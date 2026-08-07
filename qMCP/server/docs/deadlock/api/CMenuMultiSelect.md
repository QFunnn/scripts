# CMenuMultiSelect

CMenuMultiSelect metatable.

```lua
---@class CMenuMultiSelect
---CMenuMultiSelect metatable.
local _CMenuMultiSelect = {}

---Returns widget's name.
---@return string
function _CMenuMultiSelect:Name() end


---Updates the multiselect values.
---@param items {nameId: string, imagePath: string, isEnabled: boolean}[] See `CMenuGroup:MultiSelect`.
---@param expanded? boolean @default: `false`. false if you want to create MultiSelect in collapsed state.
---@param saveToConfig? boolean @default: `false`. true if you want to save to config
---@return nil
function _CMenuMultiSelect:Update(items, expanded, saveToConfig) end


---Gets or sets one item selection state. One item selection allows only one item to be\
---selected. Depends on the argument.
---@param newState boolean 
---@return boolean
---@overload fun(this: CMenuMultiSelect):boolean
function _CMenuMultiSelect:OneItemSelection(newState) end




---Gets or sets drag allowed state. Drag allows items to be ordered by cursor.\
---Depends on the argument.
---@param newState boolean 
---@return boolean
---@overload fun(this: CMenuMultiSelect):boolean
function _CMenuMultiSelect:DragAllowed(newState) end




---Returns widget's parent.
---@return CMenuGroup|CMenuGearAttachment
function _CMenuMultiSelect:Parent() end


---Returns widget type.
---@return Enum.WidgetType
function _CMenuMultiSelect:Type() end


---Opens parent tabs.
---@return nil
function _CMenuMultiSelect:Open() end


---Changes text in the widget. The path to the widget is not affected.\
---May be used for dynamic text customization or recolor.
---@param newText string 
---@return nil
function _CMenuMultiSelect:ForceLocalization(newText) end


---Gets or sets tooltip. Tooltip is displayed when mouse cursor is over the widget.\
---Depends on the argument.
---@param newText string 
---@return string
---@overload fun(this: CMenuMultiSelect):string
function _CMenuMultiSelect:ToolTip(newText) end




---Gets or sets visible state. Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuMultiSelect): boolean
function _CMenuMultiSelect:Visible(value) end




---Gets or sets disabled state. Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuMultiSelect): boolean
function _CMenuMultiSelect:Disabled(value) end




---Gets or sets unsafe state. Unsafe widgets have warning sign.\
---Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuMultiSelect): boolean
function _CMenuMultiSelect:Unsafe(value) end




---Returns enable state of the item in multiselect.
---@param itemId string 
---@return boolean
function _CMenuMultiSelect:Get(itemId) end


---Sets a new value for the item by itemId or sets a new list of enabled items
---@param enabledItems string[] A table of enabled items; other items will be disabled.
---@return nil
---@overload fun(this: CMenuMultiSelect, itemId: string, value: boolean):nil
function _CMenuMultiSelect:Set(enabledItems) end




---Returns array of itemIds.
---@return string[]
function _CMenuMultiSelect:List() end


---Returns array of enabled itemIds.
---@return string[]
function _CMenuMultiSelect:ListEnabled() end


---Sets widget's image.
---@param imagePath string Path to the image.
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional image offset.
---@return nil
function _CMenuMultiSelect:Image(imagePath, offset) end


---Sets tab's image by already created handle.
---@param imageHandle integer 
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional image offset.
---@return nil
function _CMenuMultiSelect:ImageHandle(imageHandle, offset) end


---Sets widget's icon.\
---[Icons list](https://fontawesome.com/search?o=r&s=solid&f=classic)
---@param icon string icon unicode.
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional icon offset.
---@return nil
function _CMenuMultiSelect:Icon(icon, offset) end


---Sets widget's on change callback.
---@param callback fun(this: CMenuMultiSelect):nil function to be called on widget change.
---@param forceCall? boolean @default: `false`. true if you want to call callback on widget creation.
---@return nil
function _CMenuMultiSelect:SetCallback(callback, forceCall) end


---Removes widget's on change callback.
---@param callback fun(this: CMenuMultiSelect):nil function to be removed from widget's callbacks.
---@return nil
function _CMenuMultiSelect:UnsetCallback(callback) end


---Updates widget's background colors.
---@param colors table<string> Table with background colors.
---@return nil
function _CMenuMultiSelect:UpdateBackgroundColors(colors) end


---Updates widget's image colors.
---@param colors table<string> Table with image colors.
---@return nil
function _CMenuMultiSelect:UpdateImageColors(colors) end


---Updates widget's tooltips
---@param colors table<string> Table with new tooltips
---@return nil
function _CMenuMultiSelect:UpdateToolTips(colors) end
```
