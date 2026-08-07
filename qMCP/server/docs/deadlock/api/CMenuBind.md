# CMenuBind

CMenuBind metatable.

```lua
---@class CMenuBind
---CMenuBind metatable.
local _CMenuBind = {}

---Returns widget's name.
---@return string
function _CMenuBind:Name() end


---Returns widget's parent.
---@return CMenuGroup|CMenuGearAttachment
function _CMenuBind:Parent() end


---Returns widget's type.
---@return Enum.WidgetType
function _CMenuBind:Type() end


---Opens parent tabs.
---@return nil
function _CMenuBind:Open() end


---Changes text in the widget. The path to the widget is not affected.\
---May be used for dynamic text customization or recolor.
---@param newText string 
---@return nil
function _CMenuBind:ForceLocalization(newText) end


---Gets or sets tooltip. Tooltip is displayed when mouse cursor is over the widget.\
---Depends on the argument.
---@param newText string 
---@return string
---@overload fun(this: CMenuBind):string
function _CMenuBind:ToolTip(newText) end




---Gets or sets visible state. Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuBind): boolean
function _CMenuBind:Visible(value) end




---Gets or sets disabled state. Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuBind): boolean
function _CMenuBind:Disabled(value) end




---Gets or sets unsafe state. Unsafe widgets have warning sign.\
---Depends on argument.
---@param value boolean 
---@return nil
---@overload fun(this: CMenuBind): boolean
function _CMenuBind:Unsafe(value) end




---Returns widget's value. To get both of the buttons use `Buttons` method.
---@param idx? 0|1 @default: `0`. index of the button to get value from
---@return Enum.ButtonCode
function _CMenuBind:Get(idx) end


---Sets widget's value.
---@param key1 Enum.ButtonCode primary button code
---@param key2? Enum.ButtonCode @default: `Enum.ButtonCode.KEY_NONE`. secondary button code
---@return nil
function _CMenuBind:Set(key1, key2) end


---Returns widget's buttons value.
---@return Enum.ButtonCode first button code
---@return Enum.ButtonCode second button code
function _CMenuBind:Buttons() end


---Returns `true` when the key or both keys is down.
---@return boolean
function _CMenuBind:IsDown() end


---Returns `true` when the key or both keys is pressed for the first time.
---@return boolean
function _CMenuBind:IsPressed() end


---Bind stores it's toggle state and switches it when the key is pressed. This method\
---returns this state.
---@return boolean
function _CMenuBind:IsToggled() end


---Sets the toggle state manually.
---@param value boolean 
---@return nil
function _CMenuBind:SetToggled(value) end


---Sets widget's image.
---@param imagePath string Path to the image.
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional image offset.
---@return nil
function _CMenuBind:Image(imagePath, offset) end


---Sets tab's image by already created handle.
---@param imageHandle integer 
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional image offset.
---@return nil
function _CMenuBind:ImageHandle(imageHandle, offset) end


---Sets widget's icon.\
---[Icons list](https://fontawesome.com/search?o=r&s=solid&f=classic)
---@param icon string icon unicode.
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional icon offset.
---@return nil
function _CMenuBind:Icon(icon, offset) end


---Sets widget's on change callback.
---@param callback fun(this: CMenuBind):nil function to be called on widget change.
---@param forceCall? boolean @default: `false`. true if you want to call callback on widget creation.
---@return nil
function _CMenuBind:SetCallback(callback, forceCall) end


---Removes widget's on change callback.
---@param callback fun(this: CMenuBind):nil function to be removed from widget's callbacks.
---@return nil
function _CMenuBind:UnsetCallback(callback) end


---Creates `CMenuColorPickerAttachment` and attaches it to the widget.
---@param name string Name of the attachment.
---@param color Color Default color.
---@return CMenuColorPickerAttachment
function _CMenuBind:ColorPicker(name, color) end


---Creates `CMenuGearAttachment` and attaches it to the widget.
---@param name string Name of the attachment.
---@param gearIcon? string @default: `"\uf013"`. Gear FontAwesome icon.
---@param useSmallFont? boolean @default: `true`. Use small font for gear icon.
---@return CMenuGearAttachment
function _CMenuBind:Gear(name, gearIcon, useSmallFont) end


---Updates the properties of a widget for display in the bind list.
---@param name? string @default: `nil`. Overridden name to display in bind list.
---@param value? string @default: `nil`. Overridden value to display alongside the name in the bind list. This can be used to provide additional context about the bind.
---@param markAsToggle? boolean @default: `false`. Indicates whether the bind should be marked as a toggle, which is particularly useful if the bind's functionality includes toggling states. Recommended to be used in conjunction with the IsToggled().
---@return nil
function _CMenuBind:Properties(name, value, markAsToggle) end


---Gets or sets the visibility of the bind in the bind island.
---@param newStatus boolean 
---@return boolean
---@overload fun(this: CMenuBind):boolean
function _CMenuBind:ShowInBindIsland(newStatus) end




---Gets or sets the ability to bind the mouse button.
---@param newStatus boolean 
---@return boolean
---@overload fun(this: CMenuBind):boolean
function _CMenuBind:MouseBinding(newStatus) end
```
