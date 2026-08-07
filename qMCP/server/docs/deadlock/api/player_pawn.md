# player_pawn

Player character pawn entity. Represents the in-world pawn controlled by a player.

```lua
---Player character pawn entity. Represents the in-world pawn controlled by a player.
---@class player_pawn : entity
player_pawn = {}

---Returns all abilities on this player pawn.
---@return ability[]
function player_pawn:get_abilities() end

---Returns the ability with the given VData class name, or nil if not found.
---@param name string @VData class name of the ability.
---@return ability|nil
function player_pawn:get_ability(name) end

---Returns the primary weapon ability, or nil if none is equipped.
---@return ability|nil
function player_pawn:get_primary_weapon() end

---Returns the ability in the given slot, or nil if the slot is empty.
---@param slot EAbilitySlots_t @Slot index to query.
---@return ability|nil
function player_pawn:get_ability_by_slot(slot) end

---Returns the base starting value for the given stat type.
---@param stat EStatsType @Stat to query.
---@return number
function player_pawn:get_starting_stat(stat) end

---Returns the current scaling value for the given stat type.
---@param stat EStatsType @Stat to query.
---@return number
function player_pawn:get_scaling_stat(stat) end

---Returns the current tech resistance value.
---@return number
function player_pawn:get_tech_resist() end

---Returns whether this pawn is currently visible.
---Optimized for enemy pawns; may be unreliable when called on ally pawns.
---@return boolean
function player_pawn:is_visible() end

---Movement simulation data passed to the simulate_movement callback.
---@class move_data_t
---@field tickcount integer Current tick of the simulation.
move_data_t = {}

---Returns the predicted origin at this simulation tick.
---@return Vector
function move_data_t:get_origin() end

---Returns the predicted velocity at this simulation tick.
---@return Vector
function move_data_t:get_velocity() end

---Runs a tick-by-tick movement simulation, invoking the callback each tick.
---Return true from the callback to continue simulation, false to stop it.
---Errors thrown inside the callback silently stop simulation; no Lua error is raised.
---@param callback fun(mv: move_data_t): boolean @Called each tick. Return false to stop.
function player_pawn:simulate_movement(callback) end

---Returns the CCitadelPlayerController entity associated with this pawn.
---@return entity
function player_pawn:get_player_controller() end

---Returns the amount of the specified currency held by this player.
---Returns 0 for out-of-range currency types without raising an error.
---@param currency ECurrencyType @Currency type to query.
---@return integer
function player_pawn:get_currency(currency) end

---Returns the Steam3 account ID for this player.
---To convert to SteamID64: `76561197960265728 + account_id`.
---Returns 0 on failure.
---@return integer
function player_pawn:get_account_id() end
```
