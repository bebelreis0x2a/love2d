Enemy = Object:extend()

function Enemy:new()
  self.image = love.graphics.newImage('snake.png')
  self.x = 325
  self.y = 450
  self.speed = 100
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
  self.life = 10
  direction = 'right'
end

function Enemy:update(dt)
  local window_width = love.graphics.getWidth()
  
  if self.x + self.width > window_width then
    direction = 'left'
    self.x = window_width - self.width
  end

  if self.x < 0 then
    direction = 'right'
    self.x = 0
  end
  
  if direction == 'right' then
    self.x = self.x + self.speed*dt
  elseif direction == 'left' then
    self.x = self.x - self.speed*dt
  end
  
  if self.life == 0 then
    direction = 0
  end
end


function Enemy:draw()
  love.graphics.draw(self.image, self.x, self.y)
end