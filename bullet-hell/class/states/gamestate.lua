package.path = ";../../?.lua"
class = require "lib/30log/30log"

GameState = class()
GameState.__init = { entities = {}, visible = true }

function GameState:tick()
    error("Not implemented")
end

function GameState:draw()
    error("Not implemented")
end

function GameState:init()
    error("Not implemented")
end

function GameState:hide()
    self.visible = false
end

function GameState:show()
    self.visible = true
end

return GameState
