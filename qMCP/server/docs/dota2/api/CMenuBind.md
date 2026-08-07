# CMenuBind

CMenuBind metatable.

## Name

`:Name():` **`string`**

Returns widget's name.

## Parent

`:Parent():` [**`CMenuGroup`**](CMenuGroup.md) | [**`CMenuGearAttachment`**](CMenuGearAttachment.md)

Returns widget's parent.

## Type

`:Type():` [**`Enum.WidgetType`**](Enums.md#enum.widgettype)

Returns widget's type.

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

`:Get([idx]):` [**`Enum.ButtonCode`**](Enums.md#enum.buttoncode)

| Name | Type | Description |
| --- | --- | --- |
| **idx ****`[?]`** | **`0`** \ | **`1`** | index of the button to get value from `(default: 0)` |

Returns widget's value. To get both of the buttons use `Buttons` method.

## Set

`:Set(key1, [key2]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **key1** | [**`Enum.ButtonCode`**](Enums.md#enum.buttoncode) | primary button code |
| **key2 ****`[?]`** | [**`Enum.ButtonCode`**](Enums.md#enum.buttoncode) | secondary button code `(default: Enum.ButtonCode.KEY_NONE)` |

Sets widget's value.

## Buttons

`:Buttons():` [**`Enum.ButtonCode`**](Enums.md#enum.buttoncode), [**`Enum.ButtonCode`**](Enums.md#enum.buttoncode)

Returns widget's buttons value.

## IsDown

`:IsDown():` **`boolean`**

Returns `true` when the key or both keys is down.

## IsPressed

`:IsPressed():` **`boolean`**

Returns `true` when the key or both keys is pressed for the first time.

## IsToggled

`:IsToggled():` **`boolean`**

Bind stores it's toggle state and switches it when the key is pressed. This method\
returns this state.

## SetToggled

`:SetToggled(value):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **value** | **`boolean`** |  |

Sets the toggle state manually.

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
switch:Icon("\u{f007}")
```

## SetCallback

Multiple callbacks could be set.

`:SetCallback(callback, [forceCall]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **callback** | **`fun(this: CMenuBind):nil`** | function to be called on widget change. |
| **forceCall ****`[?]`** | **`boolean`** | true if you want to call callback on widget creation. `(default: false)` |

Sets widget's on change callback.

## UnsetCallback

`:UnsetCallback(callback):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **callback** | **`fun(this: CMenuBind):nil`** | function to be removed from widget's callbacks. |

Removes widget's on change callback.

## SetKeyCallback

Multiple callbacks could be set.

`:SetKeyCallback(callback):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **callback** | **`fun(this: CMenuBind, key: Enum.ButtonCode, event: Enum.EKeyEvent):nil`** | function to be called on key press/release. |

Sets widget's on key press/release callback.

## UnsetKeyCallback

`:UnsetKeyCallback(callback):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **callback** | **`fun(this: CMenuBind, key: Enum.ButtonCode, event: Enum.EKeyEvent):nil`** | function to be removed. |

Removes widget's on key press/release callback.

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

## Properties

`:Properties([name], [value], [markAsToggle]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **name ****`[?]`** | **`string`** | Overridden name to display in bind list. `(default: nil)` |
| **value ****`[?]`** | **`string`** | Overridden value to display alongside the name in the bind list. This can be used to provide additional context about the bind. `(default: nil)` |
| **markAsToggle ****`[?]`** | **`boolean`** | Indicates whether the bind should be marked as a toggle, which is particularly useful if the bind's functionality includes toggling states. Recommended to be used in conjunction with the IsToggled(). `(default: false)` |

Updates the properties of a widget for display in the bind list.

## ShowInBindIsland

`:ShowInBindIsland(newStatus):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **newStatus** | **`boolean`** |  |

Gets or sets the visibility of the bind in the bind island.

## ShowInBindIsland

`:ShowInBindIsland():` **`boolean`**

## MouseBinding

`:MouseBinding(newStatus):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **newStatus** | **`boolean`** |  |

Gets or sets the ability to bind the mouse button.

## MouseBinding

`:MouseBinding():` **`boolean`**
