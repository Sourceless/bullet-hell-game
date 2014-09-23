-- StateManager
--
-- Manage gamestates, and maintain a stack of said states.
-- Run the state at the top of the stack, and draw any visible states (this
-- allows for transparentcy on pause screens, etc)

-- class boilerplate
local StateManager = {}
StateManager.__index = StateManager

setmetatable(StateManager, {
    __call = function (cls, ...)
        return cls.new(...)
    end,
})

function StateManager.new()
    local self = setmetatable({}, StateManager)
    self.stack = {}
    return self
end

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
    state.init()
end

function StateManager:pop_state()
    -- may need to add soemthing to handle stuff on delete
    table.remove(self.stack)
end

function StateManager:tick()
    if self:any() then
        self:top().tick()
    end
end

return StateManager
