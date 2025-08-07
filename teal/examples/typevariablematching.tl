-- given a generic function with the following type:
local my_f: function<T, U>(T): U

-- the following call will infer `T` to `boolean` and `U` to `string`:
local s: string = my_f(true)

-- Note that each type variable is inferred upon its first match, and return types are inferred first, then argument types.
-- This means that if the type signature was instead this:
local my_f: function<T>(T): T

-- then the call above would fail with an error like `argument 1: got boolean, expected string`


local interface Shape
    area: number
end

local function largest_shape<S is Shape>(a: S, b: S): S
    if a.area > b.area then
        return a
    else
        return b
    end
end

-- When attempting to use this with different kinds of shapes at the same time, we will get an error:
local record Circle is Shape
end

local record Square is Shape
end

local c: Circle = { area = 10 }
local s: Square = { area = 20 }

local l = largest_shape(c, s) -- error! argument 2: Square is not a Circle

-- The type variable S was matched to c first. We can instead do this:
local function largest_shape<S is Shape, T is Shape>(a: S, b: T): S | T
    if a.area > b.area then
        return a
    else
        return b
    end
end

-- we add a `name` to the interface
local interface Shape
    name: string
    area: number
end

local function largest_shape<S is Shape, T is Shape>(a: S, b: T): S | T
    if a.area > b.area then
        return a
    else
        return b
    end
end

-- we add `where` clauses to Circle and Square
local record Circle
    is Shape
    where self.name == "circle"
end

local record Square
    is Shape
    where self.name == "square"
end

-- we add the `name` fields so that the tables conform to their types;
-- in larger programs this would be typically done in constructor functions
local c: Circle = { area = 10, name = "circle" }
local s: Square = { area = 20, name = "square" }

local l = largest(c, s)
