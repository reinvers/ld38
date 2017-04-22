local sun = require 'sun'

local orbits = {}
local planets = {}
local players = {}

local player_count = 4

local bg_image = love.graphics.newImage('images/bg.png')

function love.load()
  love.graphics.setBackgroundColor(10, 20, 50)
  
  local orbit_offsets = {
    {50, 50},
    {50, -50},
    {-50, -50},
    {-50, 50}
  }
  
  local planet_positions = {
    math.pi * 0.25,
    math.pi * 1.75,
    math.pi * 1.25,
    math.pi * 0.75
  }
  
  local player_controls = {
    {
      jump = 'up',
      left = 'left',
      right = 'right'
    },
    {
      jump = 'w',
      left = 'a',
      right = 'd'
    },
    {
      jump = 't',
      left = 'f',
      right = 'h'
    },
    {
      jump = 'i',
      left = 'j',
      right = 'l'
    }
  }
  
  for i = 1, player_count do
    orbits[i] = dofile 'orbit.lua'
    planets[i] = dofile 'planet.lua'
    players[i] = dofile 'player.lua'
    
    orbits[i].initialize(sun, 1, 1, 0, orbit_offsets[i][1], orbit_offsets[i][2])
    planets[i].initialize(orbits[i], sun, planet_positions[i], 1, 0, math.pi)
    players[i].initialize(planets[i], planet_positions[i], player_controls[i])
  end
end

function love.keypressed(key)
  for i = 1, player_count do
    players[i].keypressed(key)
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
  
  for i = 1, player_count do
    orbits[i].draw()
  end
  
  for i = 1, player_count do
    planets[i].draw()
    players[i].draw()
  end
end