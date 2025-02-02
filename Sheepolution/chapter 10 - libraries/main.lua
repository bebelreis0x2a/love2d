function love.load()
  tick = require "tick"
  
  drawRectangle = false
  
  tick.delay(function() drawRectangle = true end, 2) 
  --The first argument is a function, the second argument us the time in seconds it takes to call the function
  
end

function love.update(dt)
  tick.update(dt)
end

function love.draw()
  if drawRectangle then
    love.graphics.rectangle("fill", math.random(100, 500), math.random(100, 300), 30, 30)
  end
end