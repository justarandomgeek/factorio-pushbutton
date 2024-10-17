data:extend{
  {
    type = "recipe",
    name = "pushbutton",
    enabled = false,
    ingredients =
    {
      { type="item", name="constant-combinator", amount=1},
      { type="item", name="electronic-circuit", amount=1},
      { type="item", name="advanced-circuit", amount=1},
    },
    results={
      {type="item", name="pushbutton", amount=1},
    },
  } --[[@as data.RecipePrototype]],
}
