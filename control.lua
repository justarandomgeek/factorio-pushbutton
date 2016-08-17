local function onTick()
  -- Clear any buttons from last tick
  if global.deactivating_buttons then
    for i,control in pairs(global.deactivating_buttons) do
      control.parameters=nil
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
  if ent and ent.valid and ent.name == "pushbutton" then
    local dist = math.abs(p.position.x-ent.position.x)+math.abs(p.position.y-ent.position.y) --the player should stand near the ent
    if dist < 10 then
      local control = ent.get_or_create_control_behavior()
        control.parameters={parameters={{index=1,count=1,signal={name="signal-black",type="virtual"}}}}
      if not global.active_buttons then global.active_buttons = {} end
      global.active_buttons[ent.unit_number] = control
    end
  end
end

script.on_event(defines.events.on_tick, onTick)

script.on_event("pushbutton-key", onKey)
