# Engine

Table to work with game engine.

## IsInGame

`Engine.IsInGame():` **`boolean`**

Returns `true` if the game is in progress.

## IsShopOpen

`Engine.IsShopOpen():` **`boolean`**

Returns `true` if the shop is open.

## SetQuickBuy

`Engine.SetQuickBuy(item_name, [reset]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **item\_name** | **`string`** | The name of the item to quick buy. (e.g. `blink`, `relic`) |
| **reset ****`[?]`** | **`boolean`** | Reset the quick buy list. `(default: true)` |

Add item to quick buy list.

## RunScript

`Engine.RunScript(script, [contextPanel]):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **script** | **`string`** | The script to run. |
| **contextPanel ****`[?]`** | **`string`** \ | [**`UIPanel`**](UIPanel.md) | The id of the panel or the panel itself to run the script in. `(default: "Dashboard")` |

Run a JS script in the panorama context. Return `true` if the script was executed\
successfully. [JS\
documentation](https://developer.valvesoftware.com/wiki/Dota_2_Workshop_Tools/Panorama/Javascript)

#### Example

```lua
-- in dota console, you should see "Hello from Lua!"
Engine.RunScript("$.Msg('Hello from Lua!')");
```

## ExecuteCommand

`Engine.ExecuteCommand(command):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **command** | **`string`** | The command to execute. |

Execute a console command.

#### Example

```lua
-- in dota chat, you should see "Hello from Lua!"
Engine.ExecuteCommand("say \"Hello from Lua!\"");
```

## PlayVol

`Engine.PlayVol(sound, [volume]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **sound** | **`string`** | The sound to play. Could find in `sounds` folder in `pak01_dir.vpk` file. |
| **volume ****`[?]`** | **`number`** | The volume of the sound. `(default: 0.1)` |

Play a sound with a specific volume.

#### Example

```lua
-- play a sound with a volume of 0.5 (very loud)
Engine.PlayVol("sounds/npc/courier/courier_acknowledge.vsnd_c", 0.5);
```

## CreateConfig

`Engine.CreateConfig(config_name, categories):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **config\_name** | **`string`** | The name of the config. |
| **categories** | **`{name: string, hero_ids: integer[], x: number, y: number, width: number, height: number}[]`** |  |

Creates a new hero grid config.

#### Example

```lua
Engine.CreateConfig("From lua", {
{
	name = "55%+",
	hero_ids = {1, 2, 3, 4},
	x = 0.0,
	y = 0.0,
	width = 300.0,
	height = 200.0
},
{
	name = "52%+",
	hero_ids = {5, 6},
	x = 350.0,
	y = 0.0,
	width = 300.0,
	height = 200.0
}
});
```

## GetCurrentConfigName

`Engine.GetCurrentConfigName():` **`string`**

Returns the current hero grid config name

## SetNewGridConfig

`Engine.SetNewGridConfig(config_name):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **config\_name** | **`string`** | The name of the config to set |

Set the new hero grid config by name

## LookAt

`Engine.LookAt(x, y):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **x** | **`number`** |  |
| **y** | **`number`** |  |

Move camera to a specific position.

## CanAcceptMatch

`Engine.CanAcceptMatch():` **`boolean`**

Returns `true` if the player can accept the match.

## GetGameDirectory

`Engine.GetGameDirectory():` **`string`**

Returns the current game directory. (e.g. `dota 2 beta`)

## GetCheatDirectory

`Engine.GetCheatDirectory():` **`string`**

Returns the current cheat directory.

## GetLevelName

`Engine.GetLevelName():` **`string`**

Returns the current level name. (e.g. `maps/hero_demo_main.vpk`)

## GetLevelNameShort

`Engine.GetLevelNameShort():` **`string`**

Returns the current level name without the extension and folder. (e.g. `hero_demo_main`)

## AcceptMatch

`Engine.AcceptMatch(state):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **state** | **`integer`** | DOTALobbyReadyState |

Accept match.

## ConsoleColorPrintf

`Engine.ConsoleColorPrintf(r, g, b, [a], text):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **r** | **`integer`** | Red value. |
| **g** | **`integer`** | Green value. |
| **b** | **`integer`** | Blue value. |
| **a ****`[?]`** | **`integer`** | Alpha value. `(default: 255)` |
| **text** | **`string`** | Text to print. |

Print a message to the dota console.

## GetMMR

`Engine.GetMMR():` **`integer`**

Returns the current MMR.

## GetMMRV2

`Engine.GetMMRV2():` **`integer`**

Returns the current MMR. Works better than `Engine.GetMMR`.\
Must be called from the game thread. Ex: OnNetUpdateEx, OnGCMessage, not OnFrame or on\
initialization.

## ReloadScriptSystem

`Engine.ReloadScriptSystem():` **`nil`**

Executes script system reload.

## ShowDotaWindow

`Engine.ShowDotaWindow():` **`nil`**

Brings the game window to the forefront if it is minimized.\
Use this function to make the game window the topmost window.

## IsInLobby

`Engine.IsInLobby():` **`boolean`**

Returns `true` if the player is in a lobby.

## GetBuildVersion

`Engine.GetBuildVersion():` **`string`**

Returns the cheat version.

## GetHeroIDByName

`Engine.GetHeroIDByName(unitName):` **`integer`** | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **unitName** | **`string`** | Can be retrieved from `NPC.GetUnitName` |

Returns hero ID by unit name.

#### Example

```lua
local abaddonId = Engine.GetHeroIDByName( "npc_dota_hero_abaddon" )
```

## GetDisplayNameByUnitName

`Engine.GetDisplayNameByUnitName(unitName):` **`string`** | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **unitName** | **`string`** | Can be retrieved from `NPC.GetUnitName` |

Returns hero display name by unit name.

#### Example

```lua
local nevermore_name = Engine.GetDisplayNameByUnitName( "npc_dota_hero_nevermore" )
-- nevermore_name == "Shadow Fiend"
```

## GetHeroNameByID

`Engine.GetHeroNameByID(heroID):` **`string`** | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **heroID** | **`integer`** |  |

Returns hero name by ID.

## GetUIState

`Engine.GetUIState():` [**`Enum.UIState`**](Enums.md#enum.uistate)

Returns current UI state.
