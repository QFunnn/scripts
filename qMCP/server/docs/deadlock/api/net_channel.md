# net_channel

Network channel interface.

```lua
---Network channel interface.
---@class net_channel
net_channel = {}

---Returns outgoing flow latency in seconds. Returns 0.0 if net channel is unavailable.
---@return number @Outgoing latency in seconds, or 0.0 if the channel is unavailable.
function net_channel.latency() end

---Sends a protobuf net message to the server.
---Looks up the message by clean name (e.g. "CCitadelClientMsg_ChatMsg"),
---first via an internal cache, then via INetworkMessages::FindNetworkMessagePartial.
---@param name string Protobuf message type name.
---@param json string JSON-encoded protobuf fields.
---@return boolean @True on success.
function net_channel.send_net_message(name, json) end
```
