local util = require("util")
local meld = require("meld")
local activity_led_light_offset = {0, 0}
data:extend{
  meld.meld(table.deepcopy(data.raw["constant-combinator"]["constant-combinator"]), {
    name = "pushbutton",
    minable = { result = "pushbutton" },
    pulse_duration = 1,
    icon = "__pushbutton__/graphics/pushbutton-icon.png",
    icon_size = 64,
    sprites = meld.overwrite(make_4way_animation_from_spritesheet({
      layers = {
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
    })),
    activity_led_sprites = meld.overwrite({
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
    }),
    activity_led_light_offsets = meld.overwrite({
      activity_led_light_offset,
      activity_led_light_offset,
      activity_led_light_offset,
      activity_led_light_offset,
    }),
    circuit_wire_connection_points = meld.overwrite({
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
    })
  }),
  {
    type = "item",
    name = "pushbutton",
    icon = "__pushbutton__/graphics/pushbutton-icon.png",
    icon_size = 64,
    subgroup = "circuit-network",
    place_result="pushbutton",
    order = "b[combinators]-d[pushbutton]",
    stack_size = 50,
  },
  {
    type = "recipe",
    name = "pushbutton",
    enabled = false,
    ingredients =
    {
      {type = "item", name = "copper-cable", amount = 5},
      {type = "item", name = "electronic-circuit", amount = 2}
    },
    results={
      {type="item", name="pushbutton", amount=1},
    },
  }--[[@as data.RecipePrototype]],
}

meld.meld(data.raw.technology["circuit-network"], {
  effects = meld.append({
    {
      type = "unlock-recipe",
      recipe = "pushbutton"
    },
  })
})
