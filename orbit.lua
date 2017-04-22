local orbit = {}

orbit.radius = 0

function orbit.initialize(radius)
  orbit.radius = radius
end

function orbit.draw(sun)
  love.graphics.circle('line', sun.x, sun.y, orbit.radius)
end

return orbit