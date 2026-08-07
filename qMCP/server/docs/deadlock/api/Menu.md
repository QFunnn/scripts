# Menu

Table to work with Menu.

```lua
---Table to work with Menu.
Menu = {}

---Returns menu item.
---@param firstTabName string 
---@param sectionName string 
---@param secondTabName string 
---@param thirdTabName string 
---@param groupTabName string 
---@param widgetName string 
---@param attachmentName string 
---@param widgetInGearName string 
---@return CMenuSwitch|CMenuBind|CMenuSliderFloat|CMenuSliderInt|CMenuColorPicker|CMenuComboBox|CMenuButton|CMenuMultiComboBox|CMenuMultiSelect|CMenuInputBox|CMenuLabel|nil
---@overload fun(firstTabName: string): CFirstTab|nil
---@overload fun(firstTabName: string, sectionName: string): CTabSection|nil
---@overload fun(firstTabName: string, sectionName: string, secondTabName: string): CSecondTab|nil
---@overload fun(firstTabName: string, sectionName: string, secondTabName: string, thirdTabName: string): CThirdTab|nil
---@overload fun(firstTabName: string, sectionName: string, secondTabName: string, thirdTabName: string, groupTabName: string): CMenuGroup|nil
---@overload fun(firstTabName: string, sectionName: string, secondTabName: string, thirdTabName:string, groupTabName: string, widgetName: string): CMenuSwitch|CMenuBind|CMenuSliderFloat|CMenuSliderInt|CMenuColorPicker|CMenuComboBox|CMenuButton|CMenuMultiComboBox|CMenuMultiSelect|CMenuInputBox|CMenuLabel|nil
---@overload fun(firstTabName: string, sectionName: string, secondTabName: string, thirdTabName: string, groupTabName: string, widgetName: string, attachmentName: string): CMenuGearAttachment|CMenuColorPickerAttachment|nil
function Menu.Find(firstTabName, sectionName, secondTabName, thirdTabName, groupTabName, widgetName, attachmentName, widgetInGearName) end


---Creates tab/section/group. Returns menu item.
---@param firstTabName string 
---@param sectionName string 
---@param secondTabName string 
---@param thirdTabName string 
---@param groupTabName string 
---@return CMenuGroup
---@overload fun(firstTabName: string): CFirstTab
---@overload fun(firstTabName: string, sectionName: string): CTabSection
---@overload fun(firstTabName: string, sectionName: string, secondTabName: string): CSecondTab
---@overload fun(firstTabName: string, sectionName: string, secondTabName: string, thirdTabName: string): CThirdTab
function Menu.Create(firstTabName, sectionName, secondTabName, thirdTabName, groupTabName) end


---Creates tab/section/group. Returns color of specified style var or table of all style colors\
---depends on param.
---@param styleColor string 
---@return Color
---@overload fun(): table
function Menu.Style(styleColor) end


---Returns current menu open state.
---@return boolean
function Menu.Opened() end


---Returns current menu alpha.
---@return number
function Menu.Alpha() end


---Returns current menu pos.
---@return Vec2
function Menu.Pos() end


---Returns current menu size.
---@return Vec2
function Menu.Size() end


---Returns current menu scale percentage.
---@return integer
function Menu.Scale() end


---Returns current menu animation duration.
---@return number
function Menu.AnimDuration() end
```
