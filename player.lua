local player = {}

player.image = love.graphics.newImage('images/player.png')
player.planet = nil
player.rotation = 0
player.elevation = 0
player.vertical_speed = 0
player.horizontal_speed = math.pi
player.gravity = 400
player.controls = {}
player.dead = false

function player.is_attacking(other_player)
  
  local detection_points_y = -(19 + (player.planet.image:getHeight() / 2 - 10) + player.elevation)
  local detection_points_x = 18
  
  local other_player_base_y = -(player.planet.image:getHeight() / 2 - 10 + other_player.elevation + other_player.image:getHeight() / 2)
  local other_player_x = 0 - math.sin(other_player.rotation) * (other_player_base_y) + other_player.planet.x
  local other_player_y = 0 + math.cos(other_player.rotation) * (other_player_base_y) + other_player.planet.y
  
  for i = 1, 4 do
    local calculated_x = player.planet.x + detection_points_x + (i - 1) * 3
    local calculated_y = player.planet.y + detection_points_y
    
    local x = math.cos(player.rotation) * (calculated_x - player.planet.x) - math.sin(player.rotation) * (calculated_y - player.planet.y) + player.planet.x
    local y = math.sin(player.rotation) * (calculated_x - player.planet.x) + math.cos(player.rotation) * (calculated_y - player.planet.y) + player.planet.y
    
    local distance = math.sqrt((other_player_x - x) ^ 2 + (other_player_y - y) ^ 2)
    
    if distance < (player.image:getHeight() / 2) + 5 then
      return true
    end
  end
  
  return false
end

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
    player.planet.boost = false
  else
    player.planet.boost = true
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
  
  --[[local detection_points_y = -(19 + (player.planet.image:getHeight() / 2 - 10) + player.elevation)
  local detection_points_x = 18
  
  for i = 1, 4 do
    local calculated_x = player.planet.x + detection_points_x + (i - 1) * 3
    local calculated_y = player.planet.y + detection_points_y
    
    local x = math.cos(player.rotation) * (calculated_x - player.planet.x) - math.sin(player.rotation) * (calculated_y - player.planet.y) + player.planet.x
    local y = math.sin(player.rotation) * (calculated_x - player.planet.x) + math.cos(player.rotation) * (calculated_y - player.planet.y) + player.planet.y
    
    love.graphics.circle('line', x, y, 5)
  end
  
  local c_x = 0 - math.sin(player.rotation) * (-(player.planet.image:getHeight() / 2 - 10 + player.elevation + player.image:getHeight() / 2)) + player.planet.x
  local c_y = 0 + math.cos(player.rotation) * (-(player.planet.image:getHeight() / 2 - 10 + player.elevation + player.image:getHeight() / 2)) + player.planet.y
  
  love.graphics.circle('line', c_x, c_y, player.image:getHeight() / 2)--]]
end

return player