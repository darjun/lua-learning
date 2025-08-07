local function keys<K,V>(xs: {K:V}): {K}
    local ks = {}
    for k, v in pairs(xs) do
        table.insert(ks, k)
    end
    return ks
end

local s = keys({ a = 1, b = 1 }) -- s is {string}

local type Tree = record<X>
    {Tree<X>}
    item: X
end

local t: Tree<number> = {
    item = 1,
    { item = 2 },
    { item = 3, { item = 4 } },
}

-- A type variable can be constrained by an interface, using `is`:
local function largest_shape<S is Shape>(shapes: {S}): S
    local max = 0
    local largest: S
    for _, s in ipairs(shapes) do
        if s.area >= max then
            max = s.area
            largest = s
        end
    end
    return largest
end
