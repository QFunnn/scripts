import logging
import os
import threading

from flask import Flask
from werkzeug.serving import BaseWSGIServer, make_server

from app.bridge import LuaBridge
from app.config import BRIDGE_PORT, HOST, MCP_PORT
from app.docs import load as load_docs
from app.logs import LogSink
from app.mcp.server import create_mcp
from app.tools.registry import ToolRegistry
from app.web.routes import create_app

log = logging.getLogger(__name__)


def configure_logging() -> None:
    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s %(levelname)-7s %(name)s: %(message)s",
        datefmt="%H:%M:%S",
    )

    fastmcp_log = logging.getLogger("fastmcp")

    for handler in fastmcp_log.handlers[:]:
        fastmcp_log.removeHandler(handler)

    fastmcp_log.propagate = True
    fastmcp_log.setLevel(logging.WARNING)
    logging.getLogger("uvicorn").setLevel(logging.WARNING)
    logging.getLogger("werkzeug").setLevel(logging.WARNING)


def start_lua_endpoint(app: Flask) -> BaseWSGIServer:
    try:
        server = make_server(HOST, BRIDGE_PORT, app, threaded=True)
    except OSError:
        log.critical(
            "cannot bind lua endpoint on %s:%d, port busy?",
            HOST,
            BRIDGE_PORT,
            exc_info=True,
        )
        raise SystemExit(1) from None

    def serve() -> None:
        try:
            server.serve_forever()
        except Exception:
            log.critical("lua endpoint on port %d died", BRIDGE_PORT, exc_info=True)
            os._exit(1)

    threading.Thread(target=serve, name="lua-http", daemon=True).start()
    return server


def main() -> None:
    configure_logging()

    bundles = load_docs()
    bridge = LuaBridge(bundles)
    registry = ToolRegistry()
    logs = LogSink()

    app = create_app(bridge, registry, logs)
    mcp = create_mcp(bridge, registry, logs, bundles)
    lua_server = start_lua_endpoint(app)

    log.info("developed by qfun (qfun_g9s), nie (internetfanat, oO (internetenemy)")
    log.info("lua endpoint on http://%s:%d", HOST, BRIDGE_PORT)
    log.info("mcp listening on http://%s:%d/mcp", HOST, MCP_PORT)

    try:
        mcp.run(
            transport="http",
            host=HOST,
            port=MCP_PORT,
            show_banner=False,
            uvicorn_config={"log_config": None},
        )
    finally:
        lua_server.shutdown()


if __name__ == "__main__":
    main()
