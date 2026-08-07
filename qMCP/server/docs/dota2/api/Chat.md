# Chat

Table to work with chat.

## GetChannels

`Chat.GetChannels():` **`string[]`**

Returns an array of channel names.

## Print

`Chat.Print(channel, text):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **channel** | **`string`** | The channel name to say the message in. |
| **text** | **`string`** | The message to say. |

Print a message in a channel. This message will not be sent to the server.

## Say

`Chat.Say(channel, text):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **channel** | **`string`** | The channel name to say the message in. |
| **text** | **`string`** | The message to say. |

Say a message in a channel.

## Flip

`Chat.Flip(channel):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **channel** | **`string`** | The channel name to flip the coin in. |

Flip the coin in a channel.

## Roll

`Chat.Roll(channel, [min], [max]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **channel** | **`string`** | The channel name to roll the dice in. |
| **min ****`[?]`** | **`number`** | The minimum number to roll. `(default: 0)` |
| **max ****`[?]`** | **`number`** | The maximum number to roll. `(default: 100)` |

Roll a dice in a channel.
