
-- Bugatti Chiron (de pacos)

function loadHandling(v)	
		if getElementModel(v) == 598 then 		-------------------/ ID DEL VEHÍCULO
			setVehicleHandling(v, "mass", 4550)
			setVehicleHandling(v, "turnMass", 12500)
			setVehicleHandling(v, "dragCoeff", 1.8)
			setVehicleHandling(v, "centerOfMass", { 0, 0.15, -0.3 } )
			setVehicleHandling(v, "percentSubmerged", 75)
			setVehicleHandling(v, "tractionMultiplier", 0.9)
			setVehicleHandling(v, "tractionLoss", 0.9)
			setVehicleHandling(v, "tractionBias", 0.497)
			setVehicleHandling(v, "numberOfGears", 5)
			setVehicleHandling(v, "maxVelocity", 180) -------------------/ VELOCIDAD MAXÍMA
			setVehicleHandling(v, "engineAcceleration", 45) -------------------/ ACELERACIÓN
			setVehicleHandling(v, "engineInertia", 50)
			setVehicleHandling(v, "driveType", "awd") -------------------/ TRACCIÓN
			setVehicleHandling(v, "engineType", "petrol")
			setVehicleHandling(v, "brakeDeceleration", 50)
			setVehicleHandling(v, "ABS", true)
			setVehicleHandling(v, "steeringLock", 47)
			setVehicleHandling(v, "headLight", 0)
			setVehicleHandling(v, "tailLight", 1)
			setVehicleHandling(v, "animGroup", 0)
			setVehicleHandling(v, "suspensionUpperLimit", 0)
			setVehicleHandling(v, "suspensionLowerLimit", 9)
		end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------




---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

end

function loadHandlings()
	for k, v in ipairs(getElementsByType("vehicle")) do
		loadHandling(v)
	end
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), loadHandlings)

function vehicleEnter()
	loadHandling(source)
end
addEventHandler("onVehicleEnter", getRootElement(), vehicleEnter)