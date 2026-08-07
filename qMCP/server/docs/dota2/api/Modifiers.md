# Modifiers

Table to work with list of modifiers.

## Count

`Modifiers.Count():` **`integer`**

Returns size of modifiers list.

## Get

`Modifiers.Get(index):` [**`CModifier`**](Modifier.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **index** | **`integer`** | Index of temp tree in cheat list. |

Returns modifiers by index in cheat list. Not the same as in-game index.

## GetAll

`Modifiers.GetAll():` [**`CModifier[]`**](Modifier.md)

Returns all modifiers in cheat list.

## Contains

`Modifiers.Contains(tree):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **tree** | [**`CModifier`**](Modifier.md) | Temp tree to check. |

Checks if modifiers is in list.
