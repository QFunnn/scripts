# CFirstTab

CFirstTab metatable

## Name

`:Name():` **`string`**

Returns tab's name.

## Parent

`:Parent():` **`nil`**

Returns parent. It's `nil` for CFirstTab.

## Type

`:Type():` [**`Enum.WidgetType`**](Enums.md#enum.widgettype)

Returns widget type.

## Open

`:Open():` **`nil`**

Opens parent tabs.

## Create

`:Create(sectionName):` [**`CTabSection`**](CTabSection.md)

| Name | Type | Description |
| --- | --- | --- |
| **sectionName** | **`string`** |  |

Creates new `CTabSection`.

## Find

`:Find(sectionName):` [**`CTabSection`**](CTabSection.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **sectionName** | **`string`** |  |

Finds the `CTabSection` by name.
