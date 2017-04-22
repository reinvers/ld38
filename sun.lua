local sun = {}

sun.image = love.graphics.newImage('images/sun.png')
sun.x = love.graphics.getWidth() / 2
sun.y = love.graphics.getHeight() / 2
sun.radius = sun.image:getWidth() / 2
sun.rotation = math.random() * math.pi * 2
sun.rotational_speed = 0.5

function sun.update(dt)
  local two_pi = math.pi * 2
  
  sun.rotation = sun.rotation + sun.rotational_speed * dt
  
  if sun.rotation > two_pi then
    sun.rotation = sun.rotation - two_pi
  end
end

function sun.draw()
  love.graphics.draw(sun.image, sun.x, sun.y, sun.rotation, 1, 1, sun.radius, sun.radius)
end

return sun
