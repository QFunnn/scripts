# entity_list

Entity list query interface.

```lua
---Entity list query interface.
entity_list = {}

---@enum entity_list.team_filter
entity_list.team_filter = {
    enemy  = 0,
    friend = 1,
    both   = 2,
}

---Returns all entities in the entity system.
---@return entity[]
function entity_list.get_all() end

---@alias player_pawn_class "C_CitadelPlayerPawn"

---Returns entities matching the given C++ class name.
---Optional `team_filter` (use `entity_list.team_filter`) restricts results to enemies or allies of the local pawn.
---When `enemy` or `friend` is requested without a local pawn, an empty table is returned (strict semantics).
---@param class_name string C++ class name to filter by.
---@param team_filter? entity_list.team_filter Defaults to `entity_list.team_filter.both`.
---@return entity[]
---@overload fun(class_name: player_pawn_class, team_filter?: entity_list.team_filter): player_pawn[]
function entity_list.by_class_name(class_name, team_filter) end

---Returns entity at the given index.
---@param index integer Entity index.
---@return entity|nil
function entity_list.by_index(index) end

---Returns entity by handle value.
---@param handle integer Entity handle.
---@return entity|nil
function entity_list.by_handle(handle) end

---Returns the local player's pawn.
---@return player_pawn
function entity_list.local_pawn() end

---Returns the local player's controller (CCitadelPlayerController).
---@return entity
function entity_list.local_controller() end
```
