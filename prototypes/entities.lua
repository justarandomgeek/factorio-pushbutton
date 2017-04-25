local p = table.deepcopy(data.raw["constant-combinator"]["constant-combinator"])
p.name = "pushbutton"
p.minable.result = "pushbutton"

p.icon = "__pushbutton__/graphics/pushbutton-icon.png"

local sprite = {
  filename = "__pushbutton__/graphics/pushbutton.png",
  width = 64,
  height = 44,
  frame_count = 1,
  --shift = {0.4375, 0.3125},
  shift = {0.4375, 0.0},
}
p.sprites =
{
  north = sprite,
  east = sprite,
  south = sprite,
  west = sprite,
}

local activity_led_light_offset = {-0.296875, 0.125}
local activity_led_sprite = {
  filename = "__pushbutton__/graphics/pushbutton-activity-led.png",
  width = 11,
  height = 10,
  frame_count = 1,
  shift = activity_led_light_offset,
}
p.activity_led_sprites =
{
  north = activity_led_sprite,
  east  = activity_led_sprite,
  south = activity_led_sprite,
  west  = activity_led_sprite,
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
