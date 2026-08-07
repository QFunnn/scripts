# TargetSelection

Target selection and scoring system.

```lua
---@class target_result
---@field entity entity Scored entity.
---@field score number Computed score.

---Target selection and scoring system.
---@class TargetSelection
local _TargetSelection = {}

---Creates a new TargetSelection instance.
---@return TargetSelection
function TargetSelection() end

---Adds a scoring criterion function.
---@param func fun(ent: entity): number Scoring function. Receives entity, must return a number. Returns 0.0 on error.
---@param weight number Weight multiplier for this criterion's score.
function _TargetSelection:add_criterion(func, weight) end

---Sets the entity filter function. Entities that fail the filter are excluded.
---@param func fun(ent: entity): boolean Filter function. Returns true to include, false to exclude. Returns false on error.
function _TargetSelection:set_filter(func) end

---Sets minimum score threshold for targets to be included.
---@param v number Minimum score.
function _TargetSelection:set_score_threshold(v) end

---Sets maximum number of targets to track.
---@param v integer Maximum targets.
function _TargetSelection:set_max_targets(v) end

---Sets whether the best-scored target is always included regardless of threshold.
---@param v boolean
function _TargetSelection:set_always_include_best(v) end

---Sets minimum score gap required for best target distinction.
---@param v number Minimum score gap.
function _TargetSelection:set_best_target_score_gap(v) end

---Evaluates targets from a Lua table of entities.
---@param entities entity[] Table of entities to evaluate.
function _TargetSelection:update(entities) end

---Evaluates targets from the entity manager by C++ class name. Preferred over update() for performance.
---@param class_name string C++ class name to query.
function _TargetSelection:update_by_class(class_name) end

---Returns scored targets sorted by score.
---@return target_result[]
function _TargetSelection:get_targets() end

---Returns the best-scored target entity, or nil if no targets.
---@return entity|nil
function _TargetSelection:get_best_target() end

---Sets the last shootable target. Passing a non-entity value sets nil.
---@param ent entity|nil
function _TargetSelection:set_last_shootable_target(ent) end

---Clears all scoring state, criteria, and filters.
function _TargetSelection:reset() end
```
