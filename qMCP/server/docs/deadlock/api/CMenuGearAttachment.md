# CMenuGearAttachment

CMenuGearAttachment metatable.

```lua
---@class CMenuGearAttachment
---CMenuGearAttachment metatable.
local _CMenuGearAttachment = {}

---Returns widget's name.
---@return string
function _CMenuGearAttachment:Name() end


---Returns widget's parent.
---@return CMenuSwitch|CMenuSliderInt|CMenuSliderFloat|CMenuMultiComboBox|CMenuLabel|CMenuInputBox|CMenuComboBox|CMenuBind
function _CMenuGearAttachment:Parent() end


---Returns widget type.
---@return Enum.WidgetType
function _CMenuGearAttachment:Type() end


---Opens parent tabs.
---@return nil
function _CMenuGearAttachment:Open() end


---Changes text in the widget. The path to the widget is not affected.\
---May be used for dynamic text customization or recolor.
---@param newText string 
---@return nil
function _CMenuGearAttachment:ForceLocalization(newText) end


---Finds the widget by name.
---@param widgetName string 
---@return CMenuSwitch|CMenuBind|CMenuSliderFloat|CMenuSliderInt|CMenuColorPicker|CMenuComboBox|CMenuMultiComboBox|CMenuMultiSelect|CMenuInputBox|CMenuLabel|nil
function _CMenuGearAttachment:Find(widgetName) end


---Creates new `CMenuSwitch`.
---@param switchName string 
---@param defaultValue? boolean @default: `false`. 
---@param imageIcon? string @default: `""`. Path to image or FontAwesome icon unicode.
---@return CMenuSwitch
function _CMenuGearAttachment:Switch(switchName, defaultValue, imageIcon) end


---Creates new `CMenuBind`.
---@param bindName string 
---@param defaultValue? Enum.ButtonCode @default: `Enum.ButtonCode.BUTTON_CODE_INVALID`. 
---@param imageIcon? string @default: `""`. Path to image or FontAwesome icon unicode.
---@return CMenuBind
function _CMenuGearAttachment:Bind(bindName, defaultValue, imageIcon) end


---Creates new `CMenuSliderInt` or `CMenuSliderFloat` depents on arg types.\
---`minValue`, `maxValue` and `defaultValue` should be integer to create `CMenuSliderInt`.
---@param sliderName string 
---@param minValue integer 
---@param maxValue integer 
---@param defaultValue integer 
---@param format? string|fun(value: integer):string @default: `"%d"`. Format string or function to format value. See example.
---@return CMenuSliderInt
---@overload fun(this: CMenuGearAttachment, sliderName: string, minValue: number, maxValue: number, defaultValue: number, format: string|fun(value: number):string): CMenuSliderFloat
function _CMenuGearAttachment:Slider(sliderName, minValue, maxValue, defaultValue, format) end




---Creates new `CMenuColorPicker`.
---@param colorPickerName string 
---@param color Color 
---@param imageIcon? string @default: `""`. Path to image or FontAwesome icon unicode.
---@return CMenuColorPicker
function _CMenuGearAttachment:ColorPicker(colorPickerName, color, imageIcon) end


---Creates new `CMenuComboBox`.
---@param comboName string 
---@param items string[] 
---@param defaultValue? integer @default: `0`. Index of default item. (starts from 0)
---@return CMenuComboBox
function _CMenuGearAttachment:Combo(comboName, items, defaultValue) end


---Creates new `CMenuMultiComboBox`.
---@param multiComboName string 
---@param items string[] 
---@param enabledItems string[] table of enabled items
---@return CMenuMultiComboBox
function _CMenuGearAttachment:MultiCombo(multiComboName, items, enabledItems) end


---Creates new `CMenuMultiSelect`.
---@param multiSelectName string 
---@param items {nameId: string, imagePath: string, isEnabled: boolean}[] See example.
---@param expanded? boolean @default: `false`. false if you want to create MultiSelect in collapsed state.
---@return CMenuMultiSelect
function _CMenuGearAttachment:MultiSelect(multiSelectName, items, expanded) end


---Creates new `CMenuInputBox`.
---@param inputName string 
---@param defaultValue? string @default: `""`. 
---@param imageIcon? string @default: `""`. Path to image or FontAwesome icon unicode.
---@return CMenuInputBox
function _CMenuGearAttachment:Input(inputName, defaultValue, imageIcon) end


---Creates new `CMenuLabel`.
---@param labelText string 
---@param imageIcon? string @default: `""`. Path to image or FontAwesome icon unicode.
---@return CMenuLabel
function _CMenuGearAttachment:Label(labelText, imageIcon) end


---Gets or sets visible state. Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuGearAttachment): boolean
function _CMenuGearAttachment:Visible(value) end




---Gets or sets disabled state. Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuGearAttachment): boolean
function _CMenuGearAttachment:Disabled(value) end
```
