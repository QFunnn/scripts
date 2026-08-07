# new_ui_lib

A gear-attached menu widget wrapper with chainable methods.

```lua
---A gear-attached menu widget wrapper with chainable methods.
---@class ui_lib_element_gear
---@field ref CMenuSwitch|CMenuSliderFloat|CMenuSliderInt|CMenuComboBox|CMenuMultiComboBox|CMenuMultiSelect|CMenuInputBox|CMenuBind|CMenuButton|CMenuLabel|CMenuColorPicker|CMenuGearAttachment Underlying menu reference.
---@field value any Current widget value.
---@operator call(): any
local ui_lib_element_gear = {}

---Sets the element value.
---@param value any Value to set.
---@return ui_lib_element_gear @Self for chaining.
function ui_lib_element_gear:set(value) end

---Sets the tooltip text.
---@param text string Tooltip text.
---@return ui_lib_element_gear @Self for chaining.
function ui_lib_element_gear:tooltip(text) end

---Sets the icon.
---@param icon string Icon identifier.
---@return ui_lib_element_gear @Self for chaining.
function ui_lib_element_gear:icon(icon) end

---Sets the image.
---@param image string Image path or identifier.
---@return ui_lib_element_gear @Self for chaining.
function ui_lib_element_gear:image(image) end

---Sets visibility state.
---@param state boolean Visible or hidden.
function ui_lib_element_gear:visible(state) end

---Sets disabled state.
---@param state boolean Disabled or enabled.
function ui_lib_element_gear:disable(state) end

---Sets a visibility condition function.
---@param func fun(): boolean Condition returning true when visible.
---@return ui_lib_element_gear @Self for chaining.
function ui_lib_element_gear:visible_condition(func) end

---Sets a disable condition function.
---@param func fun(): boolean Condition returning true when disabled.
---@return ui_lib_element_gear @Self for chaining.
function ui_lib_element_gear:disable_condition(func) end

---Registers a callback on value change.
---@param func function Callback function.
---@param preload? boolean Fire callback immediately with current value.
---@return ui_lib_element_gear @Self for chaining.
function ui_lib_element_gear:set_callback(func, preload) end

---Removes a previously registered callback.
---@param func function Callback to remove.
---@return ui_lib_element_gear @Self for chaining.
function ui_lib_element_gear:unset_callback(func) end

---Links disable condition to another ui element table.
---@param ui_table ui_lib_element Disable when this element is falsy.
---@return ui_lib_element_gear @Self for chaining.
function ui_lib_element_gear:link_to_ui_disable_condition(ui_table) end

---Links visibility condition to another ui element table.
---@param ui_table any Show only when this element is truthy.
---@return ui_lib_element_gear @Self for chaining.
function ui_lib_element_gear:link_to_ui_visible_condition(ui_table) end

---A top-level menu widget in a group, wraps gear-level widgets.
---@class ui_lib_element : ui_lib_element_gear
local ui_lib_element = {}

---Creates a switch (toggle) gear element.
---@param name string Display name.
---@param def_value? boolean Default value.
---@param icon? string Icon identifier.
---@param tooltip? string Tooltip text.
---@return ui_lib_element_gear
function ui_lib_element:switch(name, def_value, icon, tooltip) end

---Creates a slider gear element.
---@param name string Display name.
---@param min number Minimum value.
---@param max number Maximum value.
---@param def_value? number Default value.
---@param format? string Display format string (e.g. "%.2f°").
---@param icon? string Icon identifier.
---@param tooltip? string Tooltip text.
---@return ui_lib_element_gear
function ui_lib_element:slider(name, min, max, def_value, format, icon, tooltip) end

---Creates a combo box gear element.
---@param name string Display name.
---@param array string[] List of options.
---@param def_value? integer Default selected index (1-based).
---@param icon? string Icon identifier.
---@param tooltip? string Tooltip text.
---@return ui_lib_element_gear
function ui_lib_element:combo(name, array, def_value, icon, tooltip) end

---Creates a multi-combo gear element.
---@param name string Display name.
---@param array string[] List of options.
---@param def_value? any Default value.
---@param icon? string Icon identifier.
---@param tooltip? string Tooltip text.
---@return ui_lib_element_gear
function ui_lib_element:multicombo(name, array, def_value, icon, tooltip) end

---Creates a multi-selectable gear element.
---@param name string Display name.
---@param array string[] List of options.
---@param expand? boolean Expand by default.
---@param icon? string Icon identifier.
---@param tooltip? string Tooltip text.
---@return ui_lib_element_gear
function ui_lib_element:multiselectable(name, array, expand, icon, tooltip) end

---Creates a button gear element.
---@param name string Display name.
---@param icon? string Icon identifier.
---@param func? function Click callback.
---@param tooltip? string Tooltip text.
---@return ui_lib_element_gear
function ui_lib_element:button(name, icon, func, tooltip) end

---Creates a label gear element.
---@param name string Display name.
---@param icon? string Icon identifier.
---@param tooltip? string Tooltip text.
---@return ui_lib_element_gear
function ui_lib_element:label(name, icon, tooltip) end

---Creates a color picker gear element.
---@param name string Display name.
---@param color Color Default color.
---@param in_gear? boolean Attach inside the gear row.
---@param icon? string Icon identifier.
---@param tooltip? string Tooltip text.
---@return ui_lib_element_gear
function ui_lib_element:colorpicker(name, color, in_gear, icon, tooltip) end

---Creates an input box gear element.
---@param name string Display name.
---@param def_value? string Default text.
---@param icon? string Icon identifier.
---@param tooltip? string Tooltip text.
---@return ui_lib_element_gear
function ui_lib_element:input(name, def_value, icon, tooltip) end

---Creates a key bind gear element.
---@param name string Display name.
---@param def_value? integer Default key code.
---@param icon? string Icon identifier.
---@param tooltip? string Tooltip text.
---@return ui_lib_element_gear
function ui_lib_element:bind(name, def_value, icon, tooltip) end

---Overrides the gear display name.
---@param name string New gear name.
---@return ui_lib_element @Self for chaining.
function ui_lib_element:override_gear_name(name) end

---Overrides the gear icon.
---@param icon string New gear icon.
---@return ui_lib_element @Self for chaining.
function ui_lib_element:override_gear_icon(icon) end

---Overrides the gear size.
---@param is_small boolean Use small gear layout.
---@return ui_lib_element @Self for chaining.
function ui_lib_element:override_gear_size(is_small) end

---Returns whether the bound key was pressed this frame (bind elements only).
---@return boolean
function ui_lib_element:down_once() end

---Returns whether the bound key is held down (bind elements only).
---@return boolean
function ui_lib_element:down() end

---Returns the toggle state of the bound key (bind elements only).
---@return boolean
function ui_lib_element:toggle() end

---Sets the toggle state for a bind element.
---@param value boolean Toggle state.
---@return ui_lib_element @Self for chaining.
function ui_lib_element:set_toggle(value) end

---Returns the option list for combo/multicombo elements.
---@param only_enabled? boolean For multicombo, return only enabled entries.
---@return string[] @List of option names.
function ui_lib_element:list(only_enabled) end

---A menu group containing widgets.
---@class ui_lib_group
local ui_lib_group = {}

---Creates a switch (toggle) element.
---@param name string Display name.
---@param def_value? boolean Default value.
---@param icon? string Icon identifier.
---@param tooltip? string Tooltip text.
---@return ui_lib_element
function ui_lib_group:switch(name, def_value, icon, tooltip) end

---Creates a slider element.
---@param name string Display name.
---@param min number Minimum value.
---@param max number Maximum value.
---@param def_value? number Default value.
---@param format? string Display format string (e.g. "%.2f°").
---@param icon? string Icon identifier.
---@param tooltip? string Tooltip text.
---@return ui_lib_element
function ui_lib_group:slider(name, min, max, def_value, format, icon, tooltip) end

---Creates a combo box element.
---@param name string Display name.
---@param array string[] List of options.
---@param def_value? integer Default selected index (1-based).
---@param icon? string Icon identifier.
---@param tooltip? string Tooltip text.
---@return ui_lib_element
function ui_lib_group:combo(name, array, def_value, icon, tooltip) end

---Creates a multi-combo element.
---@param name string Display name.
---@param array string[] List of options.
---@param def_value? any Default value.
---@param icon? string Icon identifier.
---@param tooltip? string Tooltip text.
---@return ui_lib_element
function ui_lib_group:multicombo(name, array, def_value, icon, tooltip) end

---Creates a multi-selectable element.
---@param name string Display name.
---@param array string[] List of options.
---@param expand? boolean Expand by default.
---@param icon? string Icon identifier.
---@param tooltip? string Tooltip text.
---@return ui_lib_element
function ui_lib_group:multiselectable(name, array, expand, icon, tooltip) end

---Creates a button element.
---@param name string Display name.
---@param func? function Click callback.
---@param icon? string Icon identifier.
---@param tooltip? string Tooltip text.
---@return ui_lib_element
function ui_lib_group:button(name, func, icon, tooltip) end

---Creates a label element.
---@param name string Display name.
---@param icon? string Icon identifier.
---@param tooltip? string Tooltip text.
---@return ui_lib_element
function ui_lib_group:label(name, icon, tooltip) end

---Creates a color picker element.
---@param name string Display name.
---@param color Color Default color.
---@param icon? string Icon identifier.
---@param tooltip? string Tooltip text.
---@return ui_lib_element
function ui_lib_group:colorpicker(name, color, icon, tooltip) end

---Creates an input box element.
---@param name string Display name.
---@param def_value? string Default text.
---@param icon? string Icon identifier.
---@param tooltip? string Tooltip text.
---@return ui_lib_element
function ui_lib_group:input(name, def_value, icon, tooltip) end

---Creates a key bind element.
---@param name string Display name.
---@param def_value? integer Default key code.
---@param icon? string Icon identifier.
---@param tooltip? string Tooltip text.
---@return ui_lib_element
function ui_lib_group:bind(name, def_value, icon, tooltip) end

---Refreshes all element visibility and disable states.
function ui_lib_group:update() end

---Registers a callback on any element change in this group.
---@param func function Callback function.
---@param preload? boolean Fire callback immediately.
---@return ui_lib_group @Self for chaining.
function ui_lib_group:set_callback(func, preload) end

---Removes a previously registered callback.
---@param func function Callback to remove.
---@return ui_lib_group @Self for chaining.
function ui_lib_group:unset_callback(func) end

---Sets a visibility condition for the entire group.
---@param func fun(): boolean Condition returning true when visible.
---@param set_on? boolean Apply immediately.
---@return ui_lib_group @Self for chaining.
function ui_lib_group:visible_condition(func, set_on) end

---Sets a disable condition for the entire group.
---@param func fun(): boolean Condition returning true when disabled.
---@param set_on? boolean Apply immediately.
---@return ui_lib_group @Self for chaining.
function ui_lib_group:disable_condition(func, set_on) end

---Links disable condition to another ui element table.
---@param ui_table ui_lib_element Disable when this element is falsy.
---@return ui_lib_group @Self for chaining.
function ui_lib_group:link_to_ui_disable_condition(ui_table) end

---Links visibility condition to another ui element table.
---@param ui_table ui_lib_element Show only when this element is truthy.
---@return ui_lib_group @Self for chaining.
function ui_lib_group:link_to_ui_visible_condition(ui_table) end

---A tab wrapper for organizing groups.
---@class ui_lib_tab
local ui_lib_tab = {}

---Creates a sub-tab or group within this tab.
---@param name string Display name.
---@param align? integer Alignment mode.
---@return ui_lib_tab|ui_lib_group
function ui_lib_tab:create(name, align) end

---High-level wrapper over the raw menu system.
---@class NEW_UI_LIB
NEW_UI_LIB = {}

---Creates menu tabs for hero or generic use.
---@param is_hero boolean True for hero-specific tab.
---@param ... any When is_hero: (name, hero_image, hero_id). Otherwise: tab path segments or (tab_ref, ...).
---@return ui_lib_tab|ui_lib_group
---@overload fun(is_hero: true, name: string, hero_image: string, hero_id: integer): ui_lib_tab|ui_lib_group
---@overload fun(is_hero: false, ...: string): ui_lib_tab|ui_lib_group
function NEW_UI_LIB.create_tab(is_hero, ...) end

---Wraps a raw tab reference into a ui_lib_group.
---@param tab_ref any Raw menu tab reference.
---@return ui_lib_group
function NEW_UI_LIB.get_default_group(tab_ref) end
```
