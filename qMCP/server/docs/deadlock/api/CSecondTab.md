# CSecondTab

CSecondTab metatable

```lua
---@class CSecondTab
---CSecondTab metatable
local _CSecondTab = {}

---Returns tab's name.
---@return string
function _CSecondTab:Name() end


---Returns tab's parent.
---@return CTabSection
function _CSecondTab:Parent() end


---Returns widget type.
---@return Enum.WidgetType
function _CSecondTab:Type() end


---Opens parent tabs.
---@return nil
function _CSecondTab:Open() end


---Creates new `CThirdTab`.
---@param tabName string 
---@return CThirdTab
function _CSecondTab:Create(tabName) end


---Finds the `CThirdTab` by name.
---@param tabName string 
---@return CThirdTab|nil
function _CSecondTab:Find(tabName) end


---Sets tab's image.
---@param imagePath string Path to the image.
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional image offset.
---@return nil
function _CSecondTab:Image(imagePath, offset) end


---Sets tab's image by already created handle.
---@param imageHandle integer 
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional image offset.
---@return nil
function _CSecondTab:ImageHandle(imageHandle, offset) end


---Sets tab's icon.\
---[Icons list](https://fontawesome.com/search?o=r&s=solid&f=classic)
---@param icon string icon unicode.
---@param offset? Vec2 @default: `{0.0, 0.0}`. Optional icon offset.
---@return nil
function _CSecondTab:Icon(icon, offset) end


---Links tab to hero and attribute.
---@param heroId integer See `ent.m_CCitadelHeroComponent.m_spawnedHero.m_nHeroID.m_Value`
---@param attribute integer
---@return nil
function _CSecondTab:LinkHero(heroId, attribute) end
```
