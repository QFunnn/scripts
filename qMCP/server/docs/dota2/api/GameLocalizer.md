# GameLocalizer

Table to work with game localization.\
Localization tokens are stored in `resource/localization` folder in `pak01_dir.vpk`

## Find

`GameLocalizer.Find(token):` **`string`**

| Name | Type | Description |
| --- | --- | --- |
| **token** | **`string`** | should be in format `#token` |

Returns localized string by token or returns empty string if token not found.

#### Example

```lua
GameLocalizer.Find("#DOTA_AutocastAbility5") -- Autocast Ability Ultimate
```

## FindAbility

`GameLocalizer.FindAbility(ability_name):` **`string`**

| Name | Type | Description |
| --- | --- | --- |
| **ability\_name** | **`string`** |  |

Returns localized string by ability name or returns empty string if ability not found.

#### Example

```lua
GameLocalizer.FindAbility("antimage_mana_void") -- Mana Void
```

## FindItem

`GameLocalizer.FindItem(item_name):` **`string`**

| Name | Type | Description |
| --- | --- | --- |
| **item\_name** | **`string`** |  |

Returns localized string by item name or returns empty string if item not found.

#### Example

```lua
GameLocalizer.FindItem("item_blink") -- Blink Dagger
GameLocalizer.FindItem("item_recipe_arcane_blink") -- Recipe: Arcane Blink
```

## FindNPC

`GameLocalizer.FindNPC(unit_name):` **`string`**

| Name | Type | Description |
| --- | --- | --- |
| **unit\_name** | **`string`** |  |

Returns localized string by unit name or returns empty string if unit not found.

#### Example

```lua
GameLocalizer.FindNPC("npc_dota_hero_necrolyte") -- Necrophos
```
