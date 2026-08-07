# Couriers

Table to work with courier list.

## Count

`Couriers.Count():` **`integer`**

Return size of courier list.

## Get

`Couriers.Get(index):` [**`CCourier`**](Courier.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **index** | **`integer`** | Index of courier in cheat list. |

Return courier by index in cheat list. Not the same as in-game index.

## GetAll

`Couriers.GetAll():` [**`CCourier[]`**](Courier.md)

Return all couriers in cheat list.

## Contains

`Couriers.Contains(courier):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **courier** | [**`CCourier`**](Courier.md) | Courier to check. |

Check courier in cheat list.

## GetLocal

`Couriers.GetLocal():` [**`CCourier`**](Courier.md) | **`nil`**

Return local courier.
