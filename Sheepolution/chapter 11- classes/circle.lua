Circle = Shape:extend()
 
function Circle:new(x, y, radius)
  Circle.super.new(self, x, y)
  
  -- The super new is used to get access to shape and call Shape:new(). That's why I don't use :-sign here!
  
  self.radius = radius
end
 
function Circle:draw()
  love.graphics.circle("line", self.x, self.y, self.radius)
end