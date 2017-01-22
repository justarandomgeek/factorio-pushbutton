local function onTick()
  -- Clear any buttons from last tick
  if global.deactivating_buttons then
    for i,control in pairs(global.deactivating_buttons) do
      control.enabled=false
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
  if ent and ent.valid then
    local dist = math.abs(p.position.x-ent.position.x)+math.abs(p.position.y-ent.position.y) --the player should stand near the ent
    if dist < 15 then
      local control = ent.get_or_create_control_behavior()
      if ent.name == "pushbutton" then
        control.enabled=true
        if not global.active_buttons then global.active_buttons = {} end
        global.active_buttons[ent.unit_number] = control
      elseif ent.name == "constant-combinator" then -- toggle constant combinators
        control.enabled = not control.enabled
      end
    end
  end
end

local function onBuilt(event)
  local pushbutton = event.created_entity
  if pushbutton.name == "pushbutton" then
    local control = pushbutton.get_or_create_control_behavior()
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
script.on_event(defines.events.on_built_entity, onBuilt)
script.on_event(defines.events.on_robot_built_entity, onBuilt)
script.on_event(defines.events.on_entity_settings_pasted,onPaste)

script.on_event("pushbutton-key", onKey)
