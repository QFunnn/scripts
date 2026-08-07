import threading
from collections.abc import Callable, Iterable

from app.tools.specs import ToolSpec


class ToolRegistry:
    def __init__(self) -> None:
        self._lock = threading.Lock()
        self._tools: dict[str, ToolSpec] = {}
        self._loaded = False
        self.on_change: Callable[[], None] = lambda: None

    @property
    def loaded(self) -> bool:
        with self._lock:
            return self._loaded

    def all(self) -> list[ToolSpec]:
        with self._lock:
            return list(self._tools.values())

    def get(self, name: str) -> ToolSpec | None:
        with self._lock:
            return self._tools.get(name)

    def names(self) -> list[str]:
        with self._lock:
            return sorted(self._tools)

    def replace(self, specs: Iterable[ToolSpec]) -> None:
        tools = {spec.name: spec for spec in specs}

        with self._lock:
            changed = tools != self._tools
            self._tools = tools
            self._loaded = True

        if changed:
            self.on_change()
