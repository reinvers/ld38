local planet = {}

planet.image = love.graphics.newImage('images/planet.png')
planet.orbit = nil
planet.sun = nil
planet.position = 0

function planet.initialize(orbit, sun)
  planet.orbit = orbit
  planet.sun = sun
end

function planet.draw()
  local x = planet.orbit.radius * math.cos(planet.position) * planet.orbit.scale_x
  local y = planet.orbit.radius * math.sin(planet.position) * planet.orbit.scale_y
  local rotated_x = planet.sun.x + math.cos(planet.orbit.rotation) * x - math.sin(planet.orbit.rotation) * y
  local rotated_y = planet.sun.y + math.sin(planet.orbit.rotation) * x - math.cos(planet.orbit.rotation) * y
  
  love.graphics.draw(planet.image, rotated_x, rotated_y, 0, 1, 1, planet.image:getWidth() / 2, planet.image:getHeight() / 2)
end

return planet