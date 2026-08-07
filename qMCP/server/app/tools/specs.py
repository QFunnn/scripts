import re
from dataclasses import dataclass
from typing import Any

from jsonschema import Draft202012Validator
from jsonschema.exceptions import ValidationError

NAME_PATTERN = re.compile(r"^[a-zA-Z_]\w{0,63}$")
SUPPORTED_TYPES = frozenset(
    {"string", "number", "integer", "boolean", "object", "array"}
)
TYPE_ALIASES = {
    "str": "string",
    "int": "integer",
    "float": "number",
    "bool": "boolean",
    "table": "object",
    "list": "array",
}


class SpecError(ValueError):
    pass


def _reason(error: ValidationError) -> str:
    path = ".".join(str(part) for part in error.absolute_path)

    return f"{path}: {error.message}" if path else error.message


@dataclass(frozen=True, slots=True)
class ToolSpec:
    name: str
    description: str
    schema: dict[str, Any]
    timeout: float | None = None

    def check(self, arguments: dict[str, Any]) -> dict[str, Any]:
        args = {name: value for name, value in arguments.items() if value is not None}
        errors = sorted(Draft202012Validator(self.schema).iter_errors(args), key=str)

        if errors:
            raise SpecError("; ".join(_reason(error) for error in errors))

        return args


def _type(declared: str, name: str) -> dict[str, Any]:
    kind = TYPE_ALIASES.get(declared, declared)

    if kind.endswith("[]"):
        return {"type": "array", "items": _type(kind[:-2] or "any", name)}
    if kind in ("any", ""):
        return {}
    if kind not in SUPPORTED_TYPES:
        raise SpecError(f"unknown type '{declared}' of param {name}")

    return {"type": kind}


def _param(raw: Any, index: int) -> tuple[str, dict[str, Any], bool]:
    if isinstance(raw, list):
        raw = dict(zip(("name", "type", "description"), raw))
    if not isinstance(raw, dict):
        raise SpecError(f"param #{index}: expected a list or a table, got {raw!r}")

    name = raw.get("name")
    if not isinstance(name, str) or not NAME_PATTERN.fullmatch(name):
        raise SpecError(f"bad param name #{index}: {name!r}")

    declared = str(raw.get("type") or "any").strip().lower()
    schema = _type(declared.removesuffix("?"), name)
    if raw.get("description"):
        schema["description"] = str(raw["description"])

    return name, schema, not declared.endswith("?")


def parse_spec(raw: Any) -> ToolSpec:
    if not isinstance(raw, dict):
        raise SpecError(f"tool must be a table, got {raw!r}")

    name, description = raw.get("name"), raw.get("description")
    if not isinstance(name, str) or not NAME_PATTERN.fullmatch(name):
        raise SpecError(f"bad tool name: {name!r}")
    if not isinstance(description, str) or not description.strip():
        raise SpecError(f"{name} has no description")

    params = raw.get("params") or []
    if not isinstance(params, list):
        raise SpecError(f"params of {name} must be a list")

    timeout = raw.get("timeout")
    numeric = isinstance(timeout, int | float) and not isinstance(timeout, bool)
    if timeout is not None and not (numeric and timeout > 0):
        raise SpecError(f"timeout of {name} must be a positive number")

    parsed = [_param(item, index) for index, item in enumerate(params, 1)]
    if len({p for p, _, _ in parsed}) != len(parsed):
        raise SpecError(f"{name} has params with duplicate names")

    return ToolSpec(
        name=name,
        description=description.strip(),
        schema={
            "type": "object",
            "properties": {p: s for p, s, _ in parsed},
            "required": [p for p, _, required in parsed if required],
            "additionalProperties": False,
        },
        timeout=float(timeout) if timeout else None,
    )


def parse_manifest(raw: Any) -> tuple[list[ToolSpec], list[dict[str, str]]]:
    tools = raw.get("tools") if isinstance(raw, dict) else raw
    if not isinstance(tools, list):
        raise SpecError("expected {tools: [...]}")

    accepted: dict[str, ToolSpec] = {}
    rejected: list[dict[str, str]] = []

    for index, item in enumerate(tools, 1):
        try:
            spec = parse_spec(item)
            if spec.name in accepted:
                raise SpecError("tool with this name is already declared")
            accepted[spec.name] = spec
        except SpecError as error:
            name = item.get("name") if isinstance(item, dict) else None
            rejected.append({"name": str(name or f"#{index}"), "error": str(error)})

    return list(accepted.values()), rejected
