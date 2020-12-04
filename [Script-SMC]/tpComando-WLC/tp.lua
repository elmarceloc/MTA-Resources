comando = { }
tiempo = 0 -- milisegundos 1000 = 1 segundo--

local time = getRealTime()
	local hours = time.hour
	local minutes = time.minute
	local seconds = time.second

--DRIFT_1--
function drift1 (thePlayer)
    --oudrift1utChatBox ( "#0D81E6En 3 segundos seras transportado!!#0D81E6!", root, 255, 255, 255, true)
	setTimer( function()
	setElementPosition ( thePlayer, -274.43872, -3047.10938, 50.26491 )
	--oudrift1utChatBox ('#FFFFFF' .. gedrift1layerName(thePlayer) .. ' #FFFFFF [#01B42E Fue al barrio de CJ #FFFFFF] #FFFFFF[#01B42E /cj #FFFFFF]  [#FF0000Hora real : '..hours..' : '..minutes..'#FFFFFF]', root, 255, 255, 255, true)
    end, tiempo, 1)
	end
addCommandHandler ( "drift1", drift1 )

--DRIFT_1--
function drift2 (thePlayer)
    --oudrift1utChatBox ( "#0D81E6En 3 segundos seras transportado!!#0D81E6!", root, 255, 255, 255, true)
	setTimer( function()
	setElementPosition ( thePlayer, -886.56183, 555.27539, 13.54109 )
	--oudrift1utChatBox ('#FFFFFF' .. gedrift1layerName(thePlayer) .. ' #FFFFFF [#01B42E Fue al barrio de CJ #FFFFFF] #FFFFFF[#01B42E /cj #FFFFFF]  [#FF0000Hora real : '..hours..' : '..minutes..'#FFFFFF]', root, 255, 255, 255, true)
    end, tiempo, 1)
	end
addCommandHandler ( "drift2", drift2 )

--DRIFT_1--
function drift3 (thePlayer)
    --oudrift1utChatBox ( "#0D81E6En 3 segundos seras transportado!!#0D81E6!", root, 255, 255, 255, true)
	setTimer( function()
	setElementPosition ( thePlayer, -4230.10059, 624.37408, 618.97449 )
	--oudrift1utChatBox ('#FFFFFF' .. gedrift1layerName(thePlayer) .. ' #FFFFFF [#01B42E Fue al barrio de CJ #FFFFFF] #FFFFFF[#01B42E /cj #FFFFFF]  [#FF0000Hora real : '..hours..' : '..minutes..'#FFFFFF]', root, 255, 255, 255, true)
    end, tiempo, 1)
	end
addCommandHandler ( "drift3", drift3 )

--LABERINTO_1--
function laberinto1 (thePlayer)
    --oudrift1utChatBox ( "#0D81E6En 3 segundos seras transportado!!#0D81E6!", root, 255, 255, 255, true)
	setTimer( function()
	setElementPosition ( thePlayer, 3186.77271, -1342.78040, 71.89642 )
	--oudrift1utChatBox ('#FFFFFF' .. gedrift1layerName(thePlayer) .. ' #FFFFFF [#01B42E Fue al barrio de CJ #FFFFFF] #FFFFFF[#01B42E /cj #FFFFFF]  [#FF0000Hora real : '..hours..' : '..minutes..'#FFFFFF]', root, 255, 255, 255, true)
    end, tiempo, 1)
	end
addCommandHandler ( "laberinto1", laberinto1 )