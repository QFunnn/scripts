# TempTrees

Table to work with list of temp trees.

## Count

`TempTrees.Count():` **`integer`**

Return size of temp trees list.

## Get

`TempTrees.Get(index):` [**`CTree`**](Tree.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **index** | **`integer`** | Index of temp tree in cheat list. |

Return temp tree by index in cheat list. Not the same as in-game index.

## GetAll

`TempTrees.GetAll():` [**`CTree[]`**](Tree.md)

Return all temp trees in cheat list.

## InRadius

`TempTrees.InRadius(pos, radius):` [**`CTree[]`**](Tree.md)

| Name | Type | Description |
| --- | --- | --- |
| **pos** | [**`Vector`**](Vector.md) | Position to check. |
| **radius** | **`number`** | Radius to check. |

Return all temp trees in radius.

## Contains

`TempTrees.Contains(tree):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **tree** | [**`CTree`**](Tree.md) | Temp tree to check. |

Check temp tree in cheat list.
