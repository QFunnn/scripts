import asyncio
import logging
import weakref
from typing import Any

import mcp.types as mt
from fastmcp import FastMCP
from fastmcp.exceptions import ToolError
from fastmcp.server.middleware import CallNext, Middleware, MiddlewareContext
from mcp.shared.exceptions import McpError

from app.bridge import LuaBridge
from app.config import HANDSHAKE_WAIT, LOG_WAIT, RELOAD_TIMEOUT
from app.docs import GameDocs
from app.logs import LogSink
from app.mcp.docs import DocsProvider
from app.mcp.provider import LuaToolProvider
from app.tools.registry import ToolRegistry

log = logging.getLogger(__name__)


class ToolListNotifier(Middleware):
    def __init__(self) -> None:
        self._sessions: weakref.WeakSet[Any] = weakref.WeakSet()
        self._loop: asyncio.AbstractEventLoop | None = None

    async def on_message(self, context: MiddlewareContext, call_next: Any) -> Any:
        if context.fastmcp_context is not None:
            self._sessions.add(context.fastmcp_context.session)
            self._loop = asyncio.get_running_loop()

        return await call_next(context)

    def schedule(self) -> None:
        loop = self._loop

        if loop is None or loop.is_closed():
            return

        try:
            loop.call_soon_threadsafe(self._start_notifications)
        except RuntimeError:
            log.debug("tool-list notification loop is already closed")

    def _start_notifications(self) -> None:
        asyncio.create_task(self._notify_all())

    async def _notify_all(self) -> None:
        for session in list(self._sessions):
            await self._notify(session)

    @staticmethod
    async def _notify(session: Any) -> None:
        try:
            await session.send_tool_list_changed()
        except Exception:
            log.debug("error while notifying client", exc_info=True)


class RequireLuaClient(Middleware):
    def __init__(self, bridge: LuaBridge, docs: DocsProvider) -> None:
        self._bridge = bridge
        self._docs = docs

    async def on_initialize(
        self,
        context: MiddlewareContext[mt.InitializeRequest],
        call_next: CallNext[mt.InitializeRequest, mt.InitializeResult | None],
    ) -> mt.InitializeResult | None:
        if not self._bridge.online and self._bridge.recovering:
            log.info("mcp handshake: lua is away, waiting %gs", HANDSHAKE_WAIT)
            await asyncio.to_thread(self._bridge.wait_online, HANDSHAKE_WAIT)

        bundle = self._docs.bundle()

        if not self._bridge.online or bundle is None:
            log.warning("mcp handshake refused: no lua client")
            raise McpError(
                mt.ErrorData(
                    code=mt.INVALID_REQUEST,
                    message=(
                        "no lua client connected: start the game with the umbrella "
                        "bridge script loaded, then reconnect. The game decides which "
                        "api documentation this server serves, so there is nothing to "
                        "offer until it checks in."
                    ),
                )
            )

        log.info("mcp handshake: serving %s", bundle.game)

        return await call_next(context)


def create_mcp(
    bridge: LuaBridge,
    registry: ToolRegistry,
    logs: LogSink,
    bundles: dict[str, GameDocs],
) -> FastMCP:
    mcp = FastMCP("Lua Bridge")
    notifier = ToolListNotifier()
    docs = DocsProvider(bridge, bundles)

    mcp.add_provider(LuaToolProvider(bridge, registry))
    mcp.add_provider(docs)
    mcp.add_middleware(RequireLuaClient(bridge, docs))
    mcp.add_middleware(notifier)

    def switch_game() -> None:
        bundle = docs.bundle()

        if bundle is not None:
            mcp.instructions = bundle.skill

        notifier.schedule()

    registry.on_change = notifier.schedule
    bridge.on_game_change = switch_game

    @mcp.tool
    def bridge_status() -> dict[str, Any]:
        return bridge.status() | {"tools": registry.names()}

    @mcp.tool(
        description=(
            "Drains everything the scripts logged since the last call. Waits out a "
            "reload that is still in flight and gives the load-time entries a moment "
            "to land, so an empty answer means the scripts really logged nothing -- "
            "not that they were still starting up."
        )
    )
    def consume_logs() -> list[dict[str, Any]]:
        if bridge.reloading:
            if not bridge.wait_reload(RELOAD_TIMEOUT):
                log.warning("consume_logs: lua is still reloading")
        elif not bridge.online and bridge.recovering:
            log.info("consume_logs: lua is away, waiting for the scripts")
            bridge.wait_online(HANDSHAKE_WAIT)

        return logs.drain(LOG_WAIT)

    @mcp.tool(
        description=(
            "Reloads every lua script in the game, waits until they re-register. "
            "Answers with the fresh tool list and everything the scripts logged while "
            "loading, so there is no need to call consume_logs right after."
        )
    )
    def reload_scripts() -> dict[str, Any]:
        if not bridge.online:
            raise ToolError("lua not connected: nothing to reload")

        if not bridge.reload(RELOAD_TIMEOUT):
            raise ToolError(
                f"lua did not come back in {RELOAD_TIMEOUT:g}s, check bridge_status"
            )

        return {"ok": True, "tools": registry.names(), "logs": logs.drain(LOG_WAIT)}

    return mcp
