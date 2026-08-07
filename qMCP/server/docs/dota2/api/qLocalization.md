# qLocalization

Bundled menu localization library (`!_qLocalizer.lua`) — the only accepted way to build a menu that speaks more than one language.

The file ships with the bridge and lives in `%cheat_dir%/scripts` next to `!_qMCP_dota2.lua`; loading it
defines one global, `qLocalization`. It is a vendored library (author: qfun), identical in Dota 2 and
Deadlock: never edit it, never copy pieces of it into your own file, never reimplement it. The
`Log.Write` inside it is the library's own fallback — the logging rule of the skill still holds for
every line **you** write.

## The rule

The moment a script needs a second language — the user asks for localization, for Russian, for
translations, for a language switch — build it on `qLocalization`: wrap `Menu` once and pass
**keys** instead of visible text. Do not write per-language `if`s, do not index a strings table
yourself, do not call `ForceLocalization` by hand and do not hook the `Language` widget: the library
already does all four, and a scheme of your own next to it breaks the automatic re-translation.

If a script dies on `attempt to index a nil value (global 'qLocalization')` the file is not installed —
tell the user to drop `!_qLocalizer.lua` into `%cheat_dir%/scripts`, and stop there.

## new

`qLocalization.new(translations):` **`table`**

| Name | Type | Description |
| --- | --- | --- |
| **translations** | **`table<string, table>`** | Nested tables of text, one per language code; `en` is the fallback and should always be present |

Returns a localization instance. The language codes are matched against the client's own `Language`
widget when the instance is created, so nothing is registered by hand: a language the client offers
and you translated starts working on its own, a language you skipped falls back to `en`, and a code
you invent works as soon as the client knows it.

Every member of the instance is a plain function — call them with a **dot**,
`localization.Localize("hero.pick")`. A colon call passes the instance in as the first argument and
gives you that argument back unchanged.

## WrapLibrary

`.WrapLibrary(library):` **`table`**

| Name | Type | Description |
| --- | --- | --- |
| **library** | **`table`** | The `Menu` global |

Returns a proxy of `Menu`. Every widget created through the proxy is tracked, and every menu object it
hands back comes out wrapped as well, so the whole tree below it is localized without another call.
Shadow the global once, right after `new`: `local Menu = localization.WrapLibrary(Menu)`.

## Wrap

`.Wrap(object, bindSelf):` **`table`**

| Name | Type | Description |
| --- | --- | --- |
| **object** | **`table`** \| **`userdata`** | Menu object to proxy |
| **bindSelf** | **`boolean`** | `true` for an object whose methods are called with `:` |

Wraps a single menu object that did not come from the proxy — a widget or group returned by
`Menu.Find`, for example: `local group = localization.Wrap(Menu.Find("Scripts", ...), true)`.

## Localize

`.Localize(key, languageIndex):` **`string`**

| Name | Type | Description |
| --- | --- | --- |
| **key** | **`string`** | Dot-path into the translations table, e.g. `"hero.pick"` |
| **languageIndex** | **`number`** | Optional, defaults to the language selected in the client |

Resolves a key to text: current language first, then `en`, then the key itself — so a plain string
that is not a key passes through untouched, and a non-string argument comes back as it was. Exposed as
`.Get` under the same signature. Use it for text you render yourself (`Render.Text`, notifications,
item lists you assemble at runtime), not for widget names — those the proxy handles.

## GetLanguage

`.GetLanguage(languageIndex):` **`string`**

Language code selected in the client (`"en"` when that language has no translations table).

## Register

`.Register(object, key):` **`nil`**

Localizes a widget you got some other way and keeps it in sync afterwards. Does nothing if the key is
unknown or the object has no `ForceLocalization`.

## Update

`.Update(languageIndex):` **`nil`**

Re-applies every tracked name, tooltip and item list. The library already calls it when the user
changes `Language`, so you only need it if you add translations after the menu is built.

## What the proxy translates

| Where | How |
| --- | --- |
| Widget names | The name argument of `group:Switch/Bind/Slider/Button/Combo/MultiCombo/MultiSelect/Input/Label/ColorPicker` — pass a key |
| Group names | The argument of `thirdTab:Create(...)` and the 5th argument of `Menu.Create(...)` |
| Tooltips | `widget:ToolTip(key)` |
| Combo items | The list argument of `group:Combo(name, items, default)` and of `comboBox:Update(items)`; entries that are not keys stay as they are |

Not translated, by design: the tab path given to `Menu.Create` (`"Scripts"`, the section, the second
and third tab) — those strings identify the widget in the config and the tab objects have no
`ForceLocalization`, so keep them plain and stable. `MultiCombo`/`MultiSelect` item lists are not
touched either; localize those with `.Localize` yourself before passing them in.

## Usage

```lua
local localization = qLocalization.new({
    en = {
        hero = {
            group = "Hero Actions",
            pick = "Pick Hero",
            pick_info = "Locks the hero in",
        },
    },

    ru = {
        hero = {
            group = "Действия с героем",
            pick = "Выбрать героя",
            pick_info = "Закрепляет героя",
        },
    },
})

local Menu = localization.WrapLibrary(Menu)

local section = Menu.Create("Scripts", "Example", "Heroes", "Main") -- plain text, not a key
local group = section:Create("hero.group")

local button = group:Button("hero.pick", function()
    -- code
end)

button:ToolTip("hero.pick_info")
```
