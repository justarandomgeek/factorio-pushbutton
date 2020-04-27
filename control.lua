local function onTick()
  -- Clear any buttons from last tick
  if global.deactivating_buttons then
    for i,control in pairs(global.deactivating_buttons) do
      if control.valid then
        control.enabled=false
      end
    end
    global.deactivating_buttons = nil
  end

  if global.active_buttons then
    global.deactivating_buttons = global.active_buttons
    global.active_buttons = nil
  end
end

local function onKey(event)
  local p = game.players[event.player_index]
  local ent = p.selected
  if ent and ent.valid and p.can_reach_entity(ent) then -- if character is in range, or we're in god mode
    if ent.name == "pushbutton" then
      local control = ent.get_or_create_control_behavior()
      control.enabled=true
      if not global.active_buttons then global.active_buttons = {} end
      global.active_buttons[ent.unit_number] = control
    elseif ent.name == "constant-combinator" then -- toggle constant combinators
      local control = ent.get_or_create_control_behavior()
      control.enabled = not control.enabled
    elseif ent.name == "power-switch" then -- toggle power switches
      ent.power_switch_state = not ent.power_switch_state
    end
  end
end

local function onBuilt(entity)
  if entity.name == "pushbutton" then
    local control = entity.get_or_create_control_behavior()
    control.enabled=false
  end
end

local function onPaste(event)
  local pushbutton = event.destination
  if pushbutton.name == "pushbutton" then
    local control = pushbutton.get_or_create_control_behavior()
    control.enabled=false
  end
end

script.on_event(defines.events.on_tick, onTick)
script.on_event(defines.events.on_entity_settings_pasted,onPaste)
script.on_event("pushbutton-key", onKey)

local filters = {
  {filter="name",name="pushbutton"}
}
script.on_event(defines.events.on_built_entity, function(event) onBuilt(event.created_entity) end, filters)
script.on_event(defines.events.on_robot_built_entity, function(event) onBuilt(event.created_entity) end, filters)
script.on_event(defines.events.script_raised_built, function(event) onBuilt(event.entity) end)
script.on_event(defines.events.script_raised_revive, function(event) onBuilt(event.entity) end)
script.on_event(defines.events.on_entity_cloned, function(event) onBuilt(event.destination) end)