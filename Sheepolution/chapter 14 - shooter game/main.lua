function love.load()
  Object = require "classic"
  require "player"
  require "enemy"
  require "bullet"
  
  font = love.graphics.newFont(25)
  
  player = Player()
  enemy = Enemy()
  listOfBullets = {}
end

function love.update(dt)
  player:update(dt)
  enemy:update(dt)
  
  for i, j in ipairs(listOfBullets) do
    j:update(dt)
    j:checkCollision(enemy)
    
    if j.dead then -- for remove the bullets
      table.remove(listOfBullets, i)
    end
  end
end

function love.keypressed(key)
  player:keyPressed(key)
end

function love.draw()
  player:draw()
  enemy:draw()
  
  for i, j in ipairs(listOfBullets) do
    j:draw()
  end
  
  love.graphics.setFont(font)
  
  if enemy.life > 0 then
    love.graphics.print("Enemy's life: " .. enemy.life, 3, 3)
  else
    love.graphics.print("YOU WIN!", 3, 3)
  end
end