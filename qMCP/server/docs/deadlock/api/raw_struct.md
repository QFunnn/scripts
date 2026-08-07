# raw_struct

Base class for schema-backed game objects.

```lua
---Base class for schema-backed game objects.
---Supports field access via `__index`/`__newindex` using Source 2 schema field names.
---Fields are resolved dynamically from the game's schema system at runtime.
---@class raw_struct
---@field [string] any
raw_struct = {}

---Schema fields of type `CUtlVector<T>` are exposed as 1-indexed Lua tables of the
---element type (clamped at 4096 elements as a safety guard against corrupted memory).
---Entity-handle vectors return `entity` objects.
```
