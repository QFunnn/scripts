# CMenuGroup

CMenuGroup metatable

```lua
---@class CMenuGroup
---CMenuGroup metatable
local _CMenuGroup = {}

---Returns group's name.
---@return string
function _CMenuGroup:Name() end


---Returns group's parent.
---@return CThirdTab
function _CMenuGroup:Parent() end


---Returns widget type.
---@return Enum.WidgetType
function _CMenuGroup:Type() end


---Opens parent tabs.
---@return nil
function _CMenuGroup:Open() end


---Finds the widget by name.
---@param widgetName string 
---@return CMenuSwitch|CMenuBind|CMenuSliderFloat|CMenuSliderInt|CMenuColorPicker|CMenuComboBox|CMenuButton|CMenuMultiComboBox|CMenuMultiSelect|CMenuInputBox|CMenuLabel|nil
function _CMenuGroup:Find(widgetName) end


---Creates new `CMenuSwitch`.
---@param switchName string 
---@param defaultValue? boolean @default: `false`. 
---@param imageIcon? string @default: `""`. Path to image or FontAwesome icon unicode.
---@return CMenuSwitch
function _CMenuGroup:Switch(switchName, defaultValue, imageIcon) end


---Creates new `CMenuBind`.
---@param bindName string 
---@param defaultValue? Enum.ButtonCode @default: `Enum.ButtonCode.BUTTON_CODE_INVALID`. 
---@param imageIcon? string @default: `""`. Path to image or FontAwesome icon unicode.
---@return CMenuBind
function _CMenuGroup:Bind(bindName, defaultValue, imageIcon) end


---Creates new `CMenuSliderInt` or `CMenuSliderFloat` depents on arg types.\
---`minValue`, `maxValue` and `defaultValue` should be integer to create `CMenuSliderInt`.
---@param sliderName string 
---@param minValue integer 
---@param maxValue integer 
---@param defaultValue integer 
---@param format? string|fun(value: integer):string @default: `"%d"`. Format string or function to format value. See example.
---@return CMenuSliderInt
---@overload fun(this: CMenuGroup, sliderName: string, minValue: number, maxValue: number, defaultValue: number, format: string|fun(value: number):string): CMenuSliderFloat
function _CMenuGroup:Slider(sliderName, minValue, maxValue, defaultValue, format) end




---Creates new `CMenuColorPicker`.
---@param colorPickerName string 
---@param color Color 
---@param imageIcon? string @default: `""`. Path to image or FontAwesome icon unicode.
---@return CMenuColorPicker
function _CMenuGroup:ColorPicker(colorPickerName, color, imageIcon) end


---Creates new `CMenuButton`.
---@param buttonName string 
---@param callback function `fun(this: CMenuButton):nil` function to call on button click.
---@param altStyle? boolean @default: `false`. Use alternative button style.
---@param widthPercent? number @default: `1.0`. Button width in percents. [0.0, 1.0]
---@return CMenuButton
function _CMenuGroup:Button(buttonName, callback, altStyle, widthPercent) end


---Creates new `CMenuComboBox`.
---@param comboName string 
---@param items string[] 
---@param defaultValue? integer @default: `0`. Index of default item. (starts from 0)
---@return CMenuComboBox
function _CMenuGroup:Combo(comboName, items, defaultValue) end


---Creates new `CMenuMultiComboBox`.
---@param multiComboName string 
---@param items string[] 
---@param enabledItems string[] table of enabled items
---@return CMenuMultiComboBox
function _CMenuGroup:MultiCombo(multiComboName, items, enabledItems) end


---Creates new `CMenuMultiSelect`.
---@param multiSelectName string 
---@param items {nameId: string, imagePath: string, isEnabled: boolean}[] See example.
---@param expanded? boolean @default: `false`. false if you want to create MultiSelect in collapsed state.
---@return CMenuMultiSelect
function _CMenuGroup:MultiSelect(multiSelectName, items, expanded) end


---Creates new `CMenuInputBox`.
---@param inputName string 
---@param defaultValue string 
---@param imageIcon? string @default: `""`. Path to image or FontAwesome icon unicode.
---@return CMenuInputBox
function _CMenuGroup:Input(inputName, defaultValue, imageIcon) end


---Creates new `CMenuLabel`.
---@param labelText string 
---@param imageIcon? string @default: `""`. Path to image or FontAwesome icon unicode.
---@return CMenuLabel
function _CMenuGroup:Label(labelText, imageIcon) end


---Gets or sets group's disabled state. Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuGroup): boolean
function _CMenuGroup:Disabled(value) end




---Gets or sets group's visible state. Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuGroup): boolean
function _CMenuGroup:Visible(value) end




---Gets or sets group's search state. Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuGroup): boolean
function _CMenuGroup:SearchHidden(value) end
```
