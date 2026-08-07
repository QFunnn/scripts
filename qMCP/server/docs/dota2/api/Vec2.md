# Vec2

Vec2 metatable

### Fields

| Name | Type | Description |
| --- | --- | --- |
| **x** | **`number`** |  |
| **y** | **`number`** |  |

## AddInPlace

`:AddInPlace(other):` [**`Vec2`**](Vec2.md)

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`Vec2`**](Vec2.md) \ | **`number`** |  |

Adds other to this Vec2 in-place. Returns self for chaining.

## SubInPlace

`:SubInPlace(other):` [**`Vec2`**](Vec2.md)

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`Vec2`**](Vec2.md) \ | **`number`** |  |

Subtracts other from this Vec2 in-place. Returns self for chaining.

## MulInPlace

`:MulInPlace(other):` [**`Vec2`**](Vec2.md)

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`Vec2`**](Vec2.md) \ | **`number`** |  |

Multiplies this Vec2 by other in-place. Returns self for chaining.

## DivInPlace

`:DivInPlace(other):` [**`Vec2`**](Vec2.md)

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`Vec2`**](Vec2.md) \ | **`number`** |  |

Divides this Vec2 by other in-place. Returns self for chaining.

## CopyFrom

`:CopyFrom(other):` [**`Vec2`**](Vec2.md)

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`Vec2`**](Vec2.md) |  |

Copies values from another Vec2 without allocating. Returns self for chaining.

## Clone

`:Clone():` [**`Vec2`**](Vec2.md)

Creates a new Vec2 with the same values as the original.

## Set

`:Set(x, y):` [**`Vec2`**](Vec2.md)

| Name | Type | Description |
| --- | --- | --- |
| **x** | **`number`** |  |
| **y** | **`number`** |  |

Sets x, y components. Returns self for chaining.

## IsZero

`:IsZero([tolerance]):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **tolerance ****`[?]`** | **`number`** | `(default: 0.01)` |

Returns true if all components are near zero within tolerance.

## Vec2

`Vec2(x, y):` [**`Vec2`**](Vec2.md)

| Name | Type | Description |
| --- | --- | --- |
| **x** | **`number`** |  |
| **y** | **`number`** |  |

Create a new Vec2.

## Vec2

`Vec2():` [**`Vec2`**](Vec2.md)

Create a new Vec2(0,0).

## \_\_tostring

`:__tostring():` **`string`**

## \_\_add

Overload for operator +

`:__add(other):` [**`Vec2`**](Vec2.md)

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`Vec2`**](Vec2.md) \ | **`number`** |  |

## \_\_sub

Overload for operator -

`:__sub(other):` [**`Vec2`**](Vec2.md)

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`Vec2`**](Vec2.md) \ | **`number`** |  |

## \_\_div

Overload for operator /

`:__div(other):` [**`Vec2`**](Vec2.md)

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`Vec2`**](Vec2.md) \ | **`number`** |  |

## \_\_mul

Overload for operator *

`:__mul(other):` [**`Vec2`**](Vec2.md)

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`Vec2`**](Vec2.md) \ | **`number`** |  |

## \_\_eq

Overload for operator ==

`:\_\_eq(other):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`Vec2`**](Vec2.md) |  |

## Length

`:Length():` **`number`**

Returns the length of the vector.

## Get

`:Get():` **`number`**, **`number`**

Returns x, y of this vector.

## GetX

`:GetX():` **`number`**

Returns x of this vector. The same as Vec2.x.

## GetY

`:GetY():` **`number`**

Returns y of this vector. The same as Vec2.y.

## SetX

`:SetX(value):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **value** | **`number`** |  |

Sets x. The same as Vec2.x = value.

## SetY

`:SetY(value):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **value** | **`number`** |  |

Sets y. The same as Vec2.y = value.
