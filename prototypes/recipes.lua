data:extend{
  {
    type = "recipe",
    name = "pushbutton",
    enabled = false,
    ingredients =
    {
      {"constant-combinator", 1},
      {"electronic-circuit", 1},
      {"advanced-circuit", 1},
    },
    results={
      {type="item", name="pushbutton", amount=1},
    },
  } --[[@as data.RecipePrototype]],
}
