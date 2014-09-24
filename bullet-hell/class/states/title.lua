package.path = "../../?.lua;" .. package.path
GameState = require "class/states/gamestate"
Title = GameState:extends ()

function Title:init()
    self.super_secret_text = "You found the title screen"
end

function Title:tick()
end

function Title:draw()
    love.graphics.print(self.super_secret_text)
end

return Title
