# Entity

Table to work with `CEntity`.

**`CEntity`** is base class for all entities in the game e.g. **`CNPC`**, **`Hero`**, **`CPlayer`**, **`CAbility`**

## IsEntity

`Entity.IsEntity(entity):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **entity** | [**`CEntity`**](Entity.md) |  |

Returns `true` if the entity is in entity list. Search in unordered set.

## IsNPC

`Entity.IsNPC(entity):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **entity** | [**`CEntity`**](Entity.md) |  |

Returns `true` if the entity is in NPC list. Search in unordered set.

## IsHero

`Entity.IsHero(entity):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **entity** | [**`CEntity`**](Entity.md) |  |

Returns `true` if the entity is in hero list. Search in unordered set.

## IsPlayer

`Entity.IsPlayer(entity):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **entity** | [**`CEntity`**](Entity.md) |  |

Returns `true` if the entity is in player list. Search in unordered set.

## IsAbility

`Entity.IsAbility(entity):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **entity** | [**`CEntity`**](Entity.md) |  |

Returns `true` if the entity is in ability list. Search in unordered set. Item is ability.

## Get

Not the same as Entities.Get(index). See example.

`Entity.Get(index):` [**`CEntity`**](Entity.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **index** | **`integer`** |  |

Returns entity by game index.

#### Example

```lua
-- get_by_index.lua
local hero = Heroes.GetLocal();
local index = Entity.GetIndex(hero);
local entity_by_index = Entity.Get(index);
assert(hero == entity_by_index, "Entity.Get() is broken!"); -- true
```

## GetIndex

`Entity.GetIndex(entity):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **entity** | [**`CEntity`**](Entity.md) |  |

Returns game index of entity.

## GetClassName

`Entity.GetClassName(entity):` **`string`**

| Name | Type | Description |
| --- | --- | --- |
| **entity** | [**`CEntity`**](Entity.md) |  |

Returns the entity's class name.

## GetUnitName

`Entity.GetUnitName(entity):` **`string`**

| Name | Type | Description |
| --- | --- | --- |
| **entity** | [**`CEntity`**](Entity.md) |  |

Returns the entity's name.

## GetUnitDesignerName

`Entity.GetUnitDesignerName(entity):` **`string`**

| Name | Type | Description |
| --- | --- | --- |
| **entity** | [**`CEntity`**](Entity.md) |  |

Returns the entity's designerName field.

## GetTeamNum

`Entity.GetTeamNum(entity):` [**`Enum.TeamNum`**](Enums.md#enum.teamnum)

| Name | Type | Description |
| --- | --- | --- |
| **entity** | [**`CEntity`**](Entity.md) |  |

Returns the entity's team number.

## IsSameTeam

`Entity.IsSameTeam(entity1, entity2):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **entity1** | [**`CEntity`**](Entity.md) |  |
| **entity2** | [**`CEntity`**](Entity.md) |  |

Returns `true` if the entities are in the same team.

## GetAbsOrigin

`Entity.GetAbsOrigin(entity):` [**`Vector`**](Vector.md)

| Name | Type | Description |
| --- | --- | --- |
| **entity** | [**`CEntity`**](Entity.md) |  |

Returns the entity's position.

## GetNetOrigin

`Entity.GetNetOrigin(entity):` [**`Vector`**](Vector.md)

| Name | Type | Description |
| --- | --- | --- |
| **entity** | [**`CEntity`**](Entity.md) |  |

Returns the entity's net position.

## GetRotation

`Entity.GetRotation(entity):` [**`Angle`**](Angle.md)

| Name | Type | Description |
| --- | --- | --- |
| **entity** | [**`CEntity`**](Entity.md) |  |

Returns the entity's rotation.

#### Example

```lua
-- forward_pos.lua
return {
    -- get local hero's forward position and draw a circle around it
    OnUpdate = function ()
        local hero = Heroes.GetLocal();
        local rotation = Entity.GetRotation(hero);
        -- forward_direction is a vector that points 100 units in direction of my hero's rotation
        local forward_direction = rotation:GetForward():Normalized():Scaled(100);
        -- add forward_direction to my hero's position to get the forward position
        local forward_pos = Entity.GetAbsOrigin(hero) + forward_direction;
        -- screen_x and screen_y are the coordinates of forward_pos on the screen
        local screen_x, screen_y, is_on_screen = Renderer.WorldToScreen(forward_pos);
        if is_on_screen then
            -- draw a circle around the position
            Renderer.SetDrawColor(255, 255, 255, 255);
            Renderer.DrawFilledCircle(screen_x, screen_y, 10, 10);
            -- result: https://i.imgur.com/ERf1Pxk.png
        end
    end
}
```

## GetAbsOriginXYZ

`Entity.GetAbsOriginXYZ(entity):` **`number`**, **`number`**, **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **entity** | [**`CEntity`**](Entity.md) |  |

Returns the entity's position as three numbers (zero allocation).

## GetRotationPYR

`Entity.GetRotationPYR(entity):` **`number`**, **`number`**, **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **entity** | [**`CEntity`**](Entity.md) |  |

Returns the entity's rotation as three numbers (zero allocation).

## IsAlive

`Entity.IsAlive(entity):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **entity** | [**`CEntity`**](Entity.md) |  |

Returns `true` if the entity is alive.

## IsDormant

`Entity.IsDormant(entity):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **entity** | [**`CEntity`**](Entity.md) |  |

Returns `true` if the entity is not visible to the local player.

## GetHealth

`Entity.GetHealth(entity):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **entity** | [**`CEntity`**](Entity.md) |  |

Returns the entity's health.

## GetMaxHealth

`Entity.GetMaxHealth(entity):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **entity** | [**`CEntity`**](Entity.md) |  |

Returns the entity's max health.

## GetOwner

`Entity.GetOwner(entity):` [**`CEntity`**](Entity.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **entity** | [**`CEntity`**](Entity.md) |  |

Returns the entity's owner or `nil` if the entity has no owner.\ e.g. for **`CPlayer`** -> `npc_dota_hero_ember_spirit` -> `npc_dota_hero_ember_spirit_fire_remnant`\
ownership chain `Entity.GetOwner(remnant)` will return Ember Spirit's entity.

## OwnedBy

`Entity.OwnedBy(entity, owner):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **entity** | [**`CEntity`**](Entity.md) | - entity to check |
| **owner** | [**`CEntity`**](Entity.md) | - owner for comparison |

Returns `true` if the entity is owned by another entity-owner. It will check the first owner only.

## RecursiveGetOwner

`Entity.RecursiveGetOwner(entity):` [**`CEntity`**](Entity.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **entity** | [**`CEntity`**](Entity.md) |  |

Returns the entity's last owner.\ e.g. for **`CPlayer`** -> `npc_dota_hero_ember_spirit` -> `npc_dota_hero_ember_spirit_fire_remnant`\
ownership chain `Entity.GetOwner(remnant)` will return **`CPlayer`**.

## RecursiveOwnedBy

`Entity.RecursiveOwnedBy(entity, owner):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **entity** | [**`CEntity`**](Entity.md) | entity to check |
| **owner** | [**`CEntity`**](Entity.md) | owner for comparison |

Returns `true` if the entity is owned by another entity-owner. It will check the whole ownership chain.

## GetHeroesInRadius

`Entity.GetHeroesInRadius(entity, radius, [teamType], [omitIllusions], [omitDormant]):` [**`CHero[]`**](Hero.md)

| Name | Type | Description |
| --- | --- | --- |
| **entity** | [**`CEntity`**](Entity.md) | entity to get position |
| **radius** | **`number`** | radius to search around |
| **teamType ****`[?]`** | [**`Enum.TeamType`**](Enums.md#enum.teamtype) | relative to the entity `(default: TEAM_ENEMY)` |
| **omitIllusions ****`[?]`** | **`boolean`** | `true` if you want to get table without illusions `(default: false)` |
| **omitDormant ****`[?]`** | **`boolean`** | `true` if you want to get table without dormant units `(default: true)` |

Returns an array of all alive and visible heroes in radius of the entity. Exclude illusion.

#### Example

```lua
local hero = Heroes.GetLocal()
-- get all enemy heroes in 1200 radius
local heroes_around = Entity.GetHeroesInRadius(hero, 1200)
for i = 1, #heroes_around do
	local hero = heroes_around[i];
	Log.Write(NPC.GetUnitName(hero) .. " is near!");
end
```

## GetUnitsInRadius

`Entity.GetUnitsInRadius(entity, radius, [teamType], [omitIllusions], [omitDormant]):` [**`CNPC[]`**](NPC.md)

| Name | Type | Description |
| --- | --- | --- |
| **entity** | [**`CEntity`**](Entity.md) | entity to get position |
| **radius** | **`number`** | radius to search around |
| **teamType ****`[?]`** | [**`Enum.TeamType`**](Enums.md#enum.teamtype) | relative to the entity `(default: TEAM_ENEMY)` |
| **omitIllusions ****`[?]`** | **`boolean`** | `true` if you want to get table without illusions `(default: false)` |
| **omitDormant ****`[?]`** | **`boolean`** | `true` if you want to get table without dormant units `(default: true)` |

Returns an array of all alive and visible NPCs in radius of the entity.

#### Example

```lua
local hero = Heroes.GetLocal()
-- get all ally NPCs in 1200 radius
local units_around = Entity.GetUnitsInRadius(hero, 1200, Enum.TeamType.TEAM_FRIEND)
for i = 1, #units_around do
	local unit = units_around[i];
	Log.Write(NPC.GetUnitName(unit) .. " is near!");
end
```

## GetTreesInRadius

Active means that tree is not destroyed.

`Entity.GetTreesInRadius(entity, radius, [active]):` [**`CTree[]`**](Tree.md)

| Name | Type | Description |
| --- | --- | --- |
| **entity** | [**`CEntity`**](Entity.md) | entity to get position |
| **radius** | **`number`** | radius to search around |
| **active ****`[?]`** | **`boolean`** | `true` if you want to get table with active trees only, otherwise for inactive trees `(default: true)` |

Returns an array of all not temporary trees in radius of the entity.

#### Example

```lua
local hero = Heroes.GetLocal()
-- get all trees in 400 radius
local trees_around = Entity.GetTreesInRadius(hero, 400, true)
for i = 1, #trees_around do
	local tree = trees_around[i];
	Log.Write(Entity.GetClassName(tree) .. " is near!");
end
```

## GetTempTreesInRadius

Temporary trees are trees planted by abilities or items.

`Entity.GetTempTreesInRadius(entity, radius):` \[**`CTree\[]`**]\(Tree.md)

| Name | Type | Description |
| --- | --- | --- |
| **entity** | [**`CEntity`**](Entity.md) | entity to get position |
| **radius** | **`number`** | radius to search around |

Returns an array of all temporary trees in radius of the entity.

#### Example

```lua
local hero = Heroes.GetLocal()
-- get all trees in 400 radius
local trees_around = Entity.GetTempTreesInRadius(hero, 400)
for i = 1, #trees_around do
	local tree = trees_around[i];
	Log.Write(Entity.GetClassName(tree) .. " is near!");
end
```

## IsControllableByPlayer

`Entity.IsControllableByPlayer(entity, playerId):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **entity** | [**`CEntity`**](Entity.md) | entity to check |
| **playerId** | **`integer`** | player id |

Returns `true` if entity is controllable by player.

## GetRoshanHealth

`Entity.GetRoshanHealth():` **`integer`**

Returns Roshan's health. Onyly works in unsafe mode.

## GetForwardPosition

`Entity.GetForwardPosition(entity, distance):` [**`Vector`**](Vector.md)

| Name | Type | Description |
| --- | --- | --- |
| **entity** | [**`CEntity`**](Entity.md) | entity to get position |
| **distance** | **`number`** | distance to move forward |

Returns position in front of entity or (0,0,0) if entity is invalid.

## GetClassID

`Entity.GetClassID(entity):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **entity** | [**`CEntity`**](Entity.md) | entity to get class id |

Returns entity class id. Could be as a optimized way to check entity type.

## GetField

`Entity.GetField(entity, fieldName, [dbgPrint]):` **`any`**

| Name | Type | Description |
| --- | --- | --- |
| **entity** | [**`CEntity`**](Entity.md) | entity to get field from |
| **fieldName** | **`string`** | field name |
| **dbgPrint ****`[?]`** | **`boolean`** | print possible errors `(default: false)` |

Returns value of the field.
