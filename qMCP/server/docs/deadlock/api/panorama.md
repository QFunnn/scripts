# panorama

Finds a panel by its ID.

```lua
---@class uipanel 
---@diagnostic disable-next-line: lowercase-global
uipanel = {}

---@class panorama
---@diagnostic disable-next-line: lowercase-global
panorama = {}

--- Finds a panel by its ID.
---@param id string The ID of the panel to find.
---@return uipanel | nil
function panorama.get_panel_by_id(id) end

--- Finds the first panel of a given panel type name.
---@param type string The panel type name. (e.g., "Panel", "Label").
---@return uipanel | nil
function panorama.get_panel_by_panel_type(type) end

--- Finds a panel by a path of child IDs.
--- First element get_panel_by_id then find_child for each subsequent element.
---@param path string[] An array-like table of child IDs representing the path.
---@param log_error boolean? Whether to log an error if not found.
---@return uipanel | nil
function panorama.get_panel_by_path(path, log_error) end

--- Creates a new panel and attaches it to a parent.
---@param type string The panel type to create (e.g., "Panel", "Label").
---@param id string The ID for the new panel.
---@param parent uipanel The parent panel.
---@param classes string? A space-separated list of classes to add.
---@param styles string? A string of CSS-like styles to apply.
---@return uipanel | nil
function panorama.create_panel(type, id, parent, classes, styles) end

---Converts a raw Panorama symbol integer to its string representation.
---WARNING: Invalid symbol IDs may crash. No nil-safety path.
---@param sym integer Raw Panorama symbol ID.
---@return string
function panorama.sym2string(sym) end

--- Returns a string representation of the panel.
---@return string
function uipanel:__tostring() end

--- Checks if the panel pointer is valid and safe to use.
---@return boolean
function uipanel:is_valid() end

--- Gets the panel's ID.
---@return string
function uipanel:get_id() end

--- Sets the panel's ID.
---@param id string The new ID.
function uipanel:set_id(id) end

--- Checks if the panel has an ID.
---@return boolean
function uipanel:has_id() end

--- Gets the panel's type name.
---@return string
function uipanel:get_panel_type() end

--- Gets the panel's parent.
---@return uipanel | nil
function uipanel:get_parent() end

--- Finds a direct child by ID.
---@param id string The child's ID.
---@return uipanel | nil
function uipanel:find_child(id) end

--- Finds a child by ID, traversing the entire hierarchy.
---@param id string The child's ID.
---@return uipanel | nil
function uipanel:find_child_traverse(id) end

--- Finds an ancestor panel by ID.
---@param id string The ancestor's ID.
---@return uipanel | nil
function uipanel:find_ancestor(id) end

--- Finds a child within the panel's layout file by ID.
---@param id string The child's ID.
---@return uipanel | nil
function uipanel:find_child_in_layout_file(id) end

--- Finds all children (recursive) that have a specific class.
---@param class_name string The class name to search for.
---@return uipanel[].
function uipanel:find_children_with_class_traverse(class_name) end

--- Gets a list of direct children.
---@return uipanel[]
function uipanel:children() end

--- Gets the number of direct children.
---@return integer
function uipanel:get_child_count() end

--- Gets a direct child by its index.
---@param index integer The child index (0-based).
---@return uipanel | nil
function uipanel:get_child(index) end

--- Gets the first direct child.
---@return uipanel | nil
function uipanel:get_first_child() end

--- Gets the last direct child.
---@return uipanel | nil
function uipanel:get_last_child() end

--- Gets the index of a direct child panel.
---@param child uipanel The child panel.
---@return integer
function uipanel:get_child_index(child) end

--- Gets the actual width of the panel after being positioned by other panels.
---@return number
function uipanel:get_actual_layout_width() end

--- Gets the actual height of the panel after being positioned by other panels.
---@return number
function uipanel:get_actual_layout_height() end

--- Sets the panel's visibility.
---@param visible boolean True to make visible, false to hide.
function uipanel:set_visible(visible) end

--- Checks if the panel is visible.
---@return boolean
function uipanel:is_visible() end

--- Gets a list of all classes on the panel.
---@return string[]
function uipanel:get_class_list() end

--- Adds a single class to the panel.
---@param class_name string The class to add.
function uipanel:add_class(class_name) end

--- Removes a single class from the panel.
---@param class_name string The class to remove.
function uipanel:remove_class(class_name) end

--- Adds multiple classes from a space-separated string.
---@param class_names string A space-separated list of classes.
function uipanel:add_classes(class_names) end

--- Removes multiple classes from a space-separated string.
---@param class_names string A space-separated list of classes.
function uipanel:remove_classes(class_names) end

--- Checks if the panel has a specific class.
---@param class_name string The class to check for.
---@return boolean
function uipanel:has_class(class_name) end

--- Checks if the panel or any ancestor has a specific class.
---@param class_name string The class to check for.
---@return boolean
function uipanel:ascendant_has_class(class_name) end

--- Adds or removes a class based on a boolean.
---@param class_name string The class to add or remove.
---@param add boolean True to add, false to remove.
function uipanel:set_has_class(class_name, add) end

--- Removes and immediately re-adds a class. Useful for re-triggering animations or sound effects.
---@param class_name string The class to trigger.
function uipanel:trigger_class(class_name) end

--- Sets whether the panel can be dragged.
---@param draggable boolean True to make draggable.
function uipanel:set_draggable(draggable) end

--- Checks if the panel is draggable.
---@return boolean
function uipanel:is_draggable() end

--- Gets a string attribute from the panel.
---@param name string The name of the attribute.
---@return string
function uipanel:get_attribute_string(name) end

--- Sets a string attribute on the panel.
---@param name string The name of the attribute.
---@param value string The value to set.
function uipanel:set_attribute_string(name, value) end

--- Applies a string of CSS-like styles to the panel.
---@param style_string string The styles to apply (e.g., "width: 100px; height: 100px;").
---@return boolean
function uipanel:set_style(style_string) end

--- Forces the panel to re-apply its styles.
---@param force_reflow boolean?
function uipanel:apply_styles(force_reflow) end

--- Removes all children and deletes them.
function uipanel:remove_and_delete_children() end

--- Gets the text of the label panel.
---@return string
function uipanel:get_text() end

--- Sets the text of the label panel.
---@param text string The text to set.
function uipanel:set_text(text) end

--- Gets the image source of the image panel. (EconItemImage, Image, CitadelHeroImage)
--- @return string
function uipanel:get_image_src() end

--- Gets the panel's absolute position on the screen.
---@return Vec2
function uipanel:get_screen_position() end

--- Gets the panel's layout bounds (x, y, width, height).
---@return Vec2 position
---@return Vec2 size
function uipanel:get_bounds() end

--- Runs a JavaScript snippet in the context of this panel.
---@param script_code string The JavaScript code to execute.
function uipanel:run_script(script_code) end

--- Finds a child by a path of child IDs starting from this panel.
---@param path string[] An array-like table of child IDs representing the path.
---@param with_logs boolean? Whether to log errors if not found.
---@return uipanel | nil
function uipanel:find_child_by_path(path, with_logs) end

--- Finds the first direct child that has a specific class.
---@param class_name string The class name to search for.
---@return uipanel | nil
function uipanel:find_child_with_class(class_name) end

--- Finds all children (recursive) that have a specific ID.
---@param id_name string The ID to search for.
---@return uipanel[]
function uipanel:find_children_with_id_traverse(id_name) end

--- Switches a class within a category. Removes all classes in the category and adds the specified class.
---@param category_name string The category name.
---@param class_name string The class to add.
function uipanel:switch_class(category_name, class_name) end

--- Delete a panel
---@param delay number delay before delete
function uipanel:delete_async(delay) end

---@param file_path string The path to the layout file to load (e.g., "file://{resources}/layout/custom_layout.xml").
---@param override_existed boolean True to override the existing layout, false to keep it.
function uipanel:load_layout_file(file_path, override_existed) end


---@class file_spoofer
---@diagnostic disable-next-line: lowercase-global
file_spoofer = {}

---@param file_path string The path to the resource file to spoof/add (e.g., "panorama/styles/popups/popup_settings_old.vcss_c").
---@param content string The content to use for the spoofed resource. 
---@return boolean true if the resource was added successfully, false otherwise.
function file_spoofer.add_resource(file_path, content) end

--- Trigger a reload of a resource file.
---@param file_path string The path to the resource file to reload (e.g., "panorama/styles/popups/popup_settings_old.vcss_c").
function file_spoofer.reload_resource(file_path) end


--- Spoof whole directory by adding all files from it to the resource system
--- @param dir_path string 
function file_spoofer.add_folder(dir_path) end
```
