addCommandHandler('vehinfo',function(player)
    local vehicle = getPedOccupiedVehicle(player)

    local creador = getPlayerName(getElementData(vehicle, 'player'))
    outputChatBox('Creador: #00FF00'..creador ,source,255,255,255,true)

end)