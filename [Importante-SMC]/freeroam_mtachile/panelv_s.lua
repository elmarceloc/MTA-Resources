function Rep()
	--outputChatBox("#AFAFAF[Panel del vehículo]#FFFFFF El vehículo ha sido reparado.", source, 255, 255, 255, true)
end
addEvent("Reparado", true)
addEventHandler("Reparado", getRootElement(), Rep)

function Fli()
	--outputChatBox("#AFAFAF[Panel del vehículo]#FFFFFF El vehículo ha sido dado vuelta.", source, 255, 255, 255, true)
end
addEvent("Flip", true)
addEventHandler("Flip", getRootElement(), Fli)

function NitroX2()
	--outputChatBox("#AFAFAF[Panel del vehículo]#FFFFFF Se añadió nitro x 2.", source, 255, 255, 255, true)
end
addEvent("nitro2", true)
addEventHandler("nitro2", getRootElement(), NitroX2)

function NitroX5()
	--outputChatBox("#AFAFAF[Panel del vehículo]#FFFFFF Se añadió nitro x 5.", source, 255, 255, 255, true)
end
addEvent("nitro5", true)
addEventHandler("nitro5", getRootElement(), NitroX5)

function NitroX10()
	--outputChatBox("#AFAFAF[Panel del vehículo]#FFFFFF Se añadió nitro x 10.", source, 255, 255, 255, true)
end
addEvent("nitro10", true)
addEventHandler("nitro10", getRootElement(), NitroX10)

function MotorOn()
	outputChatBox("#AFAFAF[Panel del vehículo]#FFFFFF El motor se ha encendido.", source, 255, 255, 255, true)
end
addEvent("motorOn", true)
addEventHandler("motorOn", getRootElement(), MotorOn)

function MotorOff()
	outputChatBox("#AFAFAF[Panel del vehículo]#FFFFFF El motor se ha apagado.", source, 255, 255, 255, true)
end
addEvent("motorOff", true)
addEventHandler("motorOff", getRootElement(), MotorOff)

function LucesOn()
	--outputChatBox("#AFAFAF[Panel del vehículo]#FFFFFF Prendiste las luces.", source, 255, 255, 255, true)
end
addEvent("lucesOn", true)
addEventHandler("lucesOn", getRootElement(), LucesOn)

function LucesOff()
--outputChatBox("#AFAFAF[Panel del vehículo]#FFFFFF Apagase las luces.", source, 255, 255, 255, true)
end
addEvent("lucesOff", true)
addEventHandler("lucesOff", getRootElement(), LucesOff)

function LockOn()
	outputChatBox("#AFAFAF[Panel del vehículo]#FFFFFF Vehículo bloqueado.", source, 255, 255, 255, true)
end
addEvent("Lock", true)
addEventHandler("Lock", getRootElement(), LockOn)

function LockOff()
	outputChatBox("#AFAFAF[Panel del vehículo]#FFFFFF Vehículo desbloqueado.", source, 255, 255, 255, true)
end
addEvent("unLock", true)
addEventHandler("unLock", getRootElement(), LockOff)

function subirsuspension()
	local vehicle = getPedOccupiedVehicle ( source )
	if not vehicle then return end
	local altura_original = (getVehicleHandling(vehicle)['suspensionUpperLimit']*-1) -- Get the original handling and multiply to get negative and matches with the actual
	local suspension = (getVehicleHandling(vehicle)['suspensionLowerLimit']) -- Get actual handling from the player car
	
	
	
	if (suspension < altura_original-0.2) then --  Compares if the suspension are less then original handling height
		
	else
		setVehicleHandling ( vehicle, "suspensionLowerLimit", suspension-0.1 ) -- With suspension limit
	end
end
addEvent("upsuspension", true)
addEventHandler("upsuspension", root, subirsuspension)

function bajarsuspension( player )
	local vehicle = getPedOccupiedVehicle ( source )
	if not vehicle then return end

	local suspension = (getVehicleHandling(vehicle)['suspensionLowerLimit']) -- Get actual car handling for lower

	setVehicleHandling ( vehicle, "suspensionLowerLimit", suspension+0.1 ) -- With suspension limit 
end
addEvent("downsuspension", true)
addEventHandler("downsuspension", root, bajarsuspension)