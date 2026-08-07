# Event

Table to work with game events.

When you install events, you send the subscribe message to the server, which is potentially unsafe.\
Therefore, you won't be able to install new listeners when you have unsafe features disabled in the Settings -> Security tab.

The list of events can be found in the "pak01\_dir.vpk" under "resource/game.gameevents."

## AddListener

`Event.AddListener(name):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **name** | **`string`** | Event name |

Installs an event listener for the desired event.

## IsReliable

`Event.IsReliable(event):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **event** | [**`CEvent`**](Event.md) |  |

Checks if the event is reliable.

## IsLocal

`Event.IsLocal(event):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **event** | [**`CEvent`**](Event.md) |  |

Checks if the event is local or networked.

## IsEmpty

`Event.IsEmpty(event):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **event** | [**`CEvent`**](Event.md) |  |

Checks if the event is empty.

## GetBool

`Event.GetBool(event, field):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **event** | [**`CEvent`**](Event.md) |  |
| **field** | **`string`** | Field name |

Returns the boolean value of the specified event field.

## GetInt

`Event.GetInt(event, field):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **event** | [**`CEvent`**](Event.md) |  |
| **field** | **`string`** | Field name |

Returns the integer value of the specified event field.

## GetUint64

`Event.GetUint64(event, field):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **event** | [**`CEvent`**](Event.md) |  |
| **field** | **`string`** | Field name |

Returns the uint64 value of the specified event field.

## GetFloat

`Event.GetFloat(event, field):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **event** | [**`CEvent`**](Event.md) |  |
| **field** | **`string`** | Field name |

Returns the floating value of the specified event field.

## GetString

`Event.GetString(event, field):` **`string`**

| Name | Type | Description |
| --- | --- | --- |
| **event** | [**`CEvent`**](Event.md) |  |
| **field** | **`string`** | Field name |

Returns the string value of the specified event field.
