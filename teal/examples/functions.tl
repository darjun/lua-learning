local type Comparator = function<T>(T, T): boolean

local function mysort<A>(arr: {A}, cmp?: Comparator<A>)
    -- ...
end

local function allwords(): (function():string)
    local line = io.read()
    local pos = 1
    return function(): string
        while line do
            local s, e = line:find("%w+", pos)
            if s then
                pos = e + 1
                return line:sub(s, e)
            else
                line = io.read()
                pos = 1
            end
        end
        return nil
    end
end

for word in allwords() do
    print(word)
end

-- Variadic functions can be declared by specifying `...` as the last argument of the function
local function test(...: number)
    print(...)
end

test(1, 2, 3)

-- you may also declare variadic return types by using the `type...` syntax
local function test(...:number): number...
    return ...
end

local a, b, c = test(1, 2, 3)

local s = { 1234, "ola" }
local a, b = table.unpack as (number, string)

print(a + 1)        -- `a` has type number
print(b:upper())    -- `b` has type string
