# Physical Items

Table to work with list of phisical items.

## Count

`PhysicalItems.Count():` **`integer`**

Return size of physical item list.

## Get

`PhysicalItems.Get(index):` [**`CPhysicalItem`**](PhysicalItem.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **index** | **`integer`** | Index of physical item in cheat list. |

Return physical item by index in cheat list. Not the same as in-game index.

## GetAll

`PhysicalItems.GetAll():` [**`CPhysicalItem[]`**](PhysicalItem.md)

Return all physical items in cheat list.

## Contains

`PhysicalItems.Contains(physical):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **physical** | [**`CPhysicalItem`**](PhysicalItem.md) | item Physical item to check. |

Check physical item in cheat list.
