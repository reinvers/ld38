local player = {}

player.image = love.graphics.newImage('images/player.png')

function player.draw()
  love.graphics.draw(player.image)
end

return player