data:extend({
    {
        type = "container",
        name = "shield-generator",
        icon = "__base__/graphics/icons/electric-furnace.png",  -- Replace with your custom icon
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        max_health = 300,
        collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
        selection_box = {{-1, -1}, {1, 1}},
        inventory_size = 0,
        picture = {
            filename = "__base__/graphics/entity/electric-furnace/electric-furnace.png",  -- Replace with your custom sprite
            priority = "high",
            width = 129,
            height = 100,
            shift = {0.5, 0}
        },
    }
})
