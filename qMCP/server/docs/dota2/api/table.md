# table

Extensions for the built-in Lua `table` library.

## IsEmpty

`table.IsEmpty(t):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **t** | **`table`** |  |

Returns true if the table has no entries.

## Length

`table.Length(t):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **t** | **`table`** |  |

Counts ALL entries (array + hash), unlike `#t` which only counts the sequence part.

## Keys

`table.Keys(t):` **`table`**

| Name | Type | Description |
| --- | --- | --- |
| **t** | **`table`** |  |

Returns a new array containing all keys of the table.

## Values

`table.Values(t):` **`table`**

| Name | Type | Description |
| --- | --- | --- |
| **t** | **`table`** |  |

Returns a new array containing all values of the table.

## Sum

`table.Sum(t):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **t** | **`table`** |  |

Returns the sum of all numeric values in the table. Non-numeric values are skipped.

## Reverse

*Generic: `T`*

`table.Reverse(t):` **`T[]`**

| Name | Type | Description |
| --- | --- | --- |
| **t** | **`T[]`** |  |

Returns a new array with the sequence part of `t` in reverse order.

## CopyShallow

*Generic: `T : table`*

`table.CopyShallow(orig, [ignore_mt]):` **`T`**

| Name | Type | Description |
| --- | --- | --- |
| **orig** | **`T`** |  |
| **ignore\_mt ****`[?]`** | **`boolean`** | If true, the metatable is not copied `(default: false)` |

Creates a shallow copy of the table. Copies the metatable unless `ignore_mt` is true.

## Copy

*Generic: `T : table`*

`table.Copy(orig):` **`T`**

| Name | Type | Description |
| --- | --- | --- |
| **orig** | **`T`** |  |

Deep-copies a table with cycle detection. Metatables are preserved.

## KvSwap

`table.KvSwap(t, [v_to_true]):` **`table`**

| Name | Type | Description |
| --- | --- | --- |
| **t** | **`table`** |  |
| **v\_to\_true ****`[?]`** | **`boolean`** | If true, new values are `true` instead of the original key `(default: false)` |

Swaps keys and values. If `v_to_true` is true, all new values become `true`\
instead of the original key.

## Merge

`table.Merge(...):` **`table`**

| Name | Type | Description |
| --- | --- | --- |
| **...** | **`table`** | Tables to merge |

Concatenates array-part entries from all argument tables into a new array.

## MergeHm

`table.MergeHm(...):` **`table`**

| Name | Type | Description |
| --- | --- | --- |
| **...** | **`table`** | Tables to merge |

Merges all key-value pairs from argument tables into a new table.\
Later tables overwrite earlier ones.

## Diff

`table.Diff(new_t, old_t):` **`table`**

| Name | Type | Description |
| --- | --- | --- |
| **new\_t** | **`table`** |  |
| **old\_t** | **`table`** |  |

Returns entries in `new_t` whose values differ from `old_t` (compared by rawequal).

## Sorted

*Generic: `T`*

`table.Sorted(t, [compare_func]):` **`T[]`**

| Name | Type | Description |
| --- | --- | --- |
| **t** | **`T[]`** |  |
| **compare\_func ****`[?]`** | **`fun(a: T, b: T):boolean`** | Optional comparison function `(default: nil)` |

Sorts the table in-place via the built-in `table.sort`, then returns it.

## Map

`table.Map(t, func):` **`table`**

| Name | Type | Description |
| --- | --- | --- |
| **t** | **`table`** |  |
| **func** | **`fun(value: any, key: any):any`** | Callback `func(value, key) -> new_value` |

Applies `func(value, key)` to every entry and returns a new array of results.

## Filter

*Generic: `T`*

`table.Filter(t, func):` **`T[]`**

| Name | Type | Description |
| --- | --- | --- |
| **t** | **`T[]`** |  |
| **func** | **`fun(value: T, key: integer):boolean`** | Predicate `func(value, key) -> boolean` |

Returns a new array containing only entries for which `func(value, key)` returns true.

## Any

`table.Any(t, func):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **t** | **`table`** |  |
| **func** | **`fun(value: any, key: any):boolean`** | Predicate `func(value, key) -> boolean` |

Returns true if `func(value, key)` returns true for at least one entry.

## All

`table.All(t, func):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **t** | **`table`** |  |
| **func** | **`fun(value: any, key: any):boolean`** | Predicate `func(value, key) -> boolean` |

Returns true if `func(value, key)` returns true for every entry.

## Find

`table.Find(t, element):` **`any`**, **`any`**

| Name | Type | Description |
| --- | --- | --- |
| **t** | **`table`** |  |
| **element** | **`any`** | Element to search for |

Finds the first entry matching `element` by raw equality.\
Returns `value, key` on match, or `nil` if not found.

## RemoveElement

`table.RemoveElement(t, element):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **t** | **`table`** |  |
| **element** | **`any`** \ | **`function`** | Element to find or predicate function |

Removes the first matching element from the array-part of `t`.\
If `element` is a function, it is used as a predicate `func(value, index) -> boolean`.\
Otherwise, finds by raw equality. Shifts remaining elements down to maintain order.
