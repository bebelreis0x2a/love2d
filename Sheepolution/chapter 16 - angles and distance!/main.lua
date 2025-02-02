function love.load()
  circle = {
    x = 100,
    y = 100,
    radius = 25,
    speed = 200,
  }
end

-- To move the circle towards the cursor, we need to know the angle. We can get the angle with the function math.atan2. The first argument is the y-position you WANT TO GO TO, minus YOUR object's y-position.

function love.update(dt)
  mouse_x, mouse_y = love.mouse.getPosition()
  
  angle = math.atan2(mouse_y - circle.y, mouse_x - circle.x)
  
  cos = math.cos(angle) -- cos angle = x coordinate where terminal side of the angle intersects unit circle
  sin = math.sin(angle) -- sin angle = y coordinate where terminal side of the angle intersects unit circle

  circle.x = circle.x + circle.speed * cos * dt
  circle.y = circle.y + circle.speed * sin * dt
end

function getDistance(x1, y1, x2, y2)
  
  local horizontal_distance = x1 - x2
  local vertical_distance = y1 - y2

  local a = horizontal_distance ^ 2
  local b = vertical_distance ^ 2
  
  local c = a + b
  local distance = math.sqrt(c)
  return distance
end

function love.draw()
  love.graphics.circle("line", circle.x, circle.y, circle.radius)
  
  love.graphics.print("angle: " .. angle, 10, 10)
  love.graphics.print("PI: " .. math.pi, 300, 10)
  
  -- to visualize mouse x, mouse y and the angle
  
  love.graphics.line(circle.x, circle.y, mouse_x, circle.y)
  love.graphics.line(mouse_x, circle.y, mouse_x, mouse_y)
  love.graphics.line(circle.x, circle.y, mouse_x, mouse_y) 
  
  local distance = getDistance(circle.x, circle.y, mouse_x, mouse_y)
  love.graphics.circle("line", circle.x, circle.y, distance)
  
end