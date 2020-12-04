function send_sound(player, seat)
	if (isPedInVehicle(player)) and seat == 0 then

		local playerName = getPlayerName(player)

		triggerClientEvent(root, "play_sound", root, source, playerName)
	end
end

addEventHandler('onVehicleEnter',root, send_sound )

local function stop_sound(player, seat)
	if seat == 0 then
		local playerName = getPlayerName(player)

		triggerClientEvent(root,"stop_sound", root, playerName)
	end
end

addEventHandler('onVehicleExit',root, stop_sound )
addEventHandler('onPlayerWasted',root, stop_sound )
addEventHandler('onPlayerQuit',root, stop_sound ) 