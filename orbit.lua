local orbit = {}

orbit.radius_x = 0
orbit.radius_y = 0
orbit.rotation = 0
orbit.canvas = love.graphics.newCanvas()

function orbit.initialize(radius_x, radius_y, rotation)
  orbit.radius_x = radius_x
  orbit.radius_y = radius_y
  orbit.rotation = rotation
end

function orbit.draw(sun)
  love.graphics.setCanvas(orbit.canvas)
  love.graphics.ellipse('line', sun.x, sun.y, orbit.radius_x, orbit.radius_y)
  love.graphics.setCanvas()
  love.graphics.draw(orbit.canvas, sun.x, sun.y, 1, 1, 1, sun.x, sun.y)
end

return orbit