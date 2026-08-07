# global_vars

Engine timing and frame information.

```lua
---Engine timing and frame information.
---@class global_vars
global_vars = {}

---Returns seconds per tick.
---@return number
function global_vars.interval_per_tick() end

---Returns current tick number.
---@return integer
function global_vars.tickcount() end

---Returns current time in seconds.
---@return number
function global_vars.curtime() end

---Returns current frame number.
---@return integer
function global_vars.framecount() end

---Returns time elapsed since last frame in seconds.
---@return number
function global_vars.absoluteframetime() end
```
