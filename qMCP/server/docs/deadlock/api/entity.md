# entity

Base game entity backed by a raw memory pointer.

```lua
---Base game entity backed by a raw memory pointer.
---@class entity : raw_struct
entity = {}

---Returns the entity index in the entity system.
---@return integer @Entity index.
function entity:get_index() end

---Returns the entity handle value.
---@return integer @Entity handle.
function entity:get_handle() end

---Returns whether the entity pointer is valid and safe to use.
---@return boolean @True if pointer is valid.
function entity:valid() end

---Returns whether the entity is alive.
---@return boolean @True if alive.
function entity:is_alive() end

---Returns whether the entity is dormant (not actively networked).
---@return boolean @True if dormant.
function entity:is_dormant() end

---Returns the C++ class name of the entity.
---@return string @Class name string.
function entity:get_class_name() end

---Returns the entity's display name.
---@return string @Display name.
function entity:get_name() end

---Returns the entity world position.
---Returns nil when entity is invalid (null m_pGameSceneNode).
---@return Vector|nil @World position, or nil if entity is invalid.
function entity:get_origin() end

---Returns entity local velocity (not absolute world velocity).
---Returns nil when entity is invalid.
---@return Vector|nil @Local velocity, or nil if entity is invalid.
function entity:get_velocity() end

---Returns entity rotation angles.
---Has extra m_pGameSceneNode nil guard. Returns nil when entity is invalid.
---@return Angle|nil @Rotation angles, or nil if entity is invalid.
function entity:get_angles() end

---Returns world position of the named bone.
---@param bone_name string Name of the bone to look up.
---@return Vector|nil @World position of the bone, or nil if bone not found.
function entity:get_bone_pos(bone_name) end

---Returns all bone positions as a name-to-position map.
---Returns an empty table (not nil) when entity is invalid.
---@return table<string, Vector> @Map of bone name to world position.
function entity:get_bones() end

---Returns world position of the named attachment point.
---@param attach_name string Name of the attachment point.
---@return Vector|nil @World position of the attachment, or nil if not found.
function entity:get_attachment(attach_name) end

---Returns entity max health. Depends on m_pGameSceneNode being valid.
---@return integer @Max health value.
function entity:get_max_health() end

---Returns the modifier with the given name, or nil if not found.
---@param modifier_name string Name of the modifier to look up.
---@return modifier|nil @Modifier instance, or nil if not present.
function entity:get_modifier(modifier_name) end

---Returns whether the entity has a modifier with the given name.
---@param modifier_name string Name of the modifier to check.
---@return boolean @True if modifier is present.
function entity:has_modifier(modifier_name) end

---Returns all active modifiers on this entity.
---@return modifier[] @Array of active modifier instances.
function entity:get_modifiers() end

---Returns a single modifier property value, or def_value if not found.
---@param modifier_value EModifierValue Modifier property enum to query.
---@param def_value boolean|number Fallback value when property is absent.
---@return boolean|number @Property value, or def_value if not found.
function entity:get_modifier_value(modifier_value, def_value) end

---Returns the sum of all modifier property values, or def_value if none.
---@param modifier_value EModifierValue Modifier property enum to sum.
---@param def_value boolean|number Fallback value when no modifier provides this property.
---@return boolean|number @Summed value, or def_value if none found.
function entity:get_sum_modifier_value(modifier_value, def_value) end

---Returns whether any active modifier applies the given state.
---@param modifier_state EModifierState Modifier state enum to check.
---@return boolean @True if any modifier provides the state.
function entity:has_modifier_state(modifier_state) end

---Returns the VData class name.
---@return string @VData class name string.
function entity:get_vdata_class_name() end

---Returns VData as raw_struct for schema field access.
---@return raw_struct @VData raw struct.
function entity:get_vdata() end

---Returns the model file path.
---@return string @Model file path string.
function entity:get_model_name() end

---Returns CModelState as raw_struct.
---@return raw_struct @CModelState raw struct.
function entity:get_model_state() end

---Returns CSkeletonInstance as raw_struct.
---@return raw_struct @CSkeletonInstance raw struct.
function entity:get_skeleton_instance() end

---Returns the currently playing animations on this entity.
---@return {sequence: integer, name: string, cycle: number}[] @Array of active animation entries.
function entity:get_anims() end

---Returns memory address of entity. Only available in dev builds.
---@return string @Memory address as a hex string.
function entity:get_address() end

---@class particle_info
---@field name string
---@field control_points {cp: integer, origin: Vector}[]

---Returns all active particle systems on this entity.
---@return particle_info[] @Array of active particle info entries.
function entity:get_particles() end

---Returns whether the entity has an active particle matching the path.
---@param path string Particle system path to match.
---@return boolean @True if a matching particle is active.
function entity:has_particle(path) end

---Returns the origin of the first control point of the matching particle.
---@param path string Particle system path to match.
---@return Vector|nil @Control point origin, or nil if no matching particle found.
function entity:get_particle_position(path) end

---Calculates minimum FOV angle from camera position to any bone on this entity.
---@param camera_pos Vector Camera world position to measure from.
---@param only_yaw? boolean @default: `false`. Only consider yaw component.
---@return number @Minimum FOV angle in degrees to closest bone.
function entity:get_min_fov_to_bones(camera_pos, only_yaw) end

---Returns the fireport (muzzle) world position of the entity.
---@param unk? integer Unknown parameter.
---@return Vector|nil @Fireport position, or nil if unavailable.
function entity:get_fireport_position(unk) end
```
