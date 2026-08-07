import asyncio
import json
from collections.abc import Sequence
from typing import Any, Self

from fastmcp.exceptions import ToolError
from fastmcp.server.providers import Provider
from fastmcp.tools import Tool
from fastmcp.tools.base import ToolResult
from pydantic import Field

from app.bridge import BridgeError, LuaBridge
from app.config import WRAPPED_TOOLS
from app.tools.registry import ToolRegistry
from app.tools.specs import SpecError, ToolSpec


class LuaTool(Tool):
    spec: Any = Field(default=None, exclude=True)
    bridge: Any = Field(default=None, exclude=True)

    @classmethod
    def build(cls, spec: ToolSpec, bridge: LuaBridge) -> Self:
        return cls(
            name=spec.name,
            description=spec.description,
            parameters=spec.schema,
            timeout=spec.timeout,
            spec=spec,
            bridge=bridge,
        )

    async def run(self, arguments: dict[str, Any]) -> ToolResult:
        spec: ToolSpec = self.spec

        try:
            args = spec.check(arguments or {})
            result = await asyncio.to_thread(
                self.bridge.dispatch, spec.name, args, spec.timeout
            )
        except (SpecError, BridgeError) as error:
            raise ToolError(str(error)) from None

        return ToolResult(content=json.dumps(result, ensure_ascii=False, default=str))


class LuaToolProvider(Provider):
    def __init__(self, bridge: LuaBridge, registry: ToolRegistry) -> None:
        super().__init__()
        self._bridge = bridge
        self._registry = registry

    async def _list_tools(self) -> Sequence[Tool]:
        return [
            LuaTool.build(spec, self._bridge)
            for spec in self._registry.all()
            if spec.name not in WRAPPED_TOOLS
        ]

    async def _get_tool(self, name: str, version: Any = None) -> Tool | None:
        spec = None if name in WRAPPED_TOOLS else self._registry.get(name)

        return LuaTool.build(spec, self._bridge) if spec else None
