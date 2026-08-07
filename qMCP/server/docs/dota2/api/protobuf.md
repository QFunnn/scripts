# Protobuf

Protobuf encoding/decoding module for working with Dota 2 network messages. Loaded as a require-able library: `local protobuf = require('protobuf')`.

Message type names correspond to protobuf definitions from [Dota 2 Protobufs](https://github.com/SteamDatabase/GameTracking-Dota2/blob/master/Protobufs).

## encode

`protobuf.encode(name, data):` **`table`**

| Name | Type | Description |
| --- | --- | --- |
| **name** | **`string`** | Protobuf message type name |
| **data** | **`table`** | Lua table with message fields |

Encodes a Lua table into a serialized protobuf message. Returns a table with `binary` (userdata pointer) and `size` (number) fields.

## encodeFromJSON

`protobuf.encodeFromJSON(name, json):` **`table`**

| Name | Type | Description |
| --- | --- | --- |
| **name** | **`string`** | Protobuf message type name |
| **json** | **`string`** | JSON string representing the message |

Encodes a JSON string into a serialized protobuf message. Returns a table with `binary` (userdata pointer) and `size` (number) fields.

```lua
local protobuf = require('protobuf')
local JSON = require('assets.JSON')
local request = protobuf.encodeFromJSON('CMsgDOTAMatchmakingStatsRequest', JSON:encode({}))
GC.SendMessage(request.binary, 7197, request.size)
```

## decodeToJSON

`protobuf.decodeToJSON(name, binary, size):` **`string`**

| Name | Type | Description |
| --- | --- | --- |
| **name** | **`string`** | Protobuf message type name |
| **binary** | **`userdata`** | Pointer to serialized protobuf data |
| **size** | **`integer`** | Size of the serialized data in bytes |

Decodes a serialized protobuf message (from a raw pointer) into a JSON string.

```lua
local response = protobuf.decodeToJSON('CMsgDOTAMatchmakingStatsResponse', msg.binary_buffer_recv, msg.size)
Log.Write(response)
```

## decodeToJSONfromString

`protobuf.decodeToJSONfromString(name, base64data):` **`string`**

| Name | Type | Description |
| --- | --- | --- |
| **name** | **`string`** | Protobuf message type name |
| **base64data** | **`string`** | Base64-encoded serialized protobuf data |

Decodes a base64-encoded protobuf message into a JSON string.

## decodeToJSONfromObject

`protobuf.decodeToJSONfromObject(msg_object):` **`string`**

| Name | Type | Description |
| --- | --- | --- |
| **msg\_object** | **`userdata`** | Protobuf message object pointer |

Decodes a protobuf message object directly into a JSON string. Useful with callback message objects that provide a direct protobuf pointer.

## free

`protobuf.free(binary):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **binary** | **`userdata`** | Pointer to previously encoded protobuf data |

Frees memory allocated by `encode` or `encodeFromJSON`. Returns `true` on success.
