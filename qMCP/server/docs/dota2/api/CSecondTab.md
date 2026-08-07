# CSecondTab

CSecondTab metatable

## Name

`:Name():` **`string`**

Returns tab's name.

## Parent

`:Parent():` [**`CTabSection`**](CTabSection.md)

Returns tab's parent.

## Type

`:Type():` [**`Enum.WidgetType`**](Enums.md#enum.widgettype)

Returns widget type.

## Open

`:Open():` **`nil`**

Opens parent tabs.

## Create

`:Create(tabName):` [**`CThirdTab`**](CThirdTab.md)

| Name | Type | Description |
| --- | --- | --- |
| **tabName** | **`string`** |  |

Creates new `CThirdTab`.

## Find

`:Find(tabName):` [**`CThirdTab`**](CThirdTab.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **tabName** | **`string`** |  |

Finds the `CThirdTab` by name.

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
tab:Icon( "\u{f007}" )
```

## LinkHero

`:LinkHero(heroId, attribute):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **heroId** | **`integer`** | See `Engine.GetHeroIDByName` |
| **attribute** | [**`Enum.Attributes`**](Enums.md#enum.attributes) |  |

Links tab to hero and attribute.
