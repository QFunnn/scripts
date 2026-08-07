# Towers

Table to work with tower list.

## Count

`Towers.Count():` **`integer`**

Return size of tower list.

## Get

`Towers.Get(index):` [**`CTower`**](Tower.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **index** | **`integer`** | Index of tower in cheat list. |

Return tower by index in cheat list. Not the same as in-game index.

## GetAll

`Towers.GetAll():` [**`CTower[]`**](Tower.md)

Return all towers in cheat list.

## InRadius

`Towers.InRadius(pos, radius, teamNum, [teamType]):` [**`CTower[]`**](Tower.md)

| Name | Type | Description |
| --- | --- | --- |
| **pos** | [**`Vector`**](Vector.md) | Position to check. |
| **radius** | **`number`** | Radius to check. |
| **teamNum** | [**`Enum.TeamNum`**](Enums.md#enum.teamnum) | Team number to check. |
| **teamType ****`[?]`** | [**`Enum.TeamType`**](Enums.md#enum.teamtype) | Team number to check. `(default: Enum.TeamType.TEAM_ENEMY)` |

Return all towers in radius.

## Contains

`Towers.Contains(tower):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **tower** | [**`CTower`**](Tower.md) | Tower to check. |

Check tower in cheat list.
