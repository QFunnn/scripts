# Item

Table to work with `CItem`.

**`CItem`** extends **`CAbility`**

## IsCombinable

`Item.IsCombinable(item):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **item** | [**`CItem`**](Item.md) |  |

Returns `true` if the item is combinable. I'm not sure if non-combinable items even exist.

## IsPermanent

`Item.IsPermanent(item):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **item** | [**`CItem`**](Item.md) |  |

Returns `true` if the item is permanent. I'm not sure what permanent items is, but for items with stacks this function returns `false`.

## IsStackable

`Item.IsStackable(item):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **item** | [**`CItem`**](Item.md) |  |

Returns `true` if the item is stackable. e.g tangoes, wards, etc.

## IsRecipe

`Item.IsRecipe(item):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **item** | [**`CItem`**](Item.md) |  |

Returns `true` if the item is recipe.

## GetSharability

`Item.GetSharability(item):` [**`Enum.ShareAbility`**](Enums.md#enum.shareability)

| Name | Type | Description |
| --- | --- | --- |
| **item** | [**`CItem`**](Item.md) |  |

Returns item's sharability type.

## IsDroppable

`Item.IsDroppable(item):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **item** | [**`CItem`**](Item.md) |  |

Returns `true` if the item is droppable.

## IsPurchasable

`Item.IsPurchasable(item):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **item** | [**`CItem`**](Item.md) |  |

Returns `true` if the item is purchasable.

## IsSellable

`Item.IsSellable(item):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **item** | [**`CItem`**](Item.md) |  |

Returns `true` if the item is sellable.

## RequiresCharges

`Item.RequiresCharges(item):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **item** | [**`CItem`**](Item.md) |  |

Returns `true` if the item requires charges. e.g. urn, vessel etc.

## IsKillable

`Item.IsKillable(item):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **item** | [**`CItem`**](Item.md) |  |

Returns `true` if item is destroyable by autoatack.

## IsDisassemblable

`Item.IsDisassemblable(item):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **item** | [**`CItem`**](Item.md) |  |

Returns `true` if item is disassemblable.

## IsAlertable

`Item.IsAlertable(item):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **item** | [**`CItem`**](Item.md) |  |

Returns `true` if item is alertable. e.g. smoke, mekansm, arcane boots etc.

## GetInitialCharges

`Item.GetInitialCharges(item):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **item** | [**`CItem`**](Item.md) |  |

Returns initial charges of the item. e.g. 3 for bottle, 1 for dust etc.

## CastsOnPickup

`Item.CastsOnPickup(item):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **item** | [**`CItem`**](Item.md) |  |

No idea what this function does.

## GetCurrentCharges

`Item.GetCurrentCharges(item):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **item** | [**`CItem`**](Item.md) |  |

Returns amount of current charges.

## GetSecondaryCharges

`Item.GetSecondaryCharges(item):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **item** | [**`CItem`**](Item.md) |  |

Returns amount of secondary charges. e.g. pack of both type of wards.

## IsCombineLocked

`Item.IsCombineLocked(item):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **item** | [**`CItem`**](Item.md) |  |

Returns `true` if item locked for combining.

## IsMarkedForSell

`Item.IsMarkedForSell(item):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **item** | [**`CItem`**](Item.md) |  |

Returns `true` if item is marked for sell.

## GetPurchaseTime

`Item.GetPurchaseTime(item):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **item** | [**`CItem`**](Item.md) |  |

Returns the game time when the item was purchased. If the item was assembled from other items, It returns the purchase time of the item that had the lowest\
index at the moment of assembling.

## GetAssembledTime

`Item.GetAssembledTime(item):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **item** | [**`CItem`**](Item.md) |  |

Returns the game time when the item was assembled. If the item was not assembled, returns time when the item was purchased.

## PurchasedWhileDead

`Item.PurchasedWhileDead(item):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **item** | [**`CItem`**](Item.md) |  |

Returns `true` if item was purchased while dead.

## CanBeUsedOutOfInventory

`Item.CanBeUsedOutOfInventory(item):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **item** | [**`CItem`**](Item.md) |  |

No idea which specific item example could be used out of inventory.

## IsItemEnabled

`Item.IsItemEnabled(item):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **item** | [**`CItem`**](Item.md) |  |

Returns `false` if item has CD after moving from stash.

## GetEnableTime

Could be less than current game time if item is already enabled.

`Item.GetEnableTime(item):` **`number`**

| Name | Type | Description |
| --- | --- | --- |
| **item** | [**`CItem`**](Item.md) |  |

Returns game time when item will be enabled.

## GetPlayerOwnerID

`Item.GetPlayerOwnerID(item):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **item** | [**`CItem`**](Item.md) |  |

Returns player ID who owns the item.

## GetCost

`Item.GetCost(item):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **item** | [**`CItem`**](Item.md) |  |

Returns item cost.

## GetStockCount

Item id can be found in `assets/data/items.json` file in cheat folder.

`Item.GetStockCount(item\_id, \[team]):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **item\_id** | **`integer`** |  |
| **team ****`[?]`** | [**`Enum.TeamNum`**](Enums.md#enum.teamnum) | - Optional. Default is local player's team. `(default: Enum.TeamNum.TEAM_RADIANT)` |

Returns amount of remaining items in shop by item id.

#### Example

```lua
-- "item_ward_observer": {
--     "ID": "42",
Log.Write("Observers available: " .. Item.GetStockCount(42))
```
