--
require("utils")
--
function check_trash()
	if global.trashcans ~= nil then
		for k,rubbish_bin in pairs(global.trashcans) do
			if k % 60 == game.tick % 125 then
				if not rubbish_bin.valid then
					table.remove(global.trashcans,k)
					return
				end
				rubbish_bin.clear_items_inside()


			end
		end
	end
end
function add_trashcan(event)
	if event.created_entity.name == "trashcan" then
		debug("Making trashcan!")
		local trashcan = event.created_entity
			if global.trashcans == nil then global.trashcans = {} end
			table.insert(global.trashcans, trashcan)
	end
end
script.on_event(defines.events.on_tick,
--    --runs every tick ... really I would like to just call when items where added but meh..
	function(event)
		check_trash()
	end
)




script.on_event(defines.events.on_built_entity,
	function(event)
		debug(string.format("Created Element:%s",event.created_entity.name))
		debug(string.format("Created Element:%s",event.created_entity.type))

		add_trashcan(event)
	end
)


script.on_event(defines.events.on_robot_built_entity, function(event)
	add_trashcan(event)
end)



