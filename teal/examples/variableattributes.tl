local xs <const> = {1,2,3}
xs[1] = 999 -- ok! the array is not frozen
xs = {} -- Error! can't replace the array in variable xs

-- The `<close>` annotation from Lua 5.4 is only supported in Teal if your code generation target is Lua 5.4
local contents = {}
for _, name in ipairs(filenames) do
    local f <close> = assert(io.open(name, "r"))
    contents[name] = f:read("*a")
    -- no need to call f:close() because files have a __close metamethod
end

-- It declares a const variable assigned to a table value in which all possible keys need to be explicitly declared
-- Note that you can only use <total> when assigning to a literal table value
-- Enums are the prime case for total variables: it is common to declare a number of cases in an enum and then to have a map of values that handle each of these cases.
-- By declaring that map <total> you can be sure that you won't forget to add handlers for the new cases as you add new entries to the enum.
local degrees: <total>: {Direction:number} = {
    ["north"] = 0,
    ["west"] = 90,
    ["south"] = 180,
    ["east"] = 270,
}

-- if you later update the `Direction` enum to add new directions
-- such as "northeast" and "southwest", the above declaration of
-- `degrees` will issue a compile-time error, because the table
-- above is no longer total!

-- By marking a record variable as `<total>`, you make it so it becomes mandatory to declare all its fields in the given initialization table
local record Color
    red: integer
    green: integer
    blue: integer
end

local teal_color <total>: Color = {
    red = 0,
    green = 128,
    blue = 128,
}

-- if you later update the `Color` record to add a new component
-- such as `alpha`, the above declaration of `teal_color`
-- will issue a compile-time error, because the table above
-- is no longer total!

--  it will still accept an assignment to nil as a valid declaration.
-- The rationale is that an explicit nil entry means that the programmer did consider that case, and chose to keep it empty
local vertical_only <total>: {Direction:MotionCallback} = {
    ["north"] = move_up,
    ["west"] = nil,
    ["south"] = move_down,
    ["east"] = nil,
}

-- This declaration is fine: the map is still total, as we are
-- explicitly mentioning which cases are left empty in it.

