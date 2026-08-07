# Particle

Table to work with particles.

## Create

`Particle.Create(particle, [attach_type], [entity]):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **particle** | **`string`** | Particle path |
| **attach\_type ****`[?]`** | [**`Enum.ParticleAttachment`**](Enums.md#enum.particleattachment) | attach\_type Attach type `(default: Enum.ParticleAttachment.PATTACH_WORLDORIGIN)` |
| **entity ****`[?]`** | [**`CEntity`**](Entity.md) | Entity to own of the particle. If not specified, the local hero will be used. `(default: Players.GetLocal())` |

Creates a particle and returns its index.

## SetControlPoint

`Particle.SetControlPoint(particle_index, control_point, value):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **particle\_index** | **`integer`** | Particle index |
| **control\_point** | **`integer`** | Control point |
| **value** | [**`Vector`**](Vector.md) | Control point value |

Sets the control point value of a particle.

## SetShouldDraw

`Particle.SetShouldDraw(particle_index, value):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **particle\_index** | **`integer`** | Particle index |
| **value** | **`boolean`** | set value |

Enables or disables the drawing of a particle.

## SetControlPointEnt

`Particle.SetControlPointEnt(particle_index, control_point, entity, attach_type, attach_name, position, lock_orientation):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **particle\_index** | **`integer`** | Particle index |
| **control\_point** | **`integer`** | Control point |
| **entity** | [**`CEntity`**](Entity.md) | Entity to attach |
| **attach\_type** | [**`Enum.ParticleAttachment`**](Enums.md#enum.particleattachment) | Attach type |
| **attach\_name** | **`string`** \ | **`nil`** | Attach name. See `NPC.GetAttachment` function |
| **position** | [**`Vector`**](Vector.md) | Control point position |
| **lock\_orientation** | **`boolean`** | Lock orientation. No idea what it does |

Sets the control point entity value of a particle.

## SetParticleControlTransform

`Particle.SetParticleControlTransform(particle_index, control_point, position, angle):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **particle\_index** | **`integer`** | Particle index |
| **control\_point** | **`integer`** | Control point |
| **position** | [**`Vector`**](Vector.md) | Control point position |
| **angle** | [**`Angle`**](Angle.md) | Control point angle |

Sets the control point's position and angle.

## Destroy

`Particle.Destroy(particle_index):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **particle\_index** | **`integer`** | Particle index |

Destroys the particle by index.
