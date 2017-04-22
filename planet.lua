local planet = {}

planet.image = love.graphics.newImage('images/planet.png')
planet.orbit = nil
planet.sun = nil
planet.x = 0
planet.y = 0
planet.orbit_position = 0
planet.orbital_speed = 0
planet.rotation = 0
planet.rotational_speed = 0
planet.boost = false

function planet.initialize(orbit, sun, orbit_position, orbital_speed, rotation, rotational_speed)
  planet.orbit = orbit
  planet.sun = sun
  planet.orbit_position = orbit_position
  planet.orbital_speed = orbital_speed
  planet.rotation = rotation
  planet.rotational_speed= rotational_speed
end

function planet.update(dt)
  local two_pi = math.pi * 2
  local real_orbital_speed
  
  if planet.boost then
    real_orbital_speed = planet.orbital_speed * 2
  else
    real_orbital_speed = planet.orbital_speed
  end
  
  planet.orbit_position = planet.orbit_position + real_orbital_speed * dt
  
  if planet.orbit_position > two_pi then
    planet.orbit_position = planet.orbit_position - two_pi
  end
  
  planet.rotation = planet.rotation + planet.rotational_speed * dt
  
  if planet.rotation > two_pi then
    planet.rotation = planet.rotation - two_pi
  end
end

function planet.draw()
  local x = planet.orbit.radius * math.cos(planet.orbit_position) * planet.orbit.scale_x
  local y = planet.orbit.radius * math.sin(planet.orbit_position) * planet.orbit.scale_y
  planet.x = planet.sun.x + planet.orbit.offset_x + math.cos(planet.orbit.rotation) * x - math.sin(planet.orbit.rotation) * y
  planet.y = planet.sun.y + planet.orbit.offset_y + math.sin(planet.orbit.rotation) * x + math.cos(planet.orbit.rotation) * y
  
  love.graphics.draw(planet.image, planet.x, planet.y, planet.rotation, 1, 1, planet.image:getWidth() / 2, planet.image:getHeight() / 2)
end

return planet