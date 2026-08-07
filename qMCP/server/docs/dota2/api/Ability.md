# Ability

Table to work with `CAbility`.

**`CAbility`** extends **`CEntity`**

## GetOwner

`Ability.GetOwner(ability):` [**`CEntity`**](Entity.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns the ability owner.

## IsBasic

`Ability.IsBasic(ability):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns `true` if the ability is basic.

## IsUltimate

`Ability.IsUltimate(ability):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns `true` if the ability is an ultimate.

## IsAttributes

`Ability.IsAttributes(ability):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns `true` if the ability is an attribute or a talent.

## GetType

`Ability.GetType(ability):` [**`Enum.AbilityTypes`**](Enums.md#enum.abilitytypes)

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns the ability type.

## GetBehavior

`Ability.GetBehavior(ability, [from_static_data]):` [**`Enum.AbilityBehavior`**](Enums.md#enum.abilitybehavior)

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |
| **from\_static\_data ****`[?]`** | **`boolean`** | if `true` will check from ability static data `(default: false)` |

Returns the ability type.

## IsPassive

`Ability.IsPassive(ability, [from_static_data]):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |
| **from\_static\_data ****`[?]`** | **`boolean`** | if `true` will check from ability static data `(default: false)` |

Returns `true` if the ability is passive.

## GetTargetTeam

`Ability.GetTargetTeam(ability, [from_static_data]):` [**`Enum.TargetTeam`**](Enums.md#enum.targetteam)

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |
| **from\_static\_data ****`[?]`** | **`boolean`** | if `true` will check from ability static data `(default: false)` |

Returns the target team of this Ability.

## GetTargetType

`Ability.GetTargetType(ability, [from_static_data]):` [**`Enum.TargetType`**](Enums.md#enum.targettype)

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |
| **from\_static\_data ****`[?]`** | **`boolean`** | if `true` will check from ability static data `(default: false)` |

Returns the target type of this Ability.

## GetTargetFlags

`Ability.GetTargetFlags(ability):` [**`Enum.TargetFlags`**](Enums.md#enum.targetflags)

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns the target flags of this Ability.

## GetDamageType

`Ability.GetDamageType(ability):` [**`Enum.DamageTypes`**](Enums.md#enum.damagetypes)

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns the damage type of this Ability.

## GetImmunityType

`Ability.GetImmunityType(ability, [from_static_data]):` [**`Enum.ImmunityTypes`**](Enums.md#enum.immunitytypes)

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |
| **from\_static\_data ****`[?]`** | **`boolean`** | if `true` will check from ability static data `(default: false)` |

Returns the immunity type of this Ability.

## GetDispellableType

`Ability.GetDispellableType(ability, [from_static_data]):` [**`Enum.DispellableTypes`**](Enums.md#enum.dispellabletypes)

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |
| **from\_static\_data ****`[?]`** | **`boolean`** | if `true` will check from ability static data `(default: false)` |

Returns the dispel type of this Ability.

## GetLevelSpecialValueFor

`Ability.GetLevelSpecialValueFor(ability, name, [lvl]):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |
| **name** | **`string`** | Special value name. Can be found in the ability KV file. (`assets/data/npc_abilities.json`) |
| **lvl ****`[?]`** | **`integer`** | Ability level, if -1 will automatically get lvl. `(default: -1)` |

WRONG API FIX ME IT MUST BE GetSpecialValueFor.

## IsReady

`Ability.IsReady(ability):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns `true` if the ability is ready to use.

## SecondsSinceLastUse

`Ability.SecondsSinceLastUse(ability):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns the number of seconds passed from the last usage of the ability. Will return -1 if\
the ability is not on the cooldown.

## GetDamage

`Ability.GetDamage(ability):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns the ability damage from assets/data/npc\_abilities.json field. Will return 0.0 if the\
ability doesn't contain this field.

## GetHealthCost

`Ability.GetHealthCost(ability):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns the ability's health cost.

## GetLevel

`Ability.GetLevel(ability):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns the current ability level.

## GetCastPoint

`Ability.GetCastPoint(ability, [include_modifiers]):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |
| **include\_modifiers ****`[?]`** | **`boolean`** | `(default: true)` |

Gets the cast delay of this Ability.

## GetCastPointModifier

`Ability.GetCastPointModifier(ability):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Gets the cast delay modifier of this Ability.

## IsCastable

`Ability.IsCastable(ability, [mana]):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |
| **mana ****`[?]`** | **`number`** | `(default: 0.0)` |

Returns `true` if the ability is currently castable. Checks for mana cost, cooldown, level,\
and slot for items.

## IsChannelling

`Ability.IsChannelling(ability):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns `true` if the ability is in channeling state. Example: teleport, rearm, powershot\
etc.

## GetName

`Ability.GetName(ability):` **`string`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns the ability name or empty string.

## GetBaseName

`Ability.GetBaseName(ability):` **`string`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns the ability base name or empty string.

## IsInnate

`Ability.IsInnate(ability):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns `true` if the ability is innate.

## IsInnatePassive

`Ability.IsInnatePassive(ability):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns `true` if the ability is passive innate.

## GetMaxLevel

`Ability.GetMaxLevel(ability):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns ability's max level.

## IsGrantedByFacet

`Ability.IsGrantedByFacet(ability):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns `true` when abiliti is granted by facet.

## CanBeExecuted

`Ability.CanBeExecuted(ability):` [**`Enum.AbilityCastResult`**](Enums.md#enum.abilitycastresult)

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns `-1` if ability can be executed.

## IsOwnersManaEnough

`Ability.IsOwnersManaEnough(ability):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns `true` if enough mana for cast.

## CastNoTarget

`Ability.CastNoTarget(ability, [queue], [push], [execute_fast], [identifier]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |
| **queue ****`[?]`** | **`boolean`** | Will add order to the cast queue. `(default: false)` |
| **push ****`[?]`** | **`boolean`** | Will push order to the OnPrepareUnitOrders callback. `(default: false)` |
| **execute\_fast ****`[?]`** | **`boolean`** | Will push order to start of the order's list. `(default: false)` |
| **identifier ****`[?]`** | **`string`** | The identifier which will be passed to `OnPrepareUnitOrders` callback. `(default: nil)` |

Casts the ability that doesn't require a target or position.

## CastPosition

`Ability.CastPosition(ability, pos, [queue], [push], [execute_fast], [identifier], [force_minimap]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |
| **pos** | [**`Vector`**](Vector.md) | Order position. |
| **queue ****`[?]`** | **`boolean`** | Will add order to the cast queue. `(default: false)` |
| **push ****`[?]`** | **`boolean`** | Will push order to the OnPrepareUnitOrders callback. `(default: false)` |
| **execute\_fast ****`[?]`** | **`boolean`** | Will push order to start of the order's list. `(default: false)` |
| **identifier ****`[?]`** | **`string`** | The identifier which will be passed to `OnPrepareUnitOrders` callback. `(default: nil)` |
| **force\_minimap ****`[?]`** | **`boolean`** | If true, the order will be forced by the minimap if possible. `(default: true)` |

Casts the ability at a specified position.

## CastTarget

`Ability.CastTarget(ability, target, [queue], [push], [execute_fast], [identifier]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |
| **target** | [**`CNPC`**](NPC.md) | Order target. |
| **queue ****`[?]`** | **`boolean`** | Will add order to the cast queue. `(default: false)` |
| **push ****`[?]`** | **`boolean`** | Will push order to the OnPrepareUnitOrders callback. `(default: false)` |
| **execute\_fast ****`[?]`** | **`boolean`** | Will push order to start of the order's list. `(default: false)` |
| **identifier ****`[?]`** | **`string`** | The identifier which will be passed to `OnPrepareUnitOrders` callback. `(default: nil)` |

Casts the ability on a specified target.

## Toggle

`Ability.Toggle(ability, [queue], [push], [execute_fast], [identifier]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |
| **queue ****`[?]`** | **`boolean`** | Will add order to the cast queue. `(default: false)` |
| **push ****`[?]`** | **`boolean`** | Will push order to the OnPrepareUnitOrders callback. `(default: false)` |
| **execute\_fast ****`[?]`** | **`boolean`** | Will push order to start of the order's list. `(default: false)` |
| **identifier ****`[?]`** | **`string`** | The identifier which will be passed to `OnPrepareUnitOrders` callback. `(default: nil)` |

Toggles the ability. Example: Armlet.

## ToggleMod

`Ability.ToggleMod(ability, [queue], [push], [execute_fast], [identifier]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |
| **queue ****`[?]`** | **`boolean`** | Will add order to the cast queue. `(default: false)` |
| **push ****`[?]`** | **`boolean`** | Will push order to the OnPrepareUnitOrders callback. `(default: false)` |
| **execute\_fast ****`[?]`** | **`boolean`** | Will push order to start of the order's list. `(default: false)` |
| **identifier ****`[?]`** | **`string`** | The identifier which will be passed to `OnPrepareUnitOrders` callback. `(default: nil)` |

Toggles the ability modifier. Example: Frost Arrows, Medusa's Shield.

## GetDefaultName

`Ability.GetDefaultName(ability_name):` **`string`** | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **ability\_name** | **`string`** |  |

Returns the default ability icon name from items\_game.txt

## CanBeUpgraded

`Ability.CanBeUpgraded(ability):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns if the ability is upgradable with a specific reason.

## GetAbilityID

`Ability.GetAbilityID(ability):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns ability id

## GetIndex

`Ability.GetIndex(ability):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns the index of the ability in the ability owner's list. The index can be used in\
NPC.GetAbilityByIndex later.

## GetCastRange

`Ability.GetCastRange(ability):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns the cast range of the ability.

## IsHidden

`Ability.IsHidden(ability):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns `true` if ability is hidden. Example: Zeus's Nimbus before purchasing agh.

## IsActivated

`Ability.IsActivated(ability):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns `true` if the ability is in an activated state.

## GetDirtyButtons

`Ability.GetDirtyButtons(ability):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns we don't know what :).

## GetToggleState

`Ability.GetToggleState(ability):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns if the ability is toggled. Example: Medusa's Shield.

## IsInAbilityPhase

`Ability.IsInAbilityPhase(ability):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns `true` if the ability is in the cast state. Examples: Nature's Prophet's Teleport,\
Meepo's Poof.

## GetCooldown

`Ability.GetCooldown(ability):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns the amount of time before the ability can be cast.

## GetCooldownLength

`Ability.GetCooldownLength(ability):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns the amount of time the ability couldn't be cast after being used.

## GetManaCost

`Ability.GetManaCost(ability):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns the ability mana cost.

## GetAutoCastState

`Ability.GetAutoCastState(ability):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns the autocast state of the ability.

## GetAltCastState

`Ability.GetAltCastState(ability):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns the alt cast state of the ability. Example: Doom's Devour.

## GetChannelStartTime

`Ability.GetChannelStartTime(ability):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns the gametime the channeling of the ability will start. Requires the ability to be in\
the cast state when called.

## GetCastStartTime

`Ability.GetCastStartTime(ability):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns the gametime the ability will be casted. Requires the ability to be in the cast state\
when called.

## IsInIndefinateCooldown

`Ability.IsInIndefinateCooldown(ability):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns `true` if the cooldown of the ability is indefinite.

## IsInIndefinateCooldown

`Ability.IsInIndefinateCooldown(ability):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns `true` if the cooldown of the ability is frozen.

## GetOverrideCastPoint

`Ability.GetOverrideCastPoint(ability):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns the overridden cast point. Example: Arcane Blink.

## IsStolen

`Ability.IsStolen(ability):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns `true` if the ability is stolen.

## GetCurrentCharges

`Ability.GetCurrentCharges(ability):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns the number of charges available.

## ChargeRestoreTimeRemaining

`Ability.ChargeRestoreTimeRemaining(ability):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns the remaining time for the next charge to restore.

## GetKeybind

`Ability.GetKeybind(ability):` **`string`**

| Name | Type | Description |
| --- | --- | --- |
| **ability** | [**`CAbility`**](Ability.md) |  |

Returns the keybind of the ability.
