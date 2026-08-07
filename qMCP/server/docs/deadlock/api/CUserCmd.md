# CUserCmd

User input command sent to the server each tick.

```lua
---User input command sent to the server each tick.
---@class CUserCmd
---@field legacy_command_number integer Legacy command sequence number.
---@field client_tick integer Client tick when command was created.
---@field viewangles Angle View direction angles.
---@field forwardmove number Forward/backward movement input (-1.0 to 1.0).
---@field leftmove number Left/right strafe movement input (-1.0 to 1.0).
---@field upmove number Up/down movement input.
---@field impulse number Impulse command value.
---@field weaponselect integer Selected weapon index.
---@field random_seed integer Random seed for this command.
---@field mousedx integer Mouse delta X (horizontal movement).
---@field mousedy integer Mouse delta Y (vertical movement).
---@field pawn_entity_handle integer Entity handle of the controlled pawn.
---@field consumed_server_angle_changes integer Number of consumed server angle changes.
---@field cmd_flags integer Command flags bitmask.
---@field vec_camera_position Vector Current camera world position.
---@field ang_camera_angles Angle Current camera angles.
---@field execute_ability_indices integer Ability index to execute.
---@field in_shop boolean Whether the shop UI is open.
---@field camera_roaming_speed number Camera roaming speed.
---@field using_free_cursor boolean Whether free cursor mode is active.
---@field enemy_hero_aimed_at integer Entity handle of the enemy hero being aimed at.
---@field button_state0 InputBitMask_t|integer Raw button state slot 0. Writes ONLY to struct, not protobuf. Use add_/clear_/set_input to stay in sync.
---@field button_state1 InputBitMask_t|integer Raw button state slot 1. Same caveat as button_state0.
---@field button_state2 InputBitMask_t|integer Raw button state slot 2. Same caveat as button_state0.
---@field orig_vec_camera_position Vector Read-only. Original camera position before callbacks.
---@field orig_ang_camera_angles Angle Read-only. Original camera angles before callbacks.
CUserCmd = {}

---Adds bits to button state 1. Keeps struct and protobuf in sync.
---@param bit_mask InputBitMask_t|integer Button bits to set.
function CUserCmd:add_buttonstate1(bit_mask) end

---Adds bits to button state 2. Keeps struct and protobuf in sync.
---@param bit_mask InputBitMask_t|integer Button bits to set.
function CUserCmd:add_buttonstate2(bit_mask) end

---Adds bits to button state 3. Keeps struct and protobuf in sync.
---@param bit_mask InputBitMask_t|integer Button bits to set.
function CUserCmd:add_buttonstate3(bit_mask) end

---Clears bits from button state 1. Keeps struct and protobuf in sync.
---@param bit_mask InputBitMask_t|integer Button bits to clear.
function CUserCmd:clear_buttonstate1(bit_mask) end

---Clears bits from button state 2. Keeps struct and protobuf in sync.
---@param bit_mask InputBitMask_t|integer Button bits to clear.
function CUserCmd:clear_buttonstate2(bit_mask) end

---Clears bits from button state 3. Keeps struct and protobuf in sync.
---@param bit_mask InputBitMask_t|integer Button bits to clear.
function CUserCmd:clear_buttonstate3(bit_mask) end

---Computes the camera position needed for psilent aim at the target.
---@param target_pos Vector World position of the target.
---@return Vector @Camera position that would aim at target_pos psilently.
function CUserCmd:get_psilent_camera_pos(target_pos) end

---Checks if psilent aim is possible at the given world position.
---Validates: not camera snapping, delta bounds (100/80/80), local pawn exists, distance < 170 units.
---@param target_pos Vector World position to test.
---@return boolean @True if psilent aim is feasible this tick.
function CUserCmd:can_psilent_at_pos(target_pos) end

---Applies psilent aim toward the target position.
---Does NOT internally validate — caller must call `can_psilent_at_pos` first.
---@param target_pos Vector World position to aim at psilently.
function CUserCmd:set_psilent_at_pos(target_pos) end

---Smoothly interpolates camera toward the target angle using humanized smoothing (minimum 5.0).
---No-op during camera snap. Writes to game camera only, NOT the protobuf field.
---@param aim_angle Angle Target angle to interpolate toward.
---@param smooth number Smoothing factor (clamped to minimum 5.0 internally).
function CUserCmd:smooth_aim(aim_angle, smooth) end

---Resets backtrack state. Always operates on the global current command; self is ignored.
function CUserCmd:reset_backtrack() end

---Restores the protobuf camera position to its original value. No-op during camera snap.
function CUserCmd:reset_camera_pos() end

---Restores both protobuf angles and live game camera angles to their original values. No-op during camera snap.
function CUserCmd:reset_camera_ang() end

---Returns the frame-start snapshot of button state 0 (before any callbacks ran).
---@return InputBitMask_t|integer @Original button state 0.
function CUserCmd:get_orig_button_state0() end

---Returns the frame-start snapshot of button state 1 (before any callbacks ran).
---@return InputBitMask_t|integer @Original button state 1.
function CUserCmd:get_orig_button_state1() end

---Returns the frame-start snapshot of button state 2 (before any callbacks ran).
---@return InputBitMask_t|integer @Original button state 2.
function CUserCmd:get_orig_button_state2() end

---Encodes EInButtonState bits across buttonstate1/2/3 (both struct and protobuf).
---@param mask InputBitMask_t|integer Button mask to set.
---@param type integer EInButtonState type.
function CUserCmd:set_input(mask, type) end
```
