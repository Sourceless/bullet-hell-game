-- StateManager
--
-- Manage gamestates, and maintain a stack of said states.
-- Run the state at the top of the stack, and draw any visible states (this
-- allows for transparency on pause screens, etc)
package.path = ";../?.lua"
class = require "lib/30log/30log"

-- class boilerplate
StateManager = class ( )
StateManager.__init = { stack = {}, canvas = love.graphics.newCanvas() }

function StateManager:any()
    if #self.stack > 0 then
        return true
    else
        return false
    end
end

function StateManager:top()
    if self:any() then
        return self.stack[#self.stack]
    else
        return nil
    end
end

function StateManager:push_state(state)
    table.insert(self.stack, state)
    state:init()
end

function StateManager:pop_state()
    if self:any() then
        table.remove(self.stack)
    end
end

function StateManager:tick()
    -- Perform a tick on the top state.
    --
    -- Virtually every system except things involving
    -- graphics will happen here. Graphics are only
    -- special because states can be stacked, and one drawn
    -- underneath another.
    if self:any() then
        self:top():tick()
    end
end

function StateManager:draw()
    -- Do a draw on each of the visible states

    self.canvas:clear()

    -- Kind of an odd way to do it, but this sets
    -- this local canvas as the one that's drawn to
    -- by default. All this means is that any draw calls
    -- made inside states end up here before being rendered,
    -- which means they get stacked properly.
    love.graphics.setCanvas(self.canvas)
    if self:any() then
        -- iterate from bottom to top, drawing visible states onto the canvas
        for _, state in ipairs(self.stack) do
            if state.visible then state:draw() end
        end
    end
    love.graphics.setCanvas()

    return self.canvas
end

return StateManager
