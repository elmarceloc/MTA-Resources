--// Vehicle Save&Load GUI
--// Updated 29.1.2015
--// By TexTra Y BlooD

--// Feel free to modify in any way you want
--// but please do not reupload this anywhere.
--// Thank you.

--//
--// Tables
--//

local setHandlingTable = {
"mass",
"turnMass",
"dragCoeff",
"centerOfMass",
"percentSubmerged",
"tractionMultiplier",
"tractionLoss",
"tractionBias",
"numberOfGears",
"maxVelocity",
"engineAcceleration",
"engineInertia",
"driveType",
"engineType",
"brakeDeceleration",
"brakeBias",
"ABS",
"steeringLock",
"suspensionForceLevel",
"suspensionDamping",
"suspensionHighSpeedDamping",
"suspensionUpperLimit",
"suspensionLowerLimit",
"suspensionFrontRearBias",
"suspensionAntiDiveMultiplier",
"seatOffsetDistance",
"collisionDamageMultiplier",
"monetary",
"modelFlags",
"handlingFlags",
"headLight",
"tailLight",
"animGroup"
}

tableVehicles = {}
bannedModels = {425,464,494,520,432,556,583,577,592,476,461,406,502,541,463,568,426,447}

--//
--// Create vehicle
--//

function spawnHandler(mdl,upgrades,paintjob,colors,hlcolors,handling,x,y,z,rz)
	for k,bModel in ipairs(bannedModels) do
		if tonumber(mdl) == bModel then
			outputChatBox("Este vehículo no puede cargarse desde su garage",client,255,255,0)
			return
		end
	end
	colorsT = fromJSON(colors)
	hlColorsT = fromJSON(hlcolors)
	upgradesT = fromJSON(upgrades)
	handlingT = fromJSON(handling)
	if tableVehicles[client] then
		destroyElement(tableVehicles[client])
		tableVehicles[client] = nil
	end
	tableVehicles[client] = createVehicle(mdl, x, y+2, z+2, 0, 0, rz)
	setVehiclePaintjob(tableVehicles[client], paintjob)
	setVehicleColor( tableVehicles[client], colorsT[1], colorsT[2], colorsT[3], colorsT[4], colorsT[5], colorsT[6] )
	setVehicleHeadLightColor( tableVehicles[client], hlColorsT[1], hlColorsT[2], hlColorsT[3] )
	for k,v in ipairs(upgradesT) do
		addVehicleUpgrade(tableVehicles[client],v)
	end
	loop1 = 1
	loop2 = 1
	for k,v in ipairs(setHandlingTable) do
		setVehicleHandling(tableVehicles[client],setHandlingTable[loop1],handlingT[loop2])
		loop1 = loop1 + 1
		loop2 = loop2 + 1
	end
	loop1 = 1
	loop2 = 1 
	outputChatBox("Vehículo cargado!",client,0,255,0)
	
	setElementData(tableVehicles[client], 'player', getPlayerAccount(client))
	
	--warpPedIntoVehicle(client,tableVehicles[client])
end
addEvent("createVehicleFromGUI",true)
addEventHandler("createVehicleFromGUI",root,spawnHandler)

--//
--// Destroy the vehicle if the player left
--//

function onLeave()
	if isElement(tableVehicles[source]) then
		destroyElement(tableVehicles[source])
	end
end
addEventHandler("onPlayerQuit",getRootElement(),onLeave)