# CMenuGearAttachment

CMenuGearAttachment metatable.

## Name

`:Name():` **`string`**

Returns widget's name.

## Parent

`:Parent():` [**`CMenuSwitch`**](CMenuSwitch.md) | [**`CMenuSliderInt`**](CMenuSliderInt.md) | [**`CMenuSliderFloat`**](CMenuSliderFloat.md) | [**`CMenuMultiComboBox`**](CMenuMultiComboBox.md) | [**`CMenuLabel`**](CMenuLabel.md) | [**`CMenuInputBox`**](CMenuInputBox.md) | [**`CMenuComboBox`**](CMenuComboBox.md) | [**`CMenuBind`**](CMenuBind.md)

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

## Find

`:Find(widgetName):` [**`CMenuSwitch`**](CMenuSwitch.md) | [**`CMenuBind`**](CMenuBind.md) | [**`CMenuSliderFloat`**](CMenuSliderFloat.md) | [**`CMenuSliderInt`**](CMenuSliderInt.md) | [**`CMenuColorPicker`**](CMenuColorPicker.md) | [**`CMenuComboBox`**](CMenuComboBox.md) | [**`CMenuMultiComboBox`**](CMenuMultiComboBox.md) | [**`CMenuMultiSelect`**](CMenuMultiSelect.md) | [**`CMenuInputBox`**](CMenuInputBox.md) | [**`CMenuLabel`**](CMenuLabel.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **widgetName** | **`string`** |  |

Finds the widget by name.

## Switch

`:Switch(switchName, [defaultValue], [imageIcon]):` [**`CMenuSwitch`**](CMenuSwitch.md)

| Name | Type | Description |
| --- | --- | --- |
| **switchName** | **`string`** |  |
| **defaultValue ****`[?]`** | **`boolean`** | `(default: false)` |
| **imageIcon ****`[?]`** | **`string`** | Path to image or FontAwesome icon unicode. `(default: "")` |

Creates new `CMenuSwitch`.

## Bind

`:Bind(bindName, [defaultValue], [imageIcon]):` [**`CMenuBind`**](CMenuBind.md)

| Name | Type | Description |
| --- | --- | --- |
| **bindName** | **`string`** |  |
| **defaultValue ****`[?]`** | [**`Enum.ButtonCode`**](Enums.md#enum.buttoncode) | `(default: Enum.ButtonCode.BUTTON_CODE_INVALID)` |
| **imageIcon ****`[?]`** | **`string`** | Path to image or FontAwesome icon unicode. `(default: "")` |

Creates new `CMenuBind`.

## Slider

`:Slider(sliderName, minValue, maxValue, defaultValue, [format]):` [**`CMenuSliderInt`**](CMenuSliderInt.md)

| Name | Type | Description |
| --- | --- | --- |
| **sliderName** | **`string`** |  |
| **minValue** | **`integer`** |  |
| **maxValue** | **`integer`** |  |
| **defaultValue** | **`integer`** |  |
| **format ****`[?]`** | **`string`** \ | **`fun(value: integer):string`** | Format string or function to format value. See example. `(default: "%d")` |

Creates new `CMenuSliderInt` or `CMenuSliderFloat` depents on arg types.\
`minValue`, `maxValue` and `defaultValue` should be integer to create `CMenuSliderInt`.

#### Example

```lua
-- Create slider with integer values
gear:Slider( "slider", 0, 100, 50, "%d" )
-- Create slider with integer values and custom format function
gear:Slider( "slider", 0, 100, 50, function( value ) return "%d%%" end ) -- turns into
"50%"
```

## Slider

`:Slider(sliderName, minValue, maxValue, defaultValue, [format]):` [**`CMenuSliderFloat`**](CMenuSliderFloat.md)

| Name | Type | Description |
| --- | --- | --- |
| **sliderName** | **`string`** |  |
| **minValue** | **`number`** |  |
| **maxValue** | **`number`** |  |
| **defaultValue** | **`number`** |  |
| **format ****`[?]`** | **`string`** \ | **`fun(value: number):string`** | Format string or function to format value. See example. `(default: "%f")` |

Creates new `CMenuSliderFloat`.

#### Example

```lua
-- Create slider with float values
gear:Slider( "slider", 0.0, 1.0, 0.5, "%.2f" ) -- turns into "0.50"
-- Create slider with float values and custom format function
gear:Slider( "slider", 0.0, 100.0, 50.0, function( value )
	if value < 50 then
		return "Low(%f)"
	else
		return "High(%f)"
  end
end )
```

## ColorPicker

`:ColorPicker(colorPickerName, color, [imageIcon]):` [**`CMenuColorPicker`**](CMenuColorPicker.md)

| Name | Type | Description |
| --- | --- | --- |
| **colorPickerName** | **`string`** |  |
| **color** | [**`Color`**](Color.md) |  |
| **imageIcon ****`[?]`** | **`string`** | Path to image or FontAwesome icon unicode. `(default: "")` |

Creates new `CMenuColorPicker`.

## Button

`:Button(buttonName, callback, [altStyle], [widthPercent]):` [**`CMenuButton`**](CMenuButton.md)

| Name | Type | Description |
| --- | --- | --- |
| **buttonName** | **`string`** |  |
| **callback** | **`fun(this: CMenuButton):nil`** | function to call on button click. |
| **altStyle ****`[?]`** | **`boolean`** | Use alternative button style. `(default: false)` |
| **widthPercent ****`[?]`** | **`number`** | Button width in percents. \[0.0, 1.0] `(default: 1.0)` |

Creates new `CMenuButton`.

#### Example

```lua
gear:Button( "button", function( this )
	Log.Write( "Button '" .. this:Name() .. "' has been clicked."  )
end )
```

## Combo

`:Combo(comboName, items, [defaultValue]):` [**`CMenuComboBox`**](CMenuComboBox.md)

| Name | Type | Description |
| --- | --- | --- |
| **comboName** | **`string`** |  |
| **items** | **`string[]`** |  |
| **defaultValue ****`[?]`** | **`integer`** | Index of default item. (starts from 0) `(default: 0)` |

Creates new `CMenuComboBox`.

## MultiCombo

`:MultiCombo(multiComboName, items, enabledItems):` [**`CMenuMultiComboBox`**](CMenuMultiComboBox.md)

| Name | Type | Description |
| --- | --- | --- |
| **multiComboName** | **`string`** |  |
| **items** | **`string[]`** |  |
| **enabledItems** | **`string[]`** | table of enabled items |

Creates new `CMenuMultiComboBox`.

#### Example

```lua
gear:MultiCombo( "multiCombo", { "item1", "item2", "item3" }, { "item1", "item3" } )
```

## MultiSelect

`:MultiSelect(multiSelectName, items, [expanded]):` [**`CMenuMultiSelect`**](CMenuMultiSelect.md)

| Name | Type | Description |
| --- | --- | --- |
| **multiSelectName** | **`string`** |  |
| **items** | **`{nameId: string, imagePath: string, isEnabled: boolean}[]`** | See example. |
| **expanded ****`[?]`** | **`boolean`** | false if you want to create MultiSelect in collapsed state. `(default: false)` |

Creates new `CMenuMultiSelect`.

#### Example

```lua
gear:MultiSelect( "multiSelect", {
 	{ "1", "panorama/images/heroes/icons/npc_dota_hero_antimage_png.vtex_c", false },
 	{ "2", "panorama/images/heroes/icons/npc_dota_hero_antimage_png.vtex_c", false },
}, true )
```

## Input

`:Input(inputName, [defaultValue], [imageIcon]):` [**`CMenuInputBox`**](CMenuInputBox.md)

| Name | Type | Description |
| --- | --- | --- |
| **inputName** | **`string`** |  |
| **defaultValue ****`[?]`** | **`string`** | `(default: "")` |
| **imageIcon ****`[?]`** | **`string`** | Path to image or FontAwesome icon unicode. `(default: "")` |

Creates new `CMenuInputBox`.

## Label

`:Label(labelText, [imageIcon]):` [**`CMenuLabel`**](CMenuLabel.md)

| Name | Type | Description |
| --- | --- | --- |
| **labelText** | **`string`** |  |
| **imageIcon ****`[?]`** | **`string`** | Path to image or FontAwesome icon unicode. `(default: "")` |

Creates new `CMenuLabel`.

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
