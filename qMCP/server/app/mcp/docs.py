import difflib
from collections.abc import Sequence
from typing import Any, Self

from fastmcp.exceptions import ToolError
from fastmcp.prompts import Prompt
from fastmcp.prompts.function_prompt import FunctionPrompt
from fastmcp.resources import Resource, TextResource
from fastmcp.server.providers import Provider
from fastmcp.tools import Tool
from fastmcp.tools.base import ToolResult
from pydantic import Field

from app.bridge import LuaBridge
from app.docs import GameDocs, Page

SEPARATOR = "\n\n---\n\n"

SCHEMA = {
    "type": "object",
    "properties": {
        "modules": {
            "type": "array",
            "items": {"type": "string"},
            "description": "module names to read, e.g. ['entity_list', 'render_lib']",
        }
    },
    "required": ["modules"],
    "additionalProperties": False,
}


def _describe(bundle: GameDocs) -> str:
    catalog = "\n".join(
        f"- `{page.name}` -- {page.summary}" if page.summary else f"- `{page.name}`"
        for page in bundle.pages.values()
    )

    return (
        f"Annotated reference for an Umbrella {bundle.game} native module: signatures, "
        "types and comments exactly as the platform documents them. This tool is the "
        "only source of API truth -- read the page before using a native, and never go "
        "hunting the filesystem for docs, they do not live next to the scripts. Ask for "
        "several modules at once. Signatures differ between Umbrella games and from "
        "other Source-based APIs, so do not guess them.\n\n"
        f"Modules:\n{catalog}"
    )


def _resolve(pages: dict[str, Page], modules: list[str]) -> list[Page]:
    pages_by_lowercase_name = {name.lower(): page for name, page in pages.items()}
    resolved: list[Page] = []
    unknown: list[str] = []
    seen: set[str] = set()

    for module in modules:
        if not isinstance(module, str):
            raise ToolError("module names must be strings")

        normalized = module.strip()
        lookup_key = normalized.lower()

        if lookup_key in seen:
            continue

        seen.add(lookup_key)
        page = pages.get(normalized) or pages_by_lowercase_name.get(lookup_key)

        if page is None:
            close = difflib.get_close_matches(normalized, pages, n=3, cutoff=0.5)
            hint = f" (did you mean {', '.join(close)}?)" if close else ""
            unknown.append(f"{normalized!r}{hint}")
        else:
            resolved.append(page)

    if unknown:
        raise ToolError(f"unknown module: {', '.join(unknown)}")

    return resolved


class ApiTool(Tool):
    bundle: Any = Field(default=None, exclude=True)

    @classmethod
    def build(cls, bundle: GameDocs) -> Self:
        return cls(
            name="read_api",
            description=_describe(bundle),
            parameters=SCHEMA,
            bundle=bundle,
        )

    async def run(self, arguments: dict[str, Any]) -> ToolResult:
        modules = (arguments or {}).get("modules") or []

        if not modules:
            raise ToolError("pass at least one module, see the tool description")

        pages = _resolve(self.bundle.pages, modules)

        return ToolResult(content=SEPARATOR.join(page.text for page in pages))


class DocsProvider(Provider):
    def __init__(self, bridge: LuaBridge, bundles: dict[str, GameDocs]) -> None:
        super().__init__()
        self._bridge = bridge
        self._bundles = bundles

    def bundle(self) -> GameDocs | None:
        return self._bundles.get(self._bridge.game or "")

    async def _list_tools(self) -> Sequence[Tool]:
        bundle = self.bundle()

        return [ApiTool.build(bundle)] if bundle else []

    async def _list_resources(self) -> Sequence[Resource]:
        bundle = self.bundle()

        if bundle is None:
            return []

        return [
            TextResource(
                uri="umbrella://skill",
                text=bundle.skill,
                name="skill",
                description=(
                    f"How to write Umbrella {bundle.game} lua scripts "
                    "and drive them from here."
                ),
                mime_type="text/markdown",
            ),
            *(
                TextResource(
                    uri=f"umbrella://api/{page.name}",
                    text=page.text,
                    name=page.name,
                    description=page.summary,
                    mime_type="text/markdown",
                )
                for page in bundle.pages.values()
            ),
        ]

    async def _list_prompts(self) -> Sequence[Prompt]:
        bundle = self.bundle()

        if bundle is None:
            return []

        return [
            FunctionPrompt.from_function(
                lambda: bundle.skill,
                name="umbrella_skill",
                description=(
                    f"How to write Umbrella {bundle.game} lua scripts "
                    "and drive them through this bridge."
                ),
            )
        ]
