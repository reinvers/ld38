local sun = require 'sun'

local orbits = {}
local planets = {}
local players = {}

local player_count = 4

function love.load()
  love.graphics.setBackgroundColor(10, 20, 50)
  
  for i = 1, player_count do
    orbits[i] = dofile 'orbit.lua'
    planets[i] = dofile 'planet.lua'
    players[i] = dofile 'player.lua'
    
    orbits[i].initialize(sun, 0.75 + love.math.random() * 0.5, 0.75 + love.math.random() * 0.5, love.math.random(math.pi * 2), math.random(-50, 50), math.random(-50, 50))
    planets[i].initialize(orbits[i], sun, love.math.random() * math.pi * 2, 0.75 + love.math.random() * 0.5, love.math.random() * math.pi * 2, math.pi + love.math.random() * 0.5)
    players[i].initialize(planets[i], love.math.random() * math.pi * 2)
  end
end

function love.update(dt)
  for i = 1, player_count do
    planets[i].update(dt)
    players[i].update(dt)
  end
end

function love.draw()
  sun.draw()
  
  for i = 1, player_count do
    orbits[i].draw()
    planets[i].draw()
    players[i].draw()
  end
end