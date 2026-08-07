# CFirstTab

CFirstTab metatable

```lua
---@class CFirstTab
---CFirstTab metatable
local _CFirstTab = {}

---Returns tab's name.
---@return string
function _CFirstTab:Name() end


---Returns parent. It's `nil` for CFirstTab.
---@return nil
function _CFirstTab:Parent() end


---Returns widget type.
---@return Enum.WidgetType
function _CFirstTab:Type() end


---Opens parent tabs.
---@return nil
function _CFirstTab:Open() end


---Creates new `CTabSection`.
---@param sectionName string 
---@return CTabSection
function _CFirstTab:Create(sectionName) end


---Finds the `CTabSection` by name.
---@param sectionName string 
---@return CTabSection|nil
function _CFirstTab:Find(sectionName) end
```
