# CTabSection

CTabSection metatable

```lua
---@class CTabSection
---CTabSection metatable
local _CTabSection = {}

---Returns tab's name.
---@return string
function _CTabSection:Name() end


---Returns tab's parent.
---@return CFirstTab
function _CTabSection:Parent() end


---Returns widget type.
---@return Enum.WidgetType
function _CTabSection:Type() end


---Opens parent tabs.
---@return nil
function _CTabSection:Open() end


---Creates new `CSecondTab`.
---@param sectionName string 
---@return CSecondTab
function _CTabSection:Create(sectionName) end


---Finds the `CSecondTab` by name.
---@param sectionName string 
---@return CSecondTab|nil
function _CTabSection:Find(sectionName) end
```
