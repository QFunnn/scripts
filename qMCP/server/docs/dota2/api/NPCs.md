# NPCs

Table to work with NPC list.

## Count

`NPCs.Count():` **`integer`**

Return size of NPC list.

## Get

`NPCs.Get(index):` [**`CNPC`**](NPC.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **index** | **`integer`** | Index of NPC in cheat list. |

Return NPC by index in cheat list. Not the same as in-game index.

## GetAll

`NPCs.GetAll([filter]):` [**`CNPC[]`**](NPC.md)

| Name | Type | Description |
| --- | --- | --- |
| **filter ****`[?]`** | [**`Enum.UnitTypeFlags`**](Enums.md#enum.unittypeflags) \ | **`fun(npc: CNPC):boolean`** | `(default: nil)` |

Return all NPCs in cheat list. Can be filtered by unit type or custom function.\
Unit type filter is a much faster than custom function and can be or'ed to filter multiple types.

#### Example

```lua
-- filter function to get all structures except towers
for _, v in pairs(NPCs.GetAll(function (npc)
     return NPC.IsStructure(npc) and not NPC.IsTower(npc);
end)) do
     print(NPC.GetUnitName(v))
end

-- get all towers and heroes (x5 times faster than filter function)
for _, v in pairs(NPCs.GetAll(Enum.UnitTypeFlags.TYPE_TOWER | Enum.UnitTypeFlags.TYPE_HERO)) do
		print(NPC.GetUnitName(v))
end
```

## GetInScreen

`NPCs.GetInScreen([filter], [skipDormant]):` **`{entity:CNPC, position:Vec2}[]`**

| Name | Type | Description |
| --- | --- | --- |
| **filter ****`[?]`** | [**`Enum.UnitTypeFlags`**](Enums.md#enum.unittypeflags) \ | **`nil`** | `(default: nil)` |
| **skipDormant ****`[?]`** | **`boolean`** | `true` if you want to get table without dormant units `(default: true)` |

Return all NPCs in cheat list that visible on your screen. Can be filtered by unit type argument.

## InRadius

`NPCs.InRadius(pos, radius, teamNum, teamType, [omitIllusions], [omitDormant]):` [**`CNPC[]`**](NPC.md)

| Name | Type | Description |
| --- | --- | --- |
| **pos** | [**`Vector`**](Vector.md) | Position to check. |
| **radius** | **`number`** | Radius to check. |
| **teamNum** | [**`Enum.TeamNum`**](Enums.md#enum.teamnum) | Team number to check. |
| **teamType** | [**`Enum.TeamType`**](Enums.md#enum.teamtype) | Team type to filter by. Relative to teamNum param. |
| **omitIllusions ****`[?]`** | **`boolean`** | `true` if you want to get table without illusions `(default: false)` |
| **omitDormant ****`[?]`** | **`boolean`** | `true` if you want to get table without dormant units `(default: true)` |

Return all NPCs in radius.

## Contains

`NPCs.Contains(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | NPC to check. |

Check NPC in cheat list.
