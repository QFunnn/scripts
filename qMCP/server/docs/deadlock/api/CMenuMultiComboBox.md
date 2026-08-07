# CMenuMultiComboBox

CMenuMultiComboBox metatable.

```lua
---@class CMenuMultiComboBox
---CMenuMultiComboBox metatable.
local _CMenuMultiComboBox = {}

---Returns widget's name.
---@return string
function _CMenuMultiComboBox:Name() end


---Updates the multicombo values.
---@param items string[] 
---@param enabledItems string[] table of enabled items
---@return nil
function _CMenuMultiComboBox:Update(items, enabledItems) end


---Returns widget's parent.
---@return CMenuGroup|CMenuGearAttachment
function _CMenuMultiComboBox:Parent() end


---Returns widget type.
---@return Enum.WidgetType
function _CMenuMultiComboBox:Type() end


---Opens parent tabs.
---@return nil
function _CMenuMultiComboBox:Open() end


---Changes text in the widget. The path to the widget is not affected.\
---May be used for dynamic text customization or recolor.
---@param newText string 
---@return nil
function _CMenuMultiComboBox:ForceLocalization(newText) end


---Gets or sets tooltip. Tooltip is displayed when mouse cursor is over the widget.\
---Depends on the argument.
---@param newText string 
---@return string
---@overload fun(this: CMenuMultiComboBox):string
function _CMenuMultiComboBox:ToolTip(newText) end




---Gets or sets visible state. Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuMultiComboBox): boolean
function _CMenuMultiComboBox:Visible(value) end




---Gets or sets disabled state. Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuMultiComboBox): boolean
function _CMenuMultiComboBox:Disabled(value) end




---Gets or sets unsafe state. Unsafe widgets have warning sign.\
---Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuMultiComboBox): boolean
function _CMenuMultiComboBox:Unsafe(value) end




---Returns enable state of the item in combo box.
---@param itemId string 
---@return boolean
function _CMenuMultiComboBox:Get(itemId) end


---Sets a new value for the item by itemId or sets a new list of enabled items
---@param enabledItems string[] A table of enabled items; other items will be disabled.
---@return nil
---@overload fun(this: CMenuMultiComboBox, itemId: string, value: boolean):nil
function _CMenuMultiComboBox:Set(enabledItems) end




---Returns array of itemIds.
---@return string[]
function _CMenuMultiComboBox:List() end


---Returns array of enabled itemIds.
---@return string[]
function _CMenuMultiComboBox:ListEnabled() end


---Sets widget's image.
---@param imagePath string Path to the image.
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional image offset.
---@return nil
function _CMenuMultiComboBox:Image(imagePath, offset) end


---Sets tab's image by already created handle.
---@param imageHandle integer 
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional image offset.
---@return nil
function _CMenuMultiComboBox:ImageHandle(imageHandle, offset) end


---Sets widget's icon.\
---[Icons list](https://fontawesome.com/search?o=r&s=solid&f=classic)
---@param icon string icon unicode.
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional icon offset.
---@return nil
function _CMenuMultiComboBox:Icon(icon, offset) end


---Sets widget's on change callback.
---@param callback fun(this: CMenuMultiComboBox):nil function to be called on widget change.
---@param forceCall? boolean @default: `false`. true if you want to call callback on widget creation.
---@return nil
function _CMenuMultiComboBox:SetCallback(callback, forceCall) end


---Removes widget's on change callback.
---@param callback fun(this: CMenuMultiComboBox):nil function to be removed from widget's callbacks.
---@return nil
function _CMenuMultiComboBox:UnsetCallback(callback) end


---Creates `CMenuColorPickerAttachment` and attaches it to the widget.
---@param name string Name of the attachment.
---@param color Color Default color.
---@return CMenuColorPickerAttachment
function _CMenuMultiComboBox:ColorPicker(name, color) end


---Creates `CMenuGearAttachment` and attaches it to the widget.
---@param name string Name of the attachment.
---@param gearIcon? string @default: `"\uf013"`. Gear FontAwesome icon.
---@param useSmallFont? boolean @default: `true`. Use small font for gear icon.
---@return CMenuGearAttachment
function _CMenuMultiComboBox:Gear(name, gearIcon, useSmallFont) end
```
