# Vec2

Vec2 metatable

```lua
---@class Vec2
---@field x number 
---@field y number 
---@operator add(Vec2|number):Vec2
---@operator sub(Vec2|number):Vec2
---@operator div(Vec2|number):Vec2
---Vec2 metatable
local _Vec2 = {}

---Create a new Vec2.
---@param x number 
---@param y number 
---@return Vec2
---@overload fun():Vec2
function Vec2(x, y) end




---@return string
function _Vec2:__tostring() end


---@param other Vec2|number 
---@return Vec2
---@deprecated
function _Vec2:__add(other) end


---@param other Vec2|number 
---@return Vec2
---@deprecated
function _Vec2:__sub(other) end


---@param other Vec2|number 
---@return Vec2
---@deprecated
function _Vec2:__div(other) end


---Returns the length of the vector.
---@return number
function _Vec2:Length() end


---Returns x, y of this vector.
---@return number x
---@return number y
function _Vec2:Get() end


---Returns x of this vector. The same as Vec2.x.
---@return number
---@deprecated
function _Vec2:GetX() end


---Returns y of this vector. The same as Vec2.y.
---@return number
---@deprecated
function _Vec2:GetY() end


---Sets x. The same as Vec2.x = value.
---@param value number 
---@return nil
---@deprecated
function _Vec2:SetX(value) end


---Sets y. The same as Vec2.y = value.
---@param value number 
---@return nil
---@deprecated
function _Vec2:SetY(value) end
```
