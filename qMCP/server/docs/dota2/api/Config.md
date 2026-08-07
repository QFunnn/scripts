# Config

Table to work with configs that are stored in the `configs` folder with the `.ini` extention.

## ReadInt

`Config.ReadInt(config, key, [def]):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **config** | **`string`** | The config file name. |
| **key** | **`string`** | The key to read. |
| **def ****`[?]`** | **`integer`** | The default value to return if the key is not found. `(default: 0)` |

Read an integer from a config file.

## ReadFloat

`Config.ReadFloat(config, key, [def]):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **config** | **`string`** | The config file name. |
| **key** | **`string`** | The key to read. |
| **def ****`[?]`** | **`number`** | The default value to return if the key is not found. `(default: 0.0)` |

Read a float from a config file.

## ReadString

`Config.ReadString(config, key, [def]):` **`string`**

| Name | Type | Description |
| --- | --- | --- |
| **config** | **`string`** | The config file name. |
| **key** | **`string`** | The key to read. |
| **def ****`[?]`** | **`string`** | The default value to return if the key is not found. `(default: "")` |

Read a string from a config file.

## WriteInt

`Config.WriteInt(config, key, value):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **config** | **`string`** | The config file name. |
| **key** | **`string`** | The key to write. |
| **value** | **`integer`** | The value to write. |

Write an integer to a config file.

## WriteFloat

`Config.WriteFloat(config, key, value):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **config** | **`string`** | The config file name. |
| **key** | **`string`** | The key to write. |
| **value** | **`number`** | The value to write. |

Write a float to a config file.

## WriteString

`Config.WriteString(config, key, value):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **config** | **`string`** | The config file name. |
| **key** | **`string`** | The key to write. |
| **value** | **`string`** | The value to write. |

Write a string to a config file.
