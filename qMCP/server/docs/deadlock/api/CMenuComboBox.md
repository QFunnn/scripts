# CMenuComboBox

CMenuComboBox metatable.

```lua
---@class CMenuComboBox
---CMenuComboBox metatable.
local _CMenuComboBox = {}

---Returns widget's name.
---@return string
function _CMenuComboBox:Name() end


---Update the combo box values.
---@param items string[] 
---@param defaultValue? integer @default: `0`. Index of default item. (starts from 0)
---@return nil
function _CMenuComboBox:Update(items, defaultValue) end


---Returns widget's parent.
---@return CMenuGroup|CMenuGearAttachment
function _CMenuComboBox:Parent() end


---Returns widget type.
---@return Enum.WidgetType
function _CMenuComboBox:Type() end


---Opens parent tabs.
---@return nil
function _CMenuComboBox:Open() end


---Changes text in the widget. The path to the widget is not affected.\
---May be used for dynamic text customization or recolor.
---@param newText string 
---@return nil
function _CMenuComboBox:ForceLocalization(newText) end


---Gets or sets tooltip. Tooltip is displayed when mouse cursor is over the widget.\
---Depends on the argument.
---@param newText string 
---@return string
---@overload fun(this: CMenuComboBox):string
function _CMenuComboBox:ToolTip(newText) end




---Gets or sets visible state. Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuComboBox): boolean
function _CMenuComboBox:Visible(value) end




---Gets or sets disabled state. Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuComboBox): boolean
function _CMenuComboBox:Disabled(value) end




---Gets or sets unsafe state. Unsafe widgets have warning sign.\
---Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuComboBox): boolean
function _CMenuComboBox:Unsafe(value) end




---Returns index of the selected item. It starts from 0.
---@return integer
function _CMenuComboBox:Get() end


---Sets widget's value.
---@param value integer 
---@return nil
function _CMenuComboBox:Set(value) end


---Returns array of the items.
---@return string[]
function _CMenuComboBox:List() end


---Sets widget's image.
---@param imagePath string Path to the image.
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional image offset.
---@return nil
function _CMenuComboBox:Image(imagePath, offset) end


---Sets tab's image by already created handle.
---@param imageHandle integer 
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional image offset.
---@return nil
function _CMenuComboBox:ImageHandle(imageHandle, offset) end


---Sets widget's icon.\
---[Icons list](https://fontawesome.com/search?o=r&s=solid&f=classic)
---@param icon string icon unicode.
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional icon offset.
---@return nil
function _CMenuComboBox:Icon(icon, offset) end


---Sets widget's on change callback.
---@param callback fun(this: CMenuComboBox):nil function to be called on widget change.
---@param forceCall? boolean @default: `false`. true if you want to call callback on widget creation.
---@return nil
function _CMenuComboBox:SetCallback(callback, forceCall) end


---Removes widget's on change callback.
---@param callback fun(this: CMenuComboBox):nil function to be removed from widget's callbacks.
---@return nil
function _CMenuComboBox:UnsetCallback(callback) end


---Creates `CMenuColorPickerAttachment` and attaches it to the widget.
---@param name string Name of the attachment.
---@param color Color Default color.
---@return CMenuColorPickerAttachment
function _CMenuComboBox:ColorPicker(name, color) end


---Creates `CMenuGearAttachment` and attaches it to the widget.
---@param name string Name of the attachment.
---@param gearIcon? string @default: `"\uf013"`. Gear FontAwesome icon.
---@param useSmallFont? boolean @default: `true`. Use small font for gear icon.
---@return CMenuGearAttachment
function _CMenuComboBox:Gear(name, gearIcon, useSmallFont) end
```
