local orbit = {}

orbit.radius = 200
orbit.scale_x = 0
orbit.scale_y = 0
orbit.rotation = 0
orbit.canvas = love.graphics.newCanvas()

function orbit.initialize(scale_x, scale_y, rotation)
  orbit.scale_x = scale_x
  orbit.scale_y = scale_y
  orbit.rotation = rotation
end

function orbit.draw(sun)
  love.graphics.setCanvas(orbit.canvas)
  love.graphics.ellipse('line', sun.x, sun.y, orbit.radius * orbit.scale_x, orbit.radius * orbit.scale_y)
  love.graphics.setCanvas()
  love.graphics.draw(orbit.canvas, sun.x, sun.y, orbit.rotation, 1, 1, sun.x, sun.y)
end

return orbit