Ball = Object:extend()

function Ball:new()
  self.x = 500
  self.y = 400
  self.speed = 300
  self.radius = 5
  self.directionX = -1
  self.directionY = -1
  
  self.firstCollision = false
end

function Ball:update(dt)

  if self.directionX == 1 then
    self.x = self.x + self.speed * dt
  elseif self.directionX == -1 then
    self.x = self.x - self.speed * dt
  end
  

  if self.y < 3  or self.y > love.graphics.getHeight() then
    self.directionY = self.directionY * -1
  end
  
  if self.firstCollision and self.directionY == -1 then
    self.y = self.y - self.speed * dt
  elseif self.firstCollision and self.directionY == 1  then
    self.y = self.y + self.speed * dt
  end
end


function Ball:draw()
  love.graphics.circle('fill', self.x, self.y, self.radius)
end

function Ball:checkCollision(obj)
  local self_left = self.x
  local self_right = self.x + self.radius
  local self_top = self.y
  local self_bottom = self.y + self.radius
  
  local obj_left = obj.x
  local obj_right = obj.x + obj.width
  local obj_top = obj.y
  local obj_bottom = obj.y + obj.height
  
  if self_right > obj_left
  and self_left < obj_right
  and self_bottom > obj_top
  and self_top < obj_bottom then
    self.directionX = self.directionX * -1
    self.firstCollision = true
  end
end