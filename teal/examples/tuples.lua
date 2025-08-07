local _tl_compat; if (tonumber((_VERSION or ''):match('[%d.]*$')) or 0) < 5.3 then local p, m = pcall(require, 'compat53.module'); if p then _tl_compat = m end end; local math = _tl_compat and _tl_compat.math or math; local type = type
local p1 = { "Anna", 15 }
local p2 = { "Bob", 37 }
local p3 = { "Chris", 65 }


local my_number = math.random(1, 2)
local x = p1[my_number]
if type(x) == "string" then
   print("Name is " .. x .. "!")
else
   print("Age is " .. x)
end
