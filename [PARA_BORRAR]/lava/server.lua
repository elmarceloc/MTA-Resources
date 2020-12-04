--[[

	Made by Platin
	platincanal@gmail.com

	Do whatever you want with it!

	BTW, the comments are on spanish!

]]

local iniciado = false -- Si el evento inicio
local timedOut = nil -- Si el evento se está cargando
local timerVehicle = nil -- Si esta chequeando que haya vehículos cerca de la lava
local lavaElement = nil -- El elemento de la lava (qué realmente es agua)
local playersListos = {} -- Los jugadores que ya descargaron los archivos del cliente
local nivelActual = 0 -- Nivel del agua (getWaterLevel() no funciona en serverside)

function togEvento(thePlayer) -- Función que inicia/detiene el evento vía comando
	local cuenta = getPlayerAccount(thePlayer)
	if not isGuestAccount(cuenta) and isObjectInACLGroup("user."..getAccountName(cuenta), aclGetGroup("Admin")) then -- Si el usuario tiene cuenta y es Admin
		if not iniciado then -- Si no esta iniciado, lo inicia
			iniciado = true
			lavaElement = createWater(-3000, -3000, 0, 3000, -3000, 0, -3000, 3000, 0, 3000, 3000, 0) -- Crea el agua
			setWaterColor(255, 0, 0, 240) -- La pone roja por si todavía no se te descargó todo
			setWaterLevel(-100, false) -- Coloca el agua real a un nivel que no se pueda ver
			timedOut = setTimer(subirNivelAgua, 50, 800) -- Hace que suba la lava
			timerVehicle = setTimer(checkVehicleAgua, 250, 0) -- Si lagea mucho aumentar el intervalo
			
			for k,thePlayer in ipairs(playersListos) do -- A todos los jugadores que ya descargaron
				if isElement(thePlayer) and getElementType(thePlayer) == "player" then
					triggerClientEvent(thePlayer, "onLavaCrearLava", resourceRoot, lavaElement) -- Les indica que inicien los calculos y visuales
				end
			end
		elseif iniciado and not timedOut then -- Si ya se inicio y se terminó de mover el agua
			timedOut = setTimer(bajarNivelAgua, 50, 800) -- Hace que baje la lava
		else -- Si ya se inicio pero no se terminó de mover el agua
			outputChatBox("#AA0000Espera a que la lava se deje de mover.", thePlayer, 0,0,0,true)
		end
	end
end
addCommandHandler("lava", togEvento)

function subirNivelAgua() -- Sube el nivel del agua a 0.5 unidades por segundo
	nivelActual = nivelActual + 0.025
	setWaterLevel(lavaElement, nivelActual)
	setWaveHeight(0.10) -- Coloca las olas a 0.1
	
	if nivelActual >= 19.5 then -- Margen de error (una vez termina de subir hasta cerca de su punto máximo)
		timedOut = nil
	end
end

function bajarNivelAgua() -- Baja el nivel del agua a 0.5 unidades por segundo
	nivelActual = nivelActual - 0.025
	setWaterLevel(lavaElement, nivelActual)
	
	if nivelActual <= 0.25 then -- Margen de error (una vez termina de bajar hasta cerca de su punto mínimo)
		resetWaterColor() -- Reinicia el color del agua
		setWaterLevel(0, false) -- Hace que el agua real se coloque en la altura default
		for k,thePlayer in ipairs(playersListos) do -- Le avisa a todos los jugadores que cargaron
			if isElement(thePlayer) and getElementType(thePlayer) == "player" then
				triggerClientEvent(thePlayer, "onLavaFinalizar", resourceRoot) -- Que terminen el evento y saquen las visuales
			end
		end
		if timerVehicle and isTimer(timerVehicle) then -- Si todavía chequea vehículos que los deje de chequear
			killTimer(timerVehicle)
		end
		timerVehicle = nil
		destroyElement(lavaElement) -- Destruye el element de agua de la lava
		lavaElement = nil
		nivelActual = 0 -- Por las dudas pone que el nivel actual del agua es cero
		
		iniciado = false -- Y coloca que el evento ya no esta iniciado
	end
end

function checkVehicleAgua() -- Chequea si los vehículos están cerca del agua
	for k,veh in ipairs(getElementsByType("vehicle")) do -- Esto lagea
		if not isVehicleBlown(veh) then -- Y no están explotados
			local x, y, z = getElementPosition(veh)
			if z <= nivelActual + 1 then
				blowVehicle(veh) -- Que exploten
			end
		end
	end
end

addEvent("onLavaSetPedOnFire", true)
addEventHandler("onLavaSetPedOnFire", root, setPedOnFire) -- Sync

addEvent("onLavaSetElementHealth", true)
addEventHandler("onLavaSetElementHealth", root, setElementHealth) -- Sync

function onClientReady() -- Sync
	table.insert(playersListos, source)
	if lavaElement then
		setWaterLevel(lavaElement, nivelActual) -- Por algun motivo la altura del agua no se sincroniza bien, así que es necesario actualizarla desde el servidor
		triggerClientEvent(source, "onLavaCrearLava", resourceRoot, lavaElement)
	end
end
addEvent("onLavaClientReady", true)
addEventHandler("onLavaClientReady", root, onClientReady)

function onStop() -- Si el resource se detiene vuelve todo a la normalidad
	if iniciado then
		resetWaterColor()
		setWaterLevel(0, false)
	end
end
addEventHandler("onResourceStop", resourceRoot, onStop)