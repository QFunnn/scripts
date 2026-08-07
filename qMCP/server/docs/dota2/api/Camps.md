# Camps

Table to work with list of neutral spawners.

## Count

`Camps.Count():` **`integer`**

Return size of neutral spawner list.

## Get

`Camps.Get(index):` [**`CCamp`**](Camp.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **index** | **`integer`** | Index of neutral spawner in cheat list. |

Return neutral spawner by index in cheat list. Not the same as in-game index.

## GetAll

`Camps.GetAll():` [**`CCamp[]`**](Camp.md)

Return all neutral spawners in cheat list.

## InRadius

`Camps.InRadius(pos, radius):` [**`CCamp[]`**](Camp.md)

| Name | Type | Description |
| --- | --- | --- |
| **pos** | [**`Vector`**](Vector.md) | Position to check. |
| **radius** | **`number`** | Radius to check. |

Return all neutral spawners in radius.

## Contains

`Camps.Contains(camp):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **camp** | [**`CCamp`**](Camp.md) | Neutral spawner to check. |

Check neutral spawner in cheat list.
