-- Snake Game by Bebel
-- Based in this tutorial: https://berbasoft.com/simplegametutorials/love/snake/
-- I don't used some things of this tutorial like direction queue because I wanted to make a game the way I imagined it when I was a kid


function love.load()
  
  gridXCount = 20
  gridYCount = 15
  cellSize = 15
  
  love.window.setMode(gridXCount * cellSize, gridYCount * cellSize)
  
  snake = {
      {x = 3, y = 1},
      {x = 2, y = 1},
      {x = 1, y = 1},
    }
    
    snakeAlive = true
    timer = 0
    direction = 'right'
    
    food = {
        x = love.math.random(0, gridXCount),
        y = love.math.random(0, gridYCount),
      }
    
end

function love.update(dt)
  timer = timer + dt
  if timer >= 0.2 and snakeAlive == true then
    timer = 0
    
    local nextXPos = snake[1].x
    local nextYPos = snake[1].y
    
    if direction == 'right' then
      nextXPos = nextXPos + 1
    -- Here, I increase the first x position of my snake (i.e, the most ahead position in the x scale) by 1 for then I can add this new position on the loop (using table.insert) and after remove the last position (using table.remove)
    elseif direction == 'left' then
      nextXPos = nextXPos - 1
    elseif direction == 'up' then
      nextYPos = nextYPos - 1
    elseif direction == 'down' then
      nextYPos = nextYPos + 1
    end
    
    if nextXPos >= gridXCount then
      nextXPos = 0
    elseif nextXPos < 0 then
      nextXPos = gridXCount
      elseif nextYPos >= gridYCount then
      nextYPos = 0
      elseif nextYPos < 0 then
      nextYPos = gridYCount
    end

    if snake[1].x == food.x and snake[1].y == food.y then
      food.x = love.math.random(2, gridXCount - 1)
      food.y = love.math.random(2, gridYCount - 1)
      table.insert(snake, 1, {x = nextXPos, y = nextYPos})
      
      eating = true
    end
    
    for i, j in ipairs(snake) do
      if eating ~= true and nextXPos == j.x and nextYPos == j.y then
        snakeAlive = false
      end
    end
    
    table.insert(snake, 1, {x = nextXPos, y = nextYPos})
    table.remove(snake, #snake)
    
    eating = false
  end
end

function love.keypressed(key)
  if key == 'left' then
    direction = 'left'
  elseif key == 'right' then
    direction = 'right'
  elseif key == 'up' then
    direction = 'up'
  elseif key == 'down' then
    direction = 'down'
  end
end

function love.draw()
  
  if snakeAlive == false then
    love.graphics.setBackgroundColor(1, 0, 0)
  end
  
  love.graphics.setColor(0.5, 0.5, 1)
  love.graphics.rectangle('fill', 0, 0, gridXCount*cellSize, gridYCount*cellSize)
  
  for i, j in ipairs(snake) do
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle('fill', j.x * cellSize, j.y * cellSize, cellSize, cellSize)
  end
  
  love.graphics.rectangle('fill', food.x * cellSize, food.y * cellSize, cellSize, cellSize)
end