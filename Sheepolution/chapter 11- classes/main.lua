function love.load()
  Object = require "classic"
  require "shape"
  require "rectangle"
  require "circle"
 
  r1 = Rectangle(100, 100, 100, 20)
  r2 = Circle(80, 50, 30)
end
 
function love.update(dt)
  r1:update(dt)
  r2:update(dt)
end
 
function love.draw()
  r1:draw()
  r2:draw()
end