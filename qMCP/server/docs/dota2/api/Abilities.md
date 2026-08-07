# Abilities

Table to work with ability list.

## Count

`Abilities.Count():` **`integer`**

Return size of ability list.

## Get

`Abilities.Get(index):` [**`CAbility`**](Ability.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **index** | **`integer`** | Index of ability in cheat list. |

Return ability by index in cheat list. Not the same as in-game index.

## GetAll

`Abilities.GetAll():` [**`CAbility[]`**](Ability.md)

Return all abilities in cheat list.

## Contains

`Abilities.Contains(ability):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) | Ability to check. |

Check ability in cheat list.
