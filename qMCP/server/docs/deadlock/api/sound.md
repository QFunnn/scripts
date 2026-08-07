# sound

Soundevent registry lookup helpers.

```lua
---Soundevent registry lookup helpers.
---Use `sound.hash(name)` once at script load time and compare
---against `data.soundevent_hash` in `on_start_sound` callbacks
---instead of resolving names per event.
---@class sound
sound = {}

---Returns the FNV-style soundevent hash for `name`, matching what
---the game embeds in events. Returns nil if the soundevent manager
---is unavailable.
---@param name string Soundevent name (e.g. "Citadel.Hero.AttackPrimary").
---@return integer|nil
function sound.hash(name) end

---Reverse lookup: returns the registered soundevent name for `hash`,
---or nil if the hash is unknown. For debug only — do not call on a hot path.
---@param hash integer Soundevent hash.
---@return string|nil
function sound.name(hash) end

---Returns true iff `hash` corresponds to a registered soundevent.
---@param hash integer Soundevent hash.
---@return boolean
function sound.is_valid_hash(hash) end
```
