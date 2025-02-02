Player = Object:extend()

function Player:new()
  self.x = 10
  self.y = 303
  self.width = 20
  self.height = 100
  self.speed = 500
  self.points = 0
  self.lastTouch = false
end

function Player:update(dt)
  if love.keyboard.isDown('up') then
    self.y = self.y - self.speed * dt
  elseif love.keyboard.isDown('down') then
    self.y = self.y + self.speed * dt
  end
    
  local window_height = love.graphics.getHeight()
    
  if self.y < 0 then
    self.y = 0
  elseif self.y + self.height > window_height then
    self.y = window_height - self.height 
  end
end

function Player:draw()
  love.graphics.print("Player's points: " .. self.points, 35, 10)
  love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

function Player:pointsBall(a)
  if a.x > love.graphics.getWidth() then
    self.points = self.points + 1
    
    a.x = 500
    a.y = 400
    a.speed = 300
    a.radius = 5
    a.directionX = -1
    a.directionY = -1
  
    a.firstCollision = false
    
    self.y = 303
  end
end