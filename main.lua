local sun = require 'sun'
local orbit = require 'orbit'

function love.load()
  orbit.initialize(150, 250)
end

function love.draw()
  sun.draw()
  orbit.draw(sun)
end