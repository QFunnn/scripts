# ConVar

Table to work with `CConVars`.\
ConVars are game variable that can be used to retrieve or change some game engine settings.

## Find

`ConVar.Find(name):` [**`CConVar`**](ConVar.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **name** | **`string`** |  |

Returns the found ConVar.

#### Example

```lua
local convar = ConVar.Find("dota_camera_distance")
local camera_distance = ConVar.GetFloat(convar)
```

## GetString

`ConVar.GetString(convar):` **`string`**

| Name | Type | Description |
| --- | --- | --- |
| **convar** | [**`CConVar`**](ConVar.md) |  |

Returns string value of the Convar

## GetInt

`ConVar.GetInt(convar):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **convar** | [**`CConVar`**](ConVar.md) |  |

Returns int value of the Convar

## GetFloat

`ConVar.GetFloat(convar):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **convar** | [**`CConVar`**](ConVar.md) |  |

Returns float value of the Convar

## GetBool

`ConVar.GetBool(convar):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **convar** | [**`CConVar`**](ConVar.md) |  |

Returns boolean value of the Convar

## SetString

`ConVar.SetString(convar, value):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **convar** | [**`CConVar`**](ConVar.md) |  |
| **value** | **`string`** |  |

Assigns new string value to the ConVar

## SetInt

`ConVar.SetInt(convar, value):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **convar** | [**`CConVar`**](ConVar.md) |  |
| **value** | **`integer`** |  |

Assigns new int value to the ConVar

## SetFloat

`ConVar.SetFloat(convar, value):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **convar** | [**`CConVar`**](ConVar.md) |  |
| **value** | **`number`** |  |

Assigns new float value to the ConVar

## SetBool

`ConVar.SetBool(convar, value):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **convar** | [**`CConVar`**](ConVar.md) |  |
| **value** | **`boolean`** |  |

Assigns new boolean value to the ConVar
