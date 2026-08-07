# game_rules

Game rules interface.

```lua
---Game rules interface.
---@class game_rules
game_rules = {}

---Returns C_CitadelGameRules as raw_struct for schema field access.
---@return raw_struct
function game_rules.get() end

---Returns current game time in seconds.
---@return number
function game_rules.game_time() end

---Returns the current match ID. Returns 0 if Game Coordinator is not ready.
---@return integer
function game_rules.match_id() end
```
