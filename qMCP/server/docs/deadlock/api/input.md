# input

Raw input interface.

```lua
---Raw input interface.
---@class input
input = {}

---Returns current cursor screen position.
---@return Vec2
function input.cursor_pos() end

---Returns whether cursor is within the specified rectangle.
---@param start Vec2 Top-left corner of the bounding rectangle.
---@param end_ Vec2 Bottom-right corner of the bounding rectangle.
---@return boolean
function input.cursor_in_bounds(start, end_) end

---Returns whether the specified key is currently held down.
---@param key Enum.ButtonCode Key to check.
---@return boolean
function input.is_down(key) end

---Returns whether the specified key was just pressed this frame.
---@param key Enum.ButtonCode Key to check.
---@return boolean
function input.is_pressed(key) end
```
