# render_lib

Render library wrapping the raw Render API with caching, animations, and a hitbox/button system.

```lua
---Render library wrapping the raw Render API with caching, animations, and a hitbox/button system.
---@class LIB_RENDER
---@field loaded_fonts table<string, integer> Cached loaded fonts by name.
---@field loaded_images table<string, integer> Cached loaded images by path.
---@field screen_size Vec2 Current screen size.
---@field anim_values table<string, number> Named animation state values.
---@field anim_value number Frame-scaled animation delta.
---@field hitbox_array table Registered hitbox elements.
---@field block_deadlock table Input blocking registry.
---@field drag_activate_distance number Default drag activation distance (5).
---@field drag_activate_hold_time number Default drag hold time (0.12).
---@field debug_button boolean Enable button hitbox debug rendering.
---@field debug_drag boolean Enable drag hitbox debug rendering.
---@field cursos_pos Vector Current cursor position.
---@field easings {out_quart: (fun(value: number): number), in_quart: (fun(value: number): number), in_out_quart: (fun(value: number): number), in_out_cubic: (fun(value: number): number)} Easing functions.
LIB_RENDER = {}

-- Font/Image loading

---Loads or retrieves a cached font by name.
---@param name string Font name.
---@param fontflag? string|string[] Font creation flags from Enum.FontCreate.
---@param weight? number Font weight.
---@return integer @Font handle.
function LIB_RENDER.font(name, fontflag, weight) end

---Loads or retrieves a cached image by path.
---@param path string Image file path.
---@param filter? string Image filter mode.
---@return integer @Image handle.
function LIB_RENDER.load_image(path, filter) end

-- Notifications

---Displays a centered on-screen notification.
---@param text string Notification text.
---@param duration number Display duration in seconds.
function LIB_RENDER.centered_notification(text, duration) end

-- Visibility

---Returns whether a position (and optional area) is visible on screen.
---@param position Vec2 Screen position.
---@param size? Vec2 Area size.
---@param is_centered? boolean Whether position is the center of the area.
---@return boolean @True if visible.
function LIB_RENDER.is_visible(position, size, is_centered) end

---Returns true if the cursor is within the rectangular bounds.
---@param pos_1 Vec2 Top-left corner.
---@param pos_2 Vec2 Bottom-right corner.
---@return boolean @True if cursor is inside bounds.
function LIB_RENDER.in_bounds(pos_1, pos_2) end

-- Drawing primitives

---Draws a line between two points.
---@param pos_1 Vector|Vec2 Start position.
---@param pos_2 Vector|Vec2 End position.
---@param color Color Line color.
---@param thickness? number Line thickness.
function LIB_RENDER.line(pos_1, pos_2, color, thickness) end

---Draws a line with arrow marker(s) along it.
---@param start Vector|Vec2 Start position.
---@param end_ Vector|Vec2 End position.
---@param line_color Color Line color.
---@param arrow_color Color Arrow color.
---@param arrows_count? integer Number of arrows.
---@param arrow_size? number Arrow head size.
---@param line_thickness? number Line thickness.
---@param arrow_thickness? number Arrow line thickness.
function LIB_RENDER.line_arrowed(start, end_, line_color, arrow_color, arrows_count, arrow_size, line_thickness, arrow_thickness) end

---Draws a filled rectangle.
---@param pos_1 Vector|Vec2 Top-left corner.
---@param pos_2 Vector|Vec2 Bottom-right corner.
---@param color Color Fill color.
---@param round? number Corner rounding radius.
---@param flags? Enum.DrawFlags Draw flags.
function LIB_RENDER.filled_rect(pos_1, pos_2, color, round, flags) end

---Draws an outlined rectangle.
---@param pos_1 Vector|Vec2 Top-left corner.
---@param pos_2 Vector|Vec2 Bottom-right corner.
---@param color Color Outline color.
---@param round? number Corner rounding radius.
---@param flags? Enum.DrawFlags Draw flags.
---@param thickness? number Outline thickness.
function LIB_RENDER.outline_rect(pos_1, pos_2, color, round, flags, thickness) end

---Draws a gradient-filled rectangle with per-corner colors.
---@param pos_1 Vector|Vec2 Top-left corner.
---@param pos_2 Vector|Vec2 Bottom-right corner.
---@param lup_color Color Left-upper color.
---@param rup_color Color Right-upper color.
---@param ldown_color Color Left-lower color.
---@param rdown_color Color Right-lower color.
---@param round? number Corner rounding radius.
---@param flags? Enum.DrawFlags Draw flags.
function LIB_RENDER.gradient(pos_1, pos_2, lup_color, rup_color, ldown_color, rdown_color, round, flags) end

---Draws a glow effect around a rectangle.
---@param pos_1 Vector|Vec2 Top-left corner.
---@param pos_2 Vector|Vec2 Bottom-right corner.
---@param color Color Glow color.
---@param thickness number Glow thickness.
---@param round? number Corner rounding radius.
---@param flags? Enum.DrawFlags Draw flags.
---@param offset? Vec2 Glow offset.
function LIB_RENDER.glow(pos_1, pos_2, color, thickness, round, flags, offset) end

---Draws a blurred rectangle.
---@param pos_1 Vector|Vec2 Top-left corner.
---@param pos_2 Vector|Vec2 Bottom-right corner.
---@param strength number Blur strength.
---@param round? number Corner rounding radius.
---@param alpha? number Blur alpha (0.0-1.0).
---@param flags? Enum.DrawFlags Draw flags.
function LIB_RENDER.blur(pos_1, pos_2, strength, round, alpha, flags) end

---Draws an outlined triangle.
---@param points Vec2[] Three triangle vertices.
---@param color Color Outline color.
function LIB_RENDER.triagle(points, color) end

---Draws a filled triangle.
---@param points Vec2[] Three triangle vertices.
---@param color Color Fill color.
function LIB_RENDER.filled_triagle(points, color) end

---Draws an outlined circle or arc.
---@param pos Vector|Vec2 Center position.
---@param radius number Circle radius.
---@param color Color Outline color.
---@param thickness? number Outline thickness.
---@param start_deg? number Start angle in degrees.
---@param fill_range? number Arc fill range in degrees.
---@param round_corners? boolean Round the arc endpoints.
---@param segments? integer Number of segments.
function LIB_RENDER.circle(pos, radius, color, thickness, start_deg, fill_range, round_corners, segments) end

---Draws a filled circle or arc.
---@param pos Vector|Vec2 Center position.
---@param radius number Circle radius.
---@param color Color Fill color.
---@param start_deg? number Start angle in degrees.
---@param fill_range? number Arc fill range in degrees.
---@param segments? integer Number of segments.
function LIB_RENDER.filled_circle(pos, radius, color, start_deg, fill_range, segments) end

---Draws a gradient circle with distinct outline and inline colors.
---@param pos Vector|Vec2 Center position.
---@param radius number Circle radius.
---@param outline_color Color Outer color.
---@param inline_color Color Inner color.
---@param start_deg? number Start angle in degrees.
---@param fill_range? number Arc fill range in degrees.
function LIB_RENDER.gradient_circle(pos, radius, outline_color, inline_color, start_deg, fill_range) end

---Draws a glow effect around a circle.
---@param pos Vector|Vec2 Center position.
---@param radius number Circle radius.
---@param color Color Glow color.
---@param thickness number Glow thickness.
---@param segments? integer Number of segments.
---@param flags? Enum.DrawFlags Draw flags.
---@param offset? Vec2 Glow offset.
function LIB_RENDER.glow_circle(pos, radius, color, thickness, segments, flags, offset) end

-- Clipping

---Pushes a clip rectangle onto the clip stack.
---@param pos_1 Vector|Vec2 Top-left corner.
---@param pos_2 Vector|Vec2 Bottom-right corner.
---@param intersect? boolean Intersect with existing clip rect.
function LIB_RENDER.clip(pos_1, pos_2, intersect) end

---Pops the last clip rectangle from the clip stack.
function LIB_RENDER.pop_clip() end

-- Image rendering

---Renders a cached image with optional transformations.
---@param path string Image file path.
---@param pos Vector|Vec2 Draw position.
---@param size Vec2|number Image size (Vec2 for width/height, number for uniform).
---@param centered boolean Whether position is the center.
---@param color Color Tint color.
---@param round? number Corner rounding radius.
---@param corner_flags? Enum.DrawFlags Corner flags.
---@param cut_min? Vec2 UV minimum cut.
---@param cut_max? Vec2 UV maximum cut.
---@param gray_scale? number Grayscale amount (0.0-1.0).
---@param filter? string Image filter mode.
function LIB_RENDER.image(path, pos, size, centered, color, round, corner_flags, cut_min, cut_max, gray_scale, filter) end

-- Text

---Returns the rendered size of a text string.
---@param font_name string|integer|nil Font name, handle, or nil for default.
---@param size number Font size.
---@param text string Text to measure.
---@param dont_cache? boolean Skip font cache lookup.
---@return Vec2 @Text dimensions.
function LIB_RENDER.text_size(font_name, size, text, dont_cache) end

---Draws text at a position with optional centering and shadow.
---@param font_name string|integer|nil Font name, handle, or nil for default.
---@param size number Font size.
---@param pos Vector|Vec2 Draw position.
---@param text string Text to draw.
---@param color Color Text color.
---@param center_array? {[1]: boolean, [2]: boolean} Horizontal and vertical centering.
---@param shadow_offset_array? {x: integer, y: integer} Shadow offset.
---@param dont_cache? boolean Skip font cache lookup.
function LIB_RENDER.text(font_name, size, pos, text, color, center_array, shadow_offset_array, dont_cache) end

-- Utility

---Clones a Vector or Vec2 into a new Vector.
---@param vector Vector|Vec2 Source vector.
---@return Vector @Cloned vector.
function LIB_RENDER.clone(vector) end

---Clones a color with optional channel overrides.
---@param orig_color Color Source color.
---@param a? number Alpha channel value.
---@param r? number Red channel value.
---@param g? number Green channel value.
---@param b? number Blue channel value.
---@param disable_mult? boolean When true values replace channels; when false (default) values multiply.
---@return Color @New color.
function LIB_RENDER.clone_c(orig_color, a, r, g, b, disable_mult) end

---Returns a menu theme color by name.
---@param name string Theme color name.
---@return Color @Theme color.
function LIB_RENDER.theme(name) end

---Localizes a token string, auto-registering it if needed.
---@param token string Localization token.
---@return string @Localized string.
function LIB_RENDER.localizer(token) end

-- Animations

---Smoothly interpolates a named value toward 0 or 1 based on state, clamped.
---@param var_name string Animation variable name.
---@param state boolean Target state (true = 1, false = 0).
---@param mult? number Animation speed multiplier.
---@param min? number Minimum output value.
---@param max? number Maximum output value.
---@return number @Current interpolated value.
function LIB_RENDER.calculate_value(var_name, state, mult, min, max) end

---Smoothly interpolates a named value toward 0 or 1, allowing overshoot before easing back.
---@param var_name string Animation variable name.
---@param state boolean Target state (true = 1, false = 0).
---@param mult? number Animation speed multiplier.
---@param min? number Minimum output value.
---@param max? number Maximum output value.
---@return number @Current interpolated value (may exceed min/max during transition).
function LIB_RENDER.calculate_value_no_clamp(var_name, state, mult, min, max) end

-- Hitbox system

---Drag hitbox returned by LIB_RENDER.drag_hitbox.
---@class lib_render_drag_hitbox
---@field pos_1 Vector|Vec2 Top-left position.
---@field pos_2 Vector|Vec2 Bottom-right position.
---@field is_active boolean Whether the drag is currently active.
---@field was_dragged boolean Whether the hitbox was dragged this frame.
local lib_render_drag_hitbox = {}

---Sets a condition function that disables the hitbox when it returns true.
---@param func fun(): boolean Disable condition callback.
---@return lib_render_drag_hitbox @Self for chaining.
function lib_render_drag_hitbox:disable_condition(func) end

---Overrides the key code used to activate the drag.
---@param key_code Enum.ButtonCode Key code override.
---@return lib_render_drag_hitbox @Self for chaining.
function lib_render_drag_hitbox:override_key_code(key_code) end

---Sets both drag activation distance and hold time.
---@param distance? number Activation distance threshold.
---@param hold_time? number Hold time threshold in seconds.
---@return lib_render_drag_hitbox @Self for chaining.
function lib_render_drag_hitbox:set_drag_activation(distance, hold_time) end

---Sets the drag activation distance.
---@param distance number Activation distance threshold.
---@return lib_render_drag_hitbox @Self for chaining.
function lib_render_drag_hitbox:set_drag_distance(distance) end

---Sets the drag hold time.
---@param hold_time number Hold time threshold in seconds.
---@return lib_render_drag_hitbox @Self for chaining.
function lib_render_drag_hitbox:set_drag_hold_time(hold_time) end

---Button hitbox returned by LIB_RENDER.button_hitbox.
---@class lib_render_button_hitbox
---@field pos_1 Vector|Vec2 Top-left position.
---@field pos_2 Vector|Vec2 Bottom-right position.
---@field value boolean|nil Current button value.
---@field last_usage_time number Timestamp of last interaction.
---@field hold_time number Duration the button has been held.
---@field move_distance number Distance cursor moved since press.
---@field moved_from_press boolean Whether cursor moved from the press origin.
---@field hold_reached boolean Whether hold time threshold was reached.
local lib_render_button_hitbox = {}

---Sets a condition function that disables the hitbox when it returns true.
---@param func fun(): boolean Disable condition callback.
---@return lib_render_button_hitbox @Self for chaining.
function lib_render_button_hitbox:disable_condition(func) end

---Overrides the key code used to activate the button.
---@param key_code Enum.ButtonCode Key code override.
---@return lib_render_button_hitbox @Self for chaining.
function lib_render_button_hitbox:override_key_code(key_code) end

---Sets both drag activation distance and hold time.
---@param distance? number Activation distance threshold.
---@param hold_time? number Hold time threshold in seconds.
---@return lib_render_button_hitbox @Self for chaining.
function lib_render_button_hitbox:set_drag_activation(distance, hold_time) end

---Sets the drag activation distance.
---@param distance number Activation distance threshold.
---@return lib_render_button_hitbox @Self for chaining.
function lib_render_button_hitbox:set_drag_distance(distance) end

---Sets the drag hold time.
---@param hold_time number Hold time threshold in seconds.
---@return lib_render_button_hitbox @Self for chaining.
function lib_render_button_hitbox:set_drag_hold_time(hold_time) end

---Deletes the button hitbox, removing it from the hitbox array.
function lib_render_button_hitbox:delete() end

---Creates a drag hitbox for tracking drag gestures within a region.
---@param pos_1 Vector|Vec2 Top-left corner.
---@param pos_2 Vector|Vec2 Bottom-right corner.
---@param func? fun() Callback on drag.
---@param key_code? Enum.ButtonCode Activation key code.
---@param enable_deadlock_input? boolean Block game input while dragging.
---@param dont_edit_pos? boolean Prevent automatic position updates.
---@return lib_render_drag_hitbox @Drag hitbox instance.
function LIB_RENDER.drag_hitbox(pos_1, pos_2, func, key_code, enable_deadlock_input, dont_edit_pos) end

---Creates a button hitbox for tracking click interactions within a region.
---@param pos_1 Vector|Vec2 Top-left corner.
---@param pos_2 Vector|Vec2 Bottom-right corner.
---@param def_value? boolean|nil Default button value.
---@param key_code? Enum.ButtonCode Activation key code.
---@param func? fun() Callback on click.
---@param enable_deadlock_input? boolean Block game input while interacting.
---@param dont_block_other? boolean Allow other hitboxes to receive input simultaneously.
---@param custom_func_call_logic? boolean Use custom callback invocation logic.
---@return lib_render_button_hitbox @Button hitbox instance.
function LIB_RENDER.button_hitbox(pos_1, pos_2, def_value, key_code, func, enable_deadlock_input, dont_block_other, custom_func_call_logic) end
```
