# Vector

Vector metatable

```lua
---@class Vector
---@field x number 
---@field y number 
---@field z number 
---@operator add(Vector|Vec2|number):Vector
---@operator sub(Vector|Vec2|number):Vector
---@operator div(Vector|Vec2|number):Vector
---@operator mul(Vector|Vec2|number):Vector
---Vector metatable
local _Vector = {}

---Create a new Vector.
---@param x? number @default: `0.0`. 
---@param y? number @default: `0.0`. 
---@param z? number @default: `0.0`. 
---@return Vector
function Vector(x, y, z) end


---@return string
function _Vector:__tostring() end


---@param other Vector|Vec2|number 
---@return Vector
---@deprecated
function _Vector:__add(other) end


---@param other Vector|Vec2|number 
---@return Vector
---@deprecated
function _Vector:__sub(other) end


---@param other Vector|Vec2|number 
---@return Vector
---@deprecated
function _Vector:__div(other) end


---@param other Vector|Vec2|number 
---@return Vector
---@deprecated
function _Vector:__mul(other) end


---@param other Vector 
---@return boolean
---@deprecated
function _Vector:__eq(other) end


---Computes the distance from this vector to other.
---@param other Vector 
---@return number
function _Vector:Distance(other) end


---Computes the distance from this vector to other ignoring Z axis.
---@param other Vector 
---@return number
function _Vector:Distance2D(other) end


---Returns this vector with a length of 1.\
---When normalized, a vector keeps the same direction but its length is 1.0.\
---Note that the current vector is unchanged and a new normalized vector is returned. If you want to normalize the current vector, use `Vector:Normalize` function.
---@return Vector
function _Vector:Normalized() end


---Makes this vector have a length of 1.\
---When normalized, a vector keeps the same direction but its length is 1.0.\
---Note that this function will change the current vector. If you want to keep the current vector unchanged, use `Vector:Normalized` function.
---@return nil
function _Vector:Normalize() end


---Dot Product of two vectors.\
---The dot product is a float value equal to the magnitudes of the two vectors multiplied together and then multiplied by the cosine of the angle between them.\
---For normalized vectors Dot returns 1 if they point in exactly the same direction, -1 if they point in completely opposite directions and zero if the vectors are perpendicular. \
---\
---[More](https://medium.com/@r.w.overdijk/unity-vector3-dot-what-11feb258052e)
---@param vector Vector 
---@return number
function _Vector:Dot(vector) end


---Dot Product of two vectors ignoring Z axis.
---@param vector Vector 
---@return number
function _Vector:Dot2D(vector) end


---Returns this vector multiplied by the given number. The same as `Vector * number`.
---@param scale number 
---@return Vector
function _Vector:Scaled(scale) end


---Multiplies this vector by the given number. The same as `Vector = Vector * number`.
---@param scale number 
---@return nil
function _Vector:Scale(scale) end


---Returns the length of this vector.\
---The length of the vector is `math.sqrt(x*x+y*y+z*z)`.\
---If you only need to compare length of some vectors, you can compare squared magnitudes of them using LengthSqr (computing squared length is faster).
---@return number
function _Vector:Length() end


---Returns the squared length of this vector.\
---This method is faster than Length because it avoids computing a square root. Use this method if you need to compare vectors.
---@return number
function _Vector:LengthSqr() end


---Returns the length of this vector ignoring Z axis.
---@return number
function _Vector:Length2D() end


---Returns the squared length of this vector ignoring Z axis.\
---This method is faster than Length2D because it avoids computing a square root. Use this method if you need to compare vectors.
---@return number
function _Vector:Length2DSqr() end


---Returns the new vector rotated counterclockwise by the given angle in the XY-plane, leaving the Z-axis unaffected.
---@param angle number|Angle 
---@return Vector
function _Vector:Rotated(angle) end


---Rotates this vector counterclockwise by the given angle in the XY-plane, leaving the Z-axis unaffected.
---@param angle number|Angle 
---@return nil
function _Vector:Rotate(angle) end


---Returns linearly interpolated vector between two vectors.\
---The value returned equals **a + (b - a) * t** (which can also be written **a * (1-t) + b*t**).\
---When `t = 0`, **a:Lerp(b, t)** returns `a`.\
---When `t = 1`, **a:Lerp(b, t)** returns `b`.\
---When `t = 0.5`, **a:Lerp(b, t)** returns the point midway between `a` and `b`.
---@param b Vector end value, returned when t = 1
---@param t number value used to interpolate between a and b.
---@return Vector
function _Vector:Lerp(b, t) end


---Returns cross product of two vectors.\
---\
---[More](https://docs.unity3d.com/ScriptReference/Vector3.Cross.html)\
---[Visualization](https://www.youtube.com/watch?v=kz92vvioeng)
---@param vector Vector 
---@return Vector
function _Vector:Cross(vector) end


---Moves vector forward by a specified distance in the direction defined by a given Angle.
---@param angle Angle 
---@param distance number distance to move
---@return Vector
function _Vector:MoveForward(angle, distance) end


---Converts Vector to Angle. See\
---https://github.com/ValveSoftware/source-sdk-2013/blob/0565403b153dfcde602f6f58d8f4d13483696a13/src/mathlib/mathlib_base.cpp#L535
---@return Vector
function _Vector:ToAngle() end


---Converts Vector to screen coordinate
---@return Vec2 screenPos
---@return boolean isVisible
function _Vector:ToScreen() end


---Returns x, y and z of this vector.
---@return number x
---@return number y
---@return number z
function _Vector:Get() end


---Returns x of this vector. The same as Vector.x.
---@return number
---@deprecated
function _Vector:GetX() end


---Returns y of this vector. The same as Vector.y.
---@return number
---@deprecated
function _Vector:GetY() end


---Returns z of this vector. The same as Vector.z.
---@return number
---@deprecated
function _Vector:GetZ() end


---Sets x. The same as Vector.x = value.
---@param value number 
---@return nil
---@deprecated
function _Vector:SetX(value) end


---Sets y. The same as Vector.y = value.
---@param value number 
---@return nil
---@deprecated
function _Vector:SetY(value) end


---Sets z. The same as Vector.z = value.
---@param value number 
---@return nil
---@deprecated
function _Vector:SetZ(value) end

---@return nil
function _Vector:Normalize() end

function _Vector:Clamp() end

---@return boolean
function _Vector:IsInvalid() end
```
