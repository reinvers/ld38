local sun = require 'sun'

local orbits = {}
local planets = {}
local players = {}

local player_count = 4

local bg_image = love.graphics.newImage('images/bg.png')

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
  sun.update(dt)
  
  for i = 1, player_count do
    planets[i].update(dt)
    players[i].update(dt)
  end
end

function love.draw()
  love.graphics.draw(bg_image)
  
  sun.draw()
  
  --[[for i = 1, player_count do
    orbits[i].draw()
  end
  
  for i = 1, player_count do
    planets[i].draw()
    players[i].draw()
  end]]--
  
  orbits[1].draw()
  planets[1].draw()
  players[1].draw()
end