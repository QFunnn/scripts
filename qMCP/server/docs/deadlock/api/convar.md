# convar

Console variable accessor. Indexed by cvar name string (e.g., `convar.sv_cheats`).

```lua
---Console variable accessor. Indexed by cvar name string (e.g., `convar.sv_cheats`).
---Each accessor supports dual get/set pattern: call with no args to get, with arg to set.
---Returns nil if the CVar engine is unavailable.
---@class convar_table
convar_table = {}

---Gets or sets the float value of this convar.
---@return number|nil
---@overload fun(self: convar_table, val: number)
function convar_table:float() end

---Gets or sets the boolean value of this convar.
---@return boolean|nil
---@overload fun(self: convar_table, val: boolean): nil
function convar_table:bool() end

---Gets or sets the integer value of this convar.
---@return integer|nil
---@overload fun(self: convar_table, val: integer)
function convar_table:int() end

---@type table<string, convar_table>
convar = {}
```
