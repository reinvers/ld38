local planet = {}

planet.image = love.graphics.newImage('images/planet.png')
planet.orbit = nil
planet.sun = nil
planet.position = 0
planet.orbital_speed = 0
planet.rotation = 0
planet.rotational_speed = 0

function planet.initialize(orbit, sun, orbital_speed, rotational_speed)
  planet.orbit = orbit
  planet.sun = sun
  planet.orbital_speed = orbital_speed
  planet.rotational_speed= rotational_speed
end

function planet.update(dt)
  local two_pi = math.pi * 2
  
  planet.position = planet.position + planet.orbital_speed * dt
  
  if planet.position > two_pi then
    planet.position = planet.position - two_pi
  end
  
  planet.rotation = planet.rotation + planet.rotational_speed * dt
  
  if planet.rotation > two_pi then
    planet.rotation = planet.rotation - two_pi
  end
end

function planet.draw()
  local x = planet.orbit.radius * math.cos(planet.position) * planet.orbit.scale_x
  local y = planet.orbit.radius * math.sin(planet.position) * planet.orbit.scale_y
  local rotated_x = planet.sun.x + planet.orbit.offset_x + math.cos(planet.orbit.rotation) * x - math.sin(planet.orbit.rotation) * y
  local rotated_y = planet.sun.y + planet.orbit.offset_y + math.sin(planet.orbit.rotation) * x + math.cos(planet.orbit.rotation) * y
  
  love.graphics.draw(planet.image, rotated_x, rotated_y, planet.rotation, 1, 1, planet.image:getWidth() / 2, planet.image:getHeight() / 2)
end

return planet