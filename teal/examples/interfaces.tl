-- Interfaces are abstract records.
-- A concrete record is a type declared with record, which can be used both as a Lua table and as a type
local record MyConcreteRecord
    a: string
    x: integer
    y: integer
end

MyConcreteRecord.a = "this works"

local obj: MyConcreteRecord = { x = 10, y = 20 } -- this works too

-- An interface is abstract. It can declare fields, including those of function type, but they cannot hold concrete values on their own.
-- Instances of an interface can hold values.
local interface MyAbstractInterface
    a: string
    x: integer
    y: integer
    my_func: function(self, integer)
    another_func: function(self, integer, self)
end

MyAbstractInterface.a = "this doesn't work" -- error!

local obj: MyAbstractInterface = { x = 10, y = 20 } -- this works

-- error! this doesn't work
function MyAbstractInterface:my_func(n: integer)
end

-- however, this works
obj.my_func = function(self: MyAbstractInterface, n: integer)
end

-- records can inherit interfaces using `is`:
local record MyRecord is MyAbstractInterface
    b: string
end

local r: MyRecord = {}
r.b = "this works"
r.a = "this works too because 'a' comes from MyAbstractInterface"

-- Records and interfaces can inherit from multiple interfaces, as long as their component parts are compatible
local interface Shape
    x: number
    y: number
end

local interface Colorful
    r: integer
    g: integer
    b: integer
end

local interface SecondPoint
    x2: number
    y2: number
    get_distance: function(self): number
end

local record Line is Shape, SecondPoint
end

local record Square is Shape, SecondPoint, Colorful
    get_area: function(self): number
end

--[[
-- this produces a record with these fields,
-- but Square also satisfies `Square is Shape`,
-- `Square is SecondPoint`, `Square is Colorful`
local record Square
    x: number
    y: number
    x2: number
    y2: number
    get_distance: function(self): number
    r: integer
    g: integer
    b: integer
    get_area: function(self): number
end
]]
