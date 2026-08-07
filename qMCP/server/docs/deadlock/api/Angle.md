# Angle

Angle metatable

```lua
---@class Angle
---@field pitch number 
---@field yaw number 
---@field roll number 
---Angle metatable
local _Angle = {}

---Create a new Angle.
---@param pitch? number @default: `0.0`. 
---@param yaw? number @default: `0.0`. 
---@param roll? number @default: `0.0`. 
---@return Angle
function Angle(pitch, yaw, roll) end


---@return string
function _Angle:__tostring() end


---Returns the forward vector from a given Angle.
---@return Vector
function _Angle:GetForward() end


---Returns the forward, right and up.
---@return Vector forward
---@return Vector right
---@return Vector up
function _Angle:GetVectors() end


---Returns the yaw. The same as Angle.yaw.
---@return number
---@deprecated
function _Angle:GetYaw() end


---Returns the roll. The same as Angle.roll.
---@return number
---@deprecated
function _Angle:GetRoll() end


---Returns the pitch. The same as Angle.pitch.
---@return number
---@deprecated
function _Angle:GetPitch() end


---Sets the yaw. The same as Angle.yaw = value.
---@param value number 
---@return nil
---@deprecated
function _Angle:SetYaw(value) end


---Sets the roll. The same as Angle.roll = value.
---@param value number 
---@return nil
---@deprecated
function _Angle:SetRoll(value) end


---Sets the pitch. The same as Angle.pitch = value.
---@param value number 
---@return nil
---@deprecated
function _Angle:SetPitch(value) end

---@return nil
function _Angle:Normalize() end
```
