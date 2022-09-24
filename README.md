# luaMatrices

## Features

* plain Lua matrix library
* supports addition (+), subtraction (-), multiplication (*), division (/) (number only), and pow (^)
* supports equals (==)
* supports clone(), transpose(), trace(), inverse() and det()
* supports vec2, vec3 and vec4 multiplication, (vector lib required, mat4 supports multiplication with vec4 and vec3, mat3 with vec3 and vec2)
* supports toString()
* supports unpack() to get a 2d array format
* uses get(x, y) and set(x, y, value)
* uses getCol(x) and getRow(y) to return vector (vector lib required)
* can be indexed by 1, 2, 3, ...

## Usage

```lua
local mat2 = require("luaMatrices/mat2")
local mat3 = require("luaMatrices/mat3")
local mat4 = require("luaMatrices/mat4")

--create matrix
local m1 = mat3(1, 2, 3, 4, 5, 6, 7, 8, 9)
local m2 = mat3({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }) --recommended
local m3 = mat3({ { 1, 2, 3 }, { 4, 5, 6 }, { 7, 8, 9 } }) --slower

--use operators
local m4 = m1 * m2
local det = m1:det()

--transform vector
local v1 = mat3.getIdentity():rotate(math.pi):scale(2) * vec2(3, 4)
```

## contribution

Please notify me about errors, contributions are welcome.