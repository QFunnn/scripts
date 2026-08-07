# CMenuInputBox

CMenuInputBox metatable.

```lua
---@class CMenuInputBox
---CMenuInputBox metatable.
local _CMenuInputBox = {}

---Returns widget's name.
---@return string
function _CMenuInputBox:Name() end


---Returns widget's parent.
---@return CMenuGroup|CMenuGearAttachment
function _CMenuInputBox:Parent() end


---Returns widget type.
---@return Enum.WidgetType
function _CMenuInputBox:Type() end


---Opens parent tabs.
---@return nil
function _CMenuInputBox:Open() end


---Changes text in the widget. The path to the widget is not affected.\
---May be used for dynamic text customization or recolor.
---@param newText string 
---@return nil
function _CMenuInputBox:ForceLocalization(newText) end


---Gets or sets tooltip. Tooltip is displayed when mouse cursor is over the widget.\
---Depends on the argument.
---@param newText string 
---@return string
---@overload fun(this: CMenuInputBox):string
function _CMenuInputBox:ToolTip(newText) end




---Gets or sets visible state. Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuInputBox): boolean
function _CMenuInputBox:Visible(value) end




---Gets or sets disabled state. Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuInputBox): boolean
function _CMenuInputBox:Disabled(value) end




---Gets or sets unsafe state. Unsafe widgets have warning sign.\
---Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuInputBox): boolean
function _CMenuInputBox:Unsafe(value) end




---Returns widget's value.
---@return string
function _CMenuInputBox:Get() end


---Sets widget's value.
---@param value string 
---@return nil
function _CMenuInputBox:Set(value) end


---Sets widget's image.
---@param imagePath string Path to the image.
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional image offset.
---@return nil
function _CMenuInputBox:Image(imagePath, offset) end


---Sets tab's image by already created handle.
---@param imageHandle integer 
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional image offset.
---@return nil
function _CMenuInputBox:ImageHandle(imageHandle, offset) end


---Sets widget's icon.\
---[Icons list](https://fontawesome.com/search?o=r&s=solid&f=classic)
---@param icon string icon unicode.
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional icon offset.
---@return nil
function _CMenuInputBox:Icon(icon, offset) end


---Sets widget's on change callback.
---@param callback fun(this: CMenuInputBox):nil function to be called on widget change.
---@param forceCall? boolean @default: `false`. true if you want to call callback on widget creation.
---@return nil
function _CMenuInputBox:SetCallback(callback, forceCall) end


---Removes widget's on change callback.
---@param callback fun(this: CMenuInputBox):nil function to be removed from widget's callbacks.
---@return nil
function _CMenuInputBox:UnsetCallback(callback) end


---Creates `CMenuColorPickerAttachment` and attaches it to the widget.
---@param name string Name of the attachment.
---@param color Color Default color.
---@return CMenuColorPickerAttachment
function _CMenuInputBox:ColorPicker(name, color) end


---Creates `CMenuGearAttachment` and attaches it to the widget.
---@param name string Name of the attachment.
---@param gearIcon? string @default: `"\uf013"`. Gear FontAwesome icon.
---@param useSmallFont? boolean @default: `true`. Use small font for gear icon.
---@return CMenuGearAttachment
function _CMenuInputBox:Gear(name, gearIcon, useSmallFont) end
```
