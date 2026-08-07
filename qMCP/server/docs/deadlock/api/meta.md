# meta

Meta tracker API for hero/item statistics.

```lua
---Meta tracker API for hero/item statistics.
---@class meta
meta = {}

---Returns meta data for the given period and rank.
---Throws on hard errors. Returns nil when data is not yet available (still loading).
---@param period integer Time period filter.
---@param rank integer Rank filter.
---@return table|nil
function meta.get(period, rank) end

---Returns whether meta data has finished loading and is available.
---@return boolean
function meta.ready() end

---Returns whether meta data loading has failed.
---@return boolean
function meta.failed() end
```
