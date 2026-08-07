# callback

Game and engine event callbacks: `callback.<event>:set(fn)` / `:unset(fn)`.

```lua
callback = {}

---Fired once when all scripts finish loading.
callback.on_scripts_loaded = {}
---@param callback fun(): nil
function callback.on_scripts_loaded:set(callback) end
---@param callback fun(): nil
function callback.on_scripts_loaded:unset(callback) end

---Fired before CreateMove processing.
callback.on_pre_createmove = {}
---@param callback fun(cmd: CUserCmd): nil
function callback.on_pre_createmove:set(callback) end
---@param callback fun(cmd: CUserCmd): nil
function callback.on_pre_createmove:unset(callback) end

---Fired during CreateMove processing.
callback.on_createmove = {}
---@param callback fun(cmd: CUserCmd): nil
function callback.on_createmove:set(callback) end
---@param callback fun(cmd: CUserCmd): nil
function callback.on_createmove:unset(callback) end

---Fired every frame.
callback.on_frame = {}
---@param callback fun(): nil
function callback.on_frame:set(callback) end
---@param callback fun(): nil
function callback.on_frame:unset(callback) end

---Fired every draw frame (after on_frame).
callback.on_draw = {}
---@param callback fun(): nil
function callback.on_draw:set(callback) end
---@param callback fun(): nil
function callback.on_draw:unset(callback) end

---Fired when an entity is added to the entity system. Entity type is polymorphic: C_CitadelPlayerPawn -> player_pawn, C_CitadelBaseAbility -> ability, otherwise entity.
callback.on_add_entity = {}
---@param callback fun(ent: entity|player_pawn|ability): nil
function callback.on_add_entity:set(callback) end
---@param callback fun(ent: entity|player_pawn|ability): nil
function callback.on_add_entity:unset(callback) end

---Fired when an entity is added (late). Entity type is polymorphic: C_CitadelPlayerPawn -> player_pawn, C_CitadelBaseAbility -> ability, otherwise entity.
callback.on_late_add_entity = {}
---@param callback fun(ent: entity|player_pawn|ability): nil
function callback.on_late_add_entity:set(callback) end
---@param callback fun(ent: entity|player_pawn|ability): nil
function callback.on_late_add_entity:unset(callback) end

---Fired when an entity is removed from the entity system.
callback.on_remove_entity = {}
---@param callback fun(ent: entity|player_pawn|ability): nil
function callback.on_remove_entity:set(callback) end
---@param callback fun(ent: entity|player_pawn|ability): nil
function callback.on_remove_entity:unset(callback) end

---Fired before a frame stage change.
callback.on_pre_framestage = {}
---@param callback fun(stage: integer): nil
function callback.on_pre_framestage:set(callback) end
---@param callback fun(stage: integer): nil
function callback.on_pre_framestage:unset(callback) end

---Fired after a frame stage change.
callback.on_post_framestage = {}
---@param callback fun(stage: integer): nil
function callback.on_post_framestage:set(callback) end
---@param callback fun(stage: integer): nil
function callback.on_post_framestage:unset(callback) end

---Fired when a network message is received.
--- https://github.com/SteamDatabase/Protobufs/blob/4423890a7ade0b3e0b167ca4622d8e73c9814adf/deadlock/citadel_gameevents.proto#L5
--- local json = protobuf.decodeToJSONfromObject(msg)
callback.on_received_net_message = {}
---@param callback fun(id: integer, msg: lightuserdata): nil
function callback.on_received_net_message:set(callback) end
---@param callback fun(id: integer, msg: lightuserdata): nil
function callback.on_received_net_message:unset(callback) end

---Fired when a network message is about to be sent to the server.
---Return `false` to block the message; return `true`, nothing, or any non-false value to allow it.
---@see protobuf.decodeToJSONfromObject for inspecting `msg`.
callback.on_send_net_message = {}
---@param callback fun(id: integer, msg: lightuserdata): boolean|nil
function callback.on_send_net_message:set(callback) end
---@param callback fun(id: integer, msg: lightuserdata): boolean|nil
function callback.on_send_net_message:unset(callback) end

---Fired when a Game Coordinator message is about to be sent.
---Return `false` to block the message; return `true`, nothing, or any non-false value to allow it.
---Use `gc.decode_message` / `gc.decode` to inspect the buffer.
callback.on_send_gc_message = {}
---@param callback fun(msg_id: integer, msg: lightuserdata, msg_size: integer): boolean|nil
function callback.on_send_gc_message:set(callback) end
---@param callback fun(msg_id: integer, msg: lightuserdata, msg_size: integer): boolean|nil
function callback.on_send_gc_message:unset(callback) end

---Fired when a Game Coordinator message is received.
---Return `false` to drop the message; return `true`, nothing, or any non-false value to allow it.
---Use `gc.decode_message` / `gc.decode` to inspect the buffer.
callback.on_receive_gc_message = {}
---@param callback fun(msg_id: integer, msg: lightuserdata, msg_size: integer): boolean|nil
function callback.on_receive_gc_message:set(callback) end
---@param callback fun(msg_id: integer, msg: lightuserdata, msg_size: integer): boolean|nil
function callback.on_receive_gc_message:unset(callback) end

---@alias particle_create {entity: entity|nil, entity_for_modifiers: entity|nil, index: integer, name: string, hash: integer}

---Particle system event. Arg table is reused across handlers in the same frame.
callback.on_particle_create = {}
---@param callback fun(data: particle_create): nil
function callback.on_particle_create:set(callback) end
---@param callback fun(data: particle_create): nil
function callback.on_particle_create:unset(callback) end

---@alias particle_update {entity: entity|nil, index: integer, attach_type: integer, attachment: integer, include_wearables: boolean, control_point: integer, position: Vector}

---Particle system event. Arg table is reused across handlers in the same frame.
callback.on_particle_update = {}
---@param callback fun(data: particle_update): nil
function callback.on_particle_update:set(callback) end
---@param callback fun(data: particle_update): nil
function callback.on_particle_update:unset(callback) end

---@alias particle_update_transform {index: integer, interpolation_interval: integer, control_point: integer, position: Vector, orientation: Angle}

---Particle system event. Arg table is reused across handlers in the same frame.
callback.on_particle_update_transform = {}
---@param callback fun(data: particle_update_transform): nil
function callback.on_particle_update_transform:set(callback) end
---@param callback fun(data: particle_update_transform): nil
function callback.on_particle_update_transform:unset(callback) end

---@alias particle_destroy {index: integer, destroy_immediately: boolean}

---Particle system event. Arg table is reused across handlers in the same frame.
callback.on_particle_destroy = {}
---@param callback fun(data: particle_destroy): nil
function callback.on_particle_destroy:set(callback) end
---@param callback fun(data: particle_destroy): nil
function callback.on_particle_destroy:unset(callback) end

---Fired when a modifier is added to an entity.
callback.on_add_modifier = {}
---@param callback fun(mod: modifier, target: entity|nil, owner: entity|nil): nil
function callback.on_add_modifier:set(callback) end
---@param callback fun(mod: modifier, target: entity|nil, owner: entity|nil): nil
function callback.on_add_modifier:unset(callback) end

---Fired when a modifier is removed from an entity.
callback.on_remove_modifier = {}
---@param callback fun(mod: modifier, target: entity|nil): nil
function callback.on_remove_modifier:set(callback) end
---@param callback fun(mod: modifier, target: entity|nil): nil
function callback.on_remove_modifier:unset(callback) end

---@alias key_event {key: Enum.ButtonCode, event: Enum.KeyEvent}

---Fired on keyboard/mouse input. Return value is ANDed across all handlers. nil or no return is treated as true (allow key propagation).
callback.on_key_event = {}
---@param callback fun(data: key_event): boolean
function callback.on_key_event:set(callback) end
---@param callback fun(data: key_event): boolean
function callback.on_key_event:unset(callback) end

---@alias bullet_create {weapon_name: string, shooter: entity, start_pos: Vector, direction: Vector, weapon: raw_struct}

---Fired when a bullet is created.
callback.on_bullet_create = {}
---@param callback fun(data: bullet_create): nil
function callback.on_bullet_create:set(callback) end
---@param callback fun(data: bullet_create): nil
function callback.on_bullet_create:unset(callback) end

---@alias start_sound {source: entity|nil, source_entity_index: integer, soundevent_hash: integer, soundevent_guid: integer, seed: integer, start_time: number, position: Vector|nil}

---Fired when a soundevent starts. Arg table is reused across handlers in the same frame.
---Use `sound.hash(name)` at script load to pre-compute hashes and compare against `data.soundevent_hash`.
callback.on_start_sound = {}
---@param callback fun(data: start_sound): nil
function callback.on_start_sound:set(callback) end
---@param callback fun(data: start_sound): nil
function callback.on_start_sound:unset(callback) end
```
