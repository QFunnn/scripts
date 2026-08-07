# RenderV2

Table to work with render v2.

```lua
---Table to work with render v2.
Render = {}

---Draws a filled rectangle.
---@param start Vec2 The starting point of the rectangle.
---@param end_ Vec2 The ending point of the rectangle.
---@param color Color The color of the rectangle.
---@param rounding? number @default: `0.0`. The rounding radius of the rectangle corners.
---@param flags? Enum.DrawFlags @default: `Enum.DrawFlags.None`. Custom flags for drawing.
---@return nil
function Render.FilledRect(start, end_, color, rounding, flags) end


---Draws an unfilled rectangle.
---@param start Vec2 The starting point of the rectangle.
---@param end_ Vec2 The ending point of the rectangle.
---@param color Color The color of the rectangle's border.
---@param rounding? number @default: `0.0`. The rounding radius of the rectangle corners.
---@param flags? Enum.DrawFlags @default: `Enum.DrawFlags.None`. Custom flags for drawing.
---@param thickness? number @default: `1.0`. The thickness of the rectangle's border.
---@return nil
function Render.Rect(start, end_, color, rounding, flags, thickness) end


---Draw a progress rectangle.
---@param start Vec2 The starting point of the rectangle.
---@param end_ Vec2 The ending point of the rectangle.
---@param color Color The color of the rectangle.
---@param percent number The percentage of the rectangle to fill [0..1].
---@param rounding number The rounding radius of the rectangle corners.
---@param thickness? number @default: `1.0`. The thickness of the rectangle's border.
---@return nil
function Render.RoundedProgressRect(start, end_, color, percent, rounding, thickness) end


---Draws a line between two points.
---@param start Vec2 The starting point of the line.
---@param end_ Vec2 The ending point of the line.
---@param color Color The color of the line.
---@param thickness? number @default: `1.0`. The thickness of the line.
---@return nil
function Render.Line(start, end_, color, thickness) end


---Draws a series of connected lines (polyline).
---@param points Vec2[] A table of Vec2 points to connect with lines.
---@param color Color The color of the polyline.
---@param thickness? number @default: `1.0`. The thickness of the polyline.
---@return nil
function Render.PolyLine(points, color, thickness) end


---Draws a circle.
---@param pos Vec2 The center position of the circle.
---@param radius number The radius of the circle.
---@param color Color The color of the circle.
---@param thickness? number @default: `1.0`. The thickness of the circle's outline.
---@param startDeg? number @default: `0.0`. The starting degree for drawing the circle. 0 is right side, 90 is bottom, 180 is left, 270 is top.
---@param percentage? number @default: `1.0`. The percentage of the circle to draw, in the range [0.0-1.0].
---@param rounded? boolean @default: `false`. Whether the circle is rounded.
---@param segments? integer @default: `32`. The number of segments used for drawing the circle.
---@return nil
function Render.Circle(pos, radius, color, thickness, startDeg, percentage, rounded, segments) end


---Draws a filled circle.
---@param pos Vec2 The center position of the circle.
---@param radius number The radius of the circle.
---@param color Color The color of the circle.
---@param startDeg? number @default: `0.0`. The starting degree for drawing the circle. 0 is right side, 90 is bottom, 180 is left, 270 is top.
---@param percentage? number @default: `1.0`. The percentage of the circle to draw, in the range [0.0-1.0].
---@param segments? integer @default: `32`. The number of segments used for drawing the circle.
---@return nil
function Render.FilledCircle(pos, radius, color, startDeg, percentage, segments) end


---Draws a circle with a gradient.
---@param pos Vec2 The center position of the circle.
---@param radius number The radius of the circle.
---@param colorOuter Color The outer color of the gradient.
---@param colorInner Color The inner color of the gradient.
---@param startDeg? number @default: `0.0`. The starting degree for drawing the circle. 0 is right side, 90 is bottom, 180 is left, 270 is top.
---@param percentage? number @default: `1.0`. The percentage of the circle to draw, in the range [0.0-1.0].
---@return nil
function Render.CircleGradient(pos, radius, colorOuter, colorInner, startDeg, percentage) end


---Draws a triangle outline.
---@param points Vec2[] A table of three Vec2 points defining the vertices of the triangle.
---@param color Color The color of the triangle's outline.
---@param thickness? number @default: `1.0`. The thickness of the triangle's outline.
---@return nil
function Render.Triangle(points, color, thickness) end


---Draws a filled triangle.
---@param points Vec2[] A table of three Vec2 points defining the vertices of the triangle.
---@param color Color The color of the triangle.
---@return nil
function Render.FilledTriangle(points, color) end


---Draws a textured polygon.
---@param points Vertex[] A table of Vertex points defining the vertices of the polygon. Each Vertex contains a position (Vec2) and a texture coordinate (Vec2).
---@param textureHandle integer The handle to the texture to be applied to the polygon.
---@param color Color The color to apply over the texture. This can be used to tint the texture.
---@param grayscale? number @default: `0.0`. The grayscale of the image.
---@return nil
function Render.TexturedPoly(points, textureHandle, color, grayscale) end


---Loads a font and returns its handle. Returns handle to the loaded font.
---@param fontName string The name of the font to load.
---@param fontFlag? Enum.FontCreate|integer @default: `Enum.FontCreate.FONTFLAG_NONE`. Flags for font creation, such as antialiasing.
---@param weight? integer @default: `400`. The weight (thickness) of the font. Typically, 0 means default weight.
---@return integer
function Render.LoadFont(fontName, fontFlag, weight) end


---Draws text at a specified position.
---@param font integer The handle to the font used for drawing the text.
---@param fontSize number The size of the font.
---@param text string The text to be drawn.
---@param pos Vec2 The position where the text will be drawn.
---@param color Color The color of the text.
---@return nil
function Render.Text(font, fontSize, text, pos, color) end


---Converts a 3D world position to a 2D screen position. Returns A Vec2 representing the 2D screen position and a boolean indicating visibility on the screen.
---@param pos Vector The 3D world position to be converted.
---@return Vec2 screenPos
---@return boolean isVisible
function Render.WorldToScreen(pos) end


---Retrieves the current screen size, returning it as a Vec2 where x is the width and y is the height of the screen.
---@return Vec2
function Render.ScreenSize() end


---Calculates the size of the given text using the specified font, returning the size as a Vec2 where x is the width and y is the height of the text.
---@param font integer The handle to the font used for measuring the text.
---@param fontSize number The size of the font.
---@param text string The text to measure.
---@return Vec2
function Render.TextSize(font, fontSize, text) end


---Loads an image and returns its handle.
---@param path string Path to the image.
---@param filter? Enum.ImageFilter
---@return integer
function Render.LoadImage(path, filter) end


---Draws an image at a specified position and size.
---@param imageHandle integer The handle to the image.
---@param pos Vec2 The position to draw the image.
---@param size Vec2 The size of the image.
---@param color Color The color to tint the image.
---@param rounding? number @default: `0.0`. The rounding radius of the image corners.
---@param flags? Enum.DrawFlags @default: `Enum.DrawFlags.None`. Custom flags for drawing.
---@param uvMin? Vec2 @default: `{0.0, 0.0}`. The minimum UV coordinates for texture mapping.
---@param uvMax? Vec2 @default: `{1.0, 1.0}`. The maximum UV coordinates for texture mapping.
---@param grayscale? number @default: `0.0`. The grayscale of the image.
---@return nil
function Render.Image(imageHandle, pos, size, color, rounding, flags, uvMin, uvMax, grayscale) end


---Draws an image centered at a specified position and size.
---@param imageHandle integer The handle to the image.
---@param pos Vec2 The center position to draw the image.
---@param size Vec2 The size of the image.
---@param color Color The color to tint the image.
---@param rounding? number @default: `0.0`. The rounding radius of the image corners.
---@param flags? Enum.DrawFlags @default: `Enum.DrawFlags.None`. Custom flags for drawing.
---@param uvMin? Vec2 @default: `{0.0, 0.0}`. The minimum UV coordinates for texture mapping.
---@param uvMax? Vec2 @default: `{1.0, 1.0}`. The maximum UV coordinates for texture mapping.
---@param grayscale? number @default: `0.0`. The grayscale of the image.
---@return nil
function Render.ImageCentered(imageHandle, pos, size, color, rounding, flags, uvMin, uvMax, grayscale) end


---Retrieves the size of an image. Returns the size of the image as a Vec2.
---@param imageHandle integer The handle to the image.
---@return Vec2
function Render.ImageSize(imageHandle) end


---Draws a outlined gradient rectangle.
---@param start Vec2 The starting point of the gradient rectangle.
---@param end_ Vec2 The ending point of the gradient rectangle.
---@param topLeft Color The color of the top-left corner.
---@param topRight Color The color of the top-right corner.
---@param bottomLeft Color The color of the bottom-left corner.
---@param bottomRight Color The color of the bottom-right corner.
---@param rounding? number @default: `0.0`. The rounding radius of the rectangle corners.
---@param flags? Enum.DrawFlags @default: `Enum.DrawFlags.None`. Custom flags for drawing.
---@param thickness? number @default: `1.0`. The thickness of the outline.
---@return nil
function Render.OutlineGradient(start, end_, topLeft, topRight, bottomLeft, bottomRight, rounding, flags, thickness) end


---Draws a filled gradient rectangle.
---@param start Vec2 The starting point of the gradient rectangle.
---@param end_ Vec2 The ending point of the gradient rectangle.
---@param topLeft Color The color of the top-left corner.
---@param topRight Color The color of the top-right corner.
---@param bottomLeft Color The color of the bottom-left corner.
---@param bottomRight Color The color of the bottom-right corner.
---@param rounding? number @default: `0.0`. The rounding radius of the rectangle corners.
---@param flags? Enum.DrawFlags @default: `Enum.DrawFlags.None`. Custom flags for drawing.
---@return nil
function Render.Gradient(start, end_, topLeft, topRight, bottomLeft, bottomRight, rounding, flags) end


---Draws a shadow effect within a specified rectangular area.
---@param start Vec2 The starting point of the shadow rectangle.
---@param end_ Vec2 The ending point of the shadow rectangle.
---@param color Color The color of the shadow.
---@param thickness number The thickness of the shadow.
---@param obj_rounding? number @default: `0.0`. The rounding radius of the shadow rectangle corners.
---@param flags? Enum.DrawFlags @default: `Enum.DrawFlags.ShadowCutOutShapeBackground`. Custom flags for drawing the shadow.
---@param offset? Vec2 @default: `{0.0, 0.0}`. The offset of the shadow from the original rectangle.
---@return nil
function Render.Shadow(start, end_, color, thickness, obj_rounding, flags, offset) end


---Draws a circle shadow effect.
---@param center Vec2 The center point of the circle.
---@param radius number The radius of the circle.
---@param color Color The color of the shadow.
---@param thickness number The thickness of the shadow.
---@param num_segments? integer @default: `12`. The number of segments for drawing the circle.
---@param flags? Enum.DrawFlags @default: `Enum.DrawFlags.ShadowCutOutShapeBackground`. Custom flags for drawing the shadow.
---@param offset? Vec2 @default: `{0.0, 0.0}`. The offset of the shadow from the circle.
---@return nil
function Render.ShadowCircle(center, radius, color, thickness, num_segments, flags, offset) end


---Draws a shadow convex polygon effect.
---@param points Vec2[] Table of Vec2 points defining the convex polygon. Should be more than 2 points.
---@param color Color The color of the shadow.
---@param thickness number The thickness of the shadow.
---@param flags? Enum.DrawFlags @default: `Enum.DrawFlags.ShadowCutOutShapeBackground`. Custom flags for drawing the shadow.
---@param offset? Vec2 @default: `{0.0, 0.0}`. The offset of the shadow from the polygon.
---@return nil
function Render.ShadowConvexPoly(points, color, thickness, flags, offset) end


---Draws a shadow n-gon (polygon with n sides) effect.
---@param center Vec2 The center point of the n-gon.
---@param radius number The radius of the n-gon.
---@param color Color The color of the shadow.
---@param thickness number The thickness of the shadow.
---@param num_segments integer The number of segments (sides) of the n-gon.
---@param flags? Enum.DrawFlags @default: `Enum.DrawFlags.ShadowCutOutShapeBackground`. Custom flags for drawing the shadow.
---@param offset? Vec2 @default: `{0.0, 0.0}`. The offset of the shadow from the n-gon.
---@return nil
function Render.ShadowNGon(center, radius, color, thickness, num_segments, flags, offset) end


---Applies a blur effect within a specified rectangular area.
---@param start Vec2 The starting point of the blur rectangle.
---@param end_ Vec2 The ending point of the blur rectangle.
---@param strength? number @default: `1.0`. The strength of the blur effect.
---@param alpha? number @default: `1.0`. The alpha value of the blur effect.
---@param rounding? number @default: `0.0`. The rounding radius of the blur rectangle corners.
---@param flags? Enum.DrawFlags @default: `Enum.DrawFlags.None`. Custom flags for the blur effect.
---@return nil
function Render.Blur(start, end_, strength, alpha, rounding, flags) end


---Begins a new clipping region. Only the rendering within the specified rectangular area will be displayed.
---@param start Vec2 The starting point of the clipping rectangle.
---@param end_ Vec2 The ending point of the clipping rectangle.
---@param intersect? boolean @default: `false`. If true, the new clipping area is intersected with the current clipping area.
---@return nil
function Render.PushClip(start, end_, intersect) end


---Ends the most recently begun clipping region, restoring the previous clipping region.
---@return nil
function Render.PopClip() end


---Begins a new rotation.
---@param angle number The rotation angle.
---@return nil
function Render.StartRotation(angle) end


---End the rotation.
---@return nil
function Render.StopRotation() end


---Set the global alpha value for rendering. 
---@param alpha number The alpha value to set [0..1]
---@return nil
function Render.SetGlobalAlpha(alpha) end


---Reset the global alpha value for rendering to 1.0.
---@return nil
function Render.ResetGlobalAlpha() end
```
