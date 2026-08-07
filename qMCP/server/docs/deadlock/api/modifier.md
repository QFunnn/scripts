# modifier

Game modifier (buff/debuff). Inherits schema field access from raw_struct.

```lua
---Game modifier (buff/debuff). Inherits schema field access from raw_struct.
---@class modifier : raw_struct
modifier = {}

---Returns the C++ class name of this modifier.
---@return string
function modifier:get_class_name() end

---Returns the VData class name of this modifier.
---@return string
function modifier:get_vdata_class_name() end

---Returns VData as raw_struct for schema field access.
---@return raw_struct
function modifier:get_vdata() end

---Returns the ability that created this modifier.
---@return ability
function modifier:get_ability() end

---Returns the display name of this modifier.
---@return string
function modifier:get_name() end
```
