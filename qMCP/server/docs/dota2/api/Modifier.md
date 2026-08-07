# Modifier

Table to work with `CModifier`. You can get modifiers from `NPC.GetModifier`function.

## GetName

`Modifier.GetName(modifier):` **`string`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier to get name of |

Returns the name of the modifier.

## GetClass

`Modifier.GetClass(modifier):` **`string`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) |  |

Returns the name of the modifier's class.

## GetModifierAura

Deprecated.

`Modifier.GetModifierAura(modifier):` **`string`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier to get aura of |

Should return the name of the modifier's aura, but instead, it returns an empty string in all\
the cases I have tested.

## GetSerialNumber

Deprecated.

`Modifier.GetSerialNumber(modifier):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier to get serial number of |

Should return the serial number of the modifier, but instead, it returns 0 in all the cases I\
have tested.

## GetStringIndex

Deprecated.

`Modifier.GetStringIndex(modifier):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier to get string index of |

Should return the string index of the modifier, but instead, it returns 0 in all the cases I\
have tested.

## GetIndex

`Modifier.GetIndex(modifier):` **`GetIndex`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier to get index of |

Returns the hero's modifier index. The index is an incrementable value with each new modifier\
the NPC gets

## GetCreationTime

`Modifier.GetCreationTime(modifier):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier to get creation time of |

Returns the game time when the modifier was created.

## GetCreationFrame

`Modifier.GetCreationFrame(modifier):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier to get creation frame of |

Returns the frame when the modifier was created. You could get current frame count from\
`GlobalVars.GetFrameCount` function.

## GetLastAppliedTime

`Modifier.GetLastAppliedTime(modifier):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier to get last applied time of |

Returns the game time when the modifier was last applied. Don't know cases when it can be\
different from `GetCreationTime`.

## GetDuration

`Modifier.GetDuration(modifier):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier to get duration of |

Returns the duration of the modifier.

## GetDieTime

`Modifier.GetDieTime(modifier):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier to get expiration time of |

Returns the game time when the modifier will expire.

## GetStackCount

`Modifier.GetStackCount(modifier):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier to get stack count of |

If there are stacks of the modifier, it returns the amount of stacks; otherwise, it returns\
0\.

## GetAuraSearchTeam

Deprecated.

`Modifier.GetAuraSearchTeam(modifier):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier to get aura search team of |

Returns aura search team of the modifier.

## GetAuraSearchType

Deprecated.

`Modifier.GetAuraSearchType(modifier):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier to get aura search type of |

Returns aura search type of the modifier.

## GetAuraSearchFlags

Deprecated.

`Modifier.GetAuraSearchFlags(modifier):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier to get aura search flags of |

Returns aura search flags of the modifier.

## GetAuraRadius

Deprecated.

`Modifier.GetAuraRadius(modifier):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier to get aura radius of |

Returns aura radius of the modifier.

## GetTeam

`Modifier.GetTeam(modifier):` [**`Enum.TeamNum`**](Enums.md#enum.teamnum)

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier to get team of |

Returns team of the modifier.

## GetAttributes

Deprecated.

`Modifier.GetAttributes(modifier):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier to get attributes of |

Returns the attributes of the modifier.

## IsAura

Deprecated.

`Modifier.IsAura(modifier):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier to check |

Returns `true` if the modifier is an aura.

## IsAuraActiveOnDeath

Deprecated.

`Modifier.IsAuraActiveOnDeath(modifier):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier to check |

Returns `true` if the modifier aura active on death.

## GetMarkedForDeletion

Deprecated.

`Modifier.GetMarkedForDeletion(modifier):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier to check |

Returns `true` if the modifier is marked for deletion.

## GetAuraIsHeal

Deprecated.

`Modifier.GetAuraIsHeal(modifier):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier to check |

Returns `true` if aura is heal.

## GetProvidedByAura

`Modifier.GetProvidedByAura(modifier):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier to check |

Returns `true` if modifier is provided by an aura.

## GetPreviousTick

`Modifier.GetPreviousTick(modifier):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier to get last tick time of |

Returns the game time of the last modifier tick (\~0.033 seconds).

## GetThinkInterval

Deprecated.

`Modifier.GetThinkInterval(modifier):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier to get think interval of |

Returns the modifier's think interval.

## GetThinkTimeAccumulator

Deprecated.

`Modifier.GetThinkTimeAccumulator(modifier):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier to get think time accumulator of |

Return the modifier's think interval time accumulator.

## IsCurrentlyInAuraRange

`Modifier.IsCurrentlyInAuraRange(modifier):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier to check |

Returns `true` if is in aura range.

## GetAbility

`Modifier.GetAbility(modifier):` [**`CAbility`**](Ability.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier to get ability of |

Returns the modifier's ability or nil if ability not in the cheat's ability list

## GetAuraOwner

`Modifier.GetAuraOwner(modifier):` [**`CEntity`**](Entity.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier |

Returns the owner of aura

## GetParent

`Modifier.GetParent(modifier):` [**`CEntity`**](Entity.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier |

Returns the parent of modifier

## GetCaster

`Modifier.GetCaster(modifier):` [**`CEntity`**](Entity.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier |

Returns caster of modifier

## GetState

`Modifier.GetState(modifier):` **`number`**, **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier to get state of |

Returns the modifier state masks. See the example.

#### Example

```lua
local m_nEnabledStateMask, m_nDisabledStateMask = Modifier.GetState(mod)
local mod_is_hex = (m_nEnabledStateMask >> Enum.ModifierState.MODIFIER_STATE_HEXED & 1) > 0
local mod_is_stun = (m_nEnabledStateMask >> Enum.ModifierState.MODIFIER_STATE_STUNNED & 1) > 0
```

## IsDebuff

`Modifier.IsDebuff(modifier):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier to check |

Returns `true` if the modifier is a debuff.

## GetField

`Modifier.GetField(modifier, fieldName, [dbgPrint]):` **`any`**

| Name | Type | Description |
| --- | --- | --- |
| **modifier** | [**`CModifier`**](Modifier.md) | modifier to get field from |
| **fieldName** | **`string`** | field name |
| **dbgPrint ****`[?]`** | **`boolean`** | print possible errors `(default: false)` |

Returns value of the field.
