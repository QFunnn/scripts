# ability

Game ability or weapon entity.

```lua
---Game ability or weapon entity.
---@class ability : entity
ability = {}

---Returns the ability's cast range.
---@return number @Cast range in game units.
function ability:get_cast_range() end

---Returns the current ability level.
---@return integer @Current level (0-based).
function ability:get_level() end

---Returns the remaining cooldown in seconds.
---Computed as (cooldown_end - game_time). Returns 0 if the ability is not on cooldown.
---@return number @Remaining cooldown in seconds, or 0 if ready.
function ability:get_cooldown() end

---Returns the area of effect radius.
---@return number @AoE radius in game units.
function ability:get_aoe_radius() end

---@alias execute_enum
---| 0 # ready
---| 2 # cooldown
---| 3 # passive
---| 7 # idk
---| 10 # busy

---Returns the current execution state of the ability.
---@return execute_enum @Execution state enum value.
function ability:can_be_executed() end

---Returns an array of subclass IDs (m_nSubclassIDs) of imbued abilities.
---Returns integer IDs, not ability objects.
---@return integer[] @Array of imbued ability subclass IDs.
function ability:get_imbued_abilities() end

---Returns whether the ability has an imbue for the given subclass ID.
---@param m_nSubclassID integer Subclass ID to check.
---@return boolean @True if the ability has an imbue for the given subclass ID.
function ability:has_imbue_for(m_nSubclassID) end

---Returns a CitadelAbilityProperty_t from VData.
---Property definitions are located in pak01_dir.vpk > scripts/abilities.vdata_c.
---@param name string Property name as defined in VData.
---@return raw_struct @CitadelAbilityProperty_t struct from VData.
function ability:get_property(name) end

---Returns the scaled (level-adjusted) value of a property, or nil if not found.
---@param name string Property name as defined in VData.
---@return number|nil @Scaled property value, or nil if the property does not exist.
function ability:get_scaled_property(name) end

---Returns upgrade info at the given level. Level is 1-indexed.
---@param level integer Upgrade level (1-indexed).
---@return table<string, string> @Upgrade info key-value pairs.
function ability:get_upgrade(level) end

---Returns upgrade info for all levels.
---@return table<string, string>[] @Array of upgrade info tables, one per level.
function ability:get_upgrades() end

---Returns the ability's current target entity.
---Only works for the local player's abilities; silently returns nil for other players' abilities.
---@return entity|nil @Target entity, or nil if no target or ability belongs to another player.
function ability:get_target() end

---Finds entities within a cone-shaped area.
---@param team_num integer Team number filter.
---@param start_pos Vector Cone origin point.
---@param direction Vector Cone direction vector.
---@param distance number Cone length.
---@param cone_half_width number Half-width of the cone.
---@param cone_angles Angle Cone orientation angles.
---@param owner entity Owner entity (excluded from results).
---@param los_check boolean Whether to perform line-of-sight checks.
---@param include_extra2d_cone boolean Whether to include extra 2D cone check.
---@return entity[] @Entities found within the cone.
function ability:find_entities_in_cone(team_num, start_pos, direction, distance, cone_half_width, cone_angles, owner, los_check, include_extra2d_cone) end
```
