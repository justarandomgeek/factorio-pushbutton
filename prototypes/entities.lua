local p = table.deepcopy(data.raw["constant-combinator"]["constant-combinator"])
p.name = "pushbutton"
p.minable.result = "pushbutton"

data:extend{p}
