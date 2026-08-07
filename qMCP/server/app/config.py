import os
from pathlib import Path

HOST = os.environ.get("BRIDGE_HOST", "127.0.0.1")
BRIDGE_PORT = int(os.environ.get("BRIDGE_PORT", 4000))
MCP_PORT = int(os.environ.get("MCP_PORT", 4001))

POLL_BATCH = 8
CALL_TIMEOUT = 10.0
OFFLINE_AFTER = 4.0
RELOAD_TIMEOUT = 25.0
RECONNECT_GRACE = 60.0
HANDSHAKE_WAIT = 15.0

LOG_LIMIT = 500
LOG_WAIT = 2.0
LOG_SETTLE = 0.3
LOG_BURST_CAP = 2.0

WRAPPED_TOOLS = frozenset(
    {"reload_scripts", "bridge_status", "consume_logs", "read_api"}
)

DOCS_DIR = Path(__file__).resolve().parents[1] / "docs"
