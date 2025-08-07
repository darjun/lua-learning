-- records: tables with a set of string keys known in advance, each of them corresponding to a possibly different value type

-- To declare a record variable, you need to create a record type first.
-- The type describes the set of valid fields (keys of type string and their values of specific types) this record can take.
-- You can declare types using local type and global types using global type
local type Point = record
    x: number
    y: number
end

-- another declaration of record types:
local record Point
    x: number
    y: number
end

local p: Point = {x = 100, y = 100}

local record Vector
    x: number
    y: number
end

local p1: Vector = { x = 100, y = 100 }
local p2: Point = v1 -- Error!

-- You can always force a type using the `as` operator
local p2 = v1 as Point

-- You can also declare record functions after the record definition using the regular Lua colon or dot syntax, as long as you do it in the same scope block where the record type is defined
function Point.new(x: number, y: number): Point
    local self: Point = setmetatable({}, {{__index = Point}})
    self.x = x or 0
    self.y = y or 0
    return self
end

function Point:move(dx: number, dy: number)
    self.x = self.x + dx
    self.y = self.y + dy
end

-- If you want to define the function in a later scope, you can declare the type of the function field in the record and fill it later from anywhere
local record Obj
    location: Point
    draw: function(Obj)
end

-- A record can also store array data, by declaring an array interface.
-- You can use it both as a record, accessing its fields by name, and as an array, accessing its entries by number.
-- A record can have only one array interface
local record Node is {Node}
    weight: number
    name: string
end

-- records can contain nested record type definitions.
-- This is useful when exporting a module as a record, so that the types created in the module can be used by the client code which requires the module
local record http
    record Response
        status_code: number
    end

    get: function(string):Response
end

return http

local http = require("http")

local x: http.Response = http.get("http://example.com")
print(x.status_code)
