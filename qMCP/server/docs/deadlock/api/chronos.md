# chronos

High-resolution monotonic timer.

```lua
---High-resolution monotonic timer.
---@class chronos
chronos = {}

---Returns monotonic time in seconds with nanosecond resolution.
---Uses QueryPerformanceCounter on Windows.
---@return number @Monotonic time in seconds.
function chronos.nanotime() end
```
