# Logger

Named logger with per-level methods and per-logger level filtering. Messages are written to the debug log as \[LEVEL] \[LoggerName] message.

## Logger

`Logger(name):` **`Logger`**

| Name | Type | Description |
| --- | --- | --- |
| **name** | **`string`** |  |

Create a new Logger with the given name. Default level is DEBUG (all messages pass).

## debug

`:debug(...):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **...** | **`any`** |  |

Log a debug-level message. Arguments are converted to strings and joined with spaces.

## info

`:info(...):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **...** | **`any`** |  |

Log an info-level message.

## warning

`:warning(...):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **...** | **`any`** |  |

Log a warning-level message.

## error

`:error(...):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **...** | **`any`** |  |

Log an error-level message.

## set\_level

`:set_level(level):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **level** | **`number`** | Logger.DEBUG |

Set the minimum log level. Messages below this level are suppressed.

## get\_level

`:get_level():` **`number`**

Get the current minimum log level.

## get\_name

`:get_name():` **`string`**

Get the logger name.
