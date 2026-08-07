# Players

Table to work with player list.

## Count

`Players.Count():` **`integer`**

Return size of player list.

## Get

`Players.Get(index):` [**`CPlayer`**](Player.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **index** | **`integer`** | Index of player in cheat list. |

Return player by index in cheat list. Not the same as in-game index.

## GetAll

`Players.GetAll():` [**`CPlayer[]`**](Player.md)

Return all players in cheat list.

## Contains

`Players.Contains(player):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **player** | [**`CPlayer`**](Player.md) | Player to check. |

Check player in cheat list.

## GetLocal

`Players.GetLocal():` [**`CPlayer`**](Player.md)

Return local player.
