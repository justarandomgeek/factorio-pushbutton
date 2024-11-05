---@class (exact) pusbutton_storage
---@field deactivating_buttons? {[integer]:LuaConstantCombinatorControlBehavior}
---@field active_buttons? {[integer]:LuaConstantCombinatorControlBehavior}
storage = {}

script.on_event(defines.events.on_tick, function()
  -- Clear any buttons from last tick
  if storage.deactivating_buttons then
    for _,control in pairs(storage.deactivating_buttons) do
      if control.valid then
        control.enabled=false
      end
    end
    storage.deactivating_buttons = nil
  end

  if storage.active_buttons then
    storage.deactivating_buttons = storage.active_buttons
    storage.active_buttons = nil
  end
end)

script.on_event(defines.events.on_entity_settings_pasted, function(event)
  local pushbutton = event.destination
  if pushbutton.name == "pushbutton" then
    local control = pushbutton.get_or_create_control_behavior() --[[@as LuaConstantCombinatorControlBehavior]]
    control.enabled=false
  end
end)

script.on_event("pushbutton-key", function(event)
  local p = game.players[event.player_index]
  local ent = p.selected
  if ent and ent.valid then
    if ent.name == "pushbutton" then
      local control = ent.get_or_create_control_behavior() --[[@as LuaConstantCombinatorControlBehavior]]
      -- Toggle Entity is about to turn this on for us, so just record it to turn off...
      --control.enabled=true
      if not storage.active_buttons then storage.active_buttons = {} end
      storage.active_buttons[ent.unit_number] = control
    end
  end
end)

script.on_event(defines.events.on_script_trigger_effect, function (event)
  if event.effect_id == "pushbutton-created" then
    local entity = event.cause_entity
    if entity and entity.name == "pushbutton" then
      local control = entity.get_or_create_control_behavior() --[[@as LuaConstantCombinatorControlBehavior]]
      control.enabled=false
    end
  end
end)



if script.active_mods["compaktcircuit"] then
  
  local function defineCompakt()
    
    remote.add_interface("pushbutton+compaktcircuit", {
      
      get_info = function(entity)
        return nil -- pushbutton has no savable state
      end,
      
      create_packed_entity = function(info, surface, position, force)
        return nil
      end,
      
      create_entity = function(info, surface, force)
        local entity = surface.create_entity {
          name = "pushbutton",
          force = force,
          position = info and info.position,
          direction = info and info.direction,
        }
        local control = entity.get_or_create_control_behavior()
        control.enabled = false
        return entity
      end
      
    })
    
    remote.call("compaktcircuit", "add_combinator", {
      name = "pushbutton",
      packed_names = nil,
      interface_name = "pushbutton+compaktcircuit"
    })
    
  end
  script.on_load(defineCompakt)
  script.on_init(defineCompakt)
  
end
