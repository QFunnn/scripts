# gloabl_ctx

Cross-script shared state (session-only, lost on reload).

```lua
---Cross-script shared state (session-only, lost on reload).
---
---Get (`__index`): tries string, then float, then bool (in that order), returns first match or nil.
---Set (`__newindex`): accepts string, number (stored as float), boolean. Other types are silently ignored (logged to engine, not Lua error).
---Keys must be strings. Non-string keys are silently ignored.
---No persistence — values are lost on script reload.
---@type table<string, string|number|boolean>
global_ctx_t = {}
```
