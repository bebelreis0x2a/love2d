--! file: example.lua
local test = 20

function some_function(test)
    if true then
        local test = 40
        print(test)
        --Output: 40
    end
    print(test)
    --Output: 30, 'cause I passed the number 30 into the function below
end

some_function(30)

print(test)
--Output: 20

-- Output: 10, 'cause this value is called through main.lua

local test = 99
return test