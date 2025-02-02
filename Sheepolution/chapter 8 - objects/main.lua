function love.load()
  listOfRectangles = {}
end

function createRect(a, b, c, d, e)
  local rect = {} -- create a table
  
  -- rect["width"] = 100 or
  rect.x = a
  rect.y = b
  rect.width = c
  rect.height = d
  rect.speed = e
  
  table.insert(listOfRectangles, rect)
end

function love.keypressed(key)
  if key == "space" then
    createRect(100, math.random(100, 500), 70, 90, math.random(10, 100))
  end
end

function love.update(dt)
  for i, v in ipairs(listOfRectangles) do
    v.x = v.x + v.speed * dt
    
    if v == 800 then
      v.x = 1
    end
  end
end

function love.draw()
    love.graphics.print("Press 'space' key to start!", 20, 20)
  
  for i,v in ipairs(listOfRectangles) do
    love.graphics.rectangle("line", v.x, v.y, v.width, v.height)
  end
end

--[[
An object can also have functions. You create a function for an object like this:

tableName.functionName = function ()

end

-- Or the more common way
function tableName.functionName()

end
]]--