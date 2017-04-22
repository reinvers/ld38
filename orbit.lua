local orbit = {}

orbit.sun = nil
orbit.radius = 200
orbit.scale_x = 0
orbit.scale_y = 0
orbit.offset_x = 0
orbit.offset_y = 0
orbit.rotation = 0
orbit.canvas = love.graphics.newCanvas()

function orbit.initialize(sun, scale_x, scale_y, rotation, offset_x, offset_y)
  orbit.sun = sun
  orbit.scale_x = scale_x
  orbit.scale_y = scale_y
  orbit.offset_x = offset_x
  orbit.offset_y = offset_y
  orbit.rotation = rotation
end

function orbit.draw()
  love.graphics.setCanvas(orbit.canvas)
  love.graphics.ellipse('line', orbit.sun.x, orbit.sun.y, orbit.radius * orbit.scale_x, orbit.radius * orbit.scale_y)
  love.graphics.setCanvas()
  love.graphics.draw(orbit.canvas, orbit.sun.x + orbit.offset_x, orbit.sun.y + orbit.offset_y, orbit.rotation, 1, 1, orbit.sun.x, orbit.sun.y)
end

return orbit