--
require("utils")
--
local delay = 800


function check_trash(throttle)
	if global.trashcans ~= nil then
		local i = game.tick % throttle
		while global.trashcans[i] ~= nil do
			if global.trashcans[i].valid then
				global.trashcans[i].clear_items_inside()
			else
				table.remove(global.trashcans,k)
				return check_trash(throttle)
			end
			i = i+ throttle
		end
	end
end
function add_trashcan(event)
	if event.created_entity.name == "trashcan" then
		 	local trashcan = event.created_entity
			if global.trashcans == nil then global.trashcans = {} end
			table.insert(global.trashcans, trashcan)
	end
end
script.on_event(defines.events.on_tick,
--    --runs every tick ... really I would like to just call when items where added but meh..
	function(event)
		check_trash(delay)
	end
)




script.on_event(defines.events.on_built_entity,
	function(event)

		add_trashcan(event)
	end
)


script.on_event(defines.events.on_robot_built_entity, function(event)
	add_trashcan(event)
end)



