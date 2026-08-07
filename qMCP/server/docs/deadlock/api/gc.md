# gc

Game Coordinator (GC) interface.

```lua
---Game Coordinator (GC) interface.
---Send protobuf messages to the GC and decode raw GC traffic from callbacks.
---@class gc
gc = {}

---Sends a protobuf message to the Game Coordinator.
---@param proto_name string Full protobuf message type name (e.g. "CMsgClientToGCGetProfileCard").
---@param msg_type_id integer GC message type ID (e.g. 9024).
---@param json string JSON-encoded protobuf fields.
---@return boolean @True on success.
function gc.send_message(proto_name, msg_type_id, json) end

---Decodes a raw GC message by protobuf type name.
---@param proto_name string Full protobuf message type name.
---@param msg_ptr lightuserdata Raw buffer pointer from the callback.
---@param msg_size integer Size of the raw message buffer in bytes.
---@return string|nil @JSON string on success, nil on failure.
function gc.decode_message(proto_name, msg_ptr, msg_size) end

---Decodes a raw GC message automatically by `msg_id`.
---Uses the built-in registry mapping `msg_id` -> protobuf type name
---from generated descriptors using the Valve convention `k_EMsgFoo` -> `CMsgFoo`.
---@param msg_id integer GC message type ID from the callback.
---@param msg_ptr lightuserdata Raw buffer pointer from the callback.
---@param msg_size integer Size of the raw message buffer in bytes.
---@return string|nil @JSON string on success, nil on failure.
---@return string|nil @Resolved protobuf type name (returned even when JSON decode fails, when the id is known).
function gc.decode(msg_id, msg_ptr, msg_size) end

---Registers a custom `msg_id` -> protobuf type name mapping for messages
---not covered by the automatic registry.
---@param msg_id integer GC message type ID.
---@param proto_name string Full protobuf message type name.
---@return boolean @True if the proto_name was found in the generated pool.
function gc.register_message(msg_id, proto_name) end

---Looks up the protobuf message name for a `msg_id`.
---@param msg_id integer GC message type ID.
---@return string|nil @Proto name if registered, nil otherwise.
function gc.get_message_name(msg_id) end

---Returns the local player's Steam ID (64-bit) as a string.
---Returns an empty string if Steam is not initialized.
---@return string
function gc.get_steam_id() end
```
