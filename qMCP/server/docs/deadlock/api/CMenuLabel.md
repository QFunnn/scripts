# CMenuLabel

CMenuLabel metatable.

```lua
---@class CMenuLabel
---CMenuLabel metatable.
local _CMenuLabel = {}

---Returns widget's name.
---@return string
function _CMenuLabel:Name() end


---Returns widget's parent.
---@return CMenuGroup|CMenuGearAttachment
function _CMenuLabel:Parent() end


---Returns widget type.
---@return Enum.WidgetType
function _CMenuLabel:Type() end


---Opens parent tabs.
---@return nil
function _CMenuLabel:Open() end


---Changes text in the widget. The path to the widget is not affected.\
---May be used for dynamic text customization or recolor.
---@param newText string 
---@return nil
function _CMenuLabel:ForceLocalization(newText) end


---Gets or sets tooltip. Tooltip is displayed when mouse cursor is over the widget.\
---Depends on the argument.
---@param newText string 
---@return string
---@overload fun(this: CMenuLabel):string
function _CMenuLabel:ToolTip(newText) end




---Gets or sets visible state. Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuLabel): boolean
function _CMenuLabel:Visible(value) end




---Gets or sets disabled state. Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuLabel): boolean
function _CMenuLabel:Disabled(value) end




---Gets or sets unsafe state. Unsafe widgets have warning sign.\
---Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuLabel): boolean
function _CMenuLabel:Unsafe(value) end




---Sets widget's image.
---@param imagePath string Path to the image.
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional image offset.
---@return nil
function _CMenuLabel:Image(imagePath, offset) end


---Sets tab's image by already created handle.
---@param imageHandle integer 
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional image offset.
---@return nil
function _CMenuLabel:ImageHandle(imageHandle, offset) end


---Sets widget's icon.\
---[Icons list](https://fontawesome.com/search?o=r&s=solid&f=classic)
---@param icon string icon unicode.
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional icon offset.
---@return nil
function _CMenuLabel:Icon(icon, offset) end


---Creates `CMenuColorPickerAttachment` and attaches it to the widget.
---@param name string Name of the attachment.
---@param color Color Default color.
---@return CMenuColorPickerAttachment
function _CMenuLabel:ColorPicker(name, color) end


---Creates `CMenuGearAttachment` and attaches it to the widget.
---@param name string Name of the attachment.
---@param gearIcon? string @default: `"\uf013"`. Gear FontAwesome icon.
---@param useSmallFont? boolean @default: `true`. Use small font for gear icon.
---@return CMenuGearAttachment
function _CMenuLabel:Gear(name, gearIcon, useSmallFont) end
```
