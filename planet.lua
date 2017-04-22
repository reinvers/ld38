local planet = {}

planet.image = love.graphics.newImage('images/planet.png')
planet.orbit = nil
planet.position = 0

function planet.initialize(orbit)
  planet.orbit = orbit
end

function planet.draw(sun)
  local x = sun.x + planet.orbit.radius * math.cos(planet.position) * planet.orbit.scale_x
  local y = sun.y + planet.orbit.radius * math.sin(planet.position) * planet.orbit.scale_y
  
  love.graphics.draw(planet.image, x, y, 0, 1, 1, planet.image:getWidth() / 2, planet.image:getHeight() / 2)
end

return planet