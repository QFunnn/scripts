import logging
from dataclasses import dataclass
from pathlib import Path

from app.config import DOCS_DIR

log = logging.getLogger(__name__)


@dataclass(frozen=True, slots=True)
class Page:
    name: str
    text: str
    summary: str


@dataclass(frozen=True, slots=True)
class GameDocs:
    game: str
    skill: str
    pages: dict[str, Page]


def _summary(text: str) -> str:
    for line in text.splitlines()[1:]:
        candidate = line.strip()

        if candidate and not candidate.startswith(("#", "```", "|", "-")):
            return candidate

    return ""


def _pages(directory: Path) -> dict[str, Page]:
    pages: dict[str, Page] = {}

    for path in sorted(directory.glob("*.md")):
        if path.stem == "README":
            continue

        text = path.read_text(encoding="utf-8")
        pages[path.stem] = Page(path.stem, text, _summary(text))

    return pages


def load() -> dict[str, GameDocs]:
    bundles: dict[str, GameDocs] = {}

    if not DOCS_DIR.is_dir():
        log.critical("docs directory does not exist: %s", DOCS_DIR)
        raise SystemExit(1)

    for directory in sorted(path for path in DOCS_DIR.iterdir() if path.is_dir()):
        game = directory.name
        skill_path = directory / "skill.md"

        if not skill_path.is_file():
            log.warning("docs/%s has no skill.md, skipped", game)
            continue

        pages = _pages(directory / "api")

        if not pages:
            log.warning("docs/%s/api has no pages, skipped", game)
            continue

        bundles[game] = GameDocs(
            game=game,
            skill=skill_path.read_text(encoding="utf-8"),
            pages=pages,
        )
        log.info("docs: %s, %d modules preloaded", game, len(pages))

    if not bundles:
        log.critical("no game docs under %s", DOCS_DIR)
        raise SystemExit(1)

    return bundles
