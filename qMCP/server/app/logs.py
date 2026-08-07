import threading
import time
from collections import deque
from typing import Any

from app.config import LOG_BURST_CAP, LOG_LIMIT, LOG_SETTLE

LogEntry = dict[str, Any]


class LogSink:
    def __init__(self, limit: int = LOG_LIMIT) -> None:
        self._entries: deque[LogEntry] = deque(maxlen=limit)
        self._arrived = threading.Condition()

    def __len__(self) -> int:
        with self._arrived:
            return len(self._entries)

    def add(self, entry: LogEntry) -> None:
        with self._arrived:
            self._entries.append(entry)
            self._arrived.notify_all()

    def drain(self, wait: float = 0.0) -> list[LogEntry]:
        with self._arrived:
            if not self._entries and not self._await_first(wait):
                return []

            self._await_burst()

            drained = list(self._entries)
            self._entries.clear()

            return drained

    def _await_first(self, wait: float) -> bool:
        deadline = time.monotonic() + max(wait, 0.0)

        while not self._entries:
            left = deadline - time.monotonic()

            if left <= 0:
                return False

            self._arrived.wait(left)

        return True

    def _await_burst(self) -> None:
        deadline = time.monotonic() + LOG_BURST_CAP

        while True:
            remaining = deadline - time.monotonic()

            if remaining <= 0:
                return

            landed = len(self._entries)
            self._arrived.wait(min(LOG_SETTLE, remaining))

            if len(self._entries) == landed:
                return
