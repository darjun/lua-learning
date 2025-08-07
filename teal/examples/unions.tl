local a: string | number | MyRecord
local b: {boolean} | MyEnum
local c: number | {string: number}

-- To use a value of this type, you need to discriminate the variable, using the `is` operator
local a: string | number | MyRecord

if a is string then
    print("Hello, " .. a)
elseif a is number then
    print(a + 10)
else
    print(a.my_record_field)
end

local a: string | number

local x: number = a is number and a + 1 or 0