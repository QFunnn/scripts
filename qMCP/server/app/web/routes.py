import logging
from typing import Any

from flask import Flask, Response, jsonify, request

from app.bridge import LuaBridge
from app.logs import LogSink
from app.tools.registry import ToolRegistry
from app.tools.specs import SpecError, parse_manifest

log = logging.getLogger(__name__)
ErrorResponse = tuple[Response, int]


def create_app(bridge: LuaBridge, registry: ToolRegistry, logs: LogSink) -> Flask:
    app = Flask(__name__)
    no_unknown_game = object()
    last_unknown_game: Any = no_unknown_game

    def error_response(message: str, status: int = 400) -> ErrorResponse:
        return jsonify(ok=False, error=message), status

    def json_object() -> dict[str, Any] | None:
        payload = request.get_json(force=True, silent=True)
        return payload if isinstance(payload, dict) else None

    def claim(game: Any) -> ErrorResponse | None:
        nonlocal last_unknown_game

        if bridge.seen(game):
            last_unknown_game = no_unknown_game
            return None

        error = (
            f"unknown game {game!r}, expected one of: {', '.join(sorted(bridge.games))}"
        )

        if last_unknown_game != game:
            last_unknown_game = game
            log.warning("%s", error)

        return error_response(error)

    @app.post("/register")
    def register():
        payload = json_object()

        if payload is None:
            log.warning(
                "manifest: body is not a JSON object (%s bytes)",
                request.content_length,
            )
            return error_response("body is not a JSON object")

        refused = claim(payload.get("game"))
        if refused:
            return refused

        try:
            accepted, rejected = parse_manifest(payload)
        except SpecError as error:
            log.warning("manifest rejected: %s", error)
            return error_response(str(error))

        registry.replace(accepted)
        stranded = bridge.flush()

        for item in rejected:
            log.warning("tool %s rejected: %s", item["name"], item["error"])
        log.info("manifest: %d tools, %d rejected", len(accepted), len(rejected))

        return jsonify(
            ok=True,
            accepted=[spec.name for spec in accepted],
            rejected=rejected,
            stranded=stranded,
        )

    @app.get("/poll")
    def poll():
        refused = claim(request.args.get("game"))
        if refused:
            return refused

        return jsonify(
            registered=registry.loaded,
            commands=[command.to_json() for command in bridge.take()],
        )

    @app.post("/result")
    def result():
        data = json_object()

        if data is None:
            return error_response("body is not a JSON object")

        try:
            command_id = int(data["id"])
        except (KeyError, TypeError, ValueError):
            return error_response("numeric id required")

        known = bridge.complete(
            command_id,
            ok=bool(data.get("ok")),
            result=data.get("result"),
            error=data.get("error"),
        )

        return jsonify(ok=known), (200 if known else 404)

    @app.post("/add-log")
    def add_log():
        entry = json_object()

        if entry is None:
            return error_response("log entry must be a JSON object")

        logs.add(entry)

        return jsonify(ok=True)

    @app.get("/status")
    def status():
        return jsonify(**bridge.status(), tools=registry.names())

    return app
