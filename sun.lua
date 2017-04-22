local sun = {}

sun.image = love.graphics.newImage('images/sun.png')
sun.x = love.graphics.getWidth() / 2
sun.y = love.graphics.getHeight() / 2
sun.radius = sun.image:getWidth() / 2

function sun.draw()
  love.graphics.draw(sun.image, sun.x - sun.radius, sun.y - sun.radius)
end

return sun
