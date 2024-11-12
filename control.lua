script.on_init(function()
	if remote.interfaces["freeplay"] then
		remote.call("freeplay", "set_skip_intro", true)
		remote.call("freeplay", "set_disable_crashsite", true)
		local chest = game.planets.nauvis.surface.create_entity({
			name = "iron-chest",
      position = {0, 0},
      force = "player"
		})
		if chest ~= nil then
			chest.insert({ name = "chemical-plant", count = 20 })
			chest.insert({ name = "assembling-machine-2", count = 20 })
			chest.insert({ name = "iron-plate", count = 100 })
			chest.insert({ name = "copper-plate", count = 100 })
			chest.insert({ name = "stone", count = 100 })
			chest.insert({ name = "wood", count = 50})
			chest.insert({ name = "landfill", count = 500})
		end
	end
end)
