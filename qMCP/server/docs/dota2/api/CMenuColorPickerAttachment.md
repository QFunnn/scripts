# CMenuColorPickerAttachment

CMenuColorPickerAttachment metatable.

## Name

`:Name():` **`string`**

Returns widget's name.

## Parent

`:Parent():` [**`CMenuSwitch`**](CMenuSwitch.md) | [**`CMenuSliderInt`**](CMenuSliderInt.md) | [**`CMenuSliderFloat`**](CMenuSliderFloat.md) | [**`CMenuMultiComboBox`**](CMenuMultiComboBox.md) | [**`CMenuLabel`**](https://github.com/Boyarinov/gitbook-doc-parser/blob/main/generated/menu/CMenuLabel.md) | [**`CMenuInputBox`**](CMenuInputBox.md) | [**`CMenuGroup`**](CMenuGroup.md) | [**`CMenuBind`**](CMenuBind.md)

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

## Get

`:Get():` [**`Color`**](Color.md)

Returns widget's value.

## Set

`:Set(value):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **value** | [**`Color`**](Color.md) |  |

Sets widget's value.

## SetCallback

Multiple callbacks could be set.

`:SetCallback(callback, \[forceCall]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **callback** | **`fun(this: CMenuColorPickerAttachment):nil`** | function to be called on widget change. |
| **forceCall ****`[?]`** | **`boolean`** | true if you want to call callback on widget creation. `(default: false)` |

Sets widget's on change callback.

## UnsetCallback

`:UnsetCallback(callback):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **callback** | **`fun(this: CMenuColorPickerAttachment):nil`** | function to be removed from widget's callbacks. |

Removes widget's on change callback.
