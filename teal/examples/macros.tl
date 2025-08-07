-- Macro expressions are always expanded inline in the generated Lua code. The declaration itself produces no Lua code.
local macroexp add(a: number, b: number)
    return a + b
end

-- restrictions:
-- * the body of the macro expression can only contain a single return statement with a single expression
-- * each argument can only be used once in the macroexp body
-- you can also declare a macroexp inline in a record definition
local record R
    x: number
    get_x: function(self): number = macroexp(self: R): number
        return self.x
    end
end

local r: R = { x = 10 }
print(r:get_x())

-- generates
local r: R = { x = 10 }
print(r.x)

-- You can also use them for metamethods: this will cause the metamethod to be expanded at compile-time, without requiring a metatable
local record R
    x: number

    metamethod __lt: function (a:R, b:R) = macroexp(a: R, b: R)
        return a.x < b.x
    end
end

local r: R = { x = 10 }
local s: R = { x = 20 }
if r > s then
    print("yes")
end

-- generates
local r = { x  = 10 }
local s = { x =  20 }
if s.x < r.x then
    print("yes")
end

-- This is used to implement the pseudo-metamethod `__is`, which is used to resolve the `is` operator.
-- The where construct is syntax sugar to an __is declaration
local record MyRecord is MyInterface
    where self.my_field == "my_record"
end

-- ...is the same as:

local record MyRecord is MyInterface
    metamethod __is: function(self:MyRecord): boolean = macroexp(self:MyRecord): boolean
        return self.my_field == "my_record"
    end
end