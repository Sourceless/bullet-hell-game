package.path = "../?.lua;" .. package.path
class = require "lib/30log/30log"
Entity = require "class/entity"

EntityManager = class()
EntityManager.__init = { id_counter = 1, entities = {}, systems = {}}

function EntityManager:new_entity()
    e = Entity(id_counter)
    self.id_counter = self.id_counter + 1
    return e
end

function EntityManager:register_components(entity)
    for key, system in pairs(self.systems) do
        for name, table in entity.components do
            if system.affects[name] ~= nil then
                table.insert(system.entities, entity.id)
                -- TODO: switch this out for more efficiency,
                -- have systems register the componenet names
                -- that interest them
            end
        end
    end
end

function EntityManager:add_entity(entity)
    self.entities[entity.id] = entity
end

function EntityManager:remove_entity(id)
    self.entities[id] = nil
end
