# utils

Utility functions for camera, targeting, geometry, and map operations.

```lua
---Utility functions for camera, targeting, geometry, and map operations.
---@class utils
utils = {}

---Sets the game camera angles.
---@param angle Angle New camera angles to apply.
function utils.set_camera_angles(angle) end

---Returns the current game camera angles.
---@return Angle @Current camera angles.
function utils.get_camera_angles() end

---Returns the current game camera world position.
---@return Vector @Current camera position in world space.
function utils.get_camera_pos() end

---Returns the current camera field of view in degrees.
---@return number @FOV in degrees.
function utils.get_camera_fov() end

---Converts a FOV angle to a pixel radius on screen.
---@param fov number @FOV angle in degrees.
---@return number @Corresponding pixel radius.
function utils.fov_to_pixel_radius(fov) end

---Finds the nearest enemy player pawn that is currently visible.
---Performs a visibility check; returns nil if no visible enemy is found.
---@return player_pawn|nil @Nearest visible enemy pawn, or nil if none.
function utils.find_nearest_visible_enemy() end

---Finds the best target within the specified FOV cone.
---Performs per-bone scanning with a 3.0-degree tie-breaking threshold.
---@param fov number @Maximum FOV cone angle in degrees.
---@return player_pawn|nil @Best target within FOV, or nil if none.
function utils.find_target_in_fov(fov) end

---Finds the nearest enemy by angular (FOV) distance.
---Does NOT require visibility — no visibility check is performed.
---@return player_pawn|nil @Nearest enemy by FOV distance, or nil if none.
function utils.find_nearest_fov_enemy() end

---Calculates the angle from a source position to a destination position.
---@param src Vector Source world position.
---@param dst Vector Destination world position.
---@return Angle @Angle pointing from src toward dst.
function utils.calc_angle(src, dst) end

---Calculates the FOV difference between two angles in degrees.
---@param src Angle Source angle.
---@param dst Angle Destination angle.
---@return number @Angular difference in degrees.
function utils.get_fov(src, dst) end

---Calculates the shortest angular difference between two angles.
---Result is normalized to the shortest path (handles wrap-around).
---@param dst number Destination angle in degrees.
---@param src number Source angle in degrees.
---@return number @Shortest angular difference in degrees.
function utils.angle_diff(dst, src) end

---Predicts bullet destination accounting for projectile travel time.
---Uses the weapon's projectile speed to compensate for target velocity.
---@param src Vector Shooter position.
---@param dst Vector Current target position.
---@param target_velocity Vector Target's current velocity.
---@param primary_weapon ability Primary weapon entity used for projectile speed.
---@param shooter? entity @default: `local pawn`. Entity used as shooter origin; defaults to local player pawn.
---@return Vector @Predicted impact position.
function utils.predict_bullet(src, dst, target_velocity, primary_weapon, shooter) end

---Returns the current slide charge level.
---@return integer @Slide level (0 = no slide).
function utils.get_slide_level() end

---Returns the current slide angle in degrees.
---@return number @Slide angle.
function utils.get_slide_angle() end

---Tests if a line segment intersects an entity's bounding box.
---@param start Vector Line start position.
---@param end_ Vector Line end position.
---@param ent entity Target entity.
---@return boolean @True if the line intersects the entity's bounding box.
function utils.is_line_intersect_entity(start, end_, ent) end

---Tests if a hull (capsule) from start to end_ intersects with an entity.
---@param start Vector Hull start position.
---@param end_ Vector Hull end position.
---@param hull_radius number Hull radius.
---@param ent entity Target entity.
---@param ent_origin_offset Vector Offset applied to entity origin.
---@return boolean @True if the hull intersects the entity.
function utils.is_hull_intersect_entity(start, end_, hull_radius, ent, ent_origin_offset) end

---Returns the intersection point of a line with an entity.
---@param start Vector Line start position.
---@param end_ Vector Line end position.
---@param ent entity Target entity.
---@return Vector @World position of the intersection point.
function utils.get_line_intersection_entity(start, end_, ent) end

---Converts a world position to minimap coordinates.
---@param pos Vector World position to convert.
---@param is_inverted? boolean @default: `false`. Whether to invert the mapping.
---@return Vec2 @Minimap coordinates.
function utils.world_to_map(pos, is_inverted) end

---Converts minimap coordinates to world position.
---WARNING: `is_inverted=false` behaves identically to `true` due to a bug in optional parameter testing.
---@param pos Vec2 Minimap coordinates to convert.
---@param is_inverted? boolean @default: `false`. Whether to invert the mapping (see warning).
---@return Vec2 @World position.
function utils.minimap_to_world(pos, is_inverted) end

---Converts minimap percentage coordinates to minimap pixel coordinates.
---@param pos Vec2 Minimap position as percentage (0.0–1.0 range).
---@param is_inverted? boolean @default: `false`. Whether to invert the mapping.
---@return Vec2 @Minimap pixel coordinates.
function utils.minimap_percent_to_minimap(pos, is_inverted) end

---Neutral camp information returned by `utils.get_neutral_camps`.
---@class camp_info
---@field pos_x number Camp X position on minimap.
---@field pos_y number Camp Y position on minimap.
---@field name string Camp identifier name.
---@field visible string Camp visibility state.
---@field type integer Camp type identifier.

---Returns neutral camp info for the given team.
---IMPORTANT: Returns ONLY camps with NO live entity in the entity system (dead or hidden camps).
---@param team_num integer Team number to query.
---@param all_types? boolean @default: `false`. If true, include all camp types instead of filtering.
---@return camp_info[] @Array of camp info entries for dead/hidden camps.
function utils.get_neutral_camps(team_num, all_types) end

---Executes a console command.
---Silent no-op if CInputService is unavailable.
---@param cmd string Console command string to execute.
function utils.execute_command(cmd) end

---Reloads all Lua scripts asynchronously via the reload thread.
---Blocks the render thread during reload (OnPreloadScript/OnPostloadScript).
---Equivalent to pressing the reload bind in the menu.
function utils.reload_scripts() end

---Encodes a Lua table to a JSON string.
---@param tbl table Table to encode.
---@return string @JSON string.
function utils.json_encode(tbl) end

---Decodes a JSON string to a Lua table.
---Returns nil if the string is not valid JSON.
---@param str string JSON string to decode.
---@return table|nil @Decoded table, or nil on parse error.
function utils.json_decode(str) end
```
