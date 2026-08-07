# NPC

Table to work with `CNPC`. **`CNPC`** extends **`CEntity`**

## GetOwnerNPC

`NPC.GetOwnerNPC(npc):` [**`CNPC`**](NPC.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to get owner from |

Returns owner of the `CNPC`. Works for spirit bear.

## GetItem

`NPC.GetItem(npc, name, [isReal]):` [**`CItem`**](Item.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to get item from |
| **name** | **`string`** | name of the item |
| **isReal ****`[?]`** | **`boolean`** | if true, returns only 1-6 slots and neutral item, otherwise returns all items (including backpack and stash) `(default: true)` |

Returns `CItem` by name.

## HasItem

`NPC.HasItem(npc, name, [isReal]):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |
| **name** | **`string`** | name of the item |
| **isReal ****`[?]`** | **`boolean`** | if true, returns only 1-6 slots and neutral item, otherwise returns all items (including backpack and stash) `(default: true)` |

Returns `true` if the `CNPC` has item with specified name.

## HasModifier

`NPC.HasModifier(npc, name):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |
| **name** | **`string`** | name of the modifier |

Returns `true` if the `CNPC` has modifier with specified name.

## GetModifier

`NPC.GetModifier(npc, name):` [**`CModifier`**](Modifier.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to get modifier from |
| **name** | **`string`** | name of the modifier |

Returns `CModifier` by name.

## GetModifiers

`poperty\_filter` doesn`t filter all modifiers every call, it uses already prefiltered list. {% endhint %} `NPC.GetModifiers(npc, \[poperty\_filter]):` \[**`CModifier\[]`**]\(Modifier.md)

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to get modifiers from |
| **poperty\_filter ****`[?]`** | [**`Enum.ModifierFunction`**](Enums.md#enum.modifierfunction) | Filter modifiers by specified property `(default: Enum.ModifierFunction.MODIFIER_FUNCTION_INVALID)` |

Returns an array of all NPC's `CModifier`s.

## HasAnyModifier

`NPC.HasAnyModifier(npc, names):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) |  |
| **names** | **`string[]`** \ | **`table<string, boolean>`** |  |

Returns `true` if the NPC has any modifier from the given set.\
Accepts either an array `{"mod_a", "mod_b"}` or a hash set `{mod_a = true, mod_b = true}`.\
The hash set form is faster: O(M) hash lookups vs O(M*N) strcmp, where M = modifier count, N = names count.

## GetModifierByIndex

`NPC.GetModifierByIndex(npc, index):` [**`CModifier`**](Modifier.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) |  |
| **index** | **`integer`** | 1-based index |

Returns the modifier at the given 1-based index, or nil if out of range.\
Use with `NPC.GetModifiers` count or iterate until nil.

## HasInventorySlotFree

`NPC.HasInventorySlotFree(npc, [isReal]):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |
| **isReal ****`[?]`** | **`boolean`** | if true, returns only 1-6 slots and neutral item, otherwise returns all items (including backpack and stash) `(default: true)` |

Returns `true` if the `CNPC` has free inventory slot.

## HasState

`NPC.HasState(npc, state):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |
| **state** | [**`Enum.ModifierState`**](Enums.md#enum.modifierstate) | state to check |

Returns `true` if the `CNPC` has state. The best way to check if the `CNPC` is stunned, silenced, hexed, has BKB immune etc.

## GetStatesDuration

`NPC.GetStatesDuration(npc, states, [only_active_states]):` **`table`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |
| **states** | **`integer[]`** | states to check |
| **only\_active\_states ****`[?]`** | **`boolean`** | if `true` then check only states that active on unit, otherwise check all states. e.g. rooted while debuff immune `(default: true)` |

Returns table of remaining modifier states duration. See the example

#### Example

```lua
local states_to_check = {
		[Enum.ModifierState.MODIFIER_STATE_STUNNED] = true,
		[Enum.ModifierState.MODIFIER_STATE_HEXED] = true,
}
local states = NPC.GetStatesDuration(unit, states_to_check)
local hex_duration = states[Enum.ModifierState.MODIFIER_STATE_HEXED]
local stun_duration = states[Enum.ModifierState.MODIFIER_STATE_STUNNED]
```

## IsWaitingToSpawn

`NPC.IsWaitingToSpawn(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |

Returns `true` if waiting to spawn. For example, creeps are waiting to spawn under the ground near the barracks.

## IsIllusion

`NPC.IsIllusion(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |

Returns `true` if the `CNPC` is illusion.

## IsVisible

`NPC.IsVisible(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |

Returns `true` if the `CNPC` is visible to local player.

## IsVisibleToEnemies

`NPC.IsVisibleToEnemies(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |

Returns `true` if the `CNPC` is visible enemies.

## IsCourier

`NPC.IsCourier(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |

Returns `true` if the `CNPC` is a courier.

## IsRanged

`NPC.IsRanged(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |

Returns `true` if the `CNPC` is a ranged unit.

## IsCreep

`NPC.IsCreep(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |

Returns `true` if the `CNPC` is a creep.

## IsLaneCreep

`NPC.IsLaneCreep(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |

Returns `true` if the `CNPC` is a lane creep.

## IsStructure

`NPC.IsStructure(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |

Returns `true` if the `CNPC` is a structure.

## IsTower

`NPC.IsTower(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |

Returns `true` if the `CNPC` is a tower.

## GetUnitType

`NPC.GetUnitType(npc):` [**`Enum.UnitTypeFlags`**](Enums.md#enum.unittypeflags)

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |

Returns unit type flags.

## IsConsideredHero

`NPC.IsConsideredHero(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |

Returns `true` if it is unit a considered a hero for targeting purposes.

## IsBarracks

`NPC.IsBarracks(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |

Returns `true` if the `CNPC` is a barracks.

## IsFort

`NPC.IsFort(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |

Returns `true` if the `CNPC` is the Ancient/Throne building (the win-condition structure).\
Distinct from `IsAncient`, which checks for ancient-tier neutral camps.

## IsBoss

`NPC.IsBoss(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |

Returns `true` if the `CNPC` is a boss-like unit (TYPE\_BOSS bit).

## IsTormentor

`NPC.IsTormentor(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |

Returns `true` if the `CNPC` is a Tormentor / mini-boss. Renders with the\
siege-wide healthbar (same as Roshan).

## IsAncient

`NPC.IsAncient(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |

Returns `true` if the `CNPC` is an ancient creeps.

## IsRoshan

`NPC.IsRoshan(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |

Returns `true` if the `CNPC` is a Roshan.

## IsNeutral

`NPC.IsNeutral(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |

Returns `true` if the `CNPC` is a neutral. Neutral creeps, ancient creeps.

## IsHero

`NPC.IsHero(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |

Returns `true` if the `CNPC` is a hero.

## IsWard

`NPC.IsWard(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |

Returns `true` if the `CNPC` is a ward.

## IsMeepoClone

`NPC.IsMeepoClone(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |

Returns `true` if the `CNPC` is a meepo clone.

## IsEntityInRange

`NPC.IsEntityInRange(npc, npc2, range):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |
| **npc2** | [**`CNPC`**](NPC.md) | npc to check |
| **range** | **`number`** | range to check |

Returns `true` if the `CNPC` in range of other `CNPC`.

## IsPositionInRange

`NPC.IsPositionInRange(npc, pos, range, [hull]):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |
| **pos** | [**`Vector`**](Vector.md) | position to check |
| **range** | **`number`** | range to check |
| **hull ****`[?]`** | **`number`** | hull just added to range `(default: 0.0)` |

Returns `true` if the `CNPC` in range of position.

## IsLinkensProtected

`NPC.IsLinkensProtected(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |

Returns `true` if the `CNPC` is protected by Linkens Sphere.

## IsMirrorProtected

`NPC.IsMirrorProtected(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |

Returns `true` if the `CNPC` is protected by Mirror Shield.

## IsChannellingAbility

Do not work for items.

`NPC.IsChannellingAbility(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |

Returns `true` if the `CNPC` is channeling ability. Black Hole, Life Drain, etc.

## GetChannellingAbility

`NPC.GetChannellingAbility(npc):` [**`CAbility`**](Ability.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the currently channelling `CAbility`.

## IsRunning

`NPC.IsRunning(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns `true` if the `CNPC` is running.

## IsAttacking

`NPC.IsAttacking(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns `true` if the `CNPC` is attacking.

## IsSilenced

`NPC.IsSilenced(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns `true` if the `CNPC` is silenced.

## IsStunned

`NPC.IsStunned(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns `true` if the `CNPC` is stunned.

## HasAegis

`NPC.HasAegis(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns `true` if the `CNPC` has aegis.

## IsKillable

`NPC.IsKillable(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns `true` if the `CNPC` has killable. Example: false if affected by Eul.

## GetActivity

`NPC.GetActivity(npc):` [**`Enum.GameActivity`**](Enums.md#enum.gameactivity)

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the `CNPC` activity, such as running, attacking, casting, etc.

## GetAnimationInfo

`NPC.GetAnimationInfo(npc):` **`{sequence:integer, cycle:number, name:string, mdl_name:string}`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns information about the current animation of the `CNPC`.

## GetAttackRange

`NPC.GetAttackRange(npc):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the base attack range of the `CNPC`.

## GetAttackRangeBonus

`NPC.GetAttackRangeBonus(npc):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the bonus attack range of the `CNPC`.

## GetCastRangeBonus

`NPC.GetCastRangeBonus(npc):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the bonus cast range of the `CNPC`.

## GetPhysicalArmorValue

`NPC.GetPhysicalArmorValue(npc, [excludeWhiteArmor]):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |
| **excludeWhiteArmor ****`[?]`** | **`boolean`** | exclude white armor `(default: true)` |

Returns the physical armor value of the `CNPC`.

## GetPhysicalDamageReduction

`NPC.GetPhysicalDamageReduction(npc):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the physical damage reduction value of the `CNPC`.

## GetArmorDamageMultiplier

`NPC.GetArmorDamageMultiplier(npc):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the physical damage multiplier value of the `CNPC`.

## GetMagicalArmorValue

`NPC.GetMagicalArmorValue(npc):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the magical armor value of the `CNPC`.

## GetMagicalArmorDamageMultiplier

`NPC.GetMagicalArmorDamageMultiplier(npc):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the magical damage multiplier value of the `CNPC`.

## GetIncreasedAttackSpeed

`NPC.GetIncreasedAttackSpeed(npc, [ignore_temp_attack_speed]):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |
| **ignore\_temp\_attack\_speed ****`[?]`** | **`boolean`** | ignore temporary attack speed `(default: false)` |

Returns increased attack speed of the `CNPC`.

## GetAttacksPerSecond

`NPC.GetAttacksPerSecond(npc, [ignore_temp_attack_speed]):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |
| **ignore\_temp\_attack\_speed ****`[?]`** | **`boolean`** | ignore temporary attack speed `(default: false)` |

Returns the number of attacks per second that the `CNPC` can deal.

## GetAttackTime

`NPC.GetAttackTime(npc):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the amount of time needed for the `CNPC` to perform an attack.

## GetAttackSpeed

`NPC.GetAttackSpeed(npc, [ignore_temp_attack_speed]):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |
| **ignore\_temp\_attack\_speed ****`[?]`** | **`boolean`** | ignore temporary attack speed `(default: false)` |

Returns the attack speed of the `CNPC`.

## GetBaseAttackSpeed

`NPC.GetBaseAttackSpeed(npc):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the base attack speed of the `CNPC`.

## GetHullRadius

`NPC.GetHullRadius(npc):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the model interaction radius of the `CNPC`.

## GetPaddedCollisionRadius

`NPC.GetPaddedCollisionRadius(npc):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the collision hull radius (including padding) of this `NPC`.

## GetCollisionPadding

`NPC.GetCollisionPadding(npc):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the collision including padding of this `NPC`.

## GetPaddedCollisionRadius

`NPC.GetPaddedCollisionRadius(npc):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the ring radius of this `NPC`.

## GetProjectileCollisionSize

see: <https://dota2.fandom.com/wiki/Unit\\_Size#Collision\\_Size>

`NPC.GetProjectileCollisionSize(npc):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the collision size of the `CNPC`. Collision size is the internal size that prevents other units from passing through.

## GetTurnRate

see: <https://dota2.fandom.com/wiki/Turn\\_rate>

`NPC.GetTurnRate(npc):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the turn rate, which is the speed at which the `CNPC` can turn.

## GetAttackAnimPoint

see: <https://dota2.fandom.com/wiki/Attack\\_animation>

`NPC.GetAttackAnimPoint(npc):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the attack animation point, `nil` if not found.

## GetAttackProjectileSpeed

see: <https://dota2.fandom.com/wiki/Projectile\\_Speed>

`NPC.GetAttackProjectileSpeed(npc):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the attack projectile speed, `nil` if not found.

## IsTurning

`NPC.IsTurning(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns true if the `CNPC` is turning.

## GetAngleDiff

doesn't work for creeps

`NPC.GetAngleDiff(npc):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the remaining degree angle needed to complete the turn of the `CNPC`.

## GetPhysicalArmorMainValue

`NPC.GetPhysicalArmorMainValue(npc):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the (main) white armor of the `CNPC`.

## GetTimeToFace

`NPC.GetTimeToFace(npc, target):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | source npc |
| **target** | [**`CNPC`**](NPC.md) | target npc |

Returns the amount of time needed for the source `CNPC` to face the target `CNPC`.

## FindRotationAngle

`NPC.FindRotationAngle(npc, pos):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | source npc |
| **pos** | [**`Vector`**](Vector.md) | position to find the rotation angle |

Returns the rotation angle of the `CNPC`.

## GetTimeToFacePosition

`NPC.GetTimeToFacePosition(npc, pos):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | source npc |
| **pos** | [**`Vector`**](Vector.md) | target position |

Returns the amount of time needed for the source `CNPC` to face a specific position.

## FindFacingNPC

`NPC.FindFacingNPC(npc, ignoreNpc, [team_type], [angle], [distance]):` [**`CNPC`**](NPC.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | source npc |
| **ignoreNpc** | [**`CNPC`**](NPC.md) | ignore npc |
| **team\_type ****`[?]`** | [**`Enum.TeamType`**](Enums.md#enum.teamtype) | team type `(default: TEAM_BOTH)` |
| **angle ****`[?]`** | **`number`** | max angle to check `(default: 0.0)` |
| **distance ****`[?]`** | **`number`** | max distance to check `(default: 0.0)` |

Returns the `CNPC` that the source `CNPC` is currently facing.

## GetBaseSpeed

`NPC.GetBaseSpeed(npc):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the base move speed of the `CNPC`.

## GetMoveSpeed

`NPC.GetMoveSpeed(npc):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the move speed of the `CNPC`.

## GetMinDamage

`NPC.GetMinDamage(npc):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the minumum attack damage of the `CNPC`.

## GetBonusDamage

`NPC.GetBonusDamage(npc):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the bonus attack damage of the `CNPC`.

## GetTrueDamage

`NPC.GetTrueDamage(npc):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the minumum attack damage + bonus damage of the `CNPC`.

## GetTrueMaximumDamage

`NPC.GetTrueMaximumDamage(npc):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the maximum attack damage + bonus damage of the `CNPC`.

## GetItemByIndex

`NPC.GetItemByIndex(npc, index):` [**`CItem`**](Item.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |
| **index** | **`integer`** | item index |

Returns the `CItem` by index.

## GetAbilityByIndex

`NPC.GetAbilityByIndex(npc, index):` [**`CAbility`**](Ability.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |
| **index** | **`integer`** | ability index |

Returns the `CAbility` by index.

## GetAbilityByActivity

`NPC.GetAbilityByActivity(npc, activity):` [**`CAbility`**](Ability.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to get ability from |
| **activity** | [**`Enum.GameActivity`**](Enums.md#enum.gameactivity) | game activity |

Returns the `CAbility` by game activity.

## GetAbility

`NPC.GetAbility(npc, name):` [**`CAbility`**](Ability.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |
| **name** | **`string`** | ability name |

Returns the `CAbility` by name.

## HasAbility

`NPC.HasAbility(npc, name):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |
| **name** | **`string`** | ability name |

Returns `true` if the `CNPC` has this ability.

## GetMana

`NPC.GetMana(npc):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the current mana of the `CNPC`.

## GetMaxMana

`NPC.GetMaxMana(npc):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the maximum mana of the `CNPC`.

## GetManaRegen

`NPC.GetManaRegen(npc):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the mana regeneration rate of the `CNPC`.

## GetHealthRegen

`NPC.GetHealthRegen(npc):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the health regeneration rate of the `CNPC`.

## CalculateHealthRegen

Works for creeps but really slow.

`NPC.CalculateHealthRegen(npc):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Iterate over all modifiers and returns the health regeneration rate of the `CNPC`.

## GetCurrentLevel

`NPC.GetCurrentLevel(npc):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the current level of the `CNPC`.

## GetDayTimeVisionRange

`NPC.GetDayTimeVisionRange(npc):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the day-time vision range of the `CNPC`.

## GetNightTimeVisionRange

`NPC.GetNightTimeVisionRange(npc):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the night-time vision range of the `CNPC`.

## GetUnitName

`NPC.GetUnitName(npc):` **`string`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the unit-name of the `CNPC`.

## GetHealthBarOffset

`NPC.GetHealthBarOffset(npc, [checkOverride]):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |
| **checkOverride ****`[?]`** | **`boolean`** | returns override offset if it exists `(default: true)` |

Returns the health bar offset of the `CNPC`.

## GetUnitNameIndex

index can change when new unit are added

`NPC.GetUnitNameIndex(npc):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns unit-name index of the `CNPC`.

## GetAttachment

`NPC.GetAttachment(npc, name):` [**`Vector`**](Vector.md)

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |
| **name** | **`string`** | attachment name. e.g. "attach\_hitloc" |

Returns the attachment position of the `CNPC` by the name.

#### Example

```lua
-- attachments.txt
attach_hitloc
attach_eye_r
attach_eye_l
attach_mouth
attach_totem
attach_head
attach_tidebringer
attach_tidebringer_2
attach_sword
attach_attack1
attach_weapon
attach_eyes
attach_prop_l
attach_prop_r
attach_light
attach_staff
attach_mouthbase
attach_mouthend
attach_mom_l
attach_mom_r
attach_attack2
attach_fuse
attach_mane
attach_tail
attach_upper_jaw
attach_weapon_core_fx
attach_bow_top
attach_bow_bottom
attach_bow_mid
attach_armor
attach_chimmney
attach_eyeR
attach_eyeL
attach_spine4
attach_spine5
attach_spine6
attach_spine7
attach_spine8
attach_spine9
attach_armlet_1
attach_armlet_2
attach_armlet_3
attach_armlet_4
attach_armlet_5
attach_vanguard_guard_1
attach_vanguard_guard_2
attach_weapon_offhand
attach_vanguard_1
attach_vanguard_2
attach_attack3
attach_attack4
attach_banner
attach_fx
attach_portcullis
attach_gem
```

## GetAttachmentByIndex

`NPC.GetAttachmentByIndex(npc, index):` [**`Vector`**](Vector.md)

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |
| **index** | **`integer`** | attachment index |

Returns the attachment position of the `CNPC` by the specified index.

## GetAttachmentIndexByName

`NPC.GetAttachmentIndexByName(npc, name):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |
| **name** | **`string`** | attachment name. e.g. "attach\_hitloc" |

Returns the attachment index of the `CNPC` by the name.

## GetBountyXP

`NPC.GetBountyXP(npc):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the amount of experience points (XP) you can earn for killing the `CNPC`.

## GetGoldBountyMin

`NPC.GetGoldBountyMin(npc):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the minimum amount gold you can earn for killing the `CNPC`.

## GetGoldBountyMax

`NPC.GetGoldBountyMax(npc):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | target npc |

Returns the maximum amount gold you can earn for killing the `CNPC`.

## MoveTo

`NPC.MoveTo(npc, position, [queue], [show], [callback], [executeFast], [identifier], [force_minimap]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | The target NPC. |
| **position** | [**`Vector`**](Vector.md) | The destination position. |
| **queue ****`[?]`** | **`boolean`** | Add the order to the Dota queue. `(default: false)` |
| **show ****`[?]`** | **`boolean`** | Show the order position. `(default: false)` |
| **callback ****`[?]`** | **`boolean`** | Push the order to the OnPrepareUnitOrders callback. `(default: false)` |
| **executeFast ****`[?]`** | **`boolean`** | Place the order at the top of the queue. `(default: false)` |
| **identifier ****`[?]`** | **`string`** | The identifier which will be passed to `OnPrepareUnitOrders` callback. `(default: nil)` |
| **force\_minimap ****`[?]`** | **`boolean`** | If true, the order will be forced by the minimap if possible. `(default: true)` |

Initiates an order for the `CNPC` to move to a specified position.

## SetZDelta

`NPC.SetZDelta(npc, z):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | The target NPC. |
| **z** | **`number`** | Z pos |

Sets the Z position of the `CNPC` model.

## HasScepter

`NPC.HasScepter(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | The target NPC. |

Returns `true` if the `CNPC` has or consumed Aghanim Scepter.

## HasShard

`NPC.HasShard(npc):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | The target NPC. |

Returns `true` if the `CNPC` has or consumed Aghanim Shard.

## GetScepterUpgradeID

`NPC.GetScepterUpgradeID(npc):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | The target NPC. |

Returns index of selected scepter upgrade.

## GetShardUpgradeID

`NPC.GetShardUpgradeID(npc):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | The target NPC. |

Returns index of selected shard upgrade.

## SequenceDuration

`NPC.SequenceDuration(npc, sequence):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | The target NPC. |
| **sequence** | **`integer`** | The sequence index. |

Returns sequence duration of the npc with the specified sequence index.

## GetSecondsPerAttack

`NPC.GetSecondsPerAttack(npc, bIgnoreTempAttackSpeed):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | The target NPC. |
| **bIgnoreTempAttackSpeed** | **`boolean`** | Ignore temporary attack speed. |

Returns the seconds per attack of the npc.

## GetBarriers

`NPC.GetBarriers(npc):` **`{physical:{total:number, current:number}, magic:{total:number, current:number}, all:{total:number, current:number}}`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | The target NPC. |

Returns a table with information about the barriers of the `CNPC`.

## GetGlow

`NPC.GetGlow(npc):` **`{m_bSuppressGlow:boolean, m_bFlashing:boolean, m_bGlowing:boolean, m_iGlowType:integer, r:integer, g:integer, b:integer}`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | The target NPC. |

Returns a table with information about the current glow effect of the `CNPC`.

## SetGlow

`NPC.SetGlow(npc, suppress_glow, flashing, glowing, glow_type, r, g, b):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | The target NPC. |
| **suppress\_glow** | **`boolean`** | suppress\_glow |
| **flashing** | **`boolean`** | flashing |
| **glowing** | **`boolean`** | glowing |
| **glow\_type** | **`integer`** | glow type |
| **r** | **`integer`** | r factor |
| **g** | **`integer`** | g factor |
| **b** | **`integer`** | b factor |

Sets the `CNPC` glow effect.

## SetColor

`NPC.SetColor(npc, r, g, b):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | The target NPC. |
| **r** | **`integer`** | r factor |
| **g** | **`integer`** | g factor |
| **b** | **`integer`** | b factor |

Sets the `CNPC` model color.

## IsInRangeOfShop

`NPC.IsInRangeOfShop(npc, shop_type, [specific]):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | The target NPC. |
| **shop\_type** | [**`Enum.ShopType`**](Enums.md#enum.shoptype) | Shop type to check. |
| **specific ****`[?]`** | **`boolean`** | No idea what is that. `(default: false)` |

Checks if the `CNPC` is in range of a shop.

## GetBaseSpellAmp

`NPC.GetBaseSpellAmp(npc):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | The target NPC. |

Returns the base spell amplification of the `CNPC`.

## GetModifierProperty

`NPC.GetModifierProperty(npc, property):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | The target NPC. |
| **property** | [**`Enum.ModifierFunction`**](Enums.md#enum.modifierfunction) | Property enum. |

Returns the property value for the `CNPC`.

## IsControllableByPlayer

`NPC.IsControllableByPlayer(npc, playerId):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | npc to check |
| **playerId** | **`integer`** | player id |

Returns `true` if npc is controllable by player.

## GetModifierPropertyHighest

Fixes the issue when you have multiple Kaya items that actually don't stack.

`NPC.GetModifierPropertyHighest(npc, property):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **npc** | [**`CNPC`**](NPC.md) | The target NPC. |
| **property** | [**`Enum.ModifierFunction`**](Enums.md#enum.modifierfunction) | Property enum. |

Returns the hieghest property value for the `CNPC`.
