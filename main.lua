local sun = require 'sun'
local orbit = require 'orbit'
local planet = require 'planet'

function love.load()
  love.graphics.setBackgroundColor(10, 20, 50)
  orbit.initialize(0.75, 1.25, 0)
  planet.initialize(orbit)
end

function love.draw()
  sun.draw()
  orbit.draw(sun)
  planet.draw(sun)
end