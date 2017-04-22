local sun = require 'sun'
local orbit = require 'orbit'
local planet = require 'planet'
local player = require 'player'

function love.load()
  love.graphics.setBackgroundColor(10, 20, 50)
  orbit.initialize(sun, 0.75, 1.25, math.pi / 4, 75, -75)
  planet.initialize(orbit, sun, 1, math.pi)
end

function love.update(dt)
  planet.update(dt)
end

function love.draw()
  sun.draw()
  orbit.draw()
  planet.draw()
  player.draw()
end