local p = table.deepcopy(data.raw["constant-combinator"]["constant-combinator"])
p.name = "pushbutton"
p.minable.result = "pushbutton"

p.icon = "__pushbutton__/graphics/pushbutton_icon.png"
p.icon_size = 32
p.icon_mipmaps = 1

p.sprites =
  make_4way_animation_from_spritesheet({ layers =
    {
      {
        filename = "__pushbutton__/graphics/hr-pushbutton.png",
        width = 128,
        height = 128,
        frame_count = 1,
        shift = util.by_pixel(0, 0),
        scale = 0.5,
      },
      {
        filename = "__pushbutton__/graphics/hr-pushbuttonsh.png",
        width = 176,
        height = 80,
        frame_count = 1,
        shift = util.by_pixel(0, 0),
        draw_as_shadow = true,
        scale = 0.5,
      },
    }
  })


local activity_led_light_offset = {0, 0}
local activity_led_spriten = {
  filename = "__pushbutton__/graphics/buttonled128.1.png",
  width = 128,
  height = 128,
  frame_count = 1,
  draw_as_glow = true,
  scale = 0.5,
}
local activity_led_spritee = {
  filename = "__pushbutton__/graphics/buttonled128.2.png",
  width = 128,
  height = 128,
  frame_count = 1,
  draw_as_glow = true,
  scale = 0.5,
}
local activity_led_sprites = {
  filename = "__pushbutton__/graphics/buttonled128.3.png",
  width = 128,
  height = 128,
  frame_count = 1,
  draw_as_glow = true,
  scale = 0.5,
}
local activity_led_spritew = {
  filename = "__pushbutton__/graphics/buttonled128.4.png",
  width = 128,
  height = 128,
  frame_count = 1,
  draw_as_glow = true,
  scale = 0.5,
}
p.activity_led_sprites =
{
  north = activity_led_spriten,
  east  = activity_led_spritee,
  south = activity_led_sprites,
  west  = activity_led_spritew,
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

data:extend{p}
