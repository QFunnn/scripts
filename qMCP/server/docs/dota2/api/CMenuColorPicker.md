# CMenuColorPicker

CMenuColorPicker metatable.

## Name

`:Name():` **`string`**

Returns widget's name.

## Parent

`:Parent():` [**`CMenuGroup`**](CMenuGroup.md) | [**`CMenuGearAttachment`**](CMenuGearAttachment.md)

Returns widget's parent.

## Type

`:Type():` [**`Enum.WidgetType`**](Enums.md#enum.widgettype)

Returns widget type.

## Open

`:Open():` **`nil`**

Opens parent tabs.

## ForceLocalization

Not recommended for use due to its complexity

`:ForceLocalization(newText):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **newText** | **`string`** |  |

Changes text in the widget. The path to the widget is not affected.\
May be used for dynamic text customization or recolor.

## ToolTip

`:ToolTip(newText):` **`string`**

| Name | Type | Description |
| --- | --- | --- |
| **newText** | **`string`** |  |

Gets or sets tooltip. Tooltip is displayed when mouse cursor is over the widget.\
Depends on the argument.

## ToolTip

`:ToolTip():` **`string`**

## Visible

`:Visible(value):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **value** | **`boolean`** |  |

Gets or sets visible state. Depends on argument.

#### Example

```lua
-- setter
widget:Visible(false)
```

## Visible

`:Visible():` **`boolean`**

#### Example

```lua
-- getter
local isVisible = widget:Visible()
```

## Disabled

`:Disabled(value):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **value** | **`boolean`** |  |

Gets or sets disabled state. Depends on argument.

#### Example

```lua
-- setter
widget:Disabled( false )
```

## Disabled

`:Disabled():` **`boolean`**

#### Example

```lua
-- getter
local isDisabled = widget:Disabled()
```

## Unsafe

`:Unsafe(value):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **value** | **`boolean`** |  |

Gets or sets unsafe state. Unsafe widgets have warning sign.\
Depends on argument.

## Unsafe

`:Unsafe():` **`boolean`**

## Get

`:Get():` [**`Color`**](Color.md)

Returns widget's value.

## Set

`:Set(value):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **value** | [**`Color`**](Color.md) |  |

Sets widget's value.

## Image

`:Image(imagePath, [offset]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **imagePath** | **`string`** | Path to the image. |
| **offset ****`[?]`** | [**`Vec2`**](Vec2.md) | Optional image offset. `(default: {0.0, 0.0})` |

Sets widget's image.

## ImageHandle

`:ImageHandle(imageHandle, [offset]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **imageHandle** | **`integer`** |  |
| **offset ****`[?]`** | [**`Vec2`**](Vec2.md) | Optional image offset. `(default: {0.0, 0.0})` |

Sets tab's image by already created handle.

## Icon

`:Icon(icon, [offset]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **icon** | **`string`** | icon unicode. |
| **offset ****`[?]`** | [**`Vec2`**](Vec2.md) | Optional icon offset. `(default: {0.0, 0.0})` |

Sets widget's icon.\
[Icons list](https://fontawesome.com/search?o=r\&s=solid\&f=classic)

#### Example

```lua
--https://fontawesome.com/icons/user?f=classic&s=solid
widget:Icon("\u{f007}")
```

## ImageHandle

`:ImageHandle(imageHandle, [offset]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **imageHandle** | **`integer`** |  |
| **offset ****`[?]`** | [**`Vec2`**](Vec2.md) | Optional image offset. `(default: {0.0, 0.0})` |

Sets tab's image by already created handle.

## SetCallback

Multiple callbacks could be set.

`:SetCallback(callback, \[forceCall]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **callback** | **`fun(this: CMenuColorPicker):nil`** | function to be called on widget change. |
| **forceCall ****`[?]`** | **`boolean`** | true if you want to call callback on widget creation. `(default: false)` |

Sets widget's on change callback.

## UnsetCallback

`:UnsetCallback(callback):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **callback** | **`fun(this: CMenuColorPicker):nil`** | function to be removed from widget's callbacks. |

Removes widget's on change callback.

## HideAlphaBar

`:HideAlphaBar(value):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **value** | **`boolean`** |  |

Gets or sets alpha bar state. Depends on argument.

#### Example

```lua
-- setter
widget:HideAlphaBar( true )
```

## HideAlphaBar

`:HideAlphaBar():` **`boolean`**

#### Example

```lua
-- getter
local isAlphaBarHidden = widget:HideAlphaBar()
```
