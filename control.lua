local handler = require("event_handler")
handler.add_lib(require("pvp"))
script.on_event(defines.events.on_built_entity, function(event)
    local entity = event.created_entity
    if entity.name == "shield-generator" then
        if not global.shield_zones then
            global.shield_zones = {}
        end
        -- Add the shield zone
        table.insert(global.shield_zones, {position = entity.position, radius = 50})
        game.print("Shield generator placed! Area is now protected.")
    end
end)

script.on_event(defines.events.on_entity_died, function(event)
    local entity = event.entity
    if entity.name == "shield-generator" then
        for i, shield in pairs(global.shield_zones or {}) do
            if shield.position.x == entity.position.x and shield.position.y == entity.position.y then
                table.remove(global.shield_zones, i)
                game.print("Shield generator destroyed! Area is no longer protected.")
                break
            end
        end
    end
end)

script.on_event(defines.events.on_entity_damaged, function(event)
    local entity = event.entity
    if global.shield_zones then
        for _, shield in pairs(global.shield_zones) do
            if is_within_shield_area(entity.position, shield.position, shield.radius) then
                entity.health = entity.health + event.final_damage_amount
                return
            end
        end
    end
end)

-- Function to check if a position is within a shield zone
function is_within_shield_area(position, shield_position, radius)
    return math.abs(position.x - shield_position.x) <= radius and
           math.abs(position.y - shield_position.y) <= radius
end

-- Add starting inventory
script.on_event(defines.events.on_player_created, function(event)
    local player = game.get_player(event.player_index)
    if player then
        player.insert({name = "shield-generator", count = 1})
    end
end)
