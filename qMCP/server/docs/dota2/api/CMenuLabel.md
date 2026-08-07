# CMenuLabel

CMenuLabel metatable.

## Name

`:Name(newText):` **`string`**

| Name | Type | Description |
| --- | --- | --- |
| **newText** | **`string`** |  |

Returns widget's name.

## Name

`:Name():` **`string`**

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

## ColorPicker

`:ColorPicker(name, color):` [**`CMenuColorPickerAttachment`**](CMenuColorPickerAttachment.md)

| Name | Type | Description |
| --- | --- | --- |
| **name** | **`string`** | Name of the attachment. |
| **color** | [**`Color`**](Color.md) | Default color. |

Creates `CMenuColorPickerAttachment` and attaches it to the widget.

## Gear

`:Gear(name, [gearIcon], [useSmallFont]):` [**`CMenuGearAttachment`**](CMenuGearAttachment.md)

| Name | Type | Description |
| --- | --- | --- |
| **name** | **`string`** | Name of the attachment. |
| **gearIcon ****`[?]`** | **`string`** | Gear FontAwesome icon. `(default: "\uf013")` |
| **useSmallFont ****`[?]`** | **`boolean`** | Use small font for gear icon. `(default: true)` |

Creates `CMenuGearAttachment` and attaches it to the widget.
