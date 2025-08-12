local util = require("util")
local meld = require("meld")
local activity_led_light_offset = {0, 0}
---@class (exact) MakePushbuttonConfiguration
---@field name string
---@field scale int
---@field order_postix? string
---@field icon_overlay? string

---@param config MakePushbuttonConfiguration
local function make_button(config)
  local icon_overlay
  if config.icon_overlay then
    icon_overlay = {
      icon = "__larger-display-panels__/graphics/icons/"..config.icon_overlay..".png",
      icon_size = 64,
      scale = 0.7,
      shift = { -8, -8}
    }
  end

  local padding = (config.scale - 1) / 2
  local function scale_box(box)
    return {
      {
        box[1][1] - padding,
        box[1][2] - padding
      },{
        box[2][1] + padding,
        box[2][2] + padding
      }
    }
  end

  local function scale_num(num)
    return (num or 1) * config.scale
  end
  local function scale_shift(shift)
    return util.mul_shift(shift, config.scale)
  end

  data:extend{
    meld.meld(table.deepcopy(data.raw["constant-combinator"]["constant-combinator"]), {
      name = config.name,
      minable = { result = config.name },
      pulse_duration = 1,
      icons = {
        {
          icon = "__pushbutton__/graphics/pushbutton-icon.png",
          icon_size = 64,
        },
        icon_overlay
      },
      icon = meld.delete(),
      icon_size = meld.delete(),
      collision_box = meld.invoke(scale_box),
      selection_box = meld.invoke(scale_box),
      icon_draw_specification = {
        scale = meld.invoke(scale_num),
        scale_for_many = meld.invoke(scale_num),
        shift = meld.invoke(scale_shift)
      },
      sprites = meld.overwrite(make_4way_animation_from_spritesheet({
        layers = {
          {
            filename = "__pushbutton__/graphics/pushbutton.png",
            width = 64,
            height = 64,
            shift = util.by_pixel(0, 0),
            scale = 0.5 * config.scale,
          },
          {
            filename = "__pushbutton__/graphics/pushbuttonsh.png",
            width = 96,
            height = 64,
            shift = util.mul_shift(util.by_pixel(8, 0), config.scale),
            draw_as_shadow = true,
            scale = 0.5 * config.scale,
          },
        }
      })),
      activity_led_sprites = meld.overwrite({
        north = {
          filename = "__pushbutton__/graphics/buttonled.1.png",
          width = 64,
          height = 64,
          draw_as_glow = true,
          scale = 0.5 * config.scale,
        },
        east = {
          filename = "__pushbutton__/graphics/buttonled.2.png",
          width = 64,
          height = 64,
          draw_as_glow = true,
          scale = 0.5 * config.scale,
        },
        south = {
          filename = "__pushbutton__/graphics/buttonled.3.png",
          width = 64,
          height = 64,
          draw_as_glow = true,
          scale = 0.5 * config.scale,
        },
        west = {
          filename = "__pushbutton__/graphics/buttonled.4.png",
          width = 64,
          height = 64,
          draw_as_glow = true,
          scale = 0.5 * config.scale,
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
            red = util.mul_shift(util.by_pixel_hr(41, -6), config.scale),
            green = util.mul_shift(util.by_pixel_hr(20, -6), config.scale)
          },
          wire =
          {
            red = util.mul_shift(util.by_pixel_hr(10, -27), config.scale),
            green = util.mul_shift(util.by_pixel_hr(-10, -27), config.scale)
          }
        },
        {
          shadow =
          {
            red = util.mul_shift(util.by_pixel_hr(50, 16), config.scale),
            green = util.mul_shift(util.by_pixel_hr(50, 2), config.scale)
          },
          wire =
          {
            red = util.mul_shift(util.by_pixel_hr(22, -4), config.scale),
            green = util.mul_shift(util.by_pixel_hr(22, -18), config.scale)
          }
        },
        {
          shadow =
          {
            red = util.mul_shift(util.by_pixel_hr(20, 25), config.scale),
            green = util.mul_shift(util.by_pixel_hr(36, 25), config.scale)
          },
          wire =
          {
            red = util.mul_shift(util.by_pixel_hr(-10, 5), config.scale),
            green = util.mul_shift(util.by_pixel_hr(10, 5), config.scale)
          }
        },
        {
          shadow =
          {
            red = util.mul_shift(util.by_pixel_hr(2, -5), config.scale),
            green = util.mul_shift(util.by_pixel_hr(2, 10), config.scale)
          },
          wire =
          {
            red = util.mul_shift(util.by_pixel_hr(-22, -18), config.scale),
            green = util.mul_shift(util.by_pixel_hr(-22, -4), config.scale)
          }
        }
      })
    }),
    {
      type = "item",
      name = config.name,
      icons = {
        {
          icon = "__pushbutton__/graphics/pushbutton-icon.png",
          icon_size = 64,
        },
        icon_overlay
      },
      subgroup = "circuit-network",
      place_result=config.name,
      order = "b[combinators]-d[pushbutton]"..(config.order_postix or ''),
      stack_size = 50,
    },
    {
      type = "recipe",
      name = config.name,
      enabled = false,
      ingredients =
      {
        {type = "item", name = "copper-cable", amount = 5},
        {type = "item", name = "electronic-circuit", amount = 2}
      },
      results={
        {type="item", name=config.name, amount=1},
      },
    }--[[@as data.RecipePrototype]],
  }
end

make_button{name = "pushbutton", scale = 1, }

meld.meld(data.raw.technology["circuit-network"], {
  effects = meld.append({
    {
      type = "unlock-recipe",
      recipe = "pushbutton"
    },
  })
})

if mods["larger-display-panels"] then

  make_button{name = "medium-pushbutton", scale = 2, order_postix="-a", icon_overlay="m" }
  make_button{name = "big-pushbutton",    scale = 4, order_postix="-b", icon_overlay="b" }
  make_button{name = "giant-pushbutton",  scale = 6, order_postix="-c", icon_overlay="g" }

  meld.meld(data.raw.technology["circuit-network"], {
    effects = meld.append({
      {
        type = "unlock-recipe",
        recipe = "medium-pushbutton"
      },
    })
  })

  meld.meld(data.raw.technology["advanced-combinators"], {
    effects = meld.append({
      {
        type = "unlock-recipe",
        recipe = "big-pushbutton"
      },
      {
        type = "unlock-recipe",
        recipe = "giant-pushbutton"
      },
    })
  })
end