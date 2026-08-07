# UIPanel

UIPanel metatable

## \_\_tostring

`:__tostring():` **`nil`**

## \_\_eq

Overload for operator ==.

`:__eq(other):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`UIPanel`**](UIPanel.md) |  |

## FindChild

`:FindChild(id):` [**`UIPanel`**](UIPanel.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **id** | **`string`** | id of the child. |

Finds child by ID.

## IsVisible

`:IsVisible():` **`boolean`**

Returns visible state.

## SetVisible

`:SetVisible(newState):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **newState** | **`boolean`** |  |

Sets visible state.

## GetClassList

`:GetClassList():` **`string[]`**

Returns class name list.

## FindChildInLayoutFile

`:FindChildInLayoutFile(id):` [**`UIPanel`**](UIPanel.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **id** | **`string`** |  |

???.

## FindPanelInLayoutFile

`:FindPanelInLayoutFile(id):` [**`UIPanel`**](UIPanel.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **id** | **`string`** |  |

???.

## FindChildTraverse

`:FindChildTraverse(id):` [**`UIPanel`**](UIPanel.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **id** | **`string`** |  |

Recursive find child by id.

## FindChildWithClass

`:FindChildWithClass(className):` [**`UIPanel`**](UIPanel.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **className** | **`string`** |  |

Finds first child with provided class name.

## GetChildCount

`:GetChildCount():` **`integer`**

Returns child by count.

## GetChild

`:GetChild(index):` [**`UIPanel`**](UIPanel.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **index** | **`number`** |  |

Returns child by index.

## GetChildByPath

`:GetChildByPath(path, [bLogError]):` [**`UIPanel`**](UIPanel.md) | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **path** | **`string[]`** |  |
| **bLogError ****`[?]`** | **`boolean`** | Log error if panel not found. `(default: false)` |

Returns child by path using FindChild.

## GetChildIndex

`:GetChildIndex():` **`integer`**

Returns index in parent children list. Starts from 0.

## GetFirstChild

`:GetFirstChild():` [**`UIPanel`**](UIPanel.md) | **`nil`**

Returns first child.

## GetLastChild

`:GetLastChild():` [**`UIPanel`**](UIPanel.md) | **`nil`**

Returns last child.

## HasID

`:HasID():` **`boolean`**

Returns `true` if the panel has an id.

## GetID

`:GetID():` **`string`**

Returns id of panel.

## SetID

`:SetID(id):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **id** | **`string`** |  |

Sets the panel's id.

## GetLayoutHeight

`:GetLayoutHeight():` **`integer`**

Returns the panel height.

## GetLayoutWidth

`:GetLayoutWidth():` **`integer`**

Returns the panel width.

## GetParent

`:GetParent():` [**`UIPanel`**](UIPanel.md) | **`nil`**

Returns the panel's parent.

## GetRootParent

`:GetRootParent():` [**`UIPanel`**](UIPanel.md) | **`nil`**

Returns the panel's root parent. ???

## GetXOffset

`:GetXOffset():` **`integer`**

Returns the panel's relative X offset.

## GetYOffset

`:GetYOffset():` **`integer`**

Returns the panel's relative Y offset.

## GetBounds

`:GetBounds([useJsFunc]):` **`{x:number, y:number, w:number, h:number}`**

| Name | Type | Description |
| --- | --- | --- |
| **useJsFunc ****`[?]`** | **`boolean`** \ | **`nil`** | Use js GetPositionWithinWindow function to get position. `(default: false)` |

Returns the panel's bounds. Iterate over the parent hierarchy to get the absolute bounds.

## GetImageSrc

`:GetImageSrc():` **`string`**

Return the panel source image.

## GetPanelType

`:GetPanelType():` **`string`**

Returns the panel's type.

## BSetProperty

`:BSetProperty(key, value):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **key** | **`string`** |  |
| **value** | **`string`** |  |

Sets the panel property.

## SetStyle

`:SetStyle(cssString):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **cssString** | **`string`** |  |

Sets the panel style.

#### Example

```lua
-- set_style.lua
local css_like_table = {
    ["horizontal-align"] = "center",
	["vertical-align"] = "center",
    ["transform"] = "translate3d( 0px, -0px, 0px ) scale3d(1, 1, 1)",
    ["padding-left"] = "0px",
    ["margin"] = "0px",
    ["border-radius"] = "4px",
    ["background-color"] = "none",
    ["box-shadow"] = "none",
    ["color"] = "gradient( linear, 0% 100%, 0% 0%, from( #ff00FF ), to( #5C9C68 ) )",
    ["font-size"] = "20px",
    ["text-align"] = "center",
    ["text-decoration"] = "none",
    ["background-size"] = "0% 0%",
    ["opacity-mask"] = 'url("s2r://panorama/images/masks/hudchat_mask_psd.vtex") 1.0',
    ["hue-rotation"] = "-10deg",
    ["text-shadow"] = "2px 2px #111111b0",
    ["blur"] = "gaussian(0px)",
    ["line-height"] = "120%",
    ["font-family"] = "Radiance",
    ["border-brush"] = "gradient( linear, 0% 0%, 0% 100%, from( #96c5ff96 ), to( #12142d2d ) )",
}

local function css_to_string(tbl)
    local str = ""
    for k, v in pairs(tbl) do
        str = str .. k .. ": " .. v .. "; "
    end
    return str;
end

local health_label = Panorama.GetPanelByName("HealthLabel");
if (health_label) then
    health_label:SetStyle(css_to_string(css_like_table))
end

```

## SetAttribute

`:SetAttribute(key, value):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **key** | **`string`** |  |
| **value** | **`string`** |  |

Sets the panel's attribute.

## GetAttribute

`:GetAttribute(key, default):` **`string`** | **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **key** | **`string`** |  |
| **default** | **`string`** |  |

Returns the panel's attribute.

## GetPositionWithinWindow

`:GetPositionWithinWindow():` [**`Vec2`**](Vec2.md)

Returns the panel's window position. Not sure about optimization.

## GetText

This method is only available for Label panels.

`:GetText():` **`string`**

Returns the label panel's text.

## SetText

This method is only available for Label panels.

`:SetText(text):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **text** | **`string`** |  |

Sets the label panel's text.

## GetTextType

This method is only available for Label panels.

`:GetTextType():` **`integer`**

Gets the label panel's text type. (2 = plain, 3 = html)

## SetTextType

This method is only available for Label panels.

`:SetTextType(new):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **new** | **`integer`** | value |

Sets the label panel's text type. (2 = plain, 3 = html). Should always set text type before setting the text

#### Example

```lua

label_panel:SetTextType(3)
label_panel:SetText("<font color='#8BFFD8'>Vitória</font>")
```

## IsValid

`:IsValid():` **`boolean`**

Checks if the panel is valid

## HasClass

`:HasClass(className):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **className** | **`string`** | Class name. |

Checks if the panel has a class.

## AddClasses

`:AddClasses(classNames):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **classNames** | **`string`** | Could be a space separated list of classes. |

Adds a class to the panel.

## RemoveClasses

`:RemoveClasses(classNames):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **classNames** | **`string`** | Could be a space separated list of classes. |

Removes a class to the panel.
