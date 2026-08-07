# protobuf

Google Protobuf encoding/decoding library.

```lua
---@class protobuf_binary
---@field size integer Serialized byte count.
---@field binary lightuserdata Raw binary pointer (pass to free() when done).

---Google Protobuf encoding/decoding library.
---@class protobuf
protobuf = {}

---Encodes a Lua table into a protobuf binary message.
---@param name string Full protobuf message type name (e.g. "CMsgPlayerInfo").
---@param tbl table Lua table matching the message fields.
---@return protobuf_binary
function protobuf.encode(name, tbl) end

---Encodes a JSON string into a protobuf binary message.
---@param name string Full protobuf message type name.
---@param json string JSON string representing the message.
---@return protobuf_binary
function protobuf.encodeFromJSON(name, json) end

---Decodes binary protobuf data to a JSON string.
---@param name string Full protobuf message type name.
---@param binary lightuserdata Raw binary pointer from encode result.
---@param size integer Byte count from encode result.
---@return string @JSON representation of the message.
function protobuf.decodeToJSON(name, binary, size) end

---Decodes a base64-encoded protobuf message to a JSON string.
---@param name string Full protobuf message type name.
---@param base64_str string Base64-encoded protobuf binary data.
---@return string @JSON representation of the message.
function protobuf.decodeToJSONfromString(name, base64_str) end

---Converts a protobuf Message lightuserdata to a JSON string.
---@param userdata lightuserdata Protobuf Message pointer.
---@return string @JSON representation of the message.
function protobuf.decodeToJSONfromObject(userdata) end

---Frees memory allocated by encode.
---@param ptr lightuserdata The binary lightuserdata from encode result.
---@return boolean @True if memory was freed successfully.
function protobuf.free(ptr) end
```
