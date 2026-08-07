# MiniMap

Table to work with in-game minimap.

## Ping

`MiniMap.Ping(pos, type):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **pos** | [**`Vector`**](Vector.md) | world position to ping |
| **type** | [**`Enum.PingType`**](Enums.md#enum.pingtype) | ping type |

Pings on the minimap.

## SendLine

`MiniMap.SendLine(pos, initial, clientside):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **pos** | [**`Vector`**](Vector.md) | world position to draw line to |
| **initial** | **`boolean`** | start a new line, otherwise continue the last one |
| **clientside** | **`boolean`** | draw only for local player |

Draws a line on the minimap.

## SendLine

`MiniMap.SendLine(x, y, initial, clientside):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **x** | **`number`** | x world position to draw line |
| **y** | **`number`** | y world position to draw line |
| **initial** | **`boolean`** | start a new line, otherwise continue the last one |
| **clientside** | **`boolean`** | draw only for local player |

Draws a line on the minimap.

## DrawCircle

`MiniMap.DrawCircle(pos, [r], [g], [b], [a], [size]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **pos** | [**`Vector`**](Vector.md) | world position to draw circle |
| **r ****`[?]`** | **`integer`** | red color `(default: 255)` |
| **g ****`[?]`** | **`integer`** | green color `(default: 255)` |
| **b ****`[?]`** | **`integer`** | blue color `(default: 255)` |
| **a ****`[?]`** | **`integer`** | alpha color `(default: 255)` |
| **size ****`[?]`** | **`number`** | circle size `(default: 800)` |

Draws a circle on the minimap.

## DrawHeroIcon

`MiniMap.DrawHeroIcon(unitName, pos, [r], [g], [b], [a], [size]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **unitName** | **`string`** | unit name to draw icon. Can get it from `NPC.GetUnitName` |
| **pos** | [**`Vector`**](Vector.md) | world position to draw icon |
| **r ****`[?]`** | **`integer`** | red color `(default: 255)` |
| **g ****`[?]`** | **`integer`** | green color `(default: 255)` |
| **b ****`[?]`** | **`integer`** | blue color `(default: 255)` |
| **a ****`[?]`** | **`integer`** | alpha color `(default: 255)` |
| **size ****`[?]`** | **`number`** | icon size `(default: 800)` |

Draws a hero icon on the minimap.

## DrawIconByName

`MiniMap.DrawIconByName(iconName, pos, [r], [g], [b], [a], [size]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **iconName** | **`string`** | could get it from game\dota\pak01\_dir.vpk (scripts\mod\_textures.txt). |
| **pos** | [**`Vector`**](Vector.md) | world position to draw icon |
| **r ****`[?]`** | **`integer`** | red color `(default: 255)` |
| **g ****`[?]`** | **`integer`** | green color `(default: 255)` |
| **b ****`[?]`** | **`integer`** | blue color `(default: 255)` |
| **a ****`[?]`** | **`integer`** | alpha color `(default: 255)` |
| **size ****`[?]`** | **`number`** | icon size `(default: 800)` |

Draws a icon on the minimap.

## GetMousePosInWorld

`MiniMap.GetMousePosInWorld():` [**`Vector`**](Vector.md)

Returns world position the mouse on the minimap, if the mouse is not on the minimap, it will return (0,0,0).

## IsCursorOnMinimap

`MiniMap.IsCursorOnMinimap():` **`boolean`**

Returns `true` if the mouse is on the minimap.

## GetMinimapToWorld

`MiniMap.GetMinimapToWorld(ScreenX, ScreenY):` [**`Vector`**](Vector.md)

| Name | Type | Description |
| --- | --- | --- |
| **ScreenX** | **`integer`** |  |
| **ScreenY** | **`integer`** |  |

Returns world position from minimap position. The same as `GetMousePosInWorld`, but you can pass any position on screen, not only mouse position.
