StateManager = require "class/statemanager"
title_state = require "class/states/title"

-- As global as this is going to get
local main = {}
main.state_manager = StateManager()

function love.load()
    love.graphics.setNewFont(12)
    love.graphics.setColor(255,255,255)
    love.graphics.setBackgroundColor(0,0,0)
end

function love.update()
    main.state_manager:tick()
end

function love.draw()
    love.graphics.draw(main.state_manager:draw())
end
