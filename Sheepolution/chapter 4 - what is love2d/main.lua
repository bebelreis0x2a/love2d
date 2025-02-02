function love.load()
  x = 250
  y = 500
  a = 10
  b = 10
  move = true
end

function love.draw()
  love.graphics.rectangle("fill", 100, 200, 80, 80)
  love.graphics.rectangle("fill", x, y, 160, 80)
  
  if 4 ~= 5 then
    love.graphics.rectangle("line", a, b, 50, 50)
  end
end

function love.update(dt)
  print(dt)
  if move then
    if x <= 800 then
      x = x + 500 * dt
    else
      x = 1
    end
  end
  
  if love.keyboard.isDown("right") then
    a = a + 100 * dt
  elseif love.keyboard.isDown("left") then
    a = a - 100 * dt
  elseif love.keyboard.isDown("up") then
    b = b - 100 * dt
  elseif love.keyboard.isDown("down") then
    b = b + 100 * dt
  end
end