--local sentaodepanavehicleID = 402
local c90vehicleID = 462

local g_PlayerData = {}
local g_VehicleData = {}
local chatTime = {}
local lastChatMessage = {}

g_ArmedVehicles = {
	[425] = true,
	[447] = true,
	[520] = true,
	[430] = true,
	[464] = true,
	[432] = true
}
g_Trailers = {
	[606] = true,
	[607] = true,
	[610] = true,
	[590] = true,
	[569] = true,
	[611] = true,
	[584] = true,
	[608] = true,
	[435] = true,
	[450] = true,
	[591] = true
}

g_RPCFunctions = {
	addVehicleUpgrade = { option = 'upgrades', descr = 'Adding/removing upgrades' },
	fadeVehiclePassengersCamera = true,
	fixVehicle = { option = 'repair', descr = 'Repairing vehicles' },
	giveMeVehicles = { option = 'createvehicle', descr = 'Creating vehicles' },
	giveMeWeapon = { option = 'weapons.enabled', descr = 'Getting weapons' },
	givePedJetPack = { option = 'jetpack', descr = 'Getting a jetpack' },
	removePedFromVehicle = true,
	removePedJetPack = { option = 'jetpack', descr = 'Removing a jetpack' },
	removeVehicleUpgrade = { option = 'upgrades', descr = 'Adding/removing upgrades' },
	setElementAlpha = { option = 'alpha', descr = 'Changing your alpha' },
	setElementInterior = true,
	setMySkin = { option = 'setskin', descr = 'Setting skin' },
	setPedAnimation = { option = 'anim', descr = 'Setting an animation' },
	setPedFightingStyle = { option = 'setstyle', descr = 'Setting fighting style' },
	setVehicleColor = true,
	setVehicleHeadLightColor = true,
	setVehicleOverrideLights = { option = 'lights', descr = 'Forcing lights' },
	setVehiclePaintjob = { option = 'paintjob', descr = 'Applying paintjobs' },
	warpMeIntoVehicle = true,
	setWereable = true,
	delWereable = true
}

g_OptionDefaults = {
	alpha = true,
	anim = true,
	createvehicle = true,
	gamespeed = {
		enabled = true,
		min = 0.0,
		max = 3
	},
	gravity = {
		enabled = true,
		min = 0,
		max = 0.1
	},
	jetpack = true,
	lights = true,
	paintjob = true,
	repair = true,
	setskin = true,
	setstyle = true,
	spawnmaponstart = true,
	spawnmapondeath = true,
	upgrades = true,
	warp = true,
	weapons = {
		enabled = true,
		vehiclesenabled = true,
		disallowed = {},
		kniferestrictions = true
	},
	sounds = true;
	skinsounds = true;
	welcometextonstart = true,
	vehicles = {
		maxidletime = 60000,
		idleexplode = true,
		maxperplayer = 2,
		disallowed = {}
	}
}

function getOption(optionName)
	local option = get(optionName:gsub('%.', '/'))
	if option then
		if option == 'true' then
			option = true
		elseif option == 'false' then
			option = false
		end
		return option
	end
	option = g_OptionDefaults
	for i,part in ipairs(optionName:split('.')) do
		option = option[part]
	end
	return option
end

addEventHandler('onResourceStart', resourceRoot,
function()

	-- table.each(getElementsByType('player'), function(player)
	-- 	local accName = getAccountName(getPlayerAccount(player))
	-- 	if isObjectInACLGroup ("user."..accName, aclGetGroup("Vip")) then
	-- 		triggerClientEvent(player,"setVip",player)
	-- 	end

	-- end)

	

	table.each(getElementsByType('player'), joinHandler)
	
end
)


function onLocalSettingChange(setting,value)

	if client ~= source then return end
	g_PlayerData[client].settings[setting] = value
	triggerClientEvent("onClientFreeroamLocalSettingChange",client,setting,value)

end

function joinHandler(player)
	if not player then
		player = source
	end
	local r, g, b = math.random(50, 255), math.random(50, 255), math.random(50, 255)
	setPlayerNametagColor(player, r, g, b)
	g_PlayerData[player] = { vehicles = {}, settings={} }
	g_PlayerData[player].blip = createBlipAttachedTo(player, 0, 2, r, g, b)
	addEventHandler("onFreeroamLocalSettingChange",player,onLocalSettingChange)

	if getOption('welcometextonstart') then
		--outputChatBox('Welcome to Freeroam', player, 0, 255, 0)
		--outputChatBox('Press F1 to show/hide controls', player, 0, 255, 0)
	end
end
addEventHandler('onPlayerJoin', root, joinHandler)


local settingsToSend = {
	"command_spam_protection",
	"tries_required_to_trigger",
	"tries_required_to_trigger_low_priority",
	"command_spam_ban_duration",
	"command_exception_commands",
	"removeHex",
	"spawnmapondeath",
	"weapons/kniferestrictions",
	"kill",
	"sounds",
	"skinsounds",
	"warp",
	"hidecolortext",
	"gamespeed/enabled",
	"gamespeed/min",
	"gamespeed/max",
	"gui/antiram",
	"gui/disablewarp",
	"gui/disableknife",
	"vehicles/disallowed_warp",
}

local function updateSettings()
	local settings = {}
	for _, setting in ipairs(settingsToSend) do
		settings[setting] = getOption(setting)
	end
	return settings
end

local function sendSettings(player,settingPlayer,settings)

	for setting,value in pairs(settings) do
		triggerClientEvent(player,"onClientFreeroamLocalSettingChange",settingPlayer,setting,value)
	end

end


addEvent('onLoadedAtClient', true)
addEventHandler('onLoadedAtClient', resourceRoot,
	function()
		if getOption('spawnmaponstart') and isPedDead(client) then
		--	clientCall(client, 'showWelcomeMap')
		end
		local settings = updateSettings()
		clientCall(client, 'freeroamSettings', settings)


		for player,data in pairs(g_PlayerData) do
			if player ~= client then

				local settings = data.settings
				setTimer(sendSettings,1500,1,client,player,settings)
			end
		end
	end,
	false
)

function onSettingChange(key,_,new)
	local access = key:sub(1, 1) -- we always have modifiers
	if access ~= "*" and access ~= "#" and access ~= "@" then
		return
	end

	local resource = key:sub(2, 9)
	if key:sub(2, 9) ~= getThisResource().name then
		return
	end

	local setting = key:sub(11)
	if not table.find(settingsToSend, setting) then
		return
	end

	local settings = updateSettings()
	for index,player in ipairs(getElementsByType("player")) do
		clientCall(player, 'freeroamSettings', settings)
	end
end
addEventHandler("onSettingChange", root, onSettingChange)

function setMySkin(skinid)
	setPedAnimation(source)

	if getElementModel(source) == skinid then return end
	if isPedDead(source) then
		local x, y, z = getElementPosition(source)
		if isPedTerminated(source) then
			x = 0
			y = 0
			z = 3
		end
		local r = getPedRotation(source)
		local interior = getElementInterior(source)
		spawnPlayer(source, x, y, z, r, skinid)
		
		setElementInterior(source, interior)
		setCameraInterior(source, interior)
	else
		local canset = checkifunlock(source,skinid)
		if canset then 
			setElementModel(source, skinid)
		end
	end

	setCameraTarget(source, source)
	setCameraInterior(source, getElementInterior(source))
end

function spawnMe(x, y, z)
	if not x then
		x, y, z = getElementPosition(source)
	end
	if isPedTerminated(source) then
		repeat until spawnPlayer(source, x, y, z, 0, math.random(9, 288))
	else
		spawnPlayer(source, x, y, z, 0, getPedSkin(source))
	end

	--setCameraTarget(source, source)
	setCameraInterior(source, getElementInterior(source))

end

function warpMeIntoVehicle(vehicle)
	if not isElement(vehicle) then return end

	if isPedDead(source) then
		spawnMe()
	end

	if getPedOccupiedVehicle(source) then
		outputChatBox('Get out of your vehicle first.', source, 255,0,0)
		return
	end
	local interior = getElementInterior(vehicle)
	local numseats = getVehicleMaxPassengers(vehicle)
	local driver = getVehicleController(vehicle)
	for i=0,numseats do
		if not getVehicleOccupant(vehicle, i) then
			if isPedDead(source) then
				local x, y, z = getElementPosition(vehicle)
				spawnMe(x + 4, y, z + 1)
			end
			setElementInterior(source, interior)
			setCameraInterior(source, interior)
			warpPedIntoVehicle(source, vehicle, i)
			return
		end
	end
	if isElement(driver) then
		outputChatBox('No free seats left in ' .. getPlayerName(driver) .. '\'s vehicle.', source, 255, 0, 0)
	end

end

local sawnoffAntiAbuse = {}
function giveMeWeapon(weapon, amount)
	if table.find(getOption('weapons.disallowed'), weapon) then
		errMsg((getWeaponNameFromID(weapon) or tostring(weapon)) .. 's are not allowed', source)
	else
		giveWeapon(source, weapon, amount, true)
		if weapon == 26 then
			if not sawnoffAntiAbuse[source] then
				setControlState (source, "aim_weapon", false)
				setControlState (source, "fire", false)
				toggleControl (source, "fire", false)
				reloadPedWeapon (source)
				sawnoffAntiAbuse[source] = setTimer (function(source)
					if not source then return end
					toggleControl (source, "fire", true)
					sawnoffAntiAbuse[source] = nil
				end, 3000, 1, source)
			end
        end
	end
end


-- function playskinsoundtoserver(sound,block,anim,duration,theplayer)
-- 	setPedAnimation(theplayer,block,anim,duration,true,true,true,false)
-- 	triggerClientEvent("playskinsound",root,sound,theplayer)
-- end

function giveMeVehicles(vehID)
	local px, py, pz, prot
	local element = getPedOccupiedVehicle(source) or source
	local px,py,pz = getElementPosition(element)
	local _,_,prot = getElementRotation(element)
	local posVector = Vector3(px,py,pz+2)
	local rotVector = Vector3(0,0,prot)
	local vehMatrix = Matrix(posVector,rotVector)
	local vehicleList = g_PlayerData[source].vehicles
	if not vehID then return end
	if not table.find(getOption('vehicles.disallowed'), vehID) then
		if #vehicleList >= getOption('vehicles.maxperplayer') then unloadVehicle(vehicleList[1]) end
		local vehPos = posVector+vehMatrix.right*3
		local vehicle = Vehicle(vehID, vehPos, rotVector) or false

		if vehicle and vehID == c90vehicleID then
			setVehicleColor(vehicle, 19,90,184)
		end

		if vehicle then
			vehicle.interior = source.interior
			vehicle.dimension = source.dimension

			setElementData(vehicle, 'player', source )

			if vehicle.vehicleType == "Bike" then vehicle.velocity = Vector3(0,0,-0.01) end
			table.insert(vehicleList, vehicle)
			g_VehicleData[vehicle] = { creator = source, timers = {} }
			if g_Trailers[vehID] then
				if getOption('vehicles.maxidletime') >= 0 then
					if getOption('vehicles.idleexplode') then
						g_VehicleData[vehicle].timers.fire = setTimer(commitArsonOnVehicle, getOption('vehicles.maxidletime'), 1, vehicle)
					end
					g_VehicleData[vehicle].timers.destroy = setTimer(unloadVehicle, getOption('vehicles.maxidletime') + (getOption('vehicles.idleexplode') and 10000 or 0), 1, vehicle)
				end
			end
		end
	else
		errMsg(getVehicleNameFromModel(vehID):gsub('y$', 'ie') .. 's are not allowed', source)
	end
end


function fadeVehiclePassengersCamera(toggle)
	local vehicle = getPedOccupiedVehicle(source)
	if not vehicle then
		return
	end
	local player
	for i=0,getVehicleMaxPassengers(vehicle) do
		player = getVehicleOccupant(vehicle, i)
		if player then
			fadeCamera(player, toggle)
		end
	end
end



addEventHandler('onPlayerChat', root,
	function(msg, type)
		if type == 0 then
			cancelEvent()
			if chatTime[source] and chatTime[source] + 1000 > getTickCount() then
				outputChatBox("Deja de hacer spam -_-", source, 255, 0, 0)
				return
			else
				chatTime[source] = getTickCount()
			end
			if get("*chat/blockRepeatMessages") == "true" and lastChatMessage[source] and lastChatMessage[source] == msg then
				outputChatBox("!No repitas lo mismo!", source, 255, 0, 0)
				return
			else
				lastChatMessage[source] = msg
			end

			local r, g, b = getPlayerNametagColor(source)

			for _,player in ipairs(getElementsByType("player")) do 
				local x,y,z    = getElementPosition(source)
				local x2,y2,z2 = getElementPosition(player)

				local distance = getDistanceBetweenPoints3D(x,y,z,x2,y2,z2)


				if distance < 60 then
					--triggerClientEvent("onChatIncome", source, msg,{0, 0, 0})

					outputChatBox(getPlayerName(source) .. ': #FFFFFF' .. msg, player, r, g, b, true)
				end
				
			end
			
			outputServerLog( "CHAT Local: " .. getPlayerName(source) .. ": " .. msg )
			
			--outputChatBox(getPlayerName(source) .. ': #FFFFFF' .. msg:gsub('#%x%x%x%x%x%x', ''), root, r, g, b, true)
		end
	end
)

addEventHandler('onPlayerLogin',root,function()

	local accName = getAccountName(getPlayerAccount(source))
	if isObjectInACLGroup ("user."..accName, aclGetGroup("Vip")) then
		triggerClientEvent(source,"setVip",source)
	end

end)


addEventHandler('onVehicleEnter', root,
	function(player, seat)
		if not g_VehicleData[source] then
			return
		end
		if g_VehicleData[source].timers.fire then
			killTimer(g_VehicleData[source].timers.fire)
			g_VehicleData[source].timers.fire = nil
		end
		if g_VehicleData[source].timers.destroy then
			killTimer(g_VehicleData[source].timers.destroy)
			g_VehicleData[source].timers.destroy = nil
		end
		if not getOption('weapons.vehiclesenabled') and g_ArmedVehicles[getElementModel(source)] then
			toggleControl(player, 'vehicle_fire', false)
			toggleControl(player, 'vehicle_secondary_fire', false)
		end
	end
)

addEventHandler('onVehicleExit', root,
	function(player, seat)
		if not g_VehicleData[source] then
			return
		end
		if not g_VehicleData[source].timers.fire then
			for i=0,getVehicleMaxPassengers(source) or 1 do
				if getVehicleOccupant(source, i) then
					return
				end
			end
			if getOption('vehicles.maxidletime') >= 0 then
				if getOption('vehicles.idleexplode') then
					g_VehicleData[source].timers.fire = setTimer(commitArsonOnVehicle, getOption('vehicles.maxidletime'), 1, source)
				end
				g_VehicleData[source].timers.destroy = setTimer(unloadVehicle, getOption('vehicles.maxidletime') + (getOption('vehicles.idleexplode') and 10000 or 0), 1, source)
			end
		end
		if g_ArmedVehicles[getElementModel(source)] then
			toggleControl(player, 'vehicle_fire', true)
			toggleControl(player, 'vehicle_secondary_fire', true)
		end
	end
)

function commitArsonOnVehicle(vehicle)
	g_VehicleData[vehicle].timers.fire = nil
	setElementHealth(vehicle, 0)
end

addEventHandler('onVehicleExplode', root,
	function()
		if not g_VehicleData[source] then
			return
		end
		if g_VehicleData[source].timers.fire then
			killTimer(g_VehicleData[source].timers.fire)
			g_VehicleData[source].timers.fire = nil
		end
		if not g_VehicleData[source].timers.destroy then
			g_VehicleData[source].timers.destroy = setTimer(unloadVehicle, 5000, 1, source)
		end
		if getVehicleController(source) then
			
		end
	end
)

function unloadVehicle(vehicle)
	if not g_VehicleData[vehicle] then
		return
	end
	for name,timer in pairs(g_VehicleData[vehicle].timers) do
		if isTimer(timer) then
			killTimer(timer)
		end
		g_VehicleData[vehicle].timers[name] = nil
	end
	local creator = g_VehicleData[vehicle].creator
	if g_PlayerData[creator] then
		table.removevalue(g_PlayerData[creator].vehicles, vehicle)
	end
	g_VehicleData[vehicle] = nil
	if isElement(vehicle) then
		destroyElement(vehicle)
	end
end

addCommandHandler("quitarblip", 
function(player) 
	local accName = getAccountName(getPlayerAccount(player))
	local admin = isObjectInACLGroup ("user."..accName, aclGetGroup ( "Admin" ) )
	local moderador = isObjectInACLGroup ("user."..accName, aclGetGroup ( "Moderator" ) )
	if admin or moderator then -- Does he have access to Admin functions?
		destroyElement(g_PlayerData[player].blip)
	end
end)


function quitHandler(player)
	if g_PlayerData[source].blip and isElement(g_PlayerData[source].blip) then
		destroyElement(g_PlayerData[source].blip)
	end
	if sawnoffAntiAbuse[source] and isTimer (sawnoffAntiAbuse[source]) then
		killTimer (sawnoffAntiAbuse[source])
		sawnoffAntiAbuse[source] = nil
	end
	table.each(g_PlayerData[source].vehicles, unloadVehicle)
	removeEventHandler("onFreeroamLocalSettingChange",source,onLocalSettingChange)
	g_PlayerData[source] = nil
	chatTime[source] = nil
	lastChatMessage[source] = nil
end
addEventHandler('onPlayerQuit', root, quitHandler)

addEvent('onServerCall', true)
addEventHandler('onServerCall', resourceRoot,
	function(fnName, ...)
		source = client		-- Some called functions require 'source' to be set to the triggering client
		local fnInfo = g_RPCFunctions[fnName]

		-- Custom check made to intercept the jetpack on custom gravity
		if fnInfo and type(fnInfo) ~= "boolean" and tostring(fnInfo.option) == "jetpack" then
			if tonumber(("%.3f"):format(getPedGravity(source))) ~= 0.008 then
				errMsg("* You may use jetpack only if the gravity is set to 0.008", source)
				return
			end
		end

		if fnInfo and ((type(fnInfo) == 'boolean' and fnInfo) or (type(fnInfo) == 'table' and getOption(fnInfo.option))) then
			local fn = _G
			for i,pathpart in ipairs(fnName:split('.')) do
				fn = fn[pathpart]
			end
			fn(...)
		elseif type(fnInfo) == 'table' then
			errMsg(fnInfo.descr .. ' is not allowed', source)
		end
	end
)

function clientCall(player, fnName, ...)
	triggerClientEvent(player, 'onClientCall', resourceRoot, fnName, ...)
end

function getPlayerName(player)
	return getOption("removeHex") and player.name:gsub("#%x%x%x%x%x%x","") or player.name
end

addEvent("onFreeroamLocalSettingChange",true)