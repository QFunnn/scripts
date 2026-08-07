# GameLocalizer

Table to work with game localization.

```lua
---Table to work with game localization.
---Localization tokens are stored in `resource/localization` folder in `pak01_dir.vpk`
GameLocalizer = {}

---Returns localized string by token or returns empty string if token not found.
---@param token string should be in format `#token`
---@return string
function GameLocalizer.Find(token) end
```
