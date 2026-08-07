# db

Persistent key-value store. Automatically saved to `db.json` on save or every 5 minutes.

```lua
---@meta db

---Persistent key-value store. Automatically saved to `db.json` on save or every 5 minutes.
---
---Supports metamethods:
---  - `db.key = value` — Set a value (`__newindex`).
---  - `local v = db.key` — Get a value (`__index`).
---  - `db.key = nil` — Delete an entry.
---  - `#db` — Returns the number of entries (`__len`).
---  - `tostring(db)` — Returns JSON representation (`__tostring`).
---
---Storable types: `boolean`, `number` (stored as float), `string`, `Vec2`, `Color`, `Vector`.
---Lua tables are recursively converted to nested db subtrees.
---Unsupported value types are silently dropped (no error).
---
---Keys must be `string` or `number`. Numeric string keys auto-convert to integer indices.
---@class db
---@field [string] boolean|number|string|Vec2|Color|Vector|db
---@field [integer] boolean|number|string|Vec2|Color|Vector|db
db = {}

---Deep-converts the db tree to plain Lua tables.
---@return table
function db:to_table() end
```
