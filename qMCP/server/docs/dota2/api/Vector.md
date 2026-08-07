# Vector

Vector metatable

### Fields

| Name | Type | Description |
| --- | --- | --- |
| **x** | **`number`** |  |
| **y** | **`number`** |  |
| **z** | **`number`** |  |

## AddInPlace

`:AddInPlace(other):` [**`Vector`**](Vector.md)

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`Vector`**](Vector.md) \ | **`number`** |  |

Adds other to this vector in-place. Returns self for chaining.

## SubInPlace

`:SubInPlace(other):` [**`Vector`**](Vector.md)

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`Vector`**](Vector.md) \ | **`number`** |  |

Subtracts other from this vector in-place. Returns self for chaining.

## MulInPlace

`:MulInPlace(other):` [**`Vector`**](Vector.md)

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`Vector`**](Vector.md) \ | **`number`** |  |

Multiplies this vector by other in-place. Returns self for chaining.

## DivInPlace

`:DivInPlace(other):` [**`Vector`**](Vector.md)

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`Vector`**](Vector.md) \ | **`number`** |  |

Divides this vector by other in-place. Returns self for chaining.

## Set

`:Set(x, y, z):` [**`Vector`**](Vector.md)

| Name | Type | Description |
| --- | --- | --- |
| **x** | **`number`** |  |
| **y** | **`number`** |  |
| **z** | **`number`** |  |

Sets x, y, z components. Returns self for chaining.

## SetGroundZ

`:SetGroundZ():` [**`Vector`**](Vector.md)

Sets .z = World.GetGroundZ(.x, .y). Returns self for chaining.

## LerpInPlace

`:LerpInPlace(b, t):` [**`Vector`**](Vector.md)

| Name | Type | Description |
| --- | --- | --- |
| **b** | [**`Vector`**](Vector.md) |  |
| **t** | **`number`** |  |

Linearly interpolates this vector towards other in-place. Returns self for chaining.

## CopyFrom

`:CopyFrom(other):` [**`Vector`**](Vector.md)

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`Vector`**](Vector.md) |  |

Copies values from another vector without allocating. Returns self for chaining.

## Clone

`:Clone():` [**`Vector`**](Vector.md)

Creates a new vector with the same values as the original.

## DirectionTo

`:DirectionTo(other, [dist]):` [**`Vector`**](Vector.md)

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`Vector`**](Vector.md) |  |
| **dist ****`[?]`** | **`number`** | optional scale factor `(default: 1.0)` |

Returns a normalized direction vector from this point to other, optionally scaled by distance.\
Equivalent to `(other - self):Normalized():Scaled(dist)` but with a single allocation.

## AngleBetween2D

`:AngleBetween2D(middle, point3):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **middle** | [**`Vector`**](Vector.md) | the vertex point (this is point1, middle is point2) |
| **point3** | [**`Vector`**](Vector.md) |  |

Returns the angle in radians between two 2D vectors formed by three points.\
Equivalent to the angle at point2 in the triangle point1-point2-point3, ignoring Z.

## ClosestToPoint

`:ClosestToPoint(entities):` [**`CEntity`**](Entity.md) | **`nil`**, **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **entities** | [**`CEntity[]`**](Entity.md) |  |

Finds the closest entity to this position from a table of entities.\
Returns the entity and the distance. Uses Distance2D.

## DistanceSqr2D

`:DistanceSqr2D(other):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`Vector`**](Vector.md) |  |

Returns the squared 2D distance to another vector. Cheaper than Distance2D (no sqrt).\
Use for distance comparisons: `a:DistanceSqr2D(b) < range * range`.

## IsInRange2D

`:IsInRange2D(other, range):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`Vector`**](Vector.md) |  |
| **range** | **`number`** |  |

Returns true if this position is within range of another position (2D, no sqrt).

## Extend2D

`:Extend2D(target, distance):` [**`Vector`**](Vector.md)

| Name | Type | Description |
| --- | --- | --- |
| **target** | [**`Vector`**](Vector.md) |  |
| **distance** | **`number`** |  |

Extends this position towards target by distance (2D, ignores Z). Single allocation.\
Equivalent to `self + (target - self):Normalized() * distance` without intermediate vectors.

## Perpendicular2D

`:Perpendicular2D():` [**`Vector`**](Vector.md)

Returns a 2D perpendicular vector (-y, x, z). Zero allocation if called in-place.

## Negate

`:Negate():` [**`Vector`**](Vector.md)

Negates this vector in-place (-x, -y, -z). Returns self for chaining.

## IsZero

`:IsZero([tolerance]):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **tolerance ****`[?]`** | **`number`** | `(default: 0.01)` |

Returns true if all components are near zero within tolerance.

## Extrapolate

`:Extrapolate(direction, scalar):` [**`Vector`**](Vector.md)

| Name | Type | Description |
| --- | --- | --- |
| **direction** | [**`Vector`**](Vector.md) |  |
| **scalar** | **`number`** |  |

Returns `self + direction * scalar`. Single allocation.\
Useful for position extrapolation: `start:Extrapolate(velocity, dt * speed)`.

## Vector

`Vector([x], [y], [z]):` [**`Vector`**](Vector.md)

| Name | Type | Description |
| --- | --- | --- |
| **x ****`[?]`** | **`number`** | `(default: 0.0)` |
| **y ****`[?]`** | **`number`** | `(default: 0.0)` |
| **z ****`[?]`** | **`number`** | `(default: 0.0)` |

Create a new Vector.

## \_\_tostring

`:__tostring():` **`string`**

## \_\_add

Overload for operator +

`:__add(other):` [**`Vector`**](Vector.md)

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`Vector`**](Vector.md) \ | [**`Vec2`**](Vec2.md) \ | **`number`** |  |

## \_\_sub

Overload for operator -

`:__sub(other):` [**`Vector`**](Vector.md)

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`Vector`**](Vector.md) \ | [**`Vec2`**](Vec2.md) \ | **`number`** |  |

## \_\_div

Overload for operator /

`:__div(other):` [**`Vector`**](Vector.md)

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`Vector`**](Vector.md) \ | [**`Vec2`**](Vec2.md) \ | **`number`** |  |

## \_\_mul

Overload for operator *

`:__mul(other):` [**`Vector`**](Vector.md)

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`Vector`**](Vector.md) \ | [**`Vec2`**](Vec2.md) \ | **`number`** |  |

## \_\_eq

Overload for operator ==

`:\_\_eq(other):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`Vector`**](Vector.md) |  |

## Distance

`:Distance(other):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`Vector`**](Vector.md) |  |

Computes the distance from this vector to other.

## Distance2D

`:Distance2D(other):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`Vector`**](Vector.md) |  |

Computes the distance from this vector to other ignoring Z axis.

## Normalized

`:Normalized():` [**`Vector`**](Vector.md)

Returns this vector with a length of 1.\
When normalized, a vector keeps the same direction but its length is 1.0.\
Note that the current vector is unchanged and a new normalized vector is returned. If you want to normalize the current vector, use `Vector:Normalize` function.

## Normalize

`:Normalize():` **`nil`**

Makes this vector have a length of 1.\
When normalized, a vector keeps the same direction but its length is 1.0.\
Note that this function will change the current vector. If you want to keep the current vector unchanged, use `Vector:Normalized` function.

## Dot

`:Dot(vector):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **vector** | [**`Vector`**](Vector.md) |  |

Dot Product of two vectors.\
The dot product is a float value equal to the magnitudes of the two vectors multiplied together and then multiplied by the cosine of the angle between them.\
For normalized vectors Dot returns 1 if they point in exactly the same direction, -1 if they point in completely opposite directions and zero if the vectors are perpendicular.\
\
[More](https://medium.com/@r.w.overdijk/unity-vector3-dot-what-11feb258052e)

## Dot2D

`:Dot2D(vector):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **vector** | [**`Vector`**](Vector.md) |  |

Dot Product of two vectors ignoring Z axis.

## Scaled

`:Scaled(scale):` [**`Vector`**](Vector.md)

| Name | Type | Description |
| --- | --- | --- |
| **scale** | **`number`** |  |

Returns this vector multiplied by the given number. The same as `Vector * number`.

## Scale

`:Scale(scale):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **scale** | **`number`** |  |

Multiplies this vector by the given number. The same as `Vector = Vector * number`.

## Length

`:Length():` **`number`**

Returns the length of this vector.\
The length of the vector is `math.sqrt(x*x+y*y+z*z)`.\
If you only need to compare length of some vectors, you can compare squared magnitudes of them using LengthSqr (computing squared length is faster).

## LengthSqr

`:LengthSqr():` **`number`**

Returns the squared length of this vector.\
This method is faster than Length because it avoids computing a square root. Use this method if you need to compare vectors.

## Length2D

`:Length2D():` **`number`**

Returns the length of this vector ignoring Z axis.

## Length2DSqr

`:Length2DSqr():` **`number`**

Returns the squared length of this vector ignoring Z axis.\
This method is faster than Length2D because it avoids computing a square root. Use this method if you need to compare vectors.

## Rotated

`:Rotated(angle):` [**`Vector`**](Vector.md)

| Name | Type | Description |
| --- | --- | --- |
| **angle** | **`number`** \ | [**`Angle`**](Angle.md) |  |

Returns the new vector rotated counterclockwise by the given angle in the XY-plane, leaving the Z-axis unaffected.

## Rotate

`:Rotate(angle):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **angle** | **`number`** \ | [**`Angle`**](Angle.md) |  |

Rotates this vector counterclockwise by the given angle in the XY-plane, leaving the Z-axis unaffected.

## Lerp

`:Lerp(b, t):` [**`Vector`**](Vector.md)

| Name | Type | Description |
| --- | --- | --- |
| **b** | [**`Vector`**](Vector.md) | end value, returned when t = 1 |
| **t** | **`number`** | value used to interpolate between a and b. |

Returns linearly interpolated vector between two vectors.\
The value returned equals **a + (b - a) * t** (which can also be written **a * (1-t) + b*t**).\
When `t = 0`, **a:Lerp(b, t)** returns `a`.\
When `t = 1`, **a:Lerp(b, t)** returns `b`.\
When `t = 0.5`, **a:Lerp(b, t)** returns the point midway between `a` and `b`.

## Cross

`:Cross(vector):` [**`Vector`**](Vector.md)

| Name | Type | Description |
| --- | --- | --- |
| **vector** | [**`Vector`**](Vector.md) |  |

Returns cross product of two vectors.\
\
[More](https://docs.unity3d.com/ScriptReference/Vector3.Cross.html)\
[Visualization](https://www.youtube.com/watch?v=kz92vvioeng)

## MoveForward

`:MoveForward(angle, distance):` [**`Vector`**](Vector.md)

| Name | Type | Description |
| --- | --- | --- |
| **angle** | [**`Angle`**](Angle.md) |  |
| **distance** | **`number`** | distance to move |

Moves vector forward by a specified distance in the direction defined by a given Angle.

#### Example

```lua
-- entity position moved forward by 300
local pos = Entity.GetAbsOrigin(entity):MoveForward(Entity.GetRotation(entity), 300);
```

## ToAngle

`:ToAngle():` [**`Vector`**](Vector.md)

Converts Vector to Angle. See\
<https://github.com/ValveSoftware/source-sdk-2013/blob/0565403b153dfcde602f6f58d8f4d13483696a13/src/mathlib/mathlib\\_base.cpp#L535>

## ToScreen

`:ToScreen():` [**`Vec2`**](Vec2.md), **`boolean`**

Converts Vector to screen coordinate

## IsVisible

`:IsVisible():` **`boolean`**

Returns `true` if position visible on screen.\
To get screen position use :ToScreen method

## Get

`:Get():` **`number`**, **`number`**, **`number`**

Returns x, y and z of this vector.

## GetX

`:GetX():` **`number`**

Returns x of this vector. The same as Vector.x.

## GetY

`:GetY():` **`number`**

Returns y of this vector. The same as Vector.y.

## GetZ

`:GetZ():` **`number`**

Returns z of this vector. The same as Vector.z.

## SetX

`:SetX(value):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **value** | **`number`** |  |

Sets x. The same as Vector.x = value.

## SetY

`:SetY(value):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **value** | **`number`** |  |

Sets y. The same as Vector.y = value.

## SetZ

`:SetZ(value):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **value** | **`number`** |  |

Sets z. The same as Vector.z = value.
