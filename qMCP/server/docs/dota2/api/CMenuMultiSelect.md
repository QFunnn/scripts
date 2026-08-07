# CMenuMultiSelect

CMenuMultiSelect metatable.

## Name

`:Name():` **`string`**

Returns widget's name.

## Update

`:Update(items, [expanded], [saveToConfig]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **items** | **`{nameId: string, imagePath: string, isEnabled: boolean}[]`** | See `CMenuGroup:MultiSelect`. |
| **expanded ****`[?]`** | **`boolean`** | false if you want to create MultiSelect in collapsed state. `(default: false)` |
| **saveToConfig ****`[?]`** | **`boolean`** | true if you want to save to config `(default: false)` |

Updates the multiselect values.

## OneItemSelection

`:OneItemSelection(newState):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **newState** | **`boolean`** |  |

Gets or sets one item selection state. One item selection allows only one item to be\
selected. Depends on the argument.

## OneItemSelection

`:OneItemSelection():` **`boolean`**

## DragAllowed

`:DragAllowed(newState):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **newState** | **`boolean`** |  |

Gets or sets drag allowed state. Drag allows items to be ordered by cursor.\
Depends on the argument.

## DragAllowed

`:DragAllowed():` **`boolean`**

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

`:Get(itemId):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **itemId** | **`string`** |  |

Returns enable state of the item in multiselect.

## Set

`:Set(enabledItems):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **enabledItems** | **`string[]`** | A table of enabled items; other items will be disabled. |

Sets a new value for the item by itemId or sets a new list of enabled items

## Set

`:Set(itemId, value):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **itemId** | **`string`** |  |
| **value** | **`boolean`** |  |

## List

`:List():` **`string[]`**

Returns array of itemIds.

## ListEnabled

`:ListEnabled():` **`string[]`**

Returns array of enabled itemIds.

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

## SetCallback

Multiple callbacks could be set.

`:SetCallback(callback, \[forceCall]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **callback** | **`fun(this: CMenuMultiSelect):nil`** | function to be called on widget change. |
| **forceCall ****`[?]`** | **`boolean`** | true if you want to call callback on widget creation. `(default: false)` |

Sets widget's on change callback.

## UnsetCallback

`:UnsetCallback(callback):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **callback** | **`fun(this: CMenuMultiSelect):nil`** | function to be removed from widget's callbacks. |

Removes widget's on change callback.

## UpdateBackgroundColors

`:UpdateBackgroundColors(colors):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **colors** | **`table<string>`** | Table with background colors. |

Updates widget's background colors.

## UpdateImageColors

`:UpdateImageColors(colors):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **colors** | **`table<string>`** | Table with image colors. |

Updates widget's image colors.

## UpdateToolTips

`:UpdateToolTips(colors):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **colors** | **`table<string>`** | Table with new tooltips |

Updates widget's tooltips
