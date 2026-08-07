# CThirdTab

CThirdTab metatable

```lua
---@class CThirdTab
---CThirdTab metatable
local _CThirdTab = {}

---Returns tab's name.
---@return string
function _CThirdTab:Name() end


---Returns tab's parent.
---@return CSecondTab
function _CThirdTab:Parent() end


---Returns widget type.
---@return Enum.WidgetType
function _CThirdTab:Type() end


---Opens parent tabs.
---@return nil
function _CThirdTab:Open() end


---Creates new `CMenuGroup`.
---@param groupName string 
---@param side? Enum.GroupSide @default: `Enum.GroupSide.Default`. 
---@return CMenuGroup
function _CThirdTab:Create(groupName, side) end


---Finds the `CMenuGroup` by name.
---@param groupName string 
---@return CMenuGroup|nil
function _CThirdTab:Find(groupName) end


---Sets tab's image.
---@param imagePath string Path to the image.
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional image offset.
---@return nil
function _CThirdTab:Image(imagePath, offset) end


---Sets tab's image by already created handle.
---@param imageHandle integer 
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional image offset.
---@return nil
function _CThirdTab:ImageHandle(imageHandle, offset) end


---Sets tab's icon.\
---[Icons list](https://fontawesome.com/search?o=r&s=solid&f=classic)
---@param icon string icon unicode.
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional icon offset.
---@return nil
function _CThirdTab:Icon(icon, offset) end
```
