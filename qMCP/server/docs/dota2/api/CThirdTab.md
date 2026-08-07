# CThirdTab

CThirdTab metatable

## Name

`:Name():` **`string`**

Returns tab's name.

## Parent

`:Parent():` [**`CSecondTab`**](CSecondTab.md)

Returns tab's parent.

## Type

`:Type():` [**`Enum.WidgetType`**](Enums.md#enum.widgettype)

Returns widget type.

## Open

`:Open():` **`nil`**

Opens parent tabs.

## Create

`:Create(groupName, [side]):` [**`CMenuGroup`**](CMenuGroup.md)

| Name | Type | Description |
| --- | --- | --- |
| **groupName** | **`string`** |  |
| **side ****`[?]`** | [**`Enum.GroupSide`**](Enums.md#enum.groupside) | `(default: Enum.GroupSide.Default)` |

Creates new `CMenuGroup`.

## Find

`:Find(groupName):` [**`CMenuGroup`**](CMenuGroup.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **groupName** | **`string`** |  |

Finds the `CMenuGroup` by name.

## Image

`:Image(imagePath, [offset]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **imagePath** | **`string`** | Path to the image. |
| **offset ****`[?]`** | [**`Vec2`**](Vec2.md) | Optional image offset. `(default: {0.0, 0.0})` |

Sets tab's image.

## ImageHandle

`:ImageHandle(imageHandle, [offset]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **imageHandle** | **`integer`** |  |
| **offset ****`[?]`** | [**`Vec2`**](Vec2.md) | Optional image offset. `(default: {0.0, 0.0})` |

Sets tab's image by already created handle.

## Visible

`:Visible(value):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **value** | **`boolean`** |  |

Gets or sets third tab's visible state. Depends on argument.

#### Example

```lua
-- setter
third_tab:Visible(false)
```

## Visible

`:Visible():` **`boolean`**

#### Example

```lua
-- getter
local isVisible = third_tab:Visible()
```

## Icon

`:Icon(icon, [offset]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **icon** | **`string`** | icon unicode. |
| **offset ****`[?]`** | [**`Vec2`**](Vec2.md) | Optional icon offset. `(default: {0.0, 0.0})` |

Sets tab's icon.\
[Icons list](https://fontawesome.com/search?o=r\&s=solid\&f=classic)

#### Example

```lua
-- https://fontawesome.com/icons/user?f=classic&s=solid
tab:Icon( "\u{f007}")
```
