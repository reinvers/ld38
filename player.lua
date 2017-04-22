local player = {}

player.image = love.graphics.newImage('images/player.png')
player.planet = nil
player.rotation = 0
player.elevation = 0
player.vertical_speed = 0
player.horizontal_speed = math.pi
player.gravity = 400
player.controls = {}

function player.initialize(planet, rotation, controls)
  player.planet = planet
  player.rotation = rotation
  player.controls = controls
end

function player.keypressed(key)
  if key == player.controls.jump then
    if player.elevation <= 0 then
      player.vertical_speed = 125
    end
  end
end

function player.update(dt)
  local two_pi = math.pi * 2
  
  player.vertical_speed = player.vertical_speed - player.gravity * dt
  player.elevation = player.elevation + player.vertical_speed * dt
  
  if player.elevation < 0 then
    player.elevation = 0
    player.vertical_speed = 0
  end
  
  if love.keyboard.isDown(player.controls.left) then
    player.rotation = player.rotation - player.horizontal_speed * dt
    
    if player.planet.rotational_speed < 0 then
      player.rotation = player.rotation + player.planet.rotational_speed * dt
    end
  end

  if love.keyboard.isDown(player.controls.right) then
    player.rotation = player.rotation + player.horizontal_speed * dt
    
    if player.planet.rotational_speed > 0 then
      player.rotation = player.rotation + player.planet.rotational_speed * dt
    end
  end

  if not (love.keyboard.isDown(player.controls.left) or love.keyboard.isDown(player.controls.right)) then
    player.rotation = player.rotation + player.planet.rotational_speed * dt
  end

  if player.rotation > two_pi then
    player.rotation = player.rotation - two_pi
  end
end

function player.draw()
  local x_offset = player.image:getWidth() / 2
  local y_offset = player.image:getHeight() + player.planet.image:getHeight() / 2 - 10 + player.elevation
  
  love.graphics.draw(player.image, player.planet.x, player.planet.y, player.rotation, 1, 1, x_offset, y_offset)
end

return player