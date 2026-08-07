# Heroes

Table to work with hero list.

## Count

`Heroes.Count():` **`integer`**

Return size of hero list.

## Get

`Heroes.Get(index):` [**`CHero`**](Hero.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **index** | **`integer`** | Index of hero in cheat list. |

Return hero by index in cheat list. Not the same as in-game index.

## GetAll

`Heroes.GetAll():` [**`CHero[]`**](Hero.md)

Return all heroes in cheat list.

## Contains

`Heroes.Contains(hero):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **hero** | [**`CHero`**](Hero.md) | Hero to check. |

Check hero in cheat list.

## InRadius

`Heroes.InRadius(pos, radius, teamNum, teamType, [omitIllusions], [omitDormant]):` [**`CHero[]`**](Hero.md)

| Name | Type | Description |
| --- | --- | --- |
| **pos** | [**`Vector`**](Vector.md) | Position to check. |
| **radius** | **`number`** | Radius to check. |
| **teamNum** | [**`Enum.TeamNum`**](Enums.md#enum.teamnum) | Team number to check. |
| **teamType** | [**`Enum.TeamType`**](Enums.md#enum.teamtype) | Team type to filter by. Relative to teamNum param. |
| **omitIllusions ****`[?]`** | **`boolean`** | `true` if you want to get table without illusions `(default: false)` |
| **omitDormant ****`[?]`** | **`boolean`** | `true` if you want to get table without dormant units `(default: true)` |

Return all heroes in radius.

## GetLocal

`Heroes.GetLocal():` [**`CHero`**](Hero.md)

Return local hero.
