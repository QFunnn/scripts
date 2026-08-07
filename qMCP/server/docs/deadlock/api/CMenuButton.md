# CMenuButton

CMenuButton metatable.

```lua
---@class CMenuButton
---CMenuButton metatable.
local _CMenuButton = {}

---Returns widget's name.
---@return string
function _CMenuButton:Name() end


---Returns widget's parent.
---@return CMenuGroup|CMenuGearAttachment
function _CMenuButton:Parent() end


---Returns widget type.
---@return Enum.WidgetType
function _CMenuButton:Type() end


---Opens parent tabs.
---@return nil
function _CMenuButton:Open() end


---Changes text in the widget. The path to the widget is not affected.\
---May be used for dynamic text customization or recolor.
---@param newText string 
---@return nil
function _CMenuButton:ForceLocalization(newText) end


---Gets or sets tooltip. Tooltip is displayed when mouse cursor is over the widget.\
---Depends on the argument.
---@param newText string 
---@return string
---@overload fun(this: CMenuButton):string
function _CMenuButton:ToolTip(newText) end




---Gets or sets visible state. Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuButton): boolean
function _CMenuButton:Visible(value) end




---Gets or sets disabled state. Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuButton): boolean
function _CMenuButton:Disabled(value) end




---Gets or sets unsafe state. Unsafe widgets have warning sign.\
---Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuButton): boolean
function _CMenuButton:Unsafe(value) end




---Sets widget's image.
---@param imagePath string Path to the image.
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional image offset.
---@return nil
function _CMenuButton:Image(imagePath, offset) end


---Sets tab's image by already created handle.
---@param imageHandle integer 
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional image offset.
---@return nil
function _CMenuButton:ImageHandle(imageHandle, offset) end


---Sets widget's icon.\
---[Icons list](https://fontawesome.com/search?o=r&s=solid&f=classic)
---@param icon string icon unicode.
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional icon offset.
---@return nil
function _CMenuButton:Icon(icon, offset) end


---Sets widget's on change callback.
---@param callback fun(this: CMenuButton):nil function to be called on widget change.
---@param forceCall? boolean @default: `false`. true if you want to call callback on widget creation.
---@return nil
function _CMenuButton:SetCallback(callback, forceCall) end


---Removes widget's on change callback.
---@param callback fun(this: CMenuButton):nil function to be removed from widget's callbacks.
---@return nil
function _CMenuButton:UnsetCallback(callback) end
```
