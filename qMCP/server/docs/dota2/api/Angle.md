# Angle

Angle metatable

### Fields

| Name | Type | Description |
| --- | --- | --- |
| **pitch** | **`number`** |  |
| **yaw** | **`number`** |  |
| **roll** | **`number`** |  |

## \_\_eq

`:__eq(other):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`Angle`**](Angle.md) |  |

Compares two angles for equality.

## \_\_add

`:__add(other):` [**`Angle`**](Angle.md)

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`Angle`**](Angle.md) |  |

Adds two angles together. Returns a new Angle.

## \_\_sub

`:__sub(other):` [**`Angle`**](Angle.md)

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`Angle`**](Angle.md) |  |

Subtracts one angle from another. Returns a new Angle.

## Set

`:Set(pitch, yaw, roll):` [**`Angle`**](Angle.md)

| Name | Type | Description |
| --- | --- | --- |
| **pitch** | **`number`** |  |
| **yaw** | **`number`** |  |
| **roll** | **`number`** |  |

Sets pitch, yaw, roll. Returns self for chaining.

## CopyFrom

`:CopyFrom(other):` [**`Angle`**](Angle.md)

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`Angle`**](Angle.md) |  |

Copies values from another angle without allocating. Returns self for chaining.

## Clone

`:Clone():` [**`Angle`**](Angle.md)

Creates a new angle with the same values as the original.

## Get

`:Get():` **`number`**, **`number`**, **`number`**

Returns pitch, yaw, roll as three numbers.

## IsZero

`:IsZero([tolerance]):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **tolerance ****`[?]`** | **`number`** | `(default: 0.01)` |

Returns true if all components are near zero within tolerance.

## Angle

`Angle([pitch], [yaw], [roll]):` [**`Angle`**](Angle.md)

| Name | Type | Description |
| --- | --- | --- |
| **pitch ****`[?]`** | **`number`** | `(default: 0.0)` |
| **yaw ****`[?]`** | **`number`** | `(default: 0.0)` |
| **roll ****`[?]`** | **`number`** | `(default: 0.0)` |

Create a new Angle.

## \_\_tostring

`:__tostring():` **`string`**

## GetForward

`:GetForward():` [**`Vector`**](Vector.md)

Returns the forward vector from a given Angle.

## GetVectors

`:GetVectors():` [**`Vector`**](Vector.md), [**`Vector`**](Vector.md), [**`Vector`**](Vector.md)

Returns the forward, right and up.

## GetYaw

`:GetYaw():` **`number`**

Returns the yaw. The same as Angle.yaw.

## GetRoll

`:GetRoll():` **`number`**

Returns the roll. The same as Angle.roll.

## GetPitch

`:GetPitch():` **`number`**

Returns the pitch. The same as Angle.pitch.

## SetYaw

`:SetYaw(value):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **value** | **`number`** |  |

Sets the yaw. The same as Angle.yaw = value.

## SetRoll

`:SetRoll(value):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **value** | **`number`** |  |

Sets the roll. The same as Angle.roll = value.

## SetPitch

`:SetPitch(value):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **value** | **`number`** |  |

Sets the pitch. The same as Angle.pitch = value.
