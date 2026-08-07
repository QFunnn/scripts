# CMenuColorPickerAttachment

CMenuColorPickerAttachment metatable.

```lua
---@class CMenuColorPickerAttachment
---CMenuColorPickerAttachment metatable.
local _CMenuColorPickerAttachment = {}

---Returns widget's name.
---@return string
function _CMenuColorPickerAttachment:Name() end


---Returns widget's parent.
---@return CMenuSwitch|CMenuSliderInt|CMenuSliderFloat|CMenuMultiComboBox|CMenuLabel|CMenuInputBox|CMenuGroup|CMenuBind
function _CMenuColorPickerAttachment:Parent() end


---Returns widget type.
---@return Enum.WidgetType
function _CMenuColorPickerAttachment:Type() end


---Opens parent tabs.
---@return nil
function _CMenuColorPickerAttachment:Open() end


---Changes text in the widget. The path to the widget is not affected.\
---May be used for dynamic text customization or recolor.
---@param newText string 
---@return nil
function _CMenuColorPickerAttachment:ForceLocalization(newText) end


---Gets or sets visible state. Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuColorPickerAttachment): boolean
function _CMenuColorPickerAttachment:Visible(value) end




---Gets or sets disabled state. Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuColorPickerAttachment): boolean
function _CMenuColorPickerAttachment:Disabled(value) end




---Returns widget's value.
---@return Color
function _CMenuColorPickerAttachment:Get() end


---Sets widget's value.
---@param value Color 
---@return nil
function _CMenuColorPickerAttachment:Set(value) end


---Sets widget's on change callback.
---@param callback fun(this: CMenuColorPickerAttachment):nil function to be called on widget change.
---@param forceCall? boolean @default: `false`. true if you want to call callback on widget creation.
---@return nil
function _CMenuColorPickerAttachment:SetCallback(callback, forceCall) end


---Removes widget's on change callback.
---@param callback fun(this: CMenuColorPickerAttachment):nil function to be removed from widget's callbacks.
---@return nil
function _CMenuColorPickerAttachment:UnsetCallback(callback) end
```
