local player = {}

player.image = love.graphics.newImage('images/player.png')
player.planet = nil
player.rotation = 0

function player.initialize(planet, rotation)
  player.planet = planet
  player.rotation = rotation
end

function player.update(dt)
  local two_pi = math.pi * 2
  
  player.rotation = player.rotation + player.planet.rotational_speed * dt
  
  if player.rotation > two_pi then
    player.rotation = player.rotation - two_pi
  end
end

function player.draw()
  love.graphics.draw(player.image, player.planet.x, player.planet.y, player.rotation, 1, 1, player.image:getWidth() / 2, player.image:getHeight() + player.planet.image:getHeight() / 2 - 10)
end

return player