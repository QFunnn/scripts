# Hero

Table to work with `CHero`.

**`CHero`** extends **`CNPC`**

## GetCurrentXP

`Hero.GetCurrentXP(hero):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **hero** | [**`CHero`**](Hero.md) |  |

Returns the hero's current XP.

## GetAbilityPoints

`Hero.GetAbilityPoints(hero):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **hero** | [**`CHero`**](Hero.md) |  |

Returns the hero's available ability points.

## GetRespawnTime

Could be less than current game time if hero is already alive.

`Hero.GetRespawnTime(hero):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **hero** | [**`CHero`**](Hero.md) |  |

Returns the game time when the hero will respawn.

## GetRespawnTimePenalty

`Hero.GetRespawnTimePenalty(hero):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **hero** | [**`CHero`**](Hero.md) |  |

Returns the next respawn time penalty, e.g. buyback.

## GetPrimaryAttribute

`Hero.GetPrimaryAttribute(hero):` [**`Enum.Attributes`**](Enums.md#enum.attributes)

| Name | Type | Description |
| --- | --- | --- |
| **hero** | [**`CHero`**](Hero.md) |  |

Returns the hero's primary attribute type.

## GetStrength

`Hero.GetStrength(hero):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **hero** | [**`CHero`**](Hero.md) |  |

Returns `white` value of strength.

## GetAgility

`Hero.GetAgility(hero):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **hero** | [**`CHero`**](Hero.md) |  |

Returns `white` value of agility.

## GetIntellect

`Hero.GetIntellect(hero):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **hero** | [**`CHero`**](Hero.md) |  |

Returns `white` value of intellect.

## GetStrengthTotal

`Hero.GetStrengthTotal(hero):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **hero** | [**`CHero`**](Hero.md) |  |

Returns total value of strength.

## GetAgilityTotal

`Hero.GetAgilityTotal(hero):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **hero** | [**`CHero`**](Hero.md) |  |

Returns total value of agility.

## GetIntellectTotal

`Hero.GetIntellectTotal(hero):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **hero** | [**`CHero`**](Hero.md) |  |

Returns total value of intellect.

## GetLastHurtTime

`Hero.GetLastHurtTime(hero):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **hero** | [**`CHero`**](Hero.md) |  |

Returns the time when the hero was last hurt.

## GetHurtAmount

`Hero.GetHurtAmount(hero):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **hero** | [**`CHero`**](Hero.md) |  |

Returns the amount of damage the hero last received.

## GetRecentDamage

`Hero.GetRecentDamage(hero):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **hero** | [**`CHero`**](Hero.md) |  |

Returns the damage taken by the hero in the last in \~1 second.

## GetPainFactor

`Hero.GetPainFactor(hero):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **hero** | [**`CHero`**](Hero.md) |  |

Returns the pain factor of the hero. Not sure what it is.

## GetTargetPainFactor

`Hero.GetTargetPainFactor(hero):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **hero** | [**`CHero`**](Hero.md) |  |

Returns the pain factor of the hero's target. Not sure what it is.

## GetLifeState

`Hero.GetLifeState(hero):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **hero** | [**`CHero`**](Hero.md) |  |

Returns `true` if the hero is alive. Recommended to use `Entity.IsAlive` instead.

## GetPlayerID

`Hero.GetPlayerID(hero):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **hero** | [**`CHero`**](Hero.md) |  |

Returns the ID of the hero player.

## GetReplicatingOtherHeroModel

`Hero.GetReplicatingOtherHeroModel(hero):` [**`CHero`**](Hero.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **hero** | [**`CHero`**](Hero.md) |  |

If the hero is an illusion, Arc's copy, Meepo clone, etc. returns the original hero, otherwise returns nil.

## TalentIsLearned

`Hero.TalentIsLearned(hero, talent):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **hero** | [**`CHero`**](Hero.md) |  |
| **talent** | [**`Enum.TalentTypes`**](Enums.md#enum.talenttypes) |  |

Returns `true` if talent is learned.

#### Example

```lua
TALENT_8 <=> TALENT_7
TALENT_6 <=> TALENT_5
TALENT_4 <=> TALENT_3
TALENT_2 <=> TALENT_1
```

## GetFacetAbilities

`Hero.GetFacetAbilities(hero):` [**`CAbility[]`**](Ability.md)

| Name | Type | Description |
| --- | --- | --- |
| **hero** | [**`CHero`**](Hero.md) |  |

Returns facet ability array.

## GetFacetID

`Hero.GetFacetID(hero):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **hero** | [**`CHero`**](Hero.md) |  |

Returns facet id. Start from 1.

## GetLastMaphackPos

`Hero.GetLastMaphackPos(hero):` [**`Vector`**](Vector.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **hero** | [**`CHero`**](Hero.md) |  |

Returns the last hero pos from maphack.

## GetLastVisibleTime

`Hero.GetLastVisibleTime(hero):` **`float`** | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **hero** | [**`CHero`**](Hero.md) |  |

Returns the last visible time from VBE.
