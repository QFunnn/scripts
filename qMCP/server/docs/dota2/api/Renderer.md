# Renderer

Table to work with renderer.

## SetDrawColor

`Renderer.SetDrawColor([r], [g], [b], [a]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **r ****`[?]`** | **`integer`** | Red color. `(default: 255)` |
| **g ****`[?]`** | **`integer`** | Green color. `(default: 255)` |
| **b ****`[?]`** | **`integer`** | Blue color. `(default: 255)` |
| **a ****`[?]`** | **`integer`** | Alpha color. `(default: 255)` |

Sets the color of the renderer.

## DrawLine

`Renderer.DrawLine(x0, y0, x1, y1):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **x0** | **`integer`** | X coordinate of the first point. |
| **y0** | **`integer`** | Y coordinate of the first point. |
| **x1** | **`integer`** | X coordinate of the second point. |
| **y1** | **`integer`** | Y coordinate of the second point. |

Draws a line.

## DrawPolyLine

`Renderer.DrawPolyLine(points):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **points** | **`table`** | Table of points. |

Draws a polyline.

## DrawPolyLineFilled

`Renderer.DrawPolyLineFilled(points):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **points** | **`table`** | Table of points. |

Draws a filled polyline.

## DrawFilledRect

`Renderer.DrawFilledRect(x, y, w, h):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **x** | **`integer`** | X coordinate of the rectangle. |
| **y** | **`integer`** | Y coordinate of the rectangle. |
| **w** | **`integer`** | Width of the rectangle. |
| **h** | **`integer`** | Height of the rectangle. |

Draws a filled rectangle.

## DrawOutlineRect

`Renderer.DrawOutlineRect(x, y, w, h):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **x** | **`integer`** | X coordinate of the rectangle. |
| **y** | **`integer`** | Y coordinate of the rectangle. |
| **w** | **`integer`** | Width of the rectangle. |
| **h** | **`integer`** | Height of the rectangle. |

Draws an outlined rectangle.

## DrawOutlineCircle

`Renderer.DrawOutlineCircle(x, y, r, s):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **x** | **`integer`** | X coordinate of the circle. |
| **y** | **`integer`** | Y coordinate of the circle. |
| **r** | **`integer`** | Radius of the circle. |
| **s** | **`integer`** | Segments of the circle. |

Draws an outlined circle.

## DrawFilledCircle

`Renderer.DrawFilledCircle(x, y, r):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **x** | **`integer`** | X coordinate of the circle. |
| **y** | **`integer`** | Y coordinate of the circle. |
| **r** | **`integer`** | Radius of the circle. |

Draws a filled circle.

## DrawOutlineRoundedRect

`Renderer.DrawOutlineRoundedRect(x, y, w, h, radius):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **x** | **`integer`** | X coordinate of the rectangle. |
| **y** | **`integer`** | Y coordinate of the rectangle. |
| **w** | **`integer`** | Width of the rectangle. |
| **h** | **`integer`** | Height of the rectangle. |
| **radius** | **`integer`** | Radius of the rectangle. |

Draws an outlined rounded rectangle.

## DrawFilledRoundedRect

`Renderer.DrawFilledRoundedRect(x, y, w, h, radius):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **x** | **`integer`** | X coordinate of the rectangle. |
| **y** | **`integer`** | Y coordinate of the rectangle. |
| **w** | **`integer`** | Width of the rectangle. |
| **h** | **`integer`** | Height of the rectangle. |
| **radius** | **`integer`** | Radius of the rectangle. |

Draws a filled rounded rectangle.

## DrawOutlineTriangle

`Renderer.DrawOutlineTriangle(points):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **points** | **`table`** | Table of points. |

Draws an outlined triangle.

## DrawFilledTriangle

`Renderer.DrawFilledTriangle(points):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **points** | **`table`** | Table of points. |

Draws a filled triangle.

## DrawTexturedPolygon

`Renderer.DrawTexturedPolygon(points, texture):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **points** | **`table`** | Table of points. |
| **texture** | **`integer`** | Texture handle. |

Draws a textured polygon.

## LoadFont

`Renderer.LoadFont(name, size, flags, weight):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **name** | **`string`** | Name of the font. |
| **size** | **`integer`** | Size of the font. |
| **flags** | **`integer`** | Font flags. |
| **weight** | **`integer`** | Font weight. |

Loads a font.

## DrawText

`Renderer.DrawText(font, x, y, text):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **font** | **`integer`** | Font handle. |
| **x** | **`integer`** | X coordinate of the text. |
| **y** | **`integer`** | Y coordinate of the text. |
| **text** | **`string`** | Text to draw. |

Draws a text.

## WorldToScreen

`Renderer.WorldToScreen(pos):` **`integer`**, **`integer`**, **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **pos** | [**`Vector`**](Vector.md) | World coordinates. |

Converts world coordinates to screen coordinates. Returns x, y and visible.

## GetScreenSize

`Renderer.GetScreenSize():` **`integer`**, **`integer`**

Returns screen size.

## GetTextSize

`Renderer.GetTextSize(font, text):` **`integer`**, **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **font** | **`integer`** | Font handle. |
| **text** | **`string`** | Text to measure. |

Returns text size.

## LoadImage

`Renderer.LoadImage(path):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **path** | **`string`** | Path to the image. |

Loads an image. Returns image handle.

## DrawImage

`Renderer.DrawImage(handle, x, y, w, h):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **handle** | **`integer`** | Image handle. |
| **x** | **`integer`** | X coordinate of the image. |
| **y** | **`integer`** | Y coordinate of the image. |
| **w** | **`integer`** | Width of the image. |
| **h** | **`integer`** | Height of the image. |

Draws an image.

## DrawImageCentered

`Renderer.DrawImageCentered(handle, x, y, w, h):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **handle** | **`integer`** | Image handle. |
| **x** | **`integer`** | X coordinate of the image. |
| **y** | **`integer`** | Y coordinate of the image. |
| **w** | **`integer`** | Width of the image. |
| **h** | **`integer`** | Height of the image. |

Draws an image centered.

## GetImageSize

`Renderer.GetImageSize(handle):` **`integer`**, **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **handle** | **`integer`** | Image handle. |

Returns image size.

## DrawFilledRectFade

`Renderer.DrawFilledRectFade(x0, y0, x1, y1, alpha0, alpha1, bHorizontal):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **x0** | **`integer`** | X coordinate of the rectangle. |
| **y0** | **`integer`** | Y coordinate of the rectangle. |
| **x1** | **`integer`** | X coordinate of the rectangle. |
| **y1** | **`integer`** | Y coordinate of the rectangle. |
| **alpha0** | **`integer`** | Alpha of the first point. |
| **alpha1** | **`integer`** | Alpha of the second point. |
| **bHorizontal** | **`boolean`** | Horizontal fade. |

Draws a filled rectangle with fade.

## DrawFilledGradRect

`Renderer.DrawFilledGradRect(x0, y0, x1, y1, r, g, b, a, r2, g2, b2, a2, bHorizontal):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **x0** | **`integer`** | X coordinate of the rectangle. |
| **y0** | **`integer`** | Y coordinate of the rectangle. |
| **x1** | **`integer`** | X coordinate of the rectangle. |
| **y1** | **`integer`** | Y coordinate of the rectangle. |
| **r** | **`integer`** | Red color of the first point. |
| **g** | **`integer`** | Green color of the first point. |
| **b** | **`integer`** | Blue color of the first point. |
| **a** | **`integer`** | Alpha color of the first point. |
| **r2** | **`integer`** | Red color of the second point. |
| **g2** | **`integer`** | Green color of the second point. |
| **b2** | **`integer`** | Blue color of the second point. |
| **a2** | **`integer`** | Alpha color of the second point. |
| **bHorizontal** | **`boolean`** | Horizontal gradient. |

Draws a filled gradient rectangle.

## DrawGlow

`Renderer.DrawGlow(x0, y0, w, h, thickness, obj_rounding):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **x0** | **`integer`** | X coordinate of the rectangle. |
| **y0** | **`integer`** | Y coordinate of the rectangle. |
| **w** | **`integer`** | Width of the rectangle. |
| **h** | **`integer`** | Height of the rectangle. |
| **thickness** | **`integer`** | Thickness of the glow. |
| **obj\_rounding** | **`integer`** | Rounding of the glow. |

Draws a glow.

## DrawBlur

`Renderer.DrawBlur(x0, y0, w, h, strength, rounding, alpha):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **x0** | **`number`** | X coordinate of the rectangle. |
| **y0** | **`number`** | Y coordinate of the rectangle. |
| **w** | **`number`** | Width of the rectangle. |
| **h** | **`number`** | Height of the rectangle. |
| **strength** | **`number`** | Strength of the blur. |
| **rounding** | **`number`** | Rounding of the blur. |
| **alpha** | **`number`** | Alpha of the blur. |

Draws a blur.

## PushClip

`Renderer.PushClip(x, y, w, h, intersect):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **x** | **`integer`** | X coordinate of the rectangle. |
| **y** | **`integer`** | Y coordinate of the rectangle. |
| **w** | **`integer`** | Width of the rectangle. |
| **h** | **`integer`** | Height of the rectangle. |
| **intersect** | **`boolean`** | Intersect with the previous clip. |

Pushes a clip rect.

## PopClip

`Renderer.PopClip():` **`nil`**

Pops a clip rect.

## DrawCenteredNotification

`Renderer.DrawCenteredNotification(text, duration):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **text** | **`string`** | Text to draw. |
| **duration** | **`number`** | Duration of the notification. |

Draws a centered notification.
