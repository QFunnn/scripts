# Render

Table to work with render v2.

## FilledRect

`Render.FilledRect(start, end_, color, [rounding], [flags]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **start** | [**`Vec2`**](Vec2.md) | The starting point of the rectangle. |
| **end\_** | [**`Vec2`**](Vec2.md) | The ending point of the rectangle. |
| **color** | [**`Color`**](Color.md) | The color of the rectangle. |
| **rounding ****`[?]`** | **`number`** | The rounding radius of the rectangle corners. `(default: 0.0)` |
| **flags ****`[?]`** | [**`Enum.DrawFlags`**](Enums.md#enum.drawflags) | Custom flags for drawing. `(default: Enum.DrawFlags.None)` |

Draws a filled rectangle.

## Rect

`Render.Rect(start, end_, color, [rounding], [flags], [thickness]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **start** | [**`Vec2`**](Vec2.md) | The starting point of the rectangle. |
| **end\_** | [**`Vec2`**](Vec2.md) | The ending point of the rectangle. |
| **color** | [**`Color`**](Color.md) | The color of the rectangle's border. |
| **rounding ****`[?]`** | **`number`** | The rounding radius of the rectangle corners. `(default: 0.0)` |
| **flags ****`[?]`** | [**`Enum.DrawFlags`**](Enums.md#enum.drawflags) | Custom flags for drawing. `(default: Enum.DrawFlags.None)` |
| **thickness ****`[?]`** | **`number`** | The thickness of the rectangle's border. `(default: 1.0)` |

Draws an unfilled rectangle.

## RoundedProgressRect

`Render.RoundedProgressRect(start, end_, color, percent, rounding, [thickness]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **start** | [**`Vec2`**](Vec2.md) | The starting point of the rectangle. |
| **end\_** | [**`Vec2`**](Vec2.md) | The ending point of the rectangle. |
| **color** | [**`Color`**](Color.md) | The color of the rectangle. |
| **percent** | **`number`** | The percentage of the rectangle to fill \[0..1]. |
| **rounding** | **`number`** | The rounding radius of the rectangle corners. |
| **thickness ****`[?]`** | **`number`** | The thickness of the rectangle's border. `(default: 1.0)` |

Draw a progress rectangle.

## DonutChart

`Render.DonutChart(center, radius, thickness, segments, [options]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **center** | [**`Vec2`**](Vec2.md) | The center position of the chart. |
| **radius** | **`number`** | The outer radius of the chart. |
| **thickness** | **`number`** | The thickness of the donut ring. |
| **segments** | **`{value: number, color: Color, icon: number`** \ | **`nil, icon_color: Color`** \ | **`nil, font_icon: {font: number, size: number, text: string}`** \ | **`nil}[]`** | List of data segments. |
| **options ****`[?]`** | **`{separator_color:Color`** \ | **`nil, separator_thickness:number`** \ | **`nil}`** \ | **`nil`** | Optional settings for the chart appearance. `(default: nil)` |

Draw a donut chart.

## Line

`Render.Line(start, end_, color, [thickness]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **start** | [**`Vec2`**](Vec2.md) | The starting point of the line. |
| **end\_** | [**`Vec2`**](Vec2.md) | The ending point of the line. |
| **color** | [**`Color`**](Color.md) | The color of the line. |
| **thickness ****`[?]`** | **`number`** | The thickness of the line. `(default: 1.0)` |

Draws a line between two points.

## PolyLine

`Render.PolyLine(points, color, [thickness]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **points** | [**`Vec2[]`**](Vec2.md) | A table of Vec2 points to connect with lines. |
| **color** | [**`Color`**](Color.md) | The color of the polyline. |
| **thickness ****`[?]`** | **`number`** | The thickness of the polyline. `(default: 1.0)` |

Draws a series of connected lines (polyline).

## Circle

`Render.Circle(pos, radius, color, [thickness], [startDeg], [percentage], [rounded], [segments]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **pos** | [**`Vec2`**](Vec2.md) | The center position of the circle. |
| **radius** | **`number`** | The radius of the circle. |
| **color** | [**`Color`**](Color.md) | The color of the circle. |
| **thickness ****`[?]`** | **`number`** | The thickness of the circle's outline. `(default: 1.0)` |
| **startDeg ****`[?]`** | **`number`** | The starting degree for drawing the circle. 0 is right side, 90 is bottom, 180 is left, 270 is top. `(default: 0.0)` |
| **percentage ****`[?]`** | **`number`** | The percentage of the circle to draw, in the range \[0.0-1.0]. `(default: 1.0)` |
| **rounded ****`[?]`** | **`boolean`** | Whether the circle is rounded. `(default: false)` |
| **segments ****`[?]`** | **`integer`** | The number of segments used for drawing the circle. `(default: 32)` |

Draws a circle.

## FilledCircle

`Render.FilledCircle(pos, radius, color, [startDeg], [percentage], [segments]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **pos** | [**`Vec2`**](Vec2.md) | The center position of the circle. |
| **radius** | **`number`** | The radius of the circle. |
| **color** | [**`Color`**](Color.md) | The color of the circle. |
| **startDeg ****`[?]`** | **`number`** | The starting degree for drawing the circle. 0 is right side, 90 is bottom, 180 is left, 270 is top. `(default: 0.0)` |
| **percentage ****`[?]`** | **`number`** | The percentage of the circle to draw, in the range \[0.0-1.0]. `(default: 1.0)` |
| **segments ****`[?]`** | **`integer`** | The number of segments used for drawing the circle. `(default: 32)` |

Draws a filled circle.

## CircleGradient

`Render.CircleGradient(pos, radius, colorOuter, colorInner, [startDeg], [percentage]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **pos** | [**`Vec2`**](Vec2.md) | The center position of the circle. |
| **radius** | **`number`** | The radius of the circle. |
| **colorOuter** | [**`Color`**](Color.md) | The outer color of the gradient. |
| **colorInner** | [**`Color`**](Color.md) | The inner color of the gradient. |
| **startDeg ****`[?]`** | **`number`** | The starting degree for drawing the circle. 0 is right side, 90 is bottom, 180 is left, 270 is top. `(default: 0.0)` |
| **percentage ****`[?]`** | **`number`** | The percentage of the circle to draw, in the range \[0.0-1.0]. `(default: 1.0)` |

Draws a circle with a gradient.

## Triangle

`Render.Triangle(points, color, [thickness]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **points** | [**`Vec2[]`**](Vec2.md) | A table of three Vec2 points defining the vertices of the triangle. |
| **color** | [**`Color`**](Color.md) | The color of the triangle's outline. |
| **thickness ****`[?]`** | **`number`** | The thickness of the triangle's outline. `(default: 1.0)` |

Draws a triangle outline.

## FilledTriangle

`Render.FilledTriangle(points, color):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **points** | [**`Vec2[]`**](Vec2.md) | A table of three Vec2 points defining the vertices of the triangle. |
| **color** | [**`Color`**](Color.md) | The color of the triangle. |

Draws a filled triangle.

## TexturedPoly

`Render.TexturedPoly(points, textureHandle, color, [grayscale]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **points** | [**`Vertex[]`**](Vertex.md) | A table of Vertex points defining the vertices of the polygon. Each Vertex contains a position (Vec2) and a texture coordinate (Vec2). |
| **textureHandle** | **`integer`** | The handle to the texture to be applied to the polygon. |
| **color** | [**`Color`**](Color.md) | The color to apply over the texture. This can be used to tint the texture. |
| **grayscale ****`[?]`** | **`number`** | The grayscale of the image. `(default: 0.0)` |

Draws a textured polygon.

## LoadFont

`Render.LoadFont(fontName, [fontFlag], [weight]):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **fontName** | **`string`** | The name of the font to load. |
| **fontFlag ****`[?]`** | [**`Enum.FontCreate`**](Enums.md#enum.fontcreate) \ | **`integer`** | Flags for font creation, such as antialiasing. `(default: Enum.FontCreate.FONTFLAG_NONE)` |
| **weight ****`[?]`** | **`integer`** | The weight (thickness) of the font. Typically, 0 means default weight. `(default: 400)` |

Loads a font and returns its handle. Returns handle to the loaded font.

## Text

`Render.Text(font, fontSize, text, pos, color):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **font** | **`integer`** | The handle to the font used for drawing the text. |
| **fontSize** | **`number`** | The size of the font. |
| **text** | **`string`** | The text to be drawn. |
| **pos** | [**`Vec2`**](Vec2.md) | The position where the text will be drawn. |
| **color** | [**`Color`**](Color.md) | The color of the text. |

Draws text at a specified position.

## WorldToScreen

`Render.WorldToScreen(pos):` [**`Vec2`**](Vec2.md), **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **pos** | [**`Vector`**](Vector.md) | The 3D world position to be converted. |

Converts a 3D world position to a 2D screen position. Returns A Vec2 representing the 2D screen position and a boolean indicating visibility on the screen.

#### Example

```lua
-- Example: Convert the center of the map (0,0,0) to screen coordinates.
local worldPos = Vector(0.0, 0.0, 0.0)
local screenPos, isVisible = Render.WorldToScreen(worldPos)
if isVisible then
    Log.Write("Screen Position: " .. screenPos.x .. ", " .. screenPos.y)
else
    Log.Write("Position is not visible on the screen")
end
```

## ScreenSize

`Render.ScreenSize():` [**`Vec2`**](Vec2.md)

Retrieves the current screen size, returning it as a Vec2 where x is the width and y is the height of the screen.

## TextSize

`Render.TextSize(font, fontSize, text):` [**`Vec2`**](Vec2.md)

| Name | Type | Description |
| --- | --- | --- |
| **font** | **`integer`** | The handle to the font used for measuring the text. |
| **fontSize** | **`number`** | The size of the font. |
| **text** | **`string`** | The text to measure. |

Calculates the size of the given text using the specified font, returning the size as a Vec2 where x is the width and y is the height of the text.

## LoadImage

`Render.LoadImage(path):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **path** | **`string`** | Path to the image. |

Loads an image and returns its handle.

## LoadSvg

`Render.LoadSvg(path, size):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **path** | **`string`** | Path to the image. |
| **size** | [**`Vec2`**](Vec2.md) | Size of image to scale. |

Loads svg image and returns its handle.

## LoadSvgString

`Render.LoadSvgString(svg, size, cacheId):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **svg** | **`string`** | Svg text itself. |
| **size** | [**`Vec2`**](Vec2.md) | Size of image to scale. |
| **cacheId** | **`string`** | Texture of image creates only once for every unique cache id |

Loads svg image from string and returns its handle.

## Image

`Render.Image(imageHandle, pos, size, color, [rounding], [flags], [uvMin], [uvMax], [grayscale]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **imageHandle** | **`integer`** | The handle to the image. |
| **pos** | [**`Vec2`**](Vec2.md) | The position to draw the image. |
| **size** | [**`Vec2`**](Vec2.md) | The size of the image. |
| **color** | [**`Color`**](Color.md) | The color to tint the image. |
| **rounding ****`[?]`** | **`number`** | The rounding radius of the image corners. `(default: 0.0)` |
| **flags ****`[?]`** | [**`Enum.DrawFlags`**](Enums.md#enum.drawflags) | Custom flags for drawing. `(default: Enum.DrawFlags.None)` |
| **uvMin ****`[?]`** | [**`Vec2`**](Vec2.md) | The minimum UV coordinates for texture mapping. `(default: {0.0, 0.0})` |
| **uvMax ****`[?]`** | [**`Vec2`**](Vec2.md) | The maximum UV coordinates for texture mapping. `(default: {1.0, 1.0})` |
| **grayscale ****`[?]`** | **`number`** | The grayscale of the image. `(default: 0.0)` |

Draws an image at a specified position and size.

## ImageCentered

`Render.ImageCentered(imageHandle, pos, size, color, [rounding], [flags], [uvMin], [uvMax], [grayscale]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **imageHandle** | **`integer`** | The handle to the image. |
| **pos** | [**`Vec2`**](Vec2.md) | The center position to draw the image. |
| **size** | [**`Vec2`**](Vec2.md) | The size of the image. |
| **color** | [**`Color`**](Color.md) | The color to tint the image. |
| **rounding ****`[?]`** | **`number`** | The rounding radius of the image corners. `(default: 0.0)` |
| **flags ****`[?]`** | [**`Enum.DrawFlags`**](Enums.md#enum.drawflags) | Custom flags for drawing. `(default: Enum.DrawFlags.None)` |
| **uvMin ****`[?]`** | [**`Vec2`**](Vec2.md) | The minimum UV coordinates for texture mapping. `(default: {0.0, 0.0})` |
| **uvMax ****`[?]`** | [**`Vec2`**](Vec2.md) | The maximum UV coordinates for texture mapping. `(default: {1.0, 1.0})` |
| **grayscale ****`[?]`** | **`number`** | The grayscale of the image. `(default: 0.0)` |

Draws an image centered at a specified position and size.

## ImageSize

`Render.ImageSize(imageHandle):` [**`Vec2`**](Vec2.md)

| Name | Type | Description |
| --- | --- | --- |
| **imageHandle** | **`integer`** | The handle to the image. |

Retrieves the size of an image. Returns the size of the image as a Vec2.

## OutlineGradient

`Render.OutlineGradient(start, end_, topLeft, topRight, bottomLeft, bottomRight, [rounding], [flags], [thickness]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **start** | [**`Vec2`**](Vec2.md) | The starting point of the gradient rectangle. |
| **end\_** | [**`Vec2`**](Vec2.md) | The ending point of the gradient rectangle. |
| **topLeft** | [**`Color`**](Color.md) | The color of the top-left corner. |
| **topRight** | [**`Color`**](Color.md) | The color of the top-right corner. |
| **bottomLeft** | [**`Color`**](Color.md) | The color of the bottom-left corner. |
| **bottomRight** | [**`Color`**](Color.md) | The color of the bottom-right corner. |
| **rounding ****`[?]`** | **`number`** | The rounding radius of the rectangle corners. `(default: 0.0)` |
| **flags ****`[?]`** | [**`Enum.DrawFlags`**](Enums.md#enum.drawflags) | Custom flags for drawing. `(default: Enum.DrawFlags.None)` |
| **thickness ****`[?]`** | **`number`** | The thickness of the outline. `(default: 1.0)` |

Draws a outlined gradient rectangle.

## Gradient

`Render.Gradient(start, end_, topLeft, topRight, bottomLeft, bottomRight, [rounding], [flags]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **start** | [**`Vec2`**](Vec2.md) | The starting point of the gradient rectangle. |
| **end\_** | [**`Vec2`**](Vec2.md) | The ending point of the gradient rectangle. |
| **topLeft** | [**`Color`**](Color.md) | The color of the top-left corner. |
| **topRight** | [**`Color`**](Color.md) | The color of the top-right corner. |
| **bottomLeft** | [**`Color`**](Color.md) | The color of the bottom-left corner. |
| **bottomRight** | [**`Color`**](Color.md) | The color of the bottom-right corner. |
| **rounding ****`[?]`** | **`number`** | The rounding radius of the rectangle corners. `(default: 0.0)` |
| **flags ****`[?]`** | [**`Enum.DrawFlags`**](Enums.md#enum.drawflags) | Custom flags for drawing. `(default: Enum.DrawFlags.None)` |

Draws a filled gradient rectangle.

## Shadow

`Render.Shadow(start, end_, color, thickness, [obj_rounding], [flags], [offset]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **start** | [**`Vec2`**](Vec2.md) | The starting point of the shadow rectangle. |
| **end\_** | [**`Vec2`**](Vec2.md) | The ending point of the shadow rectangle. |
| **color** | [**`Color`**](Color.md) | The color of the shadow. |
| **thickness** | **`number`** | The thickness of the shadow. |
| **obj\_rounding ****`[?]`** | **`number`** | The rounding radius of the shadow rectangle corners. `(default: 0.0)` |
| **flags ****`[?]`** | [**`Enum.DrawFlags`**](Enums.md#enum.drawflags) | Custom flags for drawing the shadow. `(default: Enum.DrawFlags.ShadowCutOutShapeBackground)` |
| **offset ****`[?]`** | [**`Vec2`**](Vec2.md) | The offset of the shadow from the original rectangle. `(default: {0.0, 0.0})` |

Draws a shadow effect within a specified rectangular area.

## ShadowCircle

`Render.ShadowCircle(center, radius, color, thickness, [num_segments], [flags], [offset]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **center** | [**`Vec2`**](Vec2.md) | The center point of the circle. |
| **radius** | **`number`** | The radius of the circle. |
| **color** | [**`Color`**](Color.md) | The color of the shadow. |
| **thickness** | **`number`** | The thickness of the shadow. |
| **num\_segments ****`[?]`** | **`integer`** | The number of segments for drawing the circle. `(default: 12)` |
| **flags ****`[?]`** | [**`Enum.DrawFlags`**](Enums.md#enum.drawflags) | Custom flags for drawing the shadow. `(default: Enum.DrawFlags.ShadowCutOutShapeBackground)` |
| **offset ****`[?]`** | [**`Vec2`**](Vec2.md) | The offset of the shadow from the circle. `(default: {0.0, 0.0})` |

Draws a circle shadow effect.

## ShadowConvexPoly

`Render.ShadowConvexPoly(points, color, thickness, [flags], [offset]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **points** | [**`Vec2[]`**](Vec2.md) | Table of Vec2 points defining the convex polygon. Should be more than 2 points. |
| **color** | [**`Color`**](Color.md) | The color of the shadow. |
| **thickness** | **`number`** | The thickness of the shadow. |
| **flags ****`[?]`** | [**`Enum.DrawFlags`**](Enums.md#enum.drawflags) | Custom flags for drawing the shadow. `(default: Enum.DrawFlags.ShadowCutOutShapeBackground)` |
| **offset ****`[?]`** | [**`Vec2`**](Vec2.md) | The offset of the shadow from the polygon. `(default: {0.0, 0.0})` |

Draws a shadow convex polygon effect.

## ShadowNGon

`Render.ShadowNGon(center, radius, color, thickness, num_segments, [flags], [offset]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **center** | [**`Vec2`**](Vec2.md) | The center point of the n-gon. |
| **radius** | **`number`** | The radius of the n-gon. |
| **color** | [**`Color`**](Color.md) | The color of the shadow. |
| **thickness** | **`number`** | The thickness of the shadow. |
| **num\_segments** | **`integer`** | The number of segments (sides) of the n-gon. |
| **flags ****`[?]`** | [**`Enum.DrawFlags`**](Enums.md#enum.drawflags) | Custom flags for drawing the shadow. `(default: Enum.DrawFlags.ShadowCutOutShapeBackground)` |
| **offset ****`[?]`** | [**`Vec2`**](Vec2.md) | The offset of the shadow from the n-gon. `(default: {0.0, 0.0})` |

Draws a shadow n-gon (polygon with n sides) effect.

## Blur

`Render.Blur(start, end_, [strength], [alpha], [rounding], [flags]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **start** | [**`Vec2`**](Vec2.md) | The starting point of the blur rectangle. |
| **end\_** | [**`Vec2`**](Vec2.md) | The ending point of the blur rectangle. |
| **strength ****`[?]`** | **`number`** | The strength of the blur effect. `(default: 1.0)` |
| **alpha ****`[?]`** | **`number`** | The alpha value of the blur effect. `(default: 1.0)` |
| **rounding ****`[?]`** | **`number`** | The rounding radius of the blur rectangle corners. `(default: 0.0)` |
| **flags ****`[?]`** | [**`Enum.DrawFlags`**](Enums.md#enum.drawflags) | Custom flags for the blur effect. `(default: Enum.DrawFlags.None)` |

Applies a blur effect within a specified rectangular area.

## PushClip

`Render.PushClip(start, end_, [intersect]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **start** | [**`Vec2`**](Vec2.md) | The starting point of the clipping rectangle. |
| **end\_** | [**`Vec2`**](Vec2.md) | The ending point of the clipping rectangle. |
| **intersect ****`[?]`** | **`boolean`** | If true, the new clipping area is intersected with the current clipping area. `(default: false)` |

Begins a new clipping region. Only the rendering within the specified rectangular area will be displayed.

## PopClip

`Render.PopClip():` **`nil`**

Ends the most recently begun clipping region, restoring the previous clipping region.

## StartRotation

`Render.StartRotation(angle):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **angle** | **`number`** | The rotation angle. |

Begins a new rotation.

## StopRotation

`Render.StopRotation():` **`nil`**

End the rotation.

## SetGlobalAlpha

Do not forget to reset the global alpha value after your rendering.

`Render.SetGlobalAlpha(alpha):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **alpha** | **`number`** | The alpha value to set \[0..1] |

Set the global alpha value for rendering.

## ResetGlobalAlpha

`Render.ResetGlobalAlpha():` **`nil`**

Reset the global alpha value for rendering to 1.0.

## CenteredNotification

`Render.CenteredNotification(text, duration):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **text** | **`string`** | Text to draw. |
| **duration** | **`number`** | Duration of the notification. |

Draws a centered notification.

## Logo

`Render.Logo(center, radius, [angle], [primary_color], [secondary_color]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **center** | [**`Vec2`**](Vec2.md) |  |
| **radius** | **`number`** |  |
| **angle ****`[?]`** | **`number`** | rotation angle `(default: -45)` |
| **primary\_color ****`[?]`** | [**`Color`**](Color.md) | `(default: Menu.Style("primary"))` |
| **secondary\_color ****`[?]`** | [**`Color`**](Color.md) | `(default: {227, 227, 227, 255})` |

Draws umbrella logo

## FindOrCreateRT

`Render.FindOrCreateRT(name, [w], [h]):` **`integer`**

| Name | Type | Description |
| --- | --- | --- |
| **name** | **`string`** | The unique name of the render target. |
| **w ****`[?]`** | **`number`** | The width of the render target. Optional. `(default: nil)` |
| **h ****`[?]`** | **`number`** | The height of the render target. Optional. `(default: nil)` |

Creates a new render target or retrieves an existing one by name.\
If width or height are not provided, the render target will be full screen size.

## MarkDirtyRT

`Render.MarkDirtyRT(handle):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **handle** | **`integer`** | The handle of the render target. |

Marks a render target as dirty, causing the next Render.RenderRT call to re-bake it.\
Safe across frame drops: the dirty state is only cleared once the bake is actually processed.

## RenderRT

`Render.RenderRT(callback, handle, pos, color, [scale], [uvSizeMin], [uvSizeMax]):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **callback** | **`fun():boolean?`** | The function containing rendering commands to bake into the render target. |
| **handle** | **`integer`** | The handle of the render target (from Render.FindOrCreateRT). |
| **pos** | [**`Vec2`**](Vec2.md) | The screen position where the render target texture will be drawn. |
| **color** | [**`Color`**](Color.md) | The color tint to apply when drawing the render target texture. |
| **scale ****`[?]`** | **`number`** | The scale factor for the render target. `(default: 1.0)` |
| **uvSizeMin ****`[?]`** | [**`Vec2`**](Vec2.md) | The minimum UV offset for texture mapping. `(default: {0.0, 0.0})` |
| **uvSizeMax ****`[?]`** | [**`Vec2`**](Vec2.md) | The maximum UV offset for texture mapping. `(default: {0.0, 0.0})` |

Renders a cached render target texture at the given position.\
If the render target is dirty (see Render.MarkDirtyRT), the callback is invoked once\
inside a push/pop RT context to re-bake the texture content, then the baked texture\
is drawn at `pos`. If the render target is clean, only the cached texture is drawn.\
\
The callback receives no arguments and may return a boolean: returning `true` signals\
that the content is still updating (e.g. animation in progress).

#### Example

```lua
-- render_target.lua
local rt_w, rt_h = 256, 80
local rt_handle = Render.FindOrCreateRT("example_rt", rt_w, rt_h)

local font = Render.LoadFont("MuseoSansEx", Enum.FontCreate.FONTFLAG_ANTIALIAS | Enum.FontCreate.FONTFLAG_DROPSHADOW, 500)

local white  = Color(255, 255, 255, 255)
local bg     = Color(20, 20, 20, 220)
local accent = Color(80, 200, 120, 255)
local dim    = Color(160, 160, 160, 200)
local rt_pos = Vec2(100, 100)

-- Animation state
local anim_start = 0
local anim_duration = 0.6 -- seconds
local is_animating = false
local click_count = 0

-- Draw callback is invoked ONLY when the RT is dirty.
-- Returning true  tells the caller "content is still changing" (animation in progress).
-- Returning false tells the caller "content is now static" (bake is final).
-- The engine itself does NOT use this value — it is passed through as RenderRT's return.
local function draw_rt_content()
    local t = is_animating
        and math.min((os.clock() - anim_start) / anim_duration, 1.0)
        or 0

    Render.FilledRect(Vec2(0, 0), Vec2(rt_w, rt_h), bg)
    Render.FilledRect(Vec2(0, rt_h - 8), Vec2(t * rt_w, rt_h), accent)
    Render.Text(font, 14, "Clicks: " .. click_count, Vec2(10, 10), white)

    if t >= 1.0 then
        is_animating = false
    end

    return is_animating
end

return {
    OnDraw = function()
        -- Click inside the RT rect -> start a new animation
        if Input.IsKeyDownOnce(Enum.ButtonCode.KEY_MOUSE1)
            and Input.IsCursorInRect(rt_pos.x, rt_pos.y, rt_w, rt_h) then
            click_count = click_count + 1
            anim_start = os.clock()
            is_animating = true
            Render.MarkDirtyRT(rt_handle)
        end

        -- RenderRT returns true when it baked AND the callback returned true.
        -- That means the animation is still playing, so mark dirty again
        -- to force another bake next frame.
        local still_updating = Render.RenderRT(draw_rt_content, rt_handle, rt_pos, white)
        if still_updating then
            Render.MarkDirtyRT(rt_handle)
        end

        -- Print current state below the RT rect
        local state = still_updating and "Redrawing (animation)" or "Cached (using RT)"
        Render.Text(font, 12, state, Vec2(rt_pos.x, rt_pos.y + rt_h + 4), dim)
    end
}

```

## ResizeRT

`Render.ResizeRT(handle, [w], [h]):` **`nil`**

| Name | Type | Description |
| --- | --- | --- |
| **handle** | **`integer`** | The handle of the render target to resize. |
| **w ****`[?]`** | **`number`** | The new width, or a Vec2 containing both dimensions. `(default: nil)` |
| **h ****`[?]`** | **`number`** | The new height. Not used when Vec2 is provided. `(default: nil)` |

Resizes an existing render target.\
If width and height are not provided, it changes the render target to be full screen size.\
Accepts (handle, w, h), (handle, vec2), or (handle) for full screen.
