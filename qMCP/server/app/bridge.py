import itertools
import logging
import threading
import time
from collections import deque
from collections.abc import Callable, Iterable
from dataclasses import dataclass, field
from typing import Any

from app.config import (
    CALL_TIMEOUT,
    OFFLINE_AFTER,
    POLL_BATCH,
    RECONNECT_GRACE,
    RELOAD_TIMEOUT,
)

log = logging.getLogger(__name__)


class BridgeError(RuntimeError):
    pass


def _is_recent(idle: float | None) -> bool:
    return idle is not None and idle < OFFLINE_AFTER


@dataclass(slots=True)
class Command:
    method: str
    args: dict[str, Any]
    id: int = 0
    done: threading.Event = field(default_factory=threading.Event)
    ok: bool = False
    result: Any = None
    error: str | None = None

    def to_json(self) -> dict[str, Any]:
        return {"id": self.id, "method": self.method, "args": self.args}

    def resolve(self, ok: bool, result: Any = None, error: str | None = None) -> None:
        self.ok = ok
        self.result = result
        self.error = error
        self.done.set()


class LuaBridge:
    def __init__(self, games: Iterable[str]) -> None:
        self._lock = threading.RLock()
        self._awake = threading.Condition(self._lock)
        self._ids = itertools.count(1)
        self._pending: deque[Command] = deque()
        self._waiting: dict[int, Command] = {}
        self._last_poll = 0.0
        self._registered = threading.Event()
        self._reload_started = 0.0
        self._games = frozenset(games)
        self._game: str | None = None
        self.on_game_change: Callable[[], None] = lambda: None

    @property
    def online(self) -> bool:
        with self._lock:
            return self._is_online()

    @property
    def reloading(self) -> bool:
        with self._lock:
            return self._is_reloading()

    @property
    def recovering(self) -> bool:
        with self._lock:
            idle = self._idle()

            return self._is_reloading() or (idle is not None and idle < RECONNECT_GRACE)

    @property
    def game(self) -> str | None:
        with self._lock:
            return self._game

    @property
    def games(self) -> frozenset[str]:
        return self._games

    def seen(self, game: Any) -> bool:
        if game not in self._games:
            return False

        with self._lock:
            self._last_poll = time.monotonic()
            changed, self._game = game != self._game, game
            self._awake.notify_all()

        if changed:
            log.info("lua client is %s", game)
            self.on_game_change()

        return True

    def status(self) -> dict[str, Any]:
        with self._lock:
            idle = self._idle()
            return {
                "online": _is_recent(idle),
                "reloading": self._is_reloading(),
                "game": self._game,
                "seen_ago": None if idle is None else round(idle, 2),
                "queued": len(self._pending),
                "waiting": len(self._waiting),
            }

    def dispatch(
        self, method: str, args: dict[str, Any], timeout: float | None = None
    ) -> Any:
        if self.reloading and not self.wait_reload(RELOAD_TIMEOUT):
            raise BridgeError(f"lua is still reloading, {method} was not sent")

        return self._send(method, args, timeout)

    def reload(self, timeout: float) -> bool:
        with self._lock:
            self._registered.clear()
            self._reload_started = time.monotonic()

        try:
            self._send("reload_scripts", {}, CALL_TIMEOUT)
        except BridgeError as error:
            log.info("reload: %s", error)

        return self.wait_reload(timeout)

    def _send(
        self, method: str, args: dict[str, Any], timeout: float | None = None
    ) -> Any:
        if not self.online:
            raise BridgeError("lua not connected: waiting for lua connection")

        command = Command(method=method, args=args)
        wait_for = CALL_TIMEOUT if timeout is None else timeout

        with self._lock:
            command.id = next(self._ids)
            self._pending.append(command)
            self._waiting[command.id] = command

        if not command.done.wait(wait_for) and self._forget(command):
            raise BridgeError(f"lua timeout {wait_for:g}s: {method}")

        if not command.ok:
            raise BridgeError(f"{method} issued error: {command.error}")

        return command.result

    def take(self) -> list[Command]:
        with self._lock:
            return [
                self._pending.popleft()
                for _ in range(min(POLL_BATCH, len(self._pending)))
            ]

    def complete(
        self, command_id: int, ok: bool, result: Any = None, error: str | None = None
    ) -> bool:
        with self._lock:
            command = self._waiting.pop(command_id, None)

            if command is None:
                return False

            command.resolve(ok, result, error)

        return True

    def flush(self) -> int:
        with self._lock:
            stranded = list(self._waiting.values())
            self._waiting.clear()
            self._pending.clear()

            for command in stranded:
                command.resolve(False, error="lua restarted")

            self._reload_started = 0.0
            self._registered.set()

        return len(stranded)

    def wait_reload(self, timeout: float) -> bool:
        return self._registered.wait(timeout)

    def wait_online(self, timeout: float) -> bool:
        deadline = time.monotonic() + timeout

        with self._awake:
            while not self._is_online():
                left = deadline - time.monotonic()

                if left <= 0 or not self._awake.wait(left):
                    return self._is_online()

        return True

    def _idle(self) -> float | None:
        return None if self._last_poll == 0 else time.monotonic() - self._last_poll

    def _is_online(self) -> bool:
        return _is_recent(self._idle())

    def _is_reloading(self) -> bool:
        return self._reload_started != 0.0 and not self._registered.is_set()

    def _forget(self, command: Command) -> bool:
        with self._lock:
            forgotten = self._waiting.pop(command.id, None) is command
            if command in self._pending:
                self._pending.remove(command)

            return forgotten
