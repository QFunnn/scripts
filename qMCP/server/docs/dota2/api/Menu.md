# Menu

Table to work with Menu.

## Find

`Menu.Find(firstTabName, sectionName, secondTabName, thirdTabName, groupTabName, widgetName, attachmentName, widgetInGearName):` [**`CMenuSwitch`**](CMenuSwitch.md) | [**`CMenuBind`**](CMenuBind.md) | [**`CMenuSliderFloat`**](CMenuSliderFloat.md) | [**`CMenuSliderInt`**](CMenuSliderInt.md) | [**`CMenuColorPicker`**](CMenuColorPicker.md) | [**`CMenuComboBox`**](CMenuComboBox.md) | [**`CMenuButton`**](CMenuButton.md) | [**`CMenuMultiComboBox`**](CMenuMultiComboBox.md) | [**`CMenuMultiSelect`**](CMenuMultiSelect.md) | [**`CMenuInputBox`**](CMenuInputBox.md) | [**`CMenuLabel`**](CMenuLabel.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **firstTabName** | **`string`** |  |
| **sectionName** | **`string`** |  |
| **secondTabName** | **`string`** |  |
| **thirdTabName** | **`string`** |  |
| **groupTabName** | **`string`** |  |
| **widgetName** | **`string`** |  |
| **attachmentName** | **`string`** |  |
| **widgetInGearName** | **`string`** |  |

Returns menu item.

## Create

`Menu.Create(firstTabName, sectionName, secondTabName, thirdTabName, groupTabName):` [**`CMenuGroup`**](CMenuGroup.md)

| Name | Type | Description |
| --- | --- | --- |
| **firstTabName** | **`string`** |  |
| **sectionName** | **`string`** |  |
| **secondTabName** | **`string`** |  |
| **thirdTabName** | **`string`** |  |
| **groupTabName** | **`string`** |  |

Creates tab/section/group. Returns menu item.

## Style

`Menu.Style(styleColor):` [**`Color`**](Color.md)

| Name | Type | Description |
| --- | --- | --- |
| **styleColor** | **`string`** |  |

Creates tab/section/group. Returns color of specified style var or table of all style colors\
depends on param.

## Opened

`Menu.Opened():` **`boolean`**

Returns current menu open state.

## VisualsIsEnabled

`Menu.VisualsIsEnabled():` **`boolean`**

Returns current visuals enabled state.

## Alpha

`Menu.Alpha():` **`number`**

Returns current menu alpha.

## Pos

`Menu.Pos():` [**`Vec2`**](Vec2.md)

Returns current menu pos.

## Size

`Menu.Size():` [**`Vec2`**](Vec2.md)

Returns current menu size.

## Scale

`Menu.Scale():` **`integer`**

Returns current menu scale percentage.

## AnimDuration

`Menu.AnimDuration():` **`number`**

Returns current menu animation duration.
