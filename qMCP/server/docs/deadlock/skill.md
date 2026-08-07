# Umbrella Deadlock scripting bridge

You are talking to Lua running inside a live Deadlock client (Umbrella platform).
Every tool listed after the built-ins is declared in Lua and appears/disappears as the
scripts reload — treat the tool list as data, not as a fixed API.

Your own code goes into separate `.lua` files next to it, in `%cheat_dir%/deadlock_scripts`.

## Work loop

1. Write or edit your own Lua file in the repo root.
2. Call `reload_scripts` — it reloads every script in the game, waits until they
   re-register, and answers with the fresh tool list **plus everything the scripts
   logged while loading**. Never ask the user to press the reload bind, just call it.
   It freezes the render thread for a moment, so don't spam it: one call after a batch
   of edits.
3. Read the `logs` of that answer first — the load-time lines are already there. Call
   `consume_logs` for whatever the scripts have said since (it drains the buffer).
4. If a call answers `lua not connected`, the game is closed or the scripts are
   unloaded — check `bridge_status`, don't retry in a loop.

A reload takes as long as the game needs, and both tools ride it out: `reload_scripts`
waits for the scripts to come back, and `consume_logs` waits too if it is called while
they are still loading. So an empty log answer means the scripts really said nothing —
never read it as "they have not started yet" and never poll it in a loop.

## Logging

**`global_ctx_t.mcp_log` is the only logging channel you are allowed to use.**
`print`, `log.write`, writing to files, console/panorama output, your own HTTP posts —
all of it is strictly forbidden in the scripts you write, no exceptions, not even
temporarily while debugging. Anything that cannot go through it does not get logged at
all. Log through the bridge:

```lua
callback.on_scripts_loaded:set(function()
    global_ctx_t.mcp_log("info", "script is up", { heroes = #entity_list.get_all() })
end)
```

**Never log before `on_scripts_loaded` has fired.** The bridge is a script like any
other, and until the platform has run every file the logger may not exist yet: a call
at the top level of your file is a lost line at best and a nil-call that kills your
script on load at worst. Every log statement belongs in an `on_scripts_loaded` handler
or in a callback that runs after it — keep the top level to declarations, do the work
in functions, and call them from `on_scripts_loaded`.

Signature is `mcp_log(level, message, data)`: `level` is a free-form string
(`debug` / `info` / `warn` / `error`), `data` is any JSON-able table or nil.
Everything lands in the ring buffer that `consume_logs` drains (500 entries max,
oldest dropped). Every call is an HTTP post, so keep it out of per-frame paths —
log state changes, not frames.

## Localization

A menu that speaks more than one language is always built on **qLocalization** — the
`!_qLocalizer.lua` library that ships with the bridge and sits in `%cheat_dir%/deadlock_scripts`. As
soon as the user asks for localization, for Russian, for translations or for a language switch, wrap
`Menu` with it and pass keys instead of visible text:

```lua
local localization = qLocalization.new({ en = { ... }, ru = { ... } })
local Menu = localization.WrapLibrary(Menu)
```

Never write per-language `if`s, never index a strings table of your own, never call
`ForceLocalization` by hand and never hook the `Language` widget yourself — the library does all of
it, and a scheme next to it breaks the automatic re-translation. Read `read_api({ modules =
{ "qLocalization" } })` before writing the first key. If the global is nil the file is not
installed: ask the user to drop `!_qLocalizer.lua` into `%cheat_dir%/deadlock_scripts` instead of
inlining a copy. `Localizer` and `GameLocalizer` are a different thing — they read the client's and
the game's own string tables, not yours.

## API reference

Call `read_api` with the modules you need — `read_api({ modules = { "entity_list",
"render_lib" } })` — and it hands you the annotated stub of every native in them.
Its description carries the full module list, so no lookup is needed first. The docs
do not live next to the scripts: never go hunting the filesystem for them, and never
guess a signature, they differ from other Source-based APIs. Read the stub first.

Core modules: `entity_list`, `entity`, `player_pawn`, `ability`, `modifier`, `callback`,
`render_lib`/`RenderV2`, `utils`, `Vector`/`Angle`/`Vec2`, `global_vars`, `enums`,
`hero_lib`, `Menu`/`CMenu*`, `http`, `trace`, `sound`, `panorama`, `db`,
`qLocalization`.
