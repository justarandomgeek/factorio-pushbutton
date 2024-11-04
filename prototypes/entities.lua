local p = table.deepcopy(data.raw["constant-combinator"]["constant-combinator"])
p.name = "pushbutton"
p.minable.result = "pushbutton"

p.icon = "__pushbutton__/graphics/pushbutton-icon.png"
p.icon_size = 64
p.sprites =
  make_4way_animation_from_spritesheet({ layers =
    {
      {
        filename = "__pushbutton__/graphics/pushbutton.png",
        width = 64,
        height = 64,
        frame_count = 1,
        shift = util.by_pixel(0, 0),
        scale = 0.5,
      },
      {
        filename = "__pushbutton__/graphics/pushbuttonsh.png",
        width = 96,
        height = 64,
        frame_count = 1,
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
    frame_count = 1,
    draw_as_glow = true,
    scale = 0.5,
  },
  east = {
    filename = "__pushbutton__/graphics/buttonled.2.png",
    width = 64,
    height = 64,
    frame_count = 1,
    draw_as_glow = true,
    scale = 0.5,
  },
  south = {
    filename = "__pushbutton__/graphics/buttonled.3.png",
    width = 64,
    height = 64,
    frame_count = 1,
    draw_as_glow = true,
    scale = 0.5,
  },
  west = {
    filename = "__pushbutton__/graphics/buttonled.4.png",
    width = 64,
    height = 64,
    frame_count = 1,
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

local circuit_wire_connection_points = {
  shadow =
  {
    red = {0.7, 0.4},
    green = {0.7, 0.4},
  },
  wire =
  {
    red = {0.4, 0.2265625},
    green = {0.3125, 0.27734375},
  }
}
p.circuit_wire_connection_points =
{
  circuit_wire_connection_points,
  circuit_wire_connection_points,
  circuit_wire_connection_points,
  circuit_wire_connection_points,
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
