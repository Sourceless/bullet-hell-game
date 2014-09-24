package.path = "../?.lua;" .. package.path
class = require "lib/30log/30log"

Entity = class()

-- Don't create directly, use the EntityManager which can handle setting ids
function Entity:__init(id)
    self.id = id
    self.components = {}
end

-- Doing this is fine, after creating using the EntityManager.
-- There is another step after this to get the entity in the game,
-- which is to add the entity into the EntityManager's active list.
function Entity:add_component(name, table)
    self.components[name] = table
end
