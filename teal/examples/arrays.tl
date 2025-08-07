-- Arrays are described with curly brace notation, and can be denoted via declaration or initialization
local values: {number}
local names = {"John", "Paul", "George", "Ringo"}

-- To initialize it with an empty table, you have to do so explicitly
local prices: {number} = {}

-- Creating empty tables to fill an array is so common that Teal includes a naive inference logic to support determining the type of empty tables with no declaration. 
local lengths = {}
for i, n in ipairs(names) do
    table.insert(lengths, #n)   -- this make the lengths table a {number}
end

-- Note that all items of the array are expected to be of the same type.
-- If you need to deal with heterogeneous arrays, you will have to use the cast operator as to force the elements to their desired types.
-- Keep in mind that when you use as, Teal will accept whatever type you use, meaning that it can also hide incorrect usage of data
local sizes: {number} = {34, 36, 38}
sizes[#sizes+1] = true as number -- this does not perform a conversion! it will just stop tl from complaining!
local sum = 0
for i = 1, #sizes do
    sum = sum + sizes[i]    -- will crash at runtime!
end

