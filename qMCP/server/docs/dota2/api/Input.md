# Input

Table to work with input system.

## GetWorldCursorPos

`Input.GetWorldCursorPos():` [**`Vector`**](Vector.md)

Returns world cursor position.

## GetCursorPos

`Input.GetCursorPos():` **`number`**, **`number`**

Returns screen cursor position (x, y). See example.

#### Example

```lua
local x, y =	Input.GetCursorPos()
```

## IsCursorInRect

`Input.IsCursorInRect(x, y, w, h):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **x** | **`number`** | x position |
| **y** | **`number`** |  |
| **w** | **`number`** | width |
| **h** | **`number`** | height |

Returns `true` if cursor is in rect.

## IsCursorInBounds

`Input.IsCursorInBounds(x0, y0, x1, y1):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **x0** | **`number`** |  |
| **y0** | **`number`** |  |
| **x1** | **`number`** |  |
| **y1** | **`number`** |  |

Returns `true` if cursor is in bounds.

## GetNearestUnitToCursor

Excludes not visible, illusions and dead units.

`Input.GetNearestUnitToCursor(teamNum, teamType):` [**`CNPC`**](NPC.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **teamNum** | [**`Enum.TeamNum`**](Enums.md#enum.teamnum) | team number. Could be get from `Entity.GetTeamNum` |
| **teamType** | [**`Enum.TeamType`**](Enums.md#enum.teamtype) | team type to search relative to teamNum param |

Returns nearest unit to cursor.

## GetNearestHeroToCursor

Excludes not visible, illusions and dead heroes.

`Input.GetNearestHeroToCursor(teamNum, teamType):` [**`CHero`**](Hero.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **teamNum** | [**`Enum.TeamNum`**](Enums.md#enum.teamnum) | team number. Could be get from `Entity.GetTeamNum` |
| **teamType** | [**`Enum.TeamType`**](Enums.md#enum.teamtype) | team type to search relative to teamNum param |

Returns nearest hero to cursor.

## IsInputCaptured

`Input.IsInputCaptured():` **`boolean`**

Returns `true` if input is captured. e.g. opened console, chat, shop.

## IsPopupOpen

Tracks the dashboard popup manager. Same signal the game uses to suppress its own gameplay key binds while a popup is shown.

`Input.IsPopupOpen():` **`boolean`**

Returns `true` if any panorama popup is currently open\
(settings, accept-match, item picker, party invite, etc.).

## IsKeyDown

`Input.IsKeyDown(KeyCode, [bIgnoreLock]):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **KeyCode** | [**`Enum.ButtonCode`**](Enums.md#enum.buttoncode) |  |
| **bIgnoreLock ****`[?]`** | **`boolean`** | when `true`, ignores the input capture lock (chat / settings popup / console) and returns the raw |
| key state. Default `false` preserves the previous behavior - returns |  |  |
| `false` while any of those is active. `(default: false)` |  |  |

Returns `true` if key is down.

## IsKeyDownOnce

This function will return `true` only once per key press.

`Input.IsKeyDownOnce(KeyCode, \[bIgnoreLock]):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **KeyCode** | [**`Enum.ButtonCode`**](Enums.md#enum.buttoncode) |  |
| **bIgnoreLock ****`[?]`** | **`boolean`** | when `true`, ignores the input capture lock (chat / settings popup / console) and returns the raw |
| key-pressed state. Default `false` preserves the previous behavior. `(default: false)` |  |  |

Return `true` if key is down once.
