# trace

Trace result object returned by ray/hull cast functions.

```lua
---Trace result object returned by ray/hull cast functions.
---@class trace_t
---@field fraction number @How far along the ray the hit occurred. 0.0 = ray start, 1.0 = full distance traveled with no hit.
trace_t = {}

---Returns the entity that was hit by the trace.
---@return entity @The hit entity.
function trace_t:hit_entity() end

---Returns the name of the hitbox that was hit.
---@return string @Hitbox name string, empty if no hitbox was hit.
function trace_t:hitbox_name() end

---Returns true if the given entity is visible from the trace.
---Visibility is determined by: entity is within 5 world units of the trace endpoint,
---OR the trace directly hit the target entity.
---@param ent entity @Entity to check visibility for.
---@param full_trace_distance number @The full unobstructed distance of the ray.
---@return boolean @True if the entity is considered visible.
function trace_t:is_visible_entity(ent, full_trace_distance) end

---Returns whether the hit surface normal is vertical (i.e. a floor or ceiling).
---@return boolean @True if the surface normal points vertically.
function trace_t:is_vertical_normal() end

---Provides ray and hull casting utilities for world and entity intersection tests.
---@class trace
trace = {}

---Casts a ray from start to end_ and returns a trace result.
---Always ignores the local player implicitly, regardless of ignore_callback.
---`object_set_mask` is accepted but internally overridden to 0xF.
---@param start Vector @Ray start position in world space.
---@param end_ Vector @Ray end position in world space.
---@param with integer @Content mask (CONTENTS flags) — which surface types to intersect.
---@param exclude integer @Content exclusion mask — surface types to skip.
---@param as integer @Solid type filter (SOLID flags).
---@param object_set_mask integer @Accepted but IGNORED — always overridden to 0xF internally.
---@param collision_group integer @Collision group filter.
---@param ignore_callback fun(ent: entity): boolean @Called per entity. Return `true` to INCLUDE the entity in trace results (name is misleading — true means keep, not skip).
---@return trace_t @Trace result containing fraction, hit entity, and surface info.
function trace.line(start, end_, with, exclude, as, object_set_mask, collision_group, ignore_callback) end

---Casts a swept hull (box) from start to end_ and returns a trace result.
---Unlike `trace.line`, local player is only excluded when `ignore_local` is explicitly true.
---`object_set_mask` is accepted but internally overridden to 0xF.
---@param start Vector @Hull sweep start position in world space.
---@param end_ Vector @Hull sweep end position in world space.
---@param min Vector @Hull minimum bounds (local space).
---@param max Vector @Hull maximum bounds (local space).
---@param with integer @Content mask (CONTENTS flags) — which surface types to intersect.
---@param exclude integer @Content exclusion mask — surface types to skip.
---@param as integer @Solid type filter (SOLID flags).
---@param object_set_mask integer @Accepted but IGNORED — always overridden to 0xF internally.
---@param collision_group integer @Collision group filter.
---@param ignore_callback fun(ent: entity): boolean @Called per entity. Return `true` to INCLUDE the entity in trace results.
---@param ignore_local? boolean @When true, the local player is excluded from results. Default: false.
---@return trace_t @Trace result containing fraction, hit entity, and surface info.
function trace.hull(start, end_, min, max, with, exclude, as, object_set_mask, collision_group, ignore_callback, ignore_local) end

---Checks whether a bullet fired from start to end_ with the given radius would hit the entity.
---Uses a delta < 5 world units threshold against the trace endpoint.
---@param start Vector @Bullet ray start position.
---@param end_ Vector @Bullet ray end position.
---@param radius number @Bullet radius used for proximity check.
---@param ent entity @Target entity to check against.
---@return boolean @True if the bullet trace hits or is within 5 units of the entity.
function trace.bullet(start, end_, radius, ent) end

---Checks whether a bullet trace hits the entity AND the hitbox name matches.
---Hitbox match uses substring comparison, not exact equality.
---Uses a fraction >= 0.97 threshold (stricter proximity check than `trace.bullet`).
---@param start Vector @Bullet ray start position.
---@param end_ Vector @Bullet ray end position.
---@param radius number @Bullet radius.
---@param ent entity @Target entity to check against.
---@param hitbox_name string @Substring to match against the hit hitbox name.
---@return boolean @True if the trace hits the entity and the hitbox name contains hitbox_name.
function trace.bullet_hitbox(start, end_, radius, ent, hitbox_name) end

---Returns the name of the hitbox struck by the bullet trace against the given entity.
---@param start Vector @Bullet ray start position.
---@param end_ Vector @Bullet ray end position.
---@param radius number @Bullet radius.
---@param ent entity @Target entity to trace against.
---@return string @Name of the hitbox that was hit, or empty string if none.
function trace.bullet_hitbox_name(start, end_, radius, ent) end
```
