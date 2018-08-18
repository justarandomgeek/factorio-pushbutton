
if data.raw.technology["circuit-network"] then
  if not data.raw.technology["circuit-network"].effects then data.raw.technology["circuit-network"].effects = {} end
  
  table.insert(data.raw.technology["circuit-network"].effects,
    {
      type = "unlock-recipe",
      recipe = "pushbutton"
    }
end
