function love.load()
  r1 = {}
  r1.x = 30
  r1.y = 30
  r1.width = 30
  r1.height = 30
  
  r2 = {
    x = 250,
    y = 120,
    width = 150,
    height = 120
  }
end

function love.update(dt)
  
    if checkCollision(r1, r2) then
      r1.x = lastX
      r1.y = lastY
    else
      lastX = r1.x
      lastY = r1.y
    end
  
    if love.keyboard.isDown("right") then
    r1.x = r1.x + 100 * dt
  elseif love.keyboard.isDown("left") then
    r1.x = r1.x - 100 * dt
  elseif love.keyboard.isDown("up") then
    r1.y = r1.y - 100 * dt
  elseif love.keyboard.isDown("down") then
    r1.y = r1.y + 100 * dt
  end
end

function love.draw()
  
  local mode
  
  if checkCollision(r1, r2) then
    mode = "fill"
  else
    mode = "line"
  end
  
  love.graphics.rectangle(mode, r1.x, r1.y, r1.width, r1.height)
  
  love.graphics.rectangle(mode, r2.x, r2.y, r2.width, r2.height)
end

 -- it's too easy! ><
function checkCollision(a, b)
  local a_left = a.x
  local a_right = a.x + a.width -- cuz the right side is the vertex (x point) plus the width of the rectangle
  local a_top = a.y
  local a_bottom = a.y + a.height
  -- cuz the top side is the vertex (y point) plus the height of the rectangle
  
  local b_left = b.x
  local b_right = b.x + b.width
  local b_top = b.y
  local b_bottom = b.y + b.height
  
  return a_right > b_left
    and a_left < b_right
    and  a_bottom > b_top-- I think it's backwards cuz the coordinates in the games on the y line are backwards by default
    and a_top < b_bottom
end