# CMenuSwitch

CMenuSwitch metatable.

```lua
---@class CMenuSwitch
---CMenuSwitch metatable.
local _CMenuSwitch = {}

---Returns widget's name.
---@return string
function _CMenuSwitch:Name() end


---Returns widget's parent.
---@return CMenuGroup|CMenuGearAttachment
function _CMenuSwitch:Parent() end


---Returns widget type.
---@return Enum.WidgetType
function _CMenuSwitch:Type() end


---Opens parent tabs.
---@return nil
function _CMenuSwitch:Open() end


---Changes text in the widget. The path to the widget is not affected.\
---May be used for dynamic text customization or recolor.
---@param newText string 
---@return nil
function _CMenuSwitch:ForceLocalization(newText) end


---Gets or sets tooltip. Tooltip is displayed when mouse cursor is over the widget.\
---Depends on the argument.
---@param newText string 
---@return string
---@overload fun(this: CMenuSwitch):string
function _CMenuSwitch:ToolTip(newText) end




---Gets or sets visible state. Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuSwitch): boolean
function _CMenuSwitch:Visible(value) end




---Gets or sets disabled state. Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuSwitch): boolean
function _CMenuSwitch:Disabled(value) end




---Gets or sets unsafe state. Unsafe widgets have warning sign.\
---Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuSwitch): boolean
function _CMenuSwitch:Unsafe(value) end




---Returns widget's value.
---@return boolean
function _CMenuSwitch:Get() end


---Sets widget's value.
---@param value boolean 
---@return nil
function _CMenuSwitch:Set(value) end


---Sets widget's image.
---@param imagePath string Path to the image.
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional image offset.
---@return nil
function _CMenuSwitch:Image(imagePath, offset) end


---Sets tab's image by already created handle.
---@param imageHandle integer 
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional image offset.
---@return nil
function _CMenuSwitch:ImageHandle(imageHandle, offset) end


---Sets widget's icon.\
---[Icons list](https://fontawesome.com/search?o=r&s=solid&f=classic)
---@param icon string icon unicode.
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional icon offset.
---@return nil
function _CMenuSwitch:Icon(icon, offset) end


---Sets widget's on change callback.
---@param callback fun(this: CMenuSwitch):nil function to be called on widget change.
---@param forceCall? boolean @default: `false`. true if you want to call callback on widget creation.
---@return nil
function _CMenuSwitch:SetCallback(callback, forceCall) end


---Removes widget's on change callback.
---@param callback fun(this: CMenuSwitch):nil function to be removed from widget's callbacks.
---@return nil
function _CMenuSwitch:UnsetCallback(callback) end


---Creates `CMenuColorPickerAttachment` and attaches it to the widget.
---@param name string Name of the attachment.
---@param color Color Default color.
---@return CMenuColorPickerAttachment
function _CMenuSwitch:ColorPicker(name, color) end


---Creates `CMenuGearAttachment` and attaches it to the widget.
---@param name string Name of the attachment.
---@param gearIcon? string @default: `"\uf013"`. Gear FontAwesome icon.
---@param useSmallFont? boolean @default: `true`. Use small font for gear icon.
---@return CMenuGearAttachment
function _CMenuSwitch:Gear(name, gearIcon, useSmallFont) end
```
