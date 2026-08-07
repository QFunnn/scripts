# Humanizer

Table to work with humanizer.

## IsInServerCameraBounds

`Humanizer.IsInServerCameraBounds(pos):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **pos** | [**`Vector`**](Vector.md) | position to check |

Returns `true` if the world position is in server camera bounds.

## GetServerCameraPos

`Humanizer.GetServerCameraPos():` [**`Vector`**](Vector.md)

Returns server camera position.

## GetClientCameraPos

`Humanizer.GetClientCameraPos():` [**`Vector`**](Vector.md)

Returns client camera position.

## GetServerCursorPos

`Humanizer.GetServerCursorPos():` [**`Vector`**](Vector.md)

Returns the server cursor position.

## GetOrderQueue

`Humanizer.GetOrderQueue():` **`{player: CPlayer, orderType: Enum.UnitOrder, targetIndex: integer, position: Vector, abilityIndex: integer, orderIssuer: Enum.PlayerOrderIssuer, unit: CNPC, orderQueueBehavior: integer, showEffects: boolean, triggerCallBack: boolean, isByMiniMap: boolean, addTime: number }[]`**

Returns information about the current humanizer order queue.

## IsSafeTarget

`Humanizer.IsSafeTarget(entity):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **entity** | [**`CEntity`**](Entity.md) |  |

Returns information about the current humanizer order queue.

## ForceUserOrderByMinimap

`Humanizer.ForceUserOrderByMinimap():` **`nil`**

Forces current user order by minimap. Must be called in OnPrepareUnitOrder
