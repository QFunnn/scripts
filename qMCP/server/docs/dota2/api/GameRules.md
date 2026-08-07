# GameRules

Table to work with GameRules.

## GetServerGameState

`GameRules.GetServerGameState():` [**`Enum.GameState`**](Enums.md#enum.gamestate)

Returns the current server game state.

## GetGameState

`GameRules.GetGameState():` [**`Enum.GameState`**](Enums.md#enum.gamestate)

Returns the current game state.

## GetGameMode

`GameRules.GetGameMode():` [**`Enum.GameMode`**](Enums.md#enum.gamemode)

Returns the current game mode.

## GetPreGameStartTime

Pregame time is the time before the game starts, e.g. ban phase, pick time.

`GameRules.GetPreGameStartTime():` **`number`**

Returns pregame duration or 0 if now is pregame time.

## GetGameStartTime

Game start time is 0:00 on ingame timer.

`GameRules.GetGameStartTime():` **`number`**

Returns game start time duration or 0 if game is not start yet.

## GetGameEndTime

`GameRules.GetGameEndTime():` **`number`**

Returns game end time or 0 if game is not end yet.

## GetGameLoadTime

`GameRules.GetGameLoadTime():` **`number`**

No idea what this function does. Returns 0 in all cases what I've tested.

## GetGameTime

Can be used to calculate time in an in-game timer. See the example.

`GameRules.GetGameTime():` **`number`**

Returns the current game time. Starts counting from pregame state.

#### Example

```lua
local game_time = GameRules.GetGameTime();
local ingame_timer = game_time - GameRules.GetGameStartTime();
Log.Write(string.format("Current time: %d:%02d", math.floor(ingame_timer / 60),
math.floor(ingame_timer % 60)))
```

## IsPaused

`GameRules.IsPaused():` **`boolean`**

Returns `true` if game is paused.

## IsTemporaryDay

Example: Phoenix's Supernova.

`GameRules.IsTemporaryDay():` **`boolean`**

Returns `true` if it's temporary day.

## IsTemporaryNight

Example: Luna's Eclipse.

`GameRules.IsTemporaryNight():` **`boolean`**

Returns `true` if it's temporary night.

## IsNightstalkerNight

`GameRules.IsNightstalkerNight():` **`boolean`**

Returns `true` if it's nightstalker's night.

## GetMatchID

`GameRules.GetMatchID():` **`integer`**

Returns current match id.

## GetLobbyID

`GameRules.GetLobbyID():` **`integer`**

Returns current lobby id.

## GetGoodGlyphCD

Could be less than current game time if glyph is already available.

`GameRules.GetGoodGlyphCD():` **`number`**

Returns game time when next radiant glyph will be available.

## GetBadGlyphCD

Could be less than current game time if glyph is already available.

`GameRules.GetBadGlyphCD():` **`number`**

Returns game time when next dire glyph will be available.

## GetGoodScanCD

Could be less than current game time if scan is already available.

`GameRules.GetGoodScanCD():` **`number`**

Returns game time when next radiant scan will be available.

## GetBadScanCD

Could be less than current game time if scan is already available.

`GameRules.GetBadScanCD():` **`number`**

Returns game time when next dire scan will be available.

## GetGoodScanCharges

`GameRules.GetGoodScanCharges():` **`integer`**

Returns current radiant scan charges.

## GetGoodScanCharges

`GameRules.GetGoodScanCharges():` **`integer`**

Returns current dire scan charges.

## GetStockCount

Item id can be found in `assets/data/items.json` file in cheat folder.

`GameRules.GetStockCount(item\_id, \[team]):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **item\_id** | **`integer`** |  |
| **team ****`[?]`** | [**`Enum.TeamNum`**](Enums.md#enum.teamnum) | - Optional. Default is local player's team. `(default: Enum.TeamNum.TEAM_RADIANT)` |

Returns amount of remaining items in shop by item id.

#### Example

```lua
-- "item_ward_observer": {
--     "ID": "42",
Log.Write("Observers available: " .. GameRules.GetStockCount(42))
```

## GetNextCycleTime

`GameRules.GetNextCycleTime():` **`number`**, **`boolean`**

Return time remaining to the next cycle.

## GetDaytimeStart

`GameRules.GetDaytimeStart():` **`number`**

Returns day start time. To work with it use `GameRules.GetTimeOfDay`

## GetNighttimeStart

`GameRules.GetNighttimeStart():` **`number`**

Returns night start time. To work with it use `GameRules.GetTimeOfDay`

## GetTimeOfDay

`GameRules.GetTimeOfDay():` **`number`**

Returns current time of day time.

## IsInBanPhase

`GameRules.IsInBanPhase():` **`boolean`**

Returns `true` if game is in ban phase.

## GetAllDraftPhase

`GameRules.GetAllDraftPhase():` **`integer`**

Returns index of the current draft phase.

## IsAllDraftPhaseRadiantFirst

`GameRules.IsAllDraftPhaseRadiantFirst():` **`boolean`**

Returns `true` if Radiant picks first.

## GetDOTATime

`GameRules.GetDOTATime([pregame], [negative]):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **pregame ****`[?]`** | **`boolean`** | If `true` includes pregame time. `(default: false)` |
| **negative ****`[?]`** | **`boolean`** | If `true` includes negative time. `(default: false)` |

Returns the actual DOTA in-game clock time.

## GetLobbyObjectJson

`GameRules.GetLobbyObjectJson():` **`string`** | **`nil`**

Returns CSODOTALobby protobuf object as JSON string.

## GetBannedHeroes

`GameRules.GetBannedHeroes():` **`integer[]`** | **`nil`**

Returns zero-based array of banned heroes where index corresponds to the player id.

## GetStateTransitionTime

`GameRules.GetStateTransitionTime():` **`number`**

Returns time remaining between state changes.
