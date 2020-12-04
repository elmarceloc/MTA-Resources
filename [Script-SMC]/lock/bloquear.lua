function BloquearCarros(thePlayer, player)
    playervehicle=getPlayerOccupiedVehicle(thePlayer)
		if(playervehicle) then
			if playervehicle and getVehicleController ( playervehicle ) == thePlayer then
			if(isVehicleLocked(playervehicle)) then
            setVehicleLocked(playervehicle,false)
			triggerClientEvent( thePlayer, "unBlq", thePlayer)
			outputChatBox("#AFAFAF[VEHICLE]#ffffff EL vehiculo ha sido desbloqueado.", thePlayer, 255, 255, 255, true)

        else
            setVehicleLocked(playervehicle,true)
			triggerClientEvent( thePlayer, "Blq", thePlayer)
			outputChatBox("#AFAFAF[VEHICLE]#ffffff EL vehiculo ha sido bloqueado.", thePlayer, 255, 255, 255, true)
			end
			end
		end
end


function exit(player,seat,jacked)
    if(isVehicleLocked(source)) then
        setVehicleLocked(source,false)
		triggerClientEvent( player, "unBlq", player)
    end
end
 addEventHandler("onVehicleExit",getRootElement(),exit)

function Activarte2(player)
	local Jugador = getElementsByType ( "player" )
	for k,j in ipairs(Jugador) do
		bindKey( j, "L", "down", BloquearCarros)
	end
	
end
addEventHandler("onResourceStart", getRootElement(getThisResource()), Activarte2)

function activate()
		bindKey( source, "L", "down", BloquearCarros)
end
addEventHandler("onPlayerJoin", getRootElement(), activate)