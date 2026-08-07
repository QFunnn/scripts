# GridNav

Table to work with in-game navigation API.

## CreateNpcMap

You should always call `GridNav.ReleaseNpcMap` after you done with your build pathing

`GridNav.CreateNpcMap(\[excluded\_npcs], \[includeTempTrees], \[customCollisionSizes]):` \[**`GridNavNpcMap`**]\(GridNavNpcMap.md)

| Name | Type | Description |
| --- | --- | --- |
| **excluded\_npcs ****`[?]`** | [**`CEntity[]`**](Entity.md) \ | **`nil`** | table with npc to exclude from the map. for example you want to exclude local hero if you build path from local hero position `(default: nil)` |
| **includeTempTrees ****`[?]`** | **`boolean`** | `true` if you want include temp trees to the map e.g. furion's 1st spell, iron branch `(default: true)` |
| **customCollisionSizes ****`[?]`** | **`table`** \ | **`nil`** | table where key is entity userdata and value is {left, top, right, bottom} offsets from entity position `(default: nil)` |

Creates a new `GridNavNpcMap`

## ReleaseNpcMap

`GridNav.ReleaseNpcMap(npc_map):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **npc\_map** | [**`GridNavNpcMap`**](https://github.com/Boyarinov/gitbook-doc-parser/blob/main/generated/GridNavNpcMap.md) | map to release to release |

Releases allocated memory for `GridNavNpcMap`

## IsTraversable

`GridNav.IsTraversable(pos, [flag], [flag_excluded]):` **`boolean`**, **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **pos** | [**`Vector`**](Vector.md) | position to check |
| **flag ****`[?]`** | **`number`** | required cell flag mask (must be set) `(default: 1)` |
| **flag\_excluded ****`[?]`** | **`number`** | forbidden cell flag mask (must be clear) `(default: 2)` |

Returns `true` if the world position is traversable.\
\
Pass `flag_excluded` to replicate per-ability filter masks. Examples:\\

* `IsTraversable(pos, 0x1, 0x002)` - default (engine `BLOCKED` only)\\
* `IsTraversable(pos, 0x1, 0x102)` - Techies Land Mine semantics\
  (LOCATION 0x002 + BUILDING 0x100)\\
* `IsTraversable(pos, 0x1, 0x112)` - strictest variant used by many native\
  AOE landing checks (LOCATION + PORTAL + BUILDING)

## BuildPath

`GridNav.BuildPath(start, end_, [ignoreTrees], [npc_map]):` [**`Vector[]`**](Vector.md)

| Name | Type | Description |
| --- | --- | --- |
| **start** | [**`Vector`**](Vector.md) | position to start |
| **end\_** | [**`Vector`**](Vector.md) | position to end |
| **ignoreTrees ****`[?]`** | **`boolean`** | `true` if you want to exclude static trees from the pathing `(default: false)` |
| **npc\_map ****`[?]`** | [**`GridNavNpcMap`**](https://github.com/Boyarinov/gitbook-doc-parser/blob/main/generated/GridNavNpcMap.md) \ | **`nil`** | map with the npc's positions which works as additional mask for terrain map `(default: nil)` |

Build path from start to end. Returns an array with builded positions.

#### Example

```lua
-- build_path.lua
return {
    OnUpdate = function()
        local ignore_trees = false;
        local my_hero = Heroes.GetLocal();
        local start_pos = Entity.GetAbsOrigin(my_hero);
        local end_pos = Input.GetWorldCursorPos();

        -- create npc map with the temp trees but with no local hero in it
        local npc_map = GridNav.CreateNpcMap({Heroes.GetLocal()}, not ignore_trees);

        local path = GridNav.BuildPath(start_pos, end_pos, ignore_trees, npc_map);
        local prev_x, prev_y = nil, nil;
        for i, pos in pairs(path) do
            local x, y, visible = Renderer.WorldToScreen(pos);
            if (prev_x and visible) then
                Renderer.SetDrawColor(255, 255, 255, 255);
                Renderer.DrawLine(prev_x, prev_y, x, y);
            end
            prev_x, prev_y = x, y;
        end

        -- releasing allocated npc map after we done with build pathing
        GridNav.ReleaseNpcMap(npc_map)
    end
}

```

## IsTraversableFromTo

`GridNav.IsTraversableFromTo(start, end_, [ignoreTrees], [npc_map]):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **start** | [**`Vector`**](Vector.md) | position to start |
| **end\_** | [**`Vector`**](Vector.md) | position to end |
| **ignoreTrees ****`[?]`** | **`boolean`** | `true` if you want to exclude static trees from the pathing `(default: false)` |
| **npc\_map ****`[?]`** | [**`GridNavNpcMap`**](https://github.com/Boyarinov/gitbook-doc-parser/blob/main/generated/GridNavNpcMap.md) \ | **`nil`** | map with the npc's positions which works as additional mask for terrain map `(default: nil)` |

Lite version of GridNav.BuildPath function which just cheking if the path is exists.

## DebugRender

`GridNav.DebugRender([grid_range], [npc_map], [render_cell_flags]):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **grid\_range ****`[?]`** | **`integer`** | grid radius in "cell units" from Vector(0,0,0) `(default: 50)` |
| **npc\_map ****`[?]`** | [**`GridNavNpcMap`**](https://github.com/Boyarinov/gitbook-doc-parser/blob/main/generated/GridNavNpcMap.md) \ | **`nil`** | map with the npc's positions which works as additional mask for terrain map `(default: nil)` |
| **render\_cell\_flags ****`[?]`** | **`boolean`** | render the flags value for each not approachable cell (don't think you ever want to see this numbers, so ignore this arg) `(default: false)` |

Debug render of current GridNav with GridNavNpcMap (if provided)
