# Color

Color metatable

```lua
---@class Color
---@field r number red
---@field g number green
---@field b number blue
---@field a number alpha
---Color metatable
local _Color = {}

---Create a new Color.
---@param r? number @default: `255`. 
---@param g? number @default: `255`. 
---@param b? number @default: `255`. 
---@param a? number @default: `255`. 
---@return Color
---@overload fun(hex: string): Color
---@overload fun(rgba: number): Color
---@overload fun(rgb: number, alpha: number): Color
---@overload fun(r: number, g: number, b: number): Color
function Color(r, g, b, a) end




---Overwrites the color's ranges using the fraction values. Returns itself.
---@param r number New R color range as a percentage in the range [0.0, 1.0]
---@param g number New G color range as a percentage in the range [0.0, 1.0]
---@param b number New B color range as a percentage in the range [0.0, 1.0]
---@param a number New A color range as a percentage in the range [0.0, 1.0]
---@return Color
function _Color:AsFraction(r, g, b, a) end


---Overwrites the color's ranges converting the int value to RGBA values. Returns\
---itself.
---@param value number int color value
---@return Color
function _Color:AsInt(value) end


---Overwrites the color's ranges converting the HSV to RGBA values. Returns itself.
---@param h number Hue color range [0.0, 1.0]
---@param s number Saturation color range [0.0, 1.0]
---@param v number Value color range [0.0, 1.0]
---@param a number Alpha color range [0.0, 1.0]
---@return Color
function _Color:AsHsv(h, s, v, a) end


---Overwrites the color's ranges converting the HSL to RGBA values. Returns itself.
---@param h number Hue color range [0.0, 1.0]
---@param s number Saturation color range [0.0, 1.0]
---@param l number Lightness color range [0.0, 1.0]
---@param a number Alpha color range [0.0, 1.0]
---@return Color
function _Color:AsHsl(h, s, l, a) end


---Returns the r, g, b, and a ranges of the color as a percentage in the range of\
---[0.0, 1.0].
---@return number r
---@return number g
---@return number b
---@return number a
function _Color:ToFraction() end


---Returns the int value representing the color.
---@return number
function _Color:ToInt() end


---Returns the HSV representation of the color.
---@return number hue
---@return number saturation
---@return number value
function _Color:ToHsv() end


---Returns the ToHsl representation of the color.
---@return number hue
---@return number saturation
---@return number lightness
function _Color:ToHsl() end


---Returns the hex string representing the color.
---@return string
function _Color:ToHex() end


---Returns the linearly interpolated color between two colors by the specified weight.
---@param other Color The color to interpolate to
---@param weight number A value between 0 and 1 that indicates the weight of **other**
---@return Color
function _Color:Lerp(other, weight) end


---Returns the grayscaled color.
---@param weight number A value between 0 and 1 that indicates the weight of **grayscale**
---@return Color
function _Color:Grayscale(weight) end


---Returns the alpha modulated color.
---@param alpha number Alpha color range [0.0, 1.0]
---@return Color
function _Color:AlphaModulate(alpha) end


---Creates and returns a copy of the color object.
---@return Color
function _Color:Clone() end


---Returns the r, g, b, and a values of the color. Note that these fields can be\
---accessed by indexing r, g, b, and a.
---@return number r
---@return number g
---@return number b
---@return number a
function _Color:Unpack() end


---Returns hex string representing the color.
---@return string
function _Color:__tostring() end
```
