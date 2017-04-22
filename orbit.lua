local orbit = {}

orbit.radius_x = 0
orbit.radius_y = 0

function orbit.initialize(radius_x, radius_y)
  orbit.radius_x = radius_x
  orbit.radius_y = radius_y
end

function orbit.draw(sun)
  love.graphics.ellipse('line', sun.x, sun.y, orbit.radius_x, orbit.radius_y)
end

return orbit