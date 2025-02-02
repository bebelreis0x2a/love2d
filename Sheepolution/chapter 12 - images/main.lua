function love.load()
  myImage = love.graphics.newImage("sheep.png")
  -- All image must be .png format
  -- Image is an object actually
  
  love.graphics.setBackgroundColor(255/255, 200/255, 40/255, 127/255)
  
  width = myImage:getWidth()
  height = myImage:getWidth()
end

function love.draw()  
  love.graphics.setColor(1, 0.5, 0.5, 1)

  love.graphics.draw(myImage, 300, 290, 0, 2, 2, width/2, height/2, 1, 2.7)
  -- Arguments: image, x, y, rotation, x-scale, y-scale, x-origin and y-origin, kx and ky (stretch the image)
  love.graphics.setColor(1, 1, 1)
  love.graphics.print("That's crazy bro", 50, 400, 0, 2, 2, 3, 3, 0.1, 0.7)

end