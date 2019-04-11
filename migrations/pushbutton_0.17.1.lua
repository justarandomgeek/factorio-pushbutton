for _,force in pairs(game.forces) do
  force.recipes["pushbutton"].enabled = force.technologies["circuit-network"].researched
end
