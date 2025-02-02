Enemy = Object:extend()

function Enemy:new()
  self.x = love.graphics.getWidth() - 30
  self.y = 250
  self.width = 20
  self.height = 100
  self.speed = 500
  self.points = 0
  self.lastTouch = false
end

function Enemy:followBall(a, dt)
  
  self.y = -97 + a.y
  
  local window_height = love.graphics.getHeight()
    
  if self.y < 0 then
    self.y = 0
  elseif self.y + self.height > window_height then
    self.y = window_height - self.height 
  end
end

function Enemy:draw()
  love.graphics.print("Enemy's points: " .. self.points, love.graphics.getWidth() - 150, 10)
  love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

function Enemy:pointsBall(a, b)
  if a.x < 0 then
    self.points = self.points + 1
    
    a.x = 500
    a.y = 400
    a.speed = 300
    a.radius = 5
    a.directionX = -1
    a.directionY = -1
  
    a.firstCollision = false
    
    b.y = 303
  end
end