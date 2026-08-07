# Color

Color metatable

### Fields

| Name | Type | Description |
| --- | --- | --- |
| **r** | **`number`** | red |
| **g** | **`number`** | green |
| **b** | **`number`** | blue |
| **a** | **`number`** | alpha |

## \_\_eq

`:__eq(other):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`Color`**](Color.md) |  |

Compares two colors for equality.

## Set

`:Set(r, g, b, [a]):` [**`Color`**](Color.md)

| Name | Type | Description |
| --- | --- | --- |
| **r** | **`number`** |  |
| **g** | **`number`** |  |
| **b** | **`number`** |  |
| **a ****`[?]`** | **`number`** | `(default: 255)` |

Sets r, g, b, a components. Returns self for chaining.

## LerpInPlace

`:LerpInPlace(other, t):` [**`Color`**](Color.md)

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`Color`**](Color.md) |  |
| **t** | **`number`** |  |

Linearly interpolates this color towards other in-place. Returns self for chaining.

## IsZero

`:IsZero([tolerance]):` **`boolean`**

| Name | Type | Description |
| --- | --- | --- |
| **tolerance ****`[?]`** | **`number`** | `(default: 0.01)` |

Returns true if all components are near zero within tolerance.

## Color

`Color([r], [g], [b], [a]):` [**`Color`**](Color.md)

| Name | Type | Description |
| --- | --- | --- |
| **r ****`[?]`** | **`number`** | `(default: 255)` |
| **g ****`[?]`** | **`number`** | `(default: 255)` |
| **b ****`[?]`** | **`number`** | `(default: 255)` |
| **a ****`[?]`** | **`number`** | `(default: 255)` |

Create a new Color.

## Color

`Color(hex):` [**`Color`**](Color.md)

| Name | Type | Description |
| --- | --- | --- |
| **hex** | **`string`** | Hex string. Do not use "#" symbol. |

Create a new Color from hex string.

## AsFraction

`:AsFraction(r, g, b, a):` [**`Color`**](Color.md)

| Name | Type | Description |
| --- | --- | --- |
| **r** | **`number`** | New R color range as a percentage in the range \[0.0, 1.0] |
| **g** | **`number`** | New G color range as a percentage in the range \[0.0, 1.0] |
| **b** | **`number`** | New B color range as a percentage in the range \[0.0, 1.0] |
| **a** | **`number`** | New A color range as a percentage in the range \[0.0, 1.0] |

Overwrites the color's ranges using the fraction values. Returns itself.

## AsInt

`:AsInt(value):` [**`Color`**](Color.md)

| Name | Type | Description |
| --- | --- | --- |
| **value** | **`number`** | int color value |

Overwrites the color's ranges converting the int value to RGBA values. Returns\
itself.

## AsHsv

`:AsHsv(h, s, v, a):` [**`Color`**](Color.md)

| Name | Type | Description |
| --- | --- | --- |
| **h** | **`number`** | Hue color range \[0.0, 1.0] |
| **s** | **`number`** | Saturation color range \[0.0, 1.0] |
| **v** | **`number`** | Value color range \[0.0, 1.0] |
| **a** | **`number`** | Alpha color range \[0.0, 1.0] |

Overwrites the color's ranges converting the HSV to RGBA values. Returns itself.

## AsHsl

`:AsHsl(h, s, l, a):` [**`Color`**](Color.md)

| Name | Type | Description |
| --- | --- | --- |
| **h** | **`number`** | Hue color range \[0.0, 1.0] |
| **s** | **`number`** | Saturation color range \[0.0, 1.0] |
| **l** | **`number`** | Lightness color range \[0.0, 1.0] |
| **a** | **`number`** | Alpha color range \[0.0, 1.0] |

Overwrites the color's ranges converting the HSL to RGBA values. Returns itself.

## ToFraction

`:ToFraction():` **`number`**, **`number`**, **`number`**, **`number`**

Returns the r, g, b, and a ranges of the color as a percentage in the range of\
\[0.0, 1.0].

## ToInt

`:ToInt():` **`number`**

Returns the int value representing the color.

## ToHsv

`:ToHsv():` **`number`**, **`number`**, **`number`**

Returns the HSV representation of the color.

## ToHsl

`:ToHsl():` **`number`**, **`number`**, **`number`**

Returns the ToHsl representation of the color.

## ToHex

`:ToHex():` **`string`**

Returns the hex string representing the color.

## Lerp

`:Lerp(other, weight):` [**`Color`**](Color.md)

| Name | Type | Description |
| --- | --- | --- |
| **other** | [**`Color`**](Color.md) | The color to interpolate to |
| **weight** | **`number`** | A value between 0 and 1 that indicates the weight of **other** |

Returns the linearly interpolated color between two colors by the specified weight.

## Grayscale

`:Grayscale(weight):` [**`Color`**](Color.md)

| Name | Type | Description |
| --- | --- | --- |
| **weight** | **`number`** | A value between 0 and 1 that indicates the weight of **grayscale** |

Returns the grayscaled color.

## AlphaModulate

`:AlphaModulate(alpha):` [**`Color`**](Color.md)

| Name | Type | Description |
| --- | --- | --- |
| **alpha** | **`number`** | Alpha color range \[0.0, 1.0] |

Returns the alpha modulated color.

## Clone

`:Clone():` [**`Color`**](Color.md)

Creates and returns a copy of the color object.

## Unpack

`:Unpack():` **`number`**, **`number`**, **`number`**, **`number`**

Returns the r, g, b, and a values of the color. Note that these fields can be\
accessed by indexing r, g, b, and a.

## \_\_tostring

`:__tostring():` **`string`**

Returns hex string representing the color.
