data:extend({
  {
    type = "container",
    name = "trashcan",
    icon = "__Trashcan__/graphics/trashcan_inventory.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "trashcan"},
    max_health = 2000,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
    },
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fast_replaceable_group = "container",
    inventory_size = 100,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    picture =
    {
      filename = "__Trashcan__/graphics/trashcan_ground.png",
      priority = "extra-high",
      width = 48,
      height = 38,
      shift = {0.2, 0}
    }
  }})