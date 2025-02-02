function love.load()
  Object = require "classic"
  require "player"
  require "enemy"
  require "ball"
  
  player = Player()
  ball = Ball()
  enemy = Enemy()
end

function love.update(dt)
  player:update(dt)
  ball:update(dt)
  enemy:followBall(ball, dt)
  enemy:pointsBall(ball, player)
  player:pointsBall(ball)
  ball:checkCollision(player)
  ball:checkCollision(enemy)
end

function love.draw()
  player:draw()
  ball:draw()
  enemy:draw()
  
  love.graphics.print("You will never beat your enemy in this game, accept it that hurts less", 35, 50)
end