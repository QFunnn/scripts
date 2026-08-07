# qLocalization

Bundled menu localization library (`!_qLocalizer.lua`) — the only accepted way to build a menu that speaks more than one language.

The file ships with the bridge and lives in `%cheat_dir%/deadlock_scripts` next to
`!_qMCP_deadlock.lua`; loading it defines one global, `qLocalization`. It is a vendored library
(author: qfun), identical in Deadlock and Dota 2: never edit it, never copy pieces of it into your own
file, never reimplement it.

Not to be confused with `Localizer` / `GameLocalizer` — those read the client's and the game's own
string tables. `qLocalization` translates **your** menu.

## The rule

The moment a script needs a second language — the user asks for localization, for Russian, for
translations, for a language switch — build it on `qLocalization`: wrap `Menu` once and pass
**keys** instead of visible text. Do not write per-language `if`s, do not index a strings table
yourself, do not call `ForceLocalization` by hand and do not hook the `Language` widget: the library
already does all four, and a scheme of your own next to it breaks the automatic re-translation.

If a script dies on `attempt to index a nil value (global 'qLocalization')` the file is not installed —
tell the user to drop `!_qLocalizer.lua` into `%cheat_dir%/deadlock_scripts`, and stop there. An error
about a nil `Log` at load time means the opposite: the library is there but did not find the client's
`Language` widget.

## API

```lua
---Menu localization library. One global, defined by `!_qLocalizer.lua`.
qLocalization = {}

---Creates a localization instance. Language codes are matched against the client's own `Language`
---widget on creation, so nothing is registered by hand: a language the client offers and you
---translated starts working on its own, and a language you skipped falls back to `en`.
---@param translations table<string, table> Nested tables of text, one per language code; `en` is the fallback and should always be present
---@return table
function qLocalization.new(translations) end


---@class qLocalizationInstance
---Every member is a plain function: call them with a dot, `localization.Localize("hero.pick")`.
---A colon call passes the instance in as the first argument and hands that argument back unchanged.
local _localization = {}

---Returns a proxy of the `Menu` global. Every widget created through the proxy is tracked and every
---menu object it hands back comes out wrapped too, so the whole tree below it is localized without
---another call. Shadow the global once: `local Menu = localization.WrapLibrary(Menu)`.
---@param library table The `Menu` global
---@return table
function _localization.WrapLibrary(library) end


---Wraps a single menu object that did not come from the proxy — a widget or group from `Menu.Find`.
---Pass `bindSelf = true` for anything whose methods are called with `:`.
---@param object table|userdata
---@param bindSelf boolean? @default: `false`. `true` for objects called with `:`
---@return table
function _localization.Wrap(object, bindSelf) end


---Resolves a key to text: current language first, then `en`, then the key itself — so a plain string
---that is not a key passes through untouched. Use it for text you render yourself (`render_lib`,
---notifications, item lists you assemble at runtime), not for widget names.
---@param key string Dot-path into the translations table, e.g. `"hero.pick"`
---@param languageIndex number? @default: the language selected in the client.
---@return string
---@overload fun(key: string, languageIndex: number?): string @alias: `.Get`
function _localization.Localize(key, languageIndex) end


---Returns the language code selected in the client, `"en"` when that language has no translations.
---@param languageIndex number? @default: the language selected in the client.
---@return string
function _localization.GetLanguage(languageIndex) end


---Localizes a widget you got some other way and keeps it in sync afterwards. Does nothing if the key
---is unknown or the object has no `ForceLocalization`.
---@param object table|userdata
---@param key string
---@return nil
function _localization.Register(object, key) end


---Re-applies every tracked name, tooltip and item list. Already wired to the `Language` widget, so
---you only need it if you add translations after the menu is built.
---@param languageIndex number? @default: the language selected in the client.
---@return nil
function _localization.Update(languageIndex) end
```

## What the proxy translates

| Where        | How                                                                                                                                  |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------ |
| Widget names | The name argument of `group:Switch/Bind/Slider/Button/Combo/MultiCombo/MultiSelect/Input/Label/ColorPicker` — pass a key             |
| Group names  | The argument of `thirdTab:Create(...)` and the 5th argument of `Menu.Create(...)`                                                    |
| Tooltips     | `widget:ToolTip(key)`                                                                                                                |
| Combo items  | The list argument of `group:Combo(name, items, default)` and of `comboBox:Update(items)`; entries that are not keys stay as they are |

Not translated, by design: the tab path given to `Menu.Create` (`"Scripts"`, the section, the second
and third tab) — those strings identify the widget in the config and the tab objects have no
`ForceLocalization`, so keep them plain and stable. `MultiCombo`/`MultiSelect` item lists are not
touched either; localize those with `.Localize` yourself before passing them in.

Translation is applied through `ForceLocalization`, and a widget that does not have that method keeps
the raw key on screen. `CMenuGroup` is documented without it here — if a group name shows up as
`hero.group` in the menu, give the group a plain name and keep the keys for the widgets inside it.

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
