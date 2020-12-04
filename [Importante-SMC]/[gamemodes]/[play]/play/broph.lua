local vehiclesToSpawn =
{

}

local spawnpoints =
{
	{2488.3310546875,-1667.6258544922,13.34375,90},
	{1166,-2037,69,270},
	{642.951171875,-1355.9969482422,13.563170433044,90},
	{2027.6145019531,-1420.9930419922,16.9921875,133},
}

local vehicleDestroyTimers = {}
local validSkins = {0, 1, 2, 7, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 66, 67, 68, 69, 70, 71, 72, 73, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 150, 151, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287, 288, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299, 300, 301, 302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312}
local playerVehicles = {}

local function spawn(player)

	if player and isElement(player) then
		local x,y,z,r = unpack(spawnpoints[math.random(1,#spawnpoints)])
		spawnPlayer(player,x+math.random(-3,3),y+math.random(-3,3),z+2,r,validSkins[math.random(1,#validSkins)],0,0)
		fadeCamera(player, true)
		setCameraTarget(player, player)
	end
end

local function onJoin()

	spawn(source)

end

local function onWasted()

	local t = tonumber(get("playerRespawnTime")) or 5000
	setTimer(spawn,(t > 50 and t or 50),1,source)

end

local function destroyPlayerVehicles()

	local vehicles = playerVehicles[source]

	for _,vehicle in ipairs(vehicles) do
		if isElement(vehicle) then
			destroyElement(vehicle)
		end
	end

	playerVehicles[source] = nil

end

local function onEnter(player)

	local t = tonumber(get("vehicleRespawnTime")) or 60000
	source.damageProof = false
	source.frozen = false
	local vehicledata = vehiclesToSpawn[source]
	setTimer(createNewVehicle,(t > 50 and t or 50),1,vehicledata)
	vehiclesToSpawn[source] = nil
	if not playerVehicles[player] then
		playerVehicles[player] = {}
		addEventHandler("onPlayerQuit",player,destroyPlayerVehicles)
	end
	table.insert(playerVehicles[player],source)
	removeEventHandler("onVehicleEnter",source,onEnter)

end

local function destroyVehicle(vehicle)

	if vehicle and isElement(vehicle) and getElementType(vehicle) == "vehicle" then
		destroyElement(vehicle)
	end
end

local function destroyTimer()

	if vehicleDestroyTimers[source] and isTimer(vehicleDestroyTimers[source]) then killTimer(vehicleDestroyTimers[source]) end
	removeEventHandler("onVehicleEnter",source,destroyTimer)

end

local function onExit()

	local t = tonumber(get("vehicleExpireTime")) or 600000
	vehicleDestroyTimers[source] = setTimer(destroyVehicle,(t > 50 and t or 50),1,source)
	addEventHandler("onVehicleEnter",source,destroyTimer)

end

function createNewVehicle(vehicledata)

	local m,x,y,z,r = unpack(vehicledata)
	local vehicle = Vehicle(m,x,y,z,0,0,r)
	vehicle.damageProof = true
	vehicle.frozen = true
	vehiclesToSpawn[vehicle] = vehicledata
	addEventHandler("onVehicleEnter",vehicle,onEnter)
	addEventHandler("onVehicleExit",vehicle,onExit)

end

local function initScript()

	resetMapInfo()
	local players = getElementsByType("player")

	for _,player in ipairs(players) do spawn(player) end
	for _,vehicledata in ipairs(vehiclesToSpawn) do createNewVehicle(vehicledata) end

	addEventHandler("onPlayerJoin",root,onJoin)
	addEventHandler("onPlayerWasted",root,onWasted)

end

addEventHandler("onResourceStart",resourceRoot,initScript)
