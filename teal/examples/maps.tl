-- map: a table where all keys of one given type, and all values are of another given type
-- Maps are notated with curly brackets and a colon:
local populations: {string:number}
local complicated: {Object:{string:{Point}}} = {}
local modes = { -- this is [boolean:number]
    [false] = 127,
    [true] = 230,
}

-- When creating a map with string keys you may want to declare its type explicitly, so it doesn't get mistaken for a record
local is_vowel: {string:boolean} = {
    a = true,
    e = true,
    i = true,
    o = true,
    u = true,
}