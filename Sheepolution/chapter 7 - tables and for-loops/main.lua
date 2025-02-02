function love.load()
  fruits = {"avocado", "mango"}
  table.insert(fruits, "pineapple")
  table.insert(fruits, "tomato")
  table.remove(fruits, 3)
  fruits[3] = "banana"
  
  -- OUTPUT: avocado, mango, banana
  
  for i=1, #fruits do -- #-sign is the length of a table
    print(i .. ": " .. fruits[i])
  end
  
  -- Or I can do that:
  
  for i,v in ipairs(fruits) do -- v is equal to fruits[i]
    print(i, ":", v)
  end
end

function love.draw()
  for i=1, #fruits do
    love.graphics.print(i .. ": " .. fruits[i], 100, 20*i)
  end
  
  -- Or I can do that:
  
  for i,v in ipairs(fruits) do
    love.graphics.print(i .. ": " .. v, 600, 20 * i)
  end
end