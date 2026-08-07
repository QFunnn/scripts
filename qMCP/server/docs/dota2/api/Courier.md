# Courier

Table to work with `CCourier`.**`CCourier`** extends **`CNPC`**

## IsFlyingCourier

`Courier.IsFlyingCourier(courier):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **courier** | [**`CCourier`**](Courier.md) | The courier to check. |

Returns `true` if the courier is flying.

## GetRespawnTime

`Courier.GetRespawnTime(courier):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **courier** | [**`CCourier`**](Courier.md) | The courier to check. |

Returns the game time when the courier will respawn.

## GetCourierState

`Courier.GetCourierState(courier):` [**`Enum.CourierState`**](Enums.md#enum.courierstate)

| Name | Type | Description |
| --- | --- | --- |
| **courier** | [**`CCourier`**](Courier.md) | The courier to check. |

Returns the courier state.

## GetPlayerID

`Courier.GetPlayerID(courier):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **courier** | [**`CCourier`**](Courier.md) | The courier to check. |

Returns owner's player id.

## GetCourierStateEntity

`Courier.GetCourierStateEntity(courier):` [**`CEntity`**](Entity.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **courier** | [**`CCourier`**](Courier.md) | The courier to check. |

Returns the entity that the courier is currently interacting with.
