# Trees

Table to work with list of trees.

## Count

`Trees.Count():` **`integer`**

Return size of tree list.

## Get

`Trees.Get(index):` [**`CTree`**](Tree.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **index** | **`integer`** | Index of tree in cheat list. |

Return tree by index in cheat list. Not the same as in-game index.

## GetAll

`Trees.GetAll():` [**`CTree[]`**](Tree.md)

Return all trees in cheat list.

## InRadius

`Trees.InRadius(pos, radius, [active]):` [**`CTree[]`**](Tree.md)

| Name | Type | Description |
| --- | --- | --- |
| **pos** | [**`Vector`**](Vector.md) | Position to check. |
| **radius** | **`number`** | Radius to check. |
| **active ****`[?]`** | **`boolean`** | Active state to check. `(default: true)` |

Return all trees in radius.

## Contains

`Trees.Contains(tree):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **tree** | [**`CTree`**](Tree.md) | Tree to check. |

Check tree in cheat list.
