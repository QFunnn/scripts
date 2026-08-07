# CMenuColorPicker

CMenuColorPicker metatable.

```lua
---@class CMenuColorPicker
---CMenuColorPicker metatable.
local _CMenuColorPicker = {}

---Returns widget's name.
---@return string
function _CMenuColorPicker:Name() end


---Returns widget's parent.
---@return CMenuGroup|CMenuGearAttachment
function _CMenuColorPicker:Parent() end


---Returns widget type.
---@return Enum.WidgetType
function _CMenuColorPicker:Type() end


---Opens parent tabs.
---@return nil
function _CMenuColorPicker:Open() end


---Changes text in the widget. The path to the widget is not affected.\
---May be used for dynamic text customization or recolor.
---@param newText string 
---@return nil
function _CMenuColorPicker:ForceLocalization(newText) end


---Gets or sets tooltip. Tooltip is displayed when mouse cursor is over the widget.\
---Depends on the argument.
---@param newText string 
---@return string
---@overload fun(this: CMenuColorPicker):string
function _CMenuColorPicker:ToolTip(newText) end




---Gets or sets visible state. Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuColorPicker): boolean
function _CMenuColorPicker:Visible(value) end




---Gets or sets disabled state. Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuColorPicker): boolean
function _CMenuColorPicker:Disabled(value) end




---Gets or sets unsafe state. Unsafe widgets have warning sign.\
---Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuColorPicker): boolean
function _CMenuColorPicker:Unsafe(value) end




---Returns widget's value.
---@return Color
function _CMenuColorPicker:Get() end


---Sets widget's value.
---@param value Color 
---@return nil
function _CMenuColorPicker:Set(value) end


---Sets widget's image.
---@param imagePath string Path to the image.
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional image offset.
---@return nil
function _CMenuColorPicker:Image(imagePath, offset) end


---Sets tab's image by already created handle.
---@param imageHandle integer 
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional image offset.
---@return nil
function _CMenuColorPicker:ImageHandle(imageHandle, offset) end


---Sets widget's icon.\
---[Icons list](https://fontawesome.com/search?o=r&s=solid&f=classic)
---@param icon string icon unicode.
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional icon offset.
---@return nil
function _CMenuColorPicker:Icon(icon, offset) end


---Sets tab's image by already created handle.
---@param imageHandle integer 
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional image offset.
---@return nil
function _CMenuColorPicker:ImageHandle(imageHandle, offset) end


---Sets widget's on change callback.
---@param callback fun(this: CMenuColorPicker):nil function to be called on widget change.
---@param forceCall? boolean @default: `false`. true if you want to call callback on widget creation.
---@return nil
function _CMenuColorPicker:SetCallback(callback, forceCall) end


---Removes widget's on change callback.
---@param callback fun(this: CMenuColorPicker):nil function to be removed from widget's callbacks.
---@return nil
function _CMenuColorPicker:UnsetCallback(callback) end


---Gets or sets alpha bar state. Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuColorPicker): boolean
function _CMenuColorPicker:HideAlphaBar(value) end
```
