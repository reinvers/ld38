local player = {}

player.image = love.graphics.newImage('images/player.png')
player.planet = nil
player.rotation = 0

function player.initialize(planet)
  player.planet = planet
end

function player.update(dt)
  
end

function player.draw()
  love.graphics.draw(player.image, player.planet.x, player.planet.y, player.rotation, 1, 1, player.image:getWidth() / 2, player.image:getHeight())
end

return player