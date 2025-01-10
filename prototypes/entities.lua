local util = require("util")
local p = table.deepcopy(data.raw["constant-combinator"]["constant-combinator"])
p.name = "pushbutton"
p.minable.result = "pushbutton"

p.pulse_duration = 1

p.icon = "__pushbutton__/graphics/pushbutton-icon.png"
p.icon_size = 64
p.sprites =
  make_4way_animation_from_spritesheet({ layers =
    {
      {
        filename = "__pushbutton__/graphics/pushbutton.png",
        width = 64,
        height = 64,
        shift = util.by_pixel(0, 0),
        scale = 0.5,
      },
      {
        filename = "__pushbutton__/graphics/pushbuttonsh.png",
        width = 96,
        height = 64,
        shift = util.by_pixel(8, 0),
        draw_as_shadow = true,
        scale = 0.5,
      },
    }
  })

local activity_led_light_offset = {0, 0}
p.activity_led_sprites =
{
  north = {
    filename = "__pushbutton__/graphics/buttonled.1.png",
    width = 64,
    height = 64,
    draw_as_glow = true,
    scale = 0.5,
  },
  east = {
    filename = "__pushbutton__/graphics/buttonled.2.png",
    width = 64,
    height = 64,
    draw_as_glow = true,
    scale = 0.5,
  },
  south = {
    filename = "__pushbutton__/graphics/buttonled.3.png",
    width = 64,
    height = 64,
    draw_as_glow = true,
    scale = 0.5,
  },
  west = {
    filename = "__pushbutton__/graphics/buttonled.4.png",
    width = 64,
    height = 64,
    draw_as_glow = true,
    scale = 0.5,
  },
}

activity_led_light =
{
  intensity = 0.8,
  size = 1,
}


p.activity_led_light_offsets =
{
  activity_led_light_offset,
  activity_led_light_offset,
  activity_led_light_offset,
  activity_led_light_offset,
}

p.circuit_wire_connection_points =
{
  {
    shadow =
    {
      red = util.by_pixel_hr(41, -6),
      green = util.by_pixel_hr(20, -6)
    },
    wire =
    {
      red = util.by_pixel_hr(10, -27),
      green = util.by_pixel_hr(-10, -27)
    }
  },
  {
    shadow =
    {
      red = util.by_pixel_hr(50, 16),
      green = util.by_pixel_hr(50, 2)
    },
    wire =
    {
      red = util.by_pixel_hr(22, -4),
      green = util.by_pixel_hr(22, -18)
    }
  },
  {
    shadow =
    {
      red = util.by_pixel_hr(20, 25),
      green = util.by_pixel_hr(36, 25)
    },
    wire =
    {
      red = util.by_pixel_hr(-10, 5),
      green = util.by_pixel_hr(10, 5)
    }
  },
  {
    shadow =
    {
      red = util.by_pixel_hr(2, -5),
      green = util.by_pixel_hr(2, 10)
    },
    wire =
    {
      red = util.by_pixel_hr(-22, -18),
      green = util.by_pixel_hr(-22, -4)
    }
  }
}

p.created_effect = {
  type = "direct",
  action_delivery = {
    type = "instant",
    source_effects = {
      {
        type = "script",
        effect_id = "pushbutton-created",
      },
    }
  }
}

data:extend{p}
