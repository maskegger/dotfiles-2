PUSH [===[]===]
if VERSION <= 5.2 then DISABLE() end
PUSH [===[
---@meta

---@version >5.3
]===]
DES 'utf8'
PUSH [===[
---@class utf8lib
]===]
DES 'utf8.charpattern'
PUSH [===[
---@field charpattern string
utf8 = {}

]===]
DES 'utf8.char'
PUSH [===[
---@param code integer
---@vararg integer
---@return string
function utf8.char(code, ...) end

]===]
DES 'utf8.codes'
PUSH [===[
]===]
if VERSION <= 5.3 then
PUSH [===[
---@param s    string
---@return fun():integer, integer
function utf8.codes(s) end
]===]
else
PUSH [===[
---@param s    string
---@param lax? boolean
---@return fun():integer, integer
function utf8.codes(s, lax) end
]===]
end
PUSH [===[

]===]
DES 'utf8.codepoint'
PUSH [===[
]===]
if VERSION <= 5.3 then
PUSH [===[
---@param s    string
---@param i?   integer
---@param j?   integer
---@return integer code
---@return ...
function utf8.codepoint(s, i, j) end
]===]
else
PUSH [===[
---@param s    string
---@param i?   integer
---@param j?   integer
---@param lax? boolean
---@return integer code
---@return ...
function utf8.codepoint(s, i, j, lax) end
]===]
end
PUSH [===[

]===]
DES 'utf8.len'
PUSH [===[
]===]
if VERSION <= 5.3 then
PUSH [===[
---@param s    string
---@param i?   integer
---@param j?   integer
---@return integer?
---@return integer? errpos
function utf8.len(s, i, j) end
]===]
else
PUSH [===[
---@param s    string
---@param i?   integer
---@param j?   integer
---@param lax? boolean
---@return integer?
---@return integer? errpos
function utf8.len(s, i, j, lax) end
]===]
end
PUSH [===[

]===]
DES 'utf8.offset'
PUSH [===[
---@param s string
---@param n integer
---@param i integer
---@return integer p
function utf8.offset(s, n, i) end

return utf8
]===]