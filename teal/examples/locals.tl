-- it is not valid in Teal to declare a variable with no type:
local x -- Error!

-- declaration
local s: string
local r, g, b: number, number, number
local ok: boolean

-- initialization
local s = "hello"
local r, g, b = 0, 128, 128
local ok = true

-- 
local n: number = nil
