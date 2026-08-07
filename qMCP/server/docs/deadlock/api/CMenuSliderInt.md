# CMenuSliderInt

CMenuSliderInt metatable.

```lua
---@class CMenuSliderInt
---CMenuSliderInt metatable.
local _CMenuSliderInt = {}

---Updates the slider values.
---@param minValue integer 
---@param maxValue integer 
---@param defaultValue integer 
---@return nil
function _CMenuSliderInt:Update(minValue, maxValue, defaultValue) end


---Returns widget's name.
---@return string
function _CMenuSliderInt:Name() end


---Returns widget's parent.
---@return CMenuGroup|CMenuGearAttachment
function _CMenuSliderInt:Parent() end


---Returns widget type.
---@return Enum.WidgetType
function _CMenuSliderInt:Type() end


---Opens parent tabs.
---@return nil
function _CMenuSliderInt:Open() end


---Changes text in the widget. The path to the widget is not affected.\
---May be used for dynamic text customization or recolor.
---@param newText string 
---@return nil
function _CMenuSliderInt:ForceLocalization(newText) end


---Gets or sets tooltip. Tooltip is displayed when mouse cursor is over the widget.\
---Depends on the argument.
---@param newText string 
---@return string
---@overload fun(this: CMenuSliderInt):string
function _CMenuSliderInt:ToolTip(newText) end




---Gets or sets visible state. Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuSliderInt): boolean
function _CMenuSliderInt:Visible(value) end




---Gets or sets disabled state. Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuSliderInt): boolean
function _CMenuSliderInt:Disabled(value) end




---Gets or sets unsafe state. Unsafe widgets have warning sign.\
---Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuSliderInt): boolean
function _CMenuSliderInt:Unsafe(value) end




---Returns widget's value.
---@return integer
function _CMenuSliderInt:Get() end


---Sets widget's value.
---@param value integer 
---@return nil
function _CMenuSliderInt:Set(value) end


---Sets widget's image.
---@param imagePath string Path to the image.
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional image offset.
---@return nil
function _CMenuSliderInt:Image(imagePath, offset) end


---Sets tab's image by already created handle.
---@param imageHandle integer 
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional image offset.
---@return nil
function _CMenuSliderInt:ImageHandle(imageHandle, offset) end


---Sets widget's icon.\
---[Icons list](https://fontawesome.com/search?o=r&s=solid&f=classic)
---@param icon string icon unicode.
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional icon offset.
---@return nil
function _CMenuSliderInt:Icon(icon, offset) end


---Sets widget's on change callback.
---@param callback fun(this: CMenuSliderInt):nil function to be called on widget change.
---@param forceCall? boolean @default: `false`. true if you want to call callback on widget creation.
---@return nil
function _CMenuSliderInt:SetCallback(callback, forceCall) end


---Removes widget's on change callback.
---@param callback fun(this: CMenuSliderInt):nil function to be removed from widget's callbacks.
---@return nil
function _CMenuSliderInt:UnsetCallback(callback) end


---Creates `CMenuColorPickerAttachment` and attaches it to the widget.
---@param name string Name of the attachment.
---@param color Color Default color.
---@return CMenuColorPickerAttachment
function _CMenuSliderInt:ColorPicker(name, color) end


---Creates `CMenuGearAttachment` and attaches it to the widget.
---@param name string Name of the attachment.
---@param gearIcon? string @default: `"\uf013"`. Gear FontAwesome icon.
---@param useSmallFont? boolean @default: `true`. Use small font for gear icon.
---@return CMenuGearAttachment
function _CMenuSliderInt:Gear(name, gearIcon, useSmallFont) end
```
