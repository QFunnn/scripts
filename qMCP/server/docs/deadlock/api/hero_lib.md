# hero_lib

Hero-specific utilities: state checks, target finding, ability/item handling, projectile prediction, movement simulation, and UI settings.

```lua
---Hero-specific utilities: state checks, target finding, ability/item handling, projectile prediction, movement simulation, and UI settings.
---@class HERO_LIB
HERO_LIB = {}

---Conversion factor from Source 2 units to meters.
---@type number
HERO_LIB.UNITS_TO_METERS = 0.0265

---Cached local pawn, updated each tick.
---@type player_pawn|nil
HERO_LIB.lp = nil

---Cached local hero ID.
---@type integer
HERO_LIB.lp_hero_id = 0

---Whether the local pawn reference is valid.
---@type boolean|nil
HERO_LIB.is_lp_valid = nil

---Whether the local pawn is alive.
---@type boolean|nil
HERO_LIB.is_lp_alive = nil

---Internal cache storage.
---@type table
HERO_LIB.CACHE = {}

---Movement simulation type.
---@enum HERO_LIB.ENUM_MV_SIM_TYPE
HERO_LIB.ENUM_MV_SIM_TYPE = {
    INVALID = 0,
    SIMULATE_MOVEMENT = 1,
    SIMPLE_VEL_LOOP = 2,
}

---Projectile prediction info source.
---@enum HERO_LIB.ENUM_PPS_INFO_FROM
HERO_LIB.ENUM_PPS_INFO_FROM = {
    INVALID = 0,
    GUN = 1,
    PROJECTILE = 2,
    CUSTOM = 3,
}

---Projectile prediction aim target position type.
---@enum HERO_LIB.ENUM_PPS_AIM_TO_POS
HERO_LIB.ENUM_PPS_AIM_TO_POS = {
    INVALID = 0,
    LIB_TARGET_POS = 1,
    PAWN_ORIGIN = 2,
    CUSTOM = 3,
}

---Maps internal hero names to fixed image names.
---@type table<string, string>
HERO_LIB.fix_hero_names = {}

---All active items with name/image/category fields.
---@type table
HERO_LIB.all_active_items = {}

---Whitelisted bone names for tracing.
---@type table<string, boolean>
HERO_LIB.whitelist_bones = {}

---Whitelisted bone names excluding legs.
---@type table<string, boolean>
HERO_LIB.whitelist_bones_no_legs = {}

---Whitelisted bone names for bunny model.
---@type table<string, boolean>
HERO_LIB.whitelist_bunny_bones = {}

---Whitelisted bone names for cat model.
---@type table<string, boolean>
HERO_LIB.whitelist_cat_bones = {}

---Whitelisted bone names for head and body only.
---@type table<string, boolean>
HERO_LIB.whitelist_bones_only_head_body = {}

-- Cache

---Returns a cached value for the given key, calling producer on cache miss.
---@param key any Cache key.
---@param producer fun(): any Value producer called on cache miss.
---@return any @Cached or freshly produced value.
function HERO_LIB.cache_get(key, producer) end

-- State checks

---Returns whether the pawn is asleep.
---@param pawn player_pawn
---@return boolean
function HERO_LIB.is_sleeped(pawn) end

---Returns whether the pawn is stunned.
---@param pawn player_pawn
---@return boolean
function HERO_LIB.is_stunned(pawn) end

---Returns whether the pawn is invulnerable.
---@param pawn player_pawn
---@return boolean
function HERO_LIB.is_invulnerable(pawn) end

---Returns whether the pawn is unstoppable.
---@param pawn player_pawn
---@return boolean
function HERO_LIB.is_unstoppable(pawn) end

---Returns whether the pawn is silenced.
---@param pawn player_pawn
---@return boolean
function HERO_LIB.is_silenced(pawn) end

---Returns whether the pawn is ziplining.
---@param pawn player_pawn
---@return boolean
function HERO_LIB.is_ziplining(pawn) end

---Returns whether the pawn is climbing a rope.
---@param pawn player_pawn
---@return boolean
function HERO_LIB.is_climbing_rope(pawn) end

---Returns whether the pawn has combat abilities disabled.
---@param pawn player_pawn
---@return boolean
function HERO_LIB.is_combat_abilities_disabled(pawn) end

---Returns whether the pawn is command restricted.
---@param pawn player_pawn
---@return boolean
function HERO_LIB.is_command_restricted(pawn) end

---Returns whether the pawn is out of game.
---@param pawn player_pawn
---@return boolean
function HERO_LIB.is_out_of_game(pawn) end

---Returns whether the pawn is ground dashing.
---@param pawn player_pawn
---@return boolean
function HERO_LIB.is_ground_dashing(pawn) end

---Returns whether the pawn is air dashing.
---@param pawn player_pawn
---@return boolean
function HERO_LIB.is_air_dashing(pawn) end

---Returns whether the pawn is dashing (ground or air).
---@param pawn player_pawn
---@return boolean
function HERO_LIB.is_any_dashing(pawn) end

---Returns whether the pawn is untargetable.
---@param pawn player_pawn
---@return boolean
function HERO_LIB.is_untargetable(pawn) end

---Returns whether the pawn is using Blood Tribute.
---@param pawn player_pawn
---@return boolean
function HERO_LIB.is_using_blood_tribute(pawn) end

---Returns whether the pawn is immune to stun.
---@param pawn player_pawn
---@return boolean
function HERO_LIB.is_immune_to_stun(pawn) end

---Returns whether the entity is on the ground.
---@param ent entity
---@return boolean
function HERO_LIB.is_on_ground(ent) end

---Returns whether the pawn is in Ivy stone form.
---@param pawn player_pawn
---@return boolean
function HERO_LIB.is_in_ivy_stone_form(pawn) end

---Returns whether the pawn is inside Viscous cube.
---@param pawn player_pawn
---@return boolean
function HERO_LIB.is_in_viscous_cube(pawn) end

---Returns whether the pawn is in Mirage tornado.
---@param pawn player_pawn
---@return boolean
function HERO_LIB.is_in_mirage_tornado(pawn) end

---Returns whether the pawn is casting Haze ultimate.
---@param pawn player_pawn
---@return boolean
function HERO_LIB.is_casting_haze_ult(pawn) end

---Returns whether the pawn is casting Krill ultimate.
---@param pawn player_pawn
---@return boolean
function HERO_LIB.is_casting_krill_ult(pawn) end

---Returns whether the pawn is casting Seven ultimate.
---@param pawn player_pawn
---@return boolean
function HERO_LIB.is_casting_seven_ult(pawn) end

---Returns whether the pawn is casting Kelvin third ability.
---@param pawn player_pawn
---@return boolean
function HERO_LIB.is_casting_kelvin_third(pawn) end

---Returns whether the pawn is in Ethereal Shift.
---@param pawn player_pawn
---@return boolean
function HERO_LIB.is_in_ethereal_shift(pawn) end

---Returns whether the pawn is in Ivy stone form (alias).
---@param pawn player_pawn
---@return boolean
function HERO_LIB.is_ivy_stone_form(pawn) end

-- Health / stats

---Returns the entity's current health.
---@param ent entity
---@return integer|nil
function HERO_LIB.get_health(ent) end

---Returns the entity's maximum health.
---@param ent entity
---@return integer|nil
function HERO_LIB.get_max_health(ent) end

---Returns the entity's health as a fraction (0..1).
---@param ent entity
---@return number|nil
function HERO_LIB.get_health_percent(ent) end

---Returns the entity's current stamina.
---@param ent entity
---@return number
function HERO_LIB.get_stamina(ent) end

---Returns the entity's maximum stamina.
---@param ent entity
---@return number
function HERO_LIB.get_max_stamina(ent) end

---Returns the entity's hero ID.
---@param ent entity
---@return integer
function HERO_LIB.get_hero_id(ent) end

---Returns current clip count and max clip size.
---@param lp player_pawn Local pawn.
---@param tech_power? number Optional tech power override.
---@return integer @Current clip count.
---@return integer @Max clip size.
function HERO_LIB.get_clip_size(lp, tech_power) end

---Returns whether the entity has any of the specified particles.
---@param ent entity
---@param particles string[] Particle names to check.
---@return boolean
function HERO_LIB.has_any_particle(ent, particles) end

-- Ability helpers

---Returns whether the ability is ready to use.
---@param ability ability
---@param allow_casting? boolean Allow if currently casting.
---@param additional_allowed_states? integer[] Additional allowed ability states.
---@return boolean
function HERO_LIB.is_ability_ready(ability, allow_casting, additional_allowed_states) end

---Returns whether the ability is on cooldown.
---@param ability ability
---@param force_chargeable? boolean Force chargeable cooldown check.
---@return boolean|nil
function HERO_LIB.is_ability_in_cd(ability, force_chargeable) end

---Returns whether the ability is in its cast delay window.
---@param ability ability
---@param no_start_offset? boolean Skip start offset.
---@param custom_cast_delay? number Custom cast delay duration.
---@param custom_cast_delay_start_time? number Custom cast delay start time.
---@return boolean|nil
function HERO_LIB.is_ability_in_cast_delay(ability, no_start_offset, custom_cast_delay, custom_cast_delay_start_time) end

---Returns whether the ability is currently selected by the local pawn.
---@param lp player_pawn Local pawn.
---@param ability ability
---@return boolean
function HERO_LIB.is_ability_selected(lp, ability) end

---Returns whether the ability is in self cast delay.
---@param ability ability
---@return boolean
function HERO_LIB.is_ability_in_self_cast_delay(ability) end

---Returns the ability's self cast delay duration.
---@param ability ability
---@return number
function HERO_LIB.get_ability_self_cast_delay(ability) end

---Returns whether the ability is currently being channeled.
---@param ability ability
---@return boolean
function HERO_LIB.is_channeling_ability(ability) end

---Returns whether the pawn is channeling any ability.
---@param lp player_pawn Local pawn.
---@param exceptions? string[] Ability names to exclude from the check.
---@return boolean
function HERO_LIB.is_channeling_any_ability(lp, exceptions) end

---Returns whether the pawn is channeling any of the specified abilities.
---@param lp player_pawn Local pawn.
---@param ability_names string[] Ability names to check.
---@return boolean
function HERO_LIB.is_channeling_specific_abilities(lp, ability_names) end

---Returns whether the pawn is in cast delay for any of the specified abilities.
---@param lp player_pawn Local pawn.
---@param ability_names string[] Ability names to check.
---@return boolean
function HERO_LIB.is_in_cast_delay_specific_abilities(lp, ability_names) end

---Casts an ability using the given command.
---@param cmd CUserCmd User command.
---@param lp player_pawn Local pawn.
---@param ability ability Ability to cast.
---@param with_alt? boolean Use alternate cast.
---@param with_attack? boolean Include attack input.
---@param custom_ability_slot? EAbilitySlots_t Custom ability slot override.
function HERO_LIB.cast_ability(cmd, lp, ability, with_alt, with_attack, custom_ability_slot) end

---Blocks an item from being used this tick.
---@param cmd CUserCmd User command.
---@param item ability Item to block.
function HERO_LIB.block_item(cmd, item) end

---Returns the input bit mask for the given ability.
---@param ability ability
---@return InputBitMask_t|nil
function HERO_LIB.get_ability_input_mask(ability) end

---Returns the icon path for the given ability.
---@param ability ability
---@param custom_ability_name? string Custom ability name override.
---@return string|nil
function HERO_LIB.get_ability_icon(ability, custom_ability_name) end

---Returns the actual property value for the given ability prop.
---@param ability ability
---@param prop_name string Property name.
---@return number
function HERO_LIB.get_actual_prop_value(ability, prop_name) end

---Returns a cached numeric property value for the given ability prop.
---@param ability ability
---@param prop_name string Property name.
---@return number|nil
function HERO_LIB.get_cached_property_num(ability, prop_name) end

---Returns cached property values table for the given ability prop.
---@param ability ability
---@param prop_name string Property name.
---@return table|nil
function HERO_LIB.get_cached_property_values(ability, prop_name) end

---Returns cached upgrade numbers for the given ability.
---@param ability ability
---@return table|nil
function HERO_LIB.get_cached_upgrades_num(ability) end

---Returns the cast delay fraction (0..1) for the ability.
---@param ability ability
---@return number
function HERO_LIB.get_cast_delay_fraction(ability) end

---Returns the burst QSR charge-up fraction for the ability.
---@param ability ability
---@return number
function HERO_LIB.get_burst_qsr_chargeup_frac(ability) end

---Returns whether the pawn has the named ability.
---@param pawn player_pawn
---@param ability_name string Ability name to check.
---@return boolean
function HERO_LIB.has_ability(pawn, ability_name) end

---Returns whether the pawn can be last-hit killed.
---@param pawn player_pawn
---@param allow_victor_ult? boolean Allow during Victor ultimate.
---@return boolean
function HERO_LIB.can_be_lasthitted(pawn, allow_victor_ult) end

-- Damage calculation

---Applies spirit resistance to a base damage value.
---@param ent entity Target entity.
---@param base_value number Raw spirit damage.
---@return number @Damage after spirit resistance.
function HERO_LIB.handle_spirit_resist(ent, base_value) end

---Calculates QSR (Quick Silver Reload) bonus damage.
---@param lp player_pawn Local pawn.
---@param target player_pawn Target pawn.
---@param ability ability Ability used.
---@param damage number Base damage.
---@return number @Adjusted damage.
function HERO_LIB.get_qsr_damage(lp, target, ability, damage) end

---Calculates mystic burst bonus damage after resistance.
---@param lp player_pawn Local pawn.
---@param target player_pawn Target pawn.
---@param damage_no_resist number Damage before resistance.
---@return number @Damage after mystic burst calculation.
function HERO_LIB.get_mystic_burst_damage(lp, target, damage_no_resist) end

---Applies Spellbreaker damage reduction to the given damage.
---@param target player_pawn Target pawn.
---@param damage number Incoming damage.
---@return number @Damage after Spellbreaker reduction.
function HERO_LIB.handle_spellbreaker_reduction(target, damage) end

-- Target finding

---Finds the best target for the current context.
---@param cmd CUserCmd User command.
---@param lp player_pawn Local pawn.
---@param is_combo boolean Whether this is a combo target search.
---@return player_pawn|nil
function HERO_LIB.find_target(cmd, lp, is_combo) end

---Finds the best combo target.
---@param cmd CUserCmd User command.
---@param lp player_pawn Local pawn.
---@return player_pawn|nil
function HERO_LIB.find_combo_target(cmd, lp) end

---Finds the best helper target.
---@param cmd CUserCmd User command.
---@param lp player_pawn Local pawn.
---@return player_pawn|nil
function HERO_LIB.find_helper_target(cmd, lp) end

---Returns the nearest enemy pawn.
---@param lp player_pawn Local pawn.
---@param pos Vector Origin position.
---@param only_visible? boolean Only consider visible enemies.
---@param with_time_predict? boolean Use time-based prediction.
---@param time? number Prediction time.
---@param check_active? boolean Only consider active enemies.
---@param additional_filter_func? fun(pawn: player_pawn): boolean Extra filter.
---@return player_pawn|nil
function HERO_LIB.get_nearest_enemy(lp, pos, only_visible, with_time_predict, time, check_active, additional_filter_func) end

---Returns all hero pawns matching the given filters.
---@param lp player_pawn Local pawn.
---@param allow_lp? boolean Include local pawn.
---@param allow_allies? boolean Include allies.
---@param allow_enemies? boolean Include enemies.
---@param only_alive? boolean Only alive heroes.
---@return player_pawn[]
function HERO_LIB.get_all_heroes(lp, allow_lp, allow_allies, allow_enemies, only_alive) end

---Returns all hero pawns that have the named ability.
---@param ability_name string Ability name to check.
---@param lp player_pawn Local pawn.
---@param allow_lp? boolean Include local pawn.
---@param allow_allies? boolean Include allies.
---@param allow_enemies? boolean Include enemies.
---@param only_alive? boolean Only alive heroes.
---@return player_pawn[] @Matching pawns.
---@return ability[] @Corresponding abilities.
function HERO_LIB.get_all_heroes_with_ability(ability_name, lp, allow_lp, allow_allies, allow_enemies, only_alive) end

---Returns all hero pawns that have the given modifier.
---@param modifier modifier Modifier to check.
---@param lp player_pawn Local pawn.
---@param allow_lp? boolean Include local pawn.
---@param allow_allies? boolean Include allies.
---@param allow_enemies? boolean Include enemies.
---@param only_alive? boolean Only alive heroes.
---@return player_pawn[]
function HERO_LIB.get_all_heroes_with_modifier(modifier, lp, allow_lp, allow_allies, allow_enemies, only_alive) end

---Returns all hero pawns that have the given modifier state.
---@param modifier_state EModifierState Modifier state to check.
---@param lp player_pawn Local pawn.
---@param allow_lp? boolean Include local pawn.
---@param allow_allies? boolean Include allies.
---@param allow_enemies? boolean Include enemies.
---@param only_alive? boolean Only alive heroes.
---@return player_pawn[]
function HERO_LIB.get_all_heroes_with_modifier_state(modifier_state, lp, allow_lp, allow_allies, allow_enemies, only_alive) end

---Returns all hero pawns within the given radius.
---@param lp player_pawn Local pawn.
---@param pos Vector Center position.
---@param radius number Search radius.
---@param allow_allies? boolean Include allies.
---@param allow_enemies? boolean Include enemies.
---@param only_visible? boolean Only visible pawns.
---@param check_active? boolean Only active pawns.
---@param with_time_predict? boolean Use time-based prediction.
---@param time? number Prediction time.
---@return player_pawn[]
function HERO_LIB.get_heroes_in_radius(lp, pos, radius, allow_allies, allow_enemies, only_visible, check_active, with_time_predict, time) end

-- FOV / Visibility

---Returns the FOV angle from camera to the target entity.
---@param camera_pos Vector Camera position.
---@param target player_pawn Target pawn.
---@param only_yaw? boolean Only consider yaw angle.
---@param cmd? CUserCmd User command for view angles.
---@return number @FOV angle in degrees.
function HERO_LIB.get_fov_to_entity(camera_pos, target, only_yaw, cmd) end

---Returns whether the target is within the given FOV.
---@param camera_pos Vector Camera position.
---@param target player_pawn Target pawn.
---@param fov number Maximum FOV angle.
---@param only_yaw? boolean Only consider yaw angle.
---@param cmd? CUserCmd User command for view angles.
---@return boolean
function HERO_LIB.is_target_within_fov(camera_pos, target, fov, only_yaw, cmd) end

---Returns the FOV angle from camera to a world position.
---@param camera_pos Vector Camera position.
---@param pos Vector World position.
---@param custom_camera_angles? Angle Custom camera angles override.
---@param only_yaw? boolean Only consider yaw angle.
---@param cmd? CUserCmd User command for view angles.
---@return number @FOV angle in degrees.
function HERO_LIB.get_fov_to_pos(camera_pos, pos, custom_camera_angles, only_yaw, cmd) end

---Returns whether a world position is within the given FOV.
---@param camera_pos Vector Camera position.
---@param pos Vector World position.
---@param fov number Maximum FOV angle.
---@param custom_camera_angles? Angle Custom camera angles override.
---@param only_yaw? boolean Only consider yaw angle.
---@param cmd? CUserCmd User command for view angles.
---@return boolean
function HERO_LIB.is_pos_within_fov(camera_pos, pos, fov, custom_camera_angles, only_yaw, cmd) end

---Returns the minimum FOV angle across the given bone positions.
---@param bones table<string, Vector> Bone name to position map.
---@param custom_camera_pos? Vector Custom camera position.
---@return number|nil
function HERO_LIB.get_fov_to_bones(bones, custom_camera_pos) end

---Returns the closest bone position on the target to the camera.
---@param target player_pawn Target pawn.
---@param custom_camera_pos? Vector Custom camera position.
---@return Vector|nil
function HERO_LIB.get_closest_bone_pos(target, custom_camera_pos) end

---Returns a map of bone names to world positions for the target.
---@param target player_pawn Target pawn.
---@param ignore_legs? boolean Exclude leg bones.
---@return table<string, Vector>
function HERO_LIB.get_bone_positions(target, ignore_legs) end

---Returns the predicted target position used for aiming.
---@param target player_pawn Target pawn.
---@return Vector|nil
function HERO_LIB.get_target_pos(target) end

---Returns whether there is no obstruction between the camera and the target.
---@param target player_pawn Target pawn.
---@param custom_camera_pos? Vector Custom camera position.
---@param custom_lp? player_pawn Custom local pawn for trace filtering.
---@param custom_allowed_fraction? number Maximum allowed trace fraction.
---@return boolean
function HERO_LIB.no_obs_to_target(target, custom_camera_pos, custom_lp, custom_allowed_fraction) end

---Returns whether there is no obstruction between the camera and a position.
---@param pos Vector World position.
---@param custom_camera_pos? Vector Custom camera position.
---@param custom_lp? player_pawn Custom local pawn for trace filtering.
---@param target? player_pawn Target pawn to ignore in trace.
---@param custom_allowed_fraction? number Maximum allowed trace fraction.
---@return boolean
function HERO_LIB.no_obs_to_pos(pos, custom_camera_pos, custom_lp, target, custom_allowed_fraction) end

---Returns whether the line between two positions is free of obstructions.
---@param start_pos Vector Start position.
---@param end_pos Vector End position.
---@param lp player_pawn Local pawn for trace filtering.
---@param target? player_pawn Target pawn to ignore in trace.
---@param allowed_fraction? number Maximum allowed trace fraction.
---@return boolean @Whether the line is free.
---@return number @Trace fraction.
function HERO_LIB.is_line_free(start_pos, end_pos, lp, target, allowed_fraction) end

---Returns whether the target position is within the ability cone.
---@param lp player_pawn Local pawn.
---@param cmd CUserCmd User command.
---@param target_position Vector Target position to check.
---@param ability ability Ability with cone properties.
---@param angle_scale? number Scale factor for cone angle.
---@param from_lp_origin? boolean Measure from pawn origin instead of camera.
---@param with_pitch? boolean Include pitch in cone check.
---@param use_half_width_method? boolean Use half-width cone method.
---@return boolean @Whether inside the cone.
---@return number @Angle to the target.
function HERO_LIB.is_target_within_cone(lp, cmd, target_position, ability, angle_scale, from_lp_origin, with_pitch, use_half_width_method) end

---Returns whether the target position is within the wave width.
---@param camera_pos Vector Camera position.
---@param camera_forward Vector Camera forward direction.
---@param target_pos Vector Target position.
---@param wave_width number Wave width.
---@return boolean
function HERO_LIB.is_within_wave_width(camera_pos, camera_forward, target_pos, wave_width) end

---Returns whether the crosshair is already aimed at the predicted position.
---@param predicted_pos Vector Predicted target position.
---@param cmd CUserCmd User command.
---@param threshold? number FOV threshold in degrees.
---@return boolean
function HERO_LIB.is_already_aiming(predicted_pos, cmd, threshold) end

---Returns whether a hull projectile will hit the target.
---@param local_pawn player_pawn Local pawn.
---@param camera_pos Vector Camera position.
---@param target_pos Vector Target position.
---@param target player_pawn Target pawn.
---@param abil ability Ability with projectile properties.
---@param ignore_team? boolean Ignore team check.
---@param custom_radius? number Custom hull radius.
---@return boolean
function HERO_LIB.hull_projectile_will_hit(local_pawn, camera_pos, target_pos, target, abil, ignore_team, custom_radius) end

-- Projectile prediction

---Predicts projectile landing position using linear extrapolation.
---@param info_from HERO_LIB.ENUM_PPS_INFO_FROM Source of projectile info.
---@param cast_point Vector Projectile origin.
---@param target_pos Vector Target position.
---@param target_velocity Vector Target velocity.
---@param ability ability Ability with projectile properties.
---@param ignore_z? boolean Ignore Z axis in prediction.
---@param custom_proj_speed? number Custom projectile speed.
---@return Vector @Predicted aim position.
---@return Vector @Predicted target position at impact.
---@return number @Predicted time of flight.
function HERO_LIB.predict_projectile(info_from, cast_point, target_pos, target_velocity, ability, ignore_z, custom_proj_speed) end

---Predicts projectile landing position using movement simulation.
---@param need_debug boolean Enable debug visualization.
---@param info_from HERO_LIB.ENUM_PPS_INFO_FROM Source of projectile info.
---@param sim_type HERO_LIB.ENUM_MV_SIM_TYPE Movement simulation type.
---@param aim_to_pos HERO_LIB.ENUM_PPS_AIM_TO_POS Aim position type.
---@param target player_pawn Target pawn.
---@param ability ability Ability with projectile properties.
---@param custom_lp? player_pawn Custom local pawn.
---@param custom_proj_speed? number Custom projectile speed.
---@param custom_max_range? number Custom maximum range.
---@return Vector|nil @Predicted aim position.
---@return Vector|nil @Predicted target position at impact.
---@return Vector[] @Simulated projectile path points.
---@return Vector[] @Simulated target path points.
function HERO_LIB.predict_projectile_simulated(need_debug, info_from, sim_type, aim_to_pos, target, ability, custom_lp, custom_proj_speed, custom_max_range) end

-- Movement

---Simulates pawn movement using the given simulation type.
---@param pawn player_pawn Pawn to simulate.
---@param sim_type HERO_LIB.ENUM_MV_SIM_TYPE Simulation type.
---@param callback fun(pos: Vector, vel: Vector, step: integer): boolean Step callback, return false to stop.
---@return boolean @Whether simulation completed.
function HERO_LIB.simulate_pawn_movement(pawn, sim_type, callback) end

---Simulates pawn movement for a given duration and returns path points.
---@param target player_pawn Target pawn.
---@param duration number Simulation duration in seconds.
---@param additional_movement_slow? number Additional movement slow factor.
---@return Vector[] @Simulated path points.
---@return Vector @Final predicted position.
function HERO_LIB.simulate_movement_for_duration(target, duration, additional_movement_slow) end

---Rotates movement input to face a target direction or position.
---@param cmd CUserCmd User command.
---@param lp player_pawn Local pawn.
---@param only_yaw boolean Only rotate yaw.
---@param need_angle? Angle Target angle.
---@param need_dir? Vector Target direction.
---@param need_pos? Vector Target position.
---@param block_movement? boolean Block movement input.
---@param move_on? Vector Position to move toward.
---@param move_from? Vector Position to move away from.
---@return boolean @Whether rotation was applied.
function HERO_LIB.rotate_movement(cmd, lp, only_yaw, need_angle, need_dir, need_pos, block_movement, move_on, move_from) end

-- Aiming

---Performs psilent aiming with smooth interpolation.
---@param cmd CUserCmd User command.
---@param smooth number Smooth factor.
---@param pos Vector Target position.
---@param target player_pawn Target pawn.
---@param radius number Aim radius.
---@param allow_psilent boolean Allow psilent aiming.
---@param allowed_min_fov number Minimum FOV for psilent.
---@param on_aimed_callback? fun() Called when aim is on target.
---@param on_process_callback? fun() Called each processing step.
---@param angle? Angle Custom aim angle.
function HERO_LIB.aim_psilent_default(cmd, smooth, pos, target, radius, allow_psilent, allowed_min_fov, on_aimed_callback, on_process_callback, angle) end

-- Items

---Handles casting targeted items on the given target.
---@param cmd CUserCmd User command.
---@param lp player_pawn Local pawn.
---@param target player_pawn Target pawn.
---@param items_multiselect table Items multiselect widget value.
---@param smooth number Aim smooth factor.
---@param allow_psilent boolean Allow psilent aiming.
---@return boolean @Whether an item was used.
function HERO_LIB.handle_target_items(cmd, lp, target, items_multiselect, smooth, allow_psilent) end

---Handles casting AOE items at the target's position.
---@param cmd CUserCmd User command.
---@param lp player_pawn Local pawn.
---@param target player_pawn Target pawn.
---@param items_multiselect table Items multiselect widget value.
---@return boolean @Whether an item was used.
function HERO_LIB.handle_aoe_items(cmd, lp, target, items_multiselect) end

---Handles casting non-targeted items near the target.
---@param cmd CUserCmd User command.
---@param lp player_pawn Local pawn.
---@param target player_pawn Target pawn.
---@param items_multiselect table Items multiselect widget value.
---@return boolean @Whether an item was used.
function HERO_LIB.handle_non_target_items(cmd, lp, target, items_multiselect) end

---Handles all item categories for the target.
---@param cmd CUserCmd User command.
---@param me player_pawn Local pawn.
---@param target player_pawn Target pawn.
---@param items_enabled boolean Whether items are enabled.
---@param items_smooth number Aim smooth factor.
---@param items_psilent boolean Allow psilent aiming.
---@param aoe_widget table AOE items widget value.
---@param target_widget table Target items widget value.
---@param non_target_widget table Non-target items widget value.
---@return boolean @Whether an item was used.
function HERO_LIB.handle_all_items(cmd, me, target, items_enabled, items_smooth, items_psilent, aoe_widget, target_widget, non_target_widget) end

---Creates item multiselect UI widgets under the given parent.
---@param parent table UI parent element.
---@return ui_lib_element_gear @Weapon items widget.
---@return ui_lib_element_gear @Vitality items widget.
---@return ui_lib_element_gear @Spirit items widget.
---@return ui_lib_element_gear @AOE items widget.
---@return ui_lib_element_gear @Target items widget.
---@return ui_lib_element_gear @Non-target items widget.
function HERO_LIB.create_item_multiselects(parent) end

---Uses Blood Tribute active item.
---@param cmd CUserCmd User command.
---@param lp player_pawn Local pawn.
---@param blood_tribute ability Blood Tribute item.
---@param value number Health threshold value.
function HERO_LIB.use_blood_tribute(cmd, lp, blood_tribute, value) end

-- Misc

---Returns whether two pawns are on the same team.
---@param pawn1 player_pawn First pawn.
---@param pawn2 player_pawn Second pawn.
---@return boolean
function HERO_LIB.is_same_team(pawn1, pawn2) end

---Returns whether the player is using the free cursor.
---@param cmd CUserCmd User command.
---@return boolean
function HERO_LIB.is_using_free_cursor(cmd) end

---Returns whether a combo can be executed.
---@param lp player_pawn Local pawn.
---@param cmd CUserCmd User command.
---@param allow_cursor? boolean Allow during free cursor.
---@return boolean
function HERO_LIB.can_combo(lp, cmd, allow_cursor) end

---Returns the closest point on a line segment to a given point.
---@param start_point Vector Line start.
---@param end_point Vector Line end.
---@param point Vector Query point.
---@return Vector @Closest point on the line.
function HERO_LIB.closest_point_on_line(start_point, end_point, point) end

---Applies item schema configuration to a widget.
---@param widget table UI widget.
---@param items table Item configuration.
function HERO_LIB.apply_item_schema(widget, items) end

---Returns a UI element table for the given item and value.
---@param item table Item data.
---@param value any Item value.
---@return table @UI element descriptor.
function HERO_LIB.get_item_ui_element(item, value) end

---Returns the item category name for the given item name.
---@param name string Item name.
---@return string|nil @Category name.
function HERO_LIB.get_item_category_by_name(name) end

-- UI settings getters

---Returns the combo FOV setting.
---@param lp player_pawn Local pawn.
---@return number
function HERO_LIB.get_combo_fov(lp) end

---Returns the helper FOV setting.
---@param lp player_pawn Local pawn.
---@return number
function HERO_LIB.get_helper_fov(lp) end

---Returns the combo distance setting.
---@param lp player_pawn Local pawn.
---@return number
function HERO_LIB.get_combo_distance(lp) end

---Returns the helper distance setting.
---@param lp player_pawn Local pawn.
---@return number
function HERO_LIB.get_helper_distance(lp) end

---Returns the combo priority setting.
---@param lp player_pawn Local pawn.
---@return number
function HERO_LIB.get_combo_priority(lp) end

---Returns the helper priority setting.
---@param lp player_pawn Local pawn.
---@return number
function HERO_LIB.get_helper_priority(lp) end

---Returns the combo ignore list.
---@param lp player_pawn Local pawn.
---@return table
function HERO_LIB.get_combo_ignore(lp) end

---Returns the helper ignore list.
---@param lp player_pawn Local pawn.
---@return table
function HERO_LIB.get_helper_ignore(lp) end

---Returns the combo lock target setting.
---@param lp player_pawn Local pawn.
---@return number
function HERO_LIB.get_combo_lock_target(lp) end

-- Global utilities

---Clamps a value between min and max.
---@param value number Value to clamp.
---@param min number Minimum bound.
---@param max number Maximum bound.
---@return number @Clamped value.
function math.clamp(value, min, max) end

---Ternary helper: returns val1 if cond is truthy, val2 otherwise.
---@param cond any Condition to evaluate.
---@param val1 any Value returned when truthy.
---@param val2 any Value returned when falsy.
---@return any
function ter(cond, val1, val2) end
```
