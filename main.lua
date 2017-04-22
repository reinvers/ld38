local sun = require 'sun'
local orbit = require 'orbit'
local planet = require 'planet'

function love.load()
  love.graphics.setBackgroundColor(10, 20, 50)
  orbit.initialize(sun, 0.75, 1.25, 1)
  planet.initialize(orbit, sun)
end

function love.draw()
  sun.draw()
  orbit.draw()
  planet.draw()
end