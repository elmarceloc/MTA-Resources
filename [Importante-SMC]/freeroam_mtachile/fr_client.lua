pricedown = dxCreateFont("pricedown.ttf",30) 
pricedown2 = dxCreateFont("pricedown.ttf",45) 
pricedown3 = dxCreateFont("pricedown.ttf",15) 


local screenW, screenH = guiGetScreenSize()

local centerx = screenW/2
local centery = screenH/2

node = true
index = 0

local commands = {}
local customSpawnTable = false
local allowedStyles =
{
	[4] = true,
	[5] = true,
	[6] = true,
	[7] = true,
	[15] = true,
	[16] = true,
}
local internallyBannedWeapons = -- Fix for some debug warnings
{
	[19] = true,
	[20] = true,
	[21] = true,
}
local server = setmetatable(
		{},
		{
			__index = function(t, k)
				t[k] = function(...) triggerServerEvent('onServerCall', resourceRoot, k, ...) end
				return t[k]
			end
		}
	)
guiSetInputMode("no_binds_when_editing")
setCameraClip(true, false)

local antiCommandSpam = {} -- Place to store the ticks for anti spam:
local playerGravity = getGravity() -- Player's current gravity set by gravity window --
local knifeRestrictionsOn = false

-- Local settings received from server
local g_settings = {}
local _addCommandHandler = addCommandHandler
local _setElementPosition = setElementPosition

if not (g_PlayerData) then
    g_PlayerData = {}
end

-- Settings are stored in meta.xml
function freeroamSettings(settings)
	if settings then
		g_settings = settings
		for _,gui in ipairs(disableBySetting) do
			guiSetEnabled(getControl(gui.parent,gui.id),g_settings["gui/"..gui.id])
		end
	end
end

-- Store the tries for forced global cooldown
local global_cooldown = 0
function isFunctionOnCD(func, exception)
	local tick = getTickCount()
	-- check if a global cd is active
	if g_settings.command_spam_protection and global_cooldown ~= 0 then
		if tick - global_cooldown <= g_settings.command_spam_ban_duration then
			local duration = math.ceil((g_settings.command_spam_ban_duration-tick+global_cooldown)/1000)
			errMsg("No puedes usar comandos durante " .. duration)
			return true
		end
	end

	if not g_settings.command_spam_protection then
		return false
	end

	if not antiCommandSpam[func] then
		antiCommandSpam[func] = {time = tick, tries = 1}
		return false
	end

	local oldTime = antiCommandSpam[func].time
	if (tick-oldTime) > 2000 then
		antiCommandSpam[func].time = tick
		antiCommandSpam[func].tries = 1
		return false
	end

	antiCommandSpam[func].tries = antiCommandSpam[func].tries + 1

	if exception and (antiCommandSpam[func].tries < g_settings.g_settings.tries_required_to_trigger_low_priority) then
		return false
	end

	if (exception == nil) and (antiCommandSpam[func].tries < g_settings.tries_required_to_trigger) then
		return false
	end

	-- activate a global command cooldown
	global_cooldown = tick
	antiCommandSpam[func].tries = 0
	errMsg("NO hagas spam CTM")
	return true
end

local function executeCommand(cmd,...)

	local func = commands[cmd]
	cmd = string.lower(cmd)
	if not commands[cmd] then return end
	if table.find(g_settings["command_exception_commands"],cmd) then
		func(cmd,...)
		return
	end
	if isFunctionOnCD(func) then return end
	func(cmd,...)

end

local function addCommandHandler(cmd,func)

	commands[cmd] = func
	_addCommandHandler(cmd,executeCommand,false)

end

local function resetKnifing()

	knifeRestrictionsOn = false

end

local function setElementPosition(element,x,y,z)

	if g_settings["weapons/kniferestrictions"] and not knifeRestrictionsOn then
		knifeRestrictionsOn = true
		setTimer(resetKnifing,5000,1)
	end

	_setElementPosition(element,x,y,z)

end
---------------------------
-- Set skin window
---------------------------

function skinInit()
	setControlNumber(wndSkin, 'skinid', getElementModel(localPlayer))
	if selectedskin ~= nil then
		--showSkinPreview(selectedskin)
	end
end

function clickskin(leaf)
	if leaf.id then
		selectedskin = leaf.id
		setControlNumber(wndSkin, 'skinid', leaf.id)
		--showSkinPreview(leaf.id)
	end
end

function applySkin(leaf)
	local skinID = getControlNumber(wndSkin, 'skinid')
	if skinID then
		fadeCamera(true)

		if skinID == 84 then
			exports.notifications:createNotification(1,'SSJ3','Presiona b para transformarte',1000)
		end

	--	exports.sentaodepana:checkskin(skinID)
		setElementAlpha(localPlayer,255)
		server.setMySkin(skinID)
		exports.mascaras:updateMask()
	end
end


wndSkin = {
	'wnd',
	text = 'Cambiar skin',
	width = 250,
	x = -300,
--	y = 0.2,
	controls = {
		{
			'lst',
			id='skinlist',
			width=230,
			height=290,
			columns={
				{text='Skin', attr='name'}
			},
			rows={xml='data/skins.xml', attrs={'id', 'name','unlock'}},
			onitemclick=clickskin,
			onitemdoubleclick=applySkin,
			DoubleClickSpamProtected=true,
		},
		{'txt', id='skinid', text='', width=0},
		{'btn', id='elegir', onclick=applySkin, ClickSpamProtected = true},
		{'btn', id='cerrar', closeswindow=true}
	},
	oncreate = skinInit
	--onclose = function() destroySkinPreview() end
}
--[[
function showSkinPreview(id)
	
	local x,y = guiGetPosition(wndSkin.element,false)
	local w,h = guiGetSize(wndSkin.element,false)
	
	local x1, y1, z1 = getCameraMatrix()
	
	if isElement(ped) then
		setElementModel(ped, id)
	else
		ped = createPed (id, x1, y1, z1)
	end
	
	pedPreview = exports.object_preview:createObjectPreview(ped,0,0,180,x+160,y,h*0.9,h*0.9,false,true,false)
	
	addEventHandler('onClientPreRender', root, updateSkinPreview)
end

function destroySkinPreview()
	
	exports.object_preview:setAlpha(pedPreview,0)
	setTimer(function()
		exports.object_preview:destroyObjectPreview(pedPreview)
	end,100,1)
	

	removeEventHandler('onClientPreRender', root, updateSkinPreview)
end

local pedangle = 0

function updateSkinPreview()
	local x,y = guiGetPosition(wndSkin.element,false)
	local w,h = guiGetSize(wndSkin.element,false)
	
	exports.object_preview:setRotation(pedPreview,0, 0, pedangle)
	


	pedangle = pedangle + 2
	
	if pedangle > 360 then
		pedangle = 0
	end
	
	exports.object_preview:setProjection(pedPreview, x+160, y, h*0.9, h*0.9,false)
end
]]
---------------------------
-- Weapon window
---------------------------

function weaponInit()
	if selectedweapon ~= nil then
	--showWeaponPreview(selectedweapon)
	end
end

function clickweapon(leaf)
	if leaf.id then
		
		local model = getWeaponProperty(leaf.id,'std','model')
		
		selectedweapon = model

	--	showWeaponPreview(model)
	end
end


function addWeapon(leaf, amount)
	if type(leaf) ~= 'table' then
		leaf = getSelectedGridListLeaf(wndWeapon, 'weaplist')
		amount = getControlNumber(wndWeapon, 'amount')
		if not amount or not leaf or not leaf.id then
			return
		end
	end
	if amount < 1 then
		errMsg("Invalid amount")
		return
	end
	if isPedReloadingWeapon(localPlayer) then
		errMsg ("No puedes sacar armas mientras recargas")
		return 
	end
	server.giveMeWeapon(leaf.id, amount)
end

function isPlayerAiming(p)
	if isElement(p) then
		if getPedTask(p, "secondary", 0) == "TASK_SIMPLE_USE_GUN" then
			return true
		end
	end
	return false
end

wndWeapon = {
	'wnd',
	text = 'Sacar arma',
	width = 250,
	controls = {
		{
			'lst',
			id='weaplist',
			width=230,
			height=280,
			columns={
				{text='Arma', attr='name'}
			},
			rows={xml='data/weapons.xml', attrs={'id', 'name'}},
			onitemclick=function(leaf) clickweapon(leaf) end,
			onitemdoubleclick=function(leaf) addWeapon(leaf, 1500) end,
			DoubleClickSpamProtected=true
		},
		{'br'},
		{'txt', id='amount', text='1500', width=60},
		{'btn', id='agregar', onclick=addWeapon, ClickSpamProtected=true},
		{'btn', id='cerrar', closeswindow=true}
	},
	oncreate = function() weaponInit() end,
--	onclose = function() destroyWeaponPreview() end
}


--[[
function showWeaponPreview(id)
	local x,y = guiGetPosition(wndWeapon.element,false)
	local w,h = guiGetSize(wndWeapon.element,false)

	local x1, y1, z1 = getCameraMatrix()

	if isElement(weapon) then
		setElementModel(weapon, id)
	else
		weapon = createObject(id,  x1, y1, z1)
		--weapon = createVehicle (id, x1, y1, z1)
	end

	weaponPreview = exports.object_preview:createObjectPreview(weapon,0,0,180,x+200,y-50,h*1.5,h*1.5,false,true,false)

	exports.object_preview:setDistanceSpread(weaponPreview,25)

	addEventHandler('onClientPreRender', root, updateWeaponPreview)
end

function destroyWeaponPreview()
	exports.object_preview:setAlpha(weaponPreview,0)
	setTimer(function()
		exports.object_preview:destroyObjectPreview(weaponPreview)
	end,100,1)

	removeEventHandler('onClientPreRender', root, updateWeaponPreview)
end

local weaponangle = 0

function updateWeaponPreview()
	local x,y = guiGetPosition(wndWeapon.element,false)
	local w,h = guiGetSize(wndWeapon.element,false)

	exports.object_preview:setRotation(weaponPreview,0, 0, weaponangle)



	weaponangle = weaponangle + 2

	if weaponangle > 360 then
		weaponangle = 0
	end

	exports.object_preview:setProjection(weaponPreview, x+200, y-50, h*1.5, h*1.5,false)
end

]]--
function isWindowOpenGlobal()
	if not isWindowOpen(wndMain) and not isWindowOpen(wndLoc) and not isVehiclePanelOpen() and (isChatBoxInputActive() == false) and  (isConsoleActive() == false) then
		return true
	else
		return false
	end
end


function getPedWeapons(ped)
	local playerWeapons = {}
	if ped and isElement(ped) and getElementType(ped) == "ped" or getElementType(ped) == "player" then
		for i=0,12 do
			local wep = getPedWeapon(ped,i)
			if wep and wep ~= 0 then
				table.insert(playerWeapons,wep)
			end
		end
	else
		return false
	end
	return playerWeapons
end


function Set (list)
	local set = {}
	for _, l in ipairs(list) do set[l] = true end
	return set
end

function tablefind(tab,el)
	for index, value in pairs(tab) do
		if value == el then
			return index
		end
	end
end

function tablelength(T)
	local count = 0
	for _ in ipairs(T) do count = count + 1 end
	return count
end

function dxDrawBorderedText(border,bgopacity,text, left, top, right, bottom, color, scale, font, alignX, alignY, clip, wordBreak,postGUI) 
    for oX = -border, border do -- Border size
		for oY = -border, border do -- Border size
            dxDrawText(text, left + oX, top + oY, right + oX, bottom + oY, tocolor(0, 0, 0, bgopacity), scale, font, alignX, alignY, clip, wordBreak,postGUI) 
        end
    end 
    dxDrawText(text, left, top, right, bottom, color, scale, font, alignX, alignY, clip, wordBreak, postGUI) 
end 


function noRadio() 
    setRadioChannel(0) 
	addEventHandler('onClientPlayerRadioSwitch', getRootElement(), function() cancelEvent() end ) 
end 
addEventHandler("onClientVehicleStartEnter",getRootElement(),noRadio) 


wndSounds = {
	'wnd',
	text = 'Sonidos',
	width = 250,
	controls = {
		{
			'lst',
			id='soundlist',
			width=230,
			height=280,
			columns={
				{text='Sonidos', attr='name'}
			},
			rows={xml='data/sounds.xml', attrs={'file', 'name','block','anim','duration'}},
			onitemdoubleclick=function(leaf)
				 exports.sounds:sendsound(leaf) 
				 hideAllWindows()
				 showCursor(false)
				-- destroyVehiclePreview()
				-- destroySkinPreview()
			--	 destroyWeaponPreview()
				 imgloc = false
				end,
			DoubleClickSpamProtected=true
		},
		{'br'},
		--{'btn', id='Reproducir', onclick=sendsound, ClickSpamProtected=true},
		{'btn', id='Cerrar', closeswindow=true}
	}
}



wndVipPanel = {
	'wnd',
	text = 'Vip',
	width = 400,
	x = 0.4,
	y = 0.2,
	controls = {
		{'imgc', id='vip', x="0.2", y="0.1", w="0.6", h="0.3", src='img/logo.png', a=true},	
		{'lbl', x="30", y="200",h="200", text="El que lee es gay en especial el daigo.ghuguygyugyugyugyu"},
		{'lbl', x="30", y="220",h="200", text="El que lee es gay en especial el daigo.ghuguygyugyugyugyu"},
		{'lbl', x="30", y="240",h="200", text="El que lee es gay en especial el daigo.ghuguygyugyugyugyu"},
		{'lbl', x="30", y="260",h="200", text="El que lee es gay en especial el daigo.ghuguygyugyugyugyu"},

		{'txt2', x="30", y="330",w="20",w="300", text="https://bit.ly/33GVOvu"},

		--{'chk', id="terms", x="30", y="340", text="Aceptar terminos y condiciones"},
		{'btn', x="30", y="370", text="Mostrar codigo QR", onclick=function()
			toggleWindow(wndQR)
		end},

		{'br'},
		{'br'},
		{'br'},
		{'br'},
		{'br'},
		{'br'},
		{'br'},
		{'br'},
		{'br'},
		{'br'},
		{'br'},
		{'br'},
		{'br'},
		{'btn', id='Cerrar', closeswindow=true}
	}
}



wndQR = {
	'wnd',
	text = 'Escanea el sigiente codigo QR',
	width = 360,
	x = 0.45,
	y = 0.25,
	controls = {
		{'imgc', id='qr', x="0.1", y="0.1", w="0.8", h="0.75", src='img/qr.png', a=true},	

		{'br'},
		{'br'},
		{'br'},
		{'br'},
		{'br'},
		{'br'},
		{'br'},
		{'br'},
		{'br'},
		{'br'},
		{'br'},
		{'br'},
		{'br'},
		{'br'},

		{'btn',x=20 ,id='Cerrar', closeswindow=true}
	}
}




---------------------------
-- Warp to player window
---------------------------

local function warpMe(targetPlayer)

	if not g_settings["warp"] then
		errMsg("Warping is disallowed!")
		return
	end

	if targetPlayer == localPlayer then
		errMsg("No te puedes teletransportar a ti mismo")
		return
	end

	if g_PlayerData[targetPlayer].warping then
		errMsg("Esta wn es maricon, no quiere que te acerques a él")
		return
	end

	local vehicle = getPedOccupiedVehicle(targetPlayer)
	local interior = getElementInterior(targetPlayer)
	if not vehicle then
		-- target player is not in a vehicle - just warp next to him
		local vec = targetPlayer.position + targetPlayer.matrix.right*2
		local x, y, z = vec.x,vec.y,vec.z
		if localPlayer.interior ~= interior then
			fadeCamera(false,1)
			setTimer(setPlayerInterior,1000,1,x,y,z,interior)
		else
			setPlayerPosition(x,y,z)
		end
	else
		-- target player is in a vehicle - warp into it if there's space left
		server.warpMeIntoVehicle(vehicle)
	end

end

function warpInit()
	setControlText(wndWarp, 'search', '')
	warpUpdate()
end

function warpTo(leaf)
	if not leaf then
		leaf = getSelectedGridListLeaf(wndWarp, 'playerlist')
		if not leaf then
			return
		end
	end
	if isElement(leaf.player) then
		warpMe(leaf.player)
	end
	closeWindow(wndWarp)
end

function warpUpdate()
	local function getPlayersByPartName(text)
		if not text or text == '' then
			return getElementsByType("player")
		else
			local players = {}
			for _, player in ipairs(getElementsByType("player")) do
				if string.find(getPlayerName(player):gsub("#%x%x%x%x%x%x", ""):upper(), text:upper(), 1, true) then
					table.insert(players, player)
				end
			end
			return players
		end
	end
	
	local text = getControlText(wndWarp, 'search')
	local players = table.map(getPlayersByPartName(text), 
		function(p) 
			local pName = getPlayerName(p)
			if g_settings["hidecolortext"] then
				pName = pName:gsub("#%x%x%x%x%x%x", "")
			end
			return { player = p, name = pName } 
		end)
	table.sort(players, function(a, b) return a.name < b.name end)
	bindGridListToTable(wndWarp, 'playerlist', players, true)
end

---------------------------
-- Fall off bike toggle
---------------------------
function toggleFallOffBike()
	setPedCanBeKnockedOffBike(localPlayer, guiCheckBoxGetSelected(getControl(wndMain, 'falloff')))
end

---------------------------
-- Set position window
---------------------------
do
	local screenWidth, screenHeight = guiGetScreenSize()
	g_MapSide = (screenHeight * 0.85)
end

function setPosInit()
	local x, y, z = getElementPosition(localPlayer)
	setControlNumbers(wndSetPos, { x = x, y = y, z = z })

	--addEventHandler('onClientRender', root, updatePlayerBlips)
end

function fillInPosition(relX, relY, btn)
	if (btn == 'right') then
		closeWindow (wndSetPos)
		return
	end

	local x = relX*6000 - 3000
	local y = 3000 - relY*6000
	local hit, hitX, hitY, hitZ
	hit, hitX, hitY, hitZ = processLineOfSight(x, y, 3000, x, y, -3000)
	setControlNumbers(wndSetPos, { x = x, y = y, z = hitZ or 0 })
end

function setPosClick()
	if setPlayerPosition(getControlNumbers(wndSetPos, {'x', 'y', 'z'})) ~= false then
		if getElementInterior(localPlayer) ~= 0 then
			local vehicle = localPlayer.vehicle
			if vehicle and vehicle.interior ~= 0 then
				server.setElementInterior(getPedOccupiedVehicle(localPlayer), 0)
				local occupants = vehicle.occupants
				for seat,occupant in pairs(occupants) do
					if occupant.interior ~= 0 then
						server.setElementInterior(occupant,0)
					end
				end
			end
			if localPlayer.interior ~= 0 then
				server.setElementInterior(localPlayer,0)
			end
		end
		closeWindow(wndSetPos)
	end
end

local function forceFade()

	fadeCamera(false,0)

end

local function calmVehicle(veh)

	if not isElement(veh) then return end
	local z = veh.rotation.z
	veh.velocity = Vector3(0,0,0)
	veh.turnVelocity = Vector3(0,0,0)
	veh.rotation = Vector3(0,0,z)
	if not (localPlayer.inVehicle and localPlayer.vehicle) then
		server.warpMeIntoVehicle(veh)
	end

end

local function retryTeleport(elem,x,y,z,isVehicle,distanceToGround)

	local hit, groundX, groundY, groundZ = processLineOfSight(x, y, 3000, x, y, -3000)
	if hit then
		local waterZ = getWaterLevel(x, y, 100)
		z = (waterZ and math.max(groundZ, waterZ) or groundZ) + distanceToGround
		setElementPosition(elem,x, y, z + distanceToGround)
		setCameraPlayerMode()
		setGravity(grav)
		if isVehicle then
			server.fadeVehiclePassengersCamera(true)
			setTimer(calmVehicle,100,1,elem)
		else
			fadeCamera(true)
		end
		killTimer(g_TeleportTimer)
		g_TeleportTimer = nil
		grav = nil
	end

end

function setPlayerPosition(x, y, z, skipDeadCheck)
	local elem = getPedOccupiedVehicle(localPlayer)
	local isVehicle
	if elem and getPedOccupiedVehicle(localPlayer) then
		local controller = getVehicleController(elem)
		if controller and controller ~= localPlayer then
			errMsg('Only the driver of the vehicle can set its position.')
			return false
		end
		isVehicle = true
	else
		elem = localPlayer
		isVehicle = false
	end
	if isPedDead(localPlayer) and not skipDeadCheck then
		customSpawnTable = {x,y,z}
		fadeCamera(false,0)
		addEventHandler("onClientPreRender",root,forceFade)
		outputChatBox("Seras reespawneado",0,255,0)
		return
	end
	local distanceToGround = getElementDistanceFromCentreOfMassToBaseOfModel(elem)
	local hit, hitX, hitY, hitZ = processLineOfSight(x, y, 3000, x, y, -3000)
	if not hit then
		if isVehicle then
			server.fadeVehiclePassengersCamera(false)
		else
			fadeCamera(false)
		end
		if isTimer(g_TeleportMatrixTimer) then killTimer(g_TeleportMatrixTimer) end
		g_TeleportMatrixTimer = setTimer(setCameraMatrix, 1000, 1, x, y, z)
		if not grav then
			grav = playerGravity
			--setGravity(0.001)
		end
		if isTimer(g_TeleportTimer) then killTimer(g_TeleportTimer) end
		g_TeleportTimer = setTimer(retryTeleport,50,0,elem,x,y,z,isVehicle,distanceToGround)
	else
		setElementPosition(elem,x, y, z + distanceToGround)
		if isVehicle then
			setTimer(calmVehicle,100,1,elem)
		end
	end
end

function updateName(oldNick, newNick)
	if (not g_PlayerData) then return end
	local source = getElementType(source) == "player" and source or oldNick
	local player = g_PlayerData[source]
	player.name = newNick
	if player.gui.mapLabel then
		guiSetText(player.gui.mapLabelShadow, newNick)
		guiSetText(player.gui.mapLabel, newNick)
		local labelWidth = guiLabelGetTextExtent(player.gui.mapLabelShadow)
		guiSetSize(player.gui.mapLabelShadow, labelWidth, 14, false)
		guiSetSize(player.gui.mapLabel, labelWidth, 14, false)
	end
end

addEventHandler('onClientPlayerChangeNick', root,updateName)

function closePositionWindow()
	removeEventHandler('onClientRender', root, updatePlayerBlips)
end

function getPosCommand(cmd, playerName)
	local player, sentenceStart

	if playerName then
		player = getPlayerFromName(playerName)
		if not player then
			errMsg('There is no player named "' .. playerName .. '".')
			return
		end
		playerName = getPlayerName(player)		-- make sure case is correct
		sentenceStart = playerName .. ' está '
	else
		player = localPlayer
		sentenceStart = 'Estas '
	end

	local px, py, pz = getElementPosition(player)
	local vehicle = getPedOccupiedVehicle(player)
	if vehicle then
		outputChatBox(sentenceStart .. 'en un ' .. getVehicleName(vehicle), 0, 255, 0)
	else
		outputChatBox('anda a pata', 0, 255, 0)
	end
	outputChatBox(sentenceStart .. 'a {' .. string.format("%.5f", px) .. ', ' .. string.format("%.5f", py) .. ', ' .. string.format("%.5f", pz) .. '}', 0, 255, 0)
end
addCommandHandler('getpos', getPosCommand)
addCommandHandler('gp', getPosCommand)

---------------------------
-- Interior window
---------------------------

local function setPositionAfterInterior(x,y,z)
	setPlayerPosition(x,y,z)
	setCameraTarget(localPlayer)
	fadeCamera(true)
end

function setPlayerInterior(x,y,z,i)
	setCameraMatrix(x,y,z)
	setCameraInterior(i)
	server.setElementInterior(localPlayer, i)
	setTimer(setPositionAfterInterior,1000,1,x,y,z)
end

function setInterior(leaf)
	local vehicle = getPedOccupiedVehicle(localPlayer)
	if vehicle and getVehicleController (vehicle) ~= localPlayer then
		errMsg("* Only the driver may set interior/dimension")
		return
	end
	if vehicle then
		server.setElementInterior(vehicle, leaf.world)
		for i=0,getVehicleMaxPassengers(vehicle) do
			local player = getVehicleOccupant(vehicle, i)
			if player and player ~= localPlayer then
				server.setElementInterior(player, leaf.world)
				server.setCameraInterior(player, leaf.world)
			end
		end
	end
	fadeCamera(false)
	setTimer(setPlayerInterior,1000,1,leaf.posX, leaf.posY, leaf.posZ, leaf.world)
	closeWindow(wndSetInterior)
end

wndSetInterior = {
	'wnd',
	text = 'Set interior',
	width = 250,
	controls = {
		{
			'lst',
			id='interiors',
			width=230,
			height=300,
			columns={
				{text='Interior', attr='name'}
			},
			rows={xml='data/interiors.xml', attrs={'name', 'posX', 'posY', 'posZ', 'world'}},
			onitemdoubleclick=setInterior,
			DoubleClickSpamProtected=true,
		},
		{'btn', id='close', closeswindow=true}
	}
}


function updateName(oldNick, newNick)
	if (not g_PlayerData) then return end
	local source = getElementType(source) == "player" and source or oldNick
	local player = g_PlayerData[source]
	player.name = newNick
	if player.gui.mapLabel then
		guiSetText(player.gui.mapLabelShadow, newNick)
		guiSetText(player.gui.mapLabel, newNick)
		local labelWidth = guiLabelGetTextExtent(player.gui.mapLabelShadow)
		guiSetSize(player.gui.mapLabelShadow, labelWidth, 14, false)
		guiSetSize(player.gui.mapLabel, labelWidth, 14, false)
	end
end

addEventHandler('onClientPlayerChangeNick', root,updateName)

---------------------------
-- Create vehicle window
---------------------------



function initvehicle()
	if selectedvehicle ~= nil then
		--showVehiclePreview(selectedvehicle)
	end
end

function changevehicle(leaf)
	selectedvehicle = leaf.id
	--showVehiclePreview(leaf.id) --leaf.id
end

function createSelectedVehicle(leaf)
	if not leaf then
		leaf = getSelectedGridListLeaf(wndCreateVehicle, 'vehicles')
		if not leaf then
			return
		end
	end
	server.giveMeVehicles(leaf.id)
end

wndCreateVehicle = {
	'wnd',
	text = 'Sacar vehículo',
	width = 300,
	controls = {
		{
			'lst',
			id='vehicles',
			width=280,
			height=340,
			columns={
				{text='Vehículo', attr='name'}
			},
			rows={xml='data/vehicles.xml', attrs={'id', 'name'}},
			onitemclick=changevehicle,
			onitemdoubleclick=createSelectedVehicle,
			DoubleClickSpamProtected=true,
		},
		{'btn', id='crear', onclick=createSelectedVehicle, ClickSpamProtected=true},
		{'btn', id='cerrar', closeswindow=true}
	},
	
	oncreate = function() initvehicle() end,
--	onclose = function() destroyVehiclePreview() end
}
--[[
function showVehiclePreview(id)
	local x,y = guiGetPosition(wndCreateVehicle.element,false)
	local w,h = guiGetSize(wndCreateVehicle.element,false)

	local x1, y1, z1 = getCameraMatrix()

	if isElement(vehicle) then
		setElementModel(vehicle, id)
	else
		vehicle = createVehicle (id, x1, y1, z1)
	end

	vehiclePreview = exports.object_preview:createObjectPreview(vehicle,0,0,180,x+300,y,h*0.9,h*0.9,false,true,false)

	exports.object_preview:setDistanceSpread(vehiclePreview,25)

	addEventHandler('onClientPreRender', root, updateVehiclePreview)
end

function destroyVehiclePreview()
	exports.object_preview:setAlpha(vehiclePreview,0)
	exports.object_preview:setProjection(vehiclePreview, 9999, 9999, 1, 1,false)
	setTimer(function()
		--exports.object_preview:destroyObjectPreview(vehiclePreview)
	end,100,1)

	removeEventHandler('onClientPreRender', root, updateVehiclePreview)
end

local vehicleangle = 0

function updateVehiclePreview()
	local x,y = guiGetPosition(wndCreateVehicle.element,false)
	local w,h = guiGetSize(wndCreateVehicle.element,false)

	exports.object_preview:setRotation(vehiclePreview,0, 0, vehicleangle)

	vehicleangle = vehicleangle + 2

	if vehicleangle > 360 then
		vehicleangle = 0
	end

	exports.object_preview:setProjection(vehiclePreview, x+300, y, h*0.9, h*0.9,false)
end
]]--
---------------------------
-- Flip vehicle
---------------------------
function flipVehicle()
	local vehicle = getPedOccupiedVehicle(localPlayer)
	if vehicle then
		local rX, rY, rZ = getElementRotation(vehicle)
		setElementRotation(vehicle, 0, 0, (rX > 90 and rX < 270) and (rZ + 180) or rZ)
	end
end

addCommandHandler('flip', flipVehicle)
addCommandHandler('f', flipVehicle)

---------------------------
-- Vehicle upgrades
---------------------------
function upgradesInit()
	local vehicle = getPedOccupiedVehicle(localPlayer)
	if not vehicle then
		errMsg('Please enter a vehicle to change the upgrades of.')
		closeWindow(wndUpgrades)
		return
	end
	local installedUpgrades = getVehicleUpgrades(vehicle)
	local compatibleUpgrades = {}
	local slotName, group
	for i,upgrade in ipairs(getVehicleCompatibleUpgrades(vehicle)) do
		slotName = getVehicleUpgradeSlotName(upgrade)
		group = table.find(compatibleUpgrades, 'name', slotName)
		if not group then
			group = { 'group', name = slotName, children = {} }
			table.insert(compatibleUpgrades, group)
		else
			group = compatibleUpgrades[group]
		end
		table.insert(group.children, { id = upgrade, installed = table.find(installedUpgrades, upgrade) ~= false })
	end
	table.sort(compatibleUpgrades, function(a, b) return a.name < b.name end)
	bindGridListToTable(wndUpgrades, 'upgradelist', compatibleUpgrades, true)
end

function selectUpgrade(leaf)
	setControlText(wndUpgrades, 'addremove', leaf.installed and 'remove' or 'add')
end

function addRemoveUpgrade(selUpgrade)
	-- Add or remove selected upgrade
	local vehicle = getPedOccupiedVehicle(localPlayer)
	if not vehicle then
		return
	end

	if not selUpgrade then
		selUpgrade = getSelectedGridListLeaf(wndUpgrades, 'upgradelist')
		if not selUpgrade then
			return
		end
	end

	if selUpgrade.installed then
		-- remove upgrade
		selUpgrade.installed = false
		setControlText(wndUpgrades, 'addremove', 'add')
		server.removeVehicleUpgrade(vehicle, selUpgrade.id)
	else
		-- add upgrade
		local prevUpgradeIndex = table.find(selUpgrade.siblings, 'installed', true)
		if prevUpgradeIndex then
			selUpgrade.siblings[prevUpgradeIndex].installed = false
		end
		selUpgrade.installed = true
		setControlText(wndUpgrades, 'addremove', 'remove')
		server.addVehicleUpgrade(vehicle, selUpgrade.id)
	end
end	


function openColorPicker()
	editingVehicle = getPedOccupiedVehicle(localPlayer)
	if (editingVehicle) then
		local r1, g1, b1, r2, g2, b2, r3, g3, b3, r4, g4, b4 = getVehicleColor(editingVehicle, true)
		local r, g, b = 255, 255, 255
		if (guiCheckBoxGetSelected(checkColor1)) then
			r, g, b = r1, g1, b1
		end
		if (guiCheckBoxGetSelected(checkColor2)) then
			r, g, b = r2, g2, b2
		end
		if (guiCheckBoxGetSelected(checkColor3)) then
			r, g, b = r3, g3, b3
		end
		if (guiCheckBoxGetSelected(checkColor4)) then
			r, g, b = r4, g4, b4
		end
		if (guiCheckBoxGetSelected(checkColor5)) then
			r, g, b = getVehicleHeadLightColor(editingVehicle)
		end
		colorPicker.setValue({r, g, b})
		colorPicker.openSelect(colors)
	end
end

function closedColorPicker()
	local r1, g1, b1, r2, g2, b2, r3, g3, b3, r4, g4, b4 = getVehicleColor(editingVehicle, true)
	server.setVehicleColor(editingVehicle, r1, g1, b1, r2, g2, b2, r3, g3, b3, r4, g4, b4)
	local r, g, b = getVehicleHeadLightColor(editingVehicle)
	server.setVehicleHeadLightColor(editingVehicle, r, g, b)
	editingVehicle = nil
end

function updateColor()
	if (not colorPicker.isSelectOpen) then return end
	local r, g, b = colorPicker.updateTempColors()
	if (editingVehicle and isElement(editingVehicle)) then
		local r1, g1, b1, r2, g2, b2, r3, g3, b3, r4, g4, b4  = getVehicleColor(editingVehicle, true)
		if (guiCheckBoxGetSelected(checkColor1)) then
			r1, g1, b1 = r, g, b
		end
		if (guiCheckBoxGetSelected(checkColor2)) then
			r2, g2, b2 = r, g, b
		end
		if (guiCheckBoxGetSelected(checkColor3)) then
			r3, g3, b3 = r, g, b
		end
		if (guiCheckBoxGetSelected(checkColor4)) then
			r4, g4, b4 = r, g, b
		end
		if (guiCheckBoxGetSelected(checkColor5)) then
			setVehicleHeadLightColor(editingVehicle, r, g, b)
		end
		setVehicleColor(editingVehicle, r1, g1, b1, r2, g2, b2, r3, g3, b3, r4, g4, b4)
	end
end
addEventHandler("onClientRender", root, updateColor)

---------------------------
-- Main window
---------------------------

function toggleWarping()

end

function updateGUI(updateVehicle)
	-- update position
	local x, y, z = getElementPosition(localPlayer)
	setControlNumbers(wndMain, {xpos=math.ceil(x), ypos=math.ceil(y), zpos=math.ceil(z)})

	-- update jetpack toggle
	guiCheckBoxSetSelected( getControl(wndMain, 'jetpack'), doesPedHaveJetPack(localPlayer) )

	if updateVehicle then
		-- update current vehicle
		local vehicle = getPedOccupiedVehicle(localPlayer)
		if vehicle and isElement(vehicle) then
			setControlText(wndMain, 'curvehicle', getVehicleName(vehicle))
		else
			setControlText(wndMain, 'curvehicle', 'A pata')
		end
	end
end

function mainWndShow()
	updateTimer = updateTimer or setTimer(updateGUI, 2000, 0)
	updateGUI(true)
end

function mainWndClose()
	killTimer(updateTimer)
	updateTimer = nil
	colorPicker.closeSelect()
end


function hasDriverGhost(vehicle)
	
	if not g_PlayerData then return end
	if not isElement(vehicle) then return end
	if getElementType(vehicle) ~= "vehicle" then return end
	
	local driver = getVehicleController(vehicle)
	if g_PlayerData[driver] and g_PlayerData[driver].ghostmode then return true end
	return false
	
end

function onEnterVehicle(vehicle,seat)
	if seat == 0 and g_PlayerData[source] then
		setVehicleGhost(vehicle,hasDriverGhost(vehicle))
	end
end

function onExitVehicle(vehicle,seat)
	if (eventName == "onClientPlayerVehicleExit" and source == localPlayer) or (eventName == "onClientElementDestroy" and getElementType(source) == "vehicle" and getPedOccupiedVehicle(localPlayer) == source) then

	elseif vehicle and seat == 0 then
		if source and g_PlayerData[source] then
			setVehicleGhost(vehicle,hasDriverGhost(vehicle))
		end
	end
end

function killLocalPlayer()
	if g_settings["kill"] then
		setElementHealth(localPlayer,0)
	else
		errMsg("No te podí suicidar")
	end
end

addCommandHandler('kill', killLocalPlayer)



vipbtn = guiCreateButton(screenW-145,screenH-75,140,60, "button", false) 
guiSetAlpha(vipbtn, 0) 

function clickvipbtn() 
	showCursor(false)
	removeEventHandler('onClientRender',root,showvipimg)
	removeEventHandler("onClientGUIClick", vipbtn , clickvipbtn) 
end 
	

function showvipimg()
	dxDrawImage(0,0,screenW,screenH,'img/vipimg.png',0,0,0,tocolor(255,255,255,255),false)
	

	dxDrawRectangle(screenW-145,screenH-75,140,60,tocolor(0,0,0,190))
	dxDrawText('Omitir',screenW-130,screenH-67,100,100,white,2.9,'sans')
	addEventHandler("onClientGUIClick", vipbtn , clickvipbtn) 
end


vip = false

addEvent('setVip',true)
addEventHandler('setVip',root,function()
	vip = true
end)
wndMain = {
	'wnd',
	text = '::MTA CHILE::',
	x = 200,
	y = 0.2,
	width = 280,
	controls = {
		{'imgc', id='btn1', src="img/btn1.png", x=30,y=40,w=60,h=60, a=false, onclick=killLocalPlayer},
		{'imgc', id='btn2', src="img/btn2.png", x=110,y=40,w=60,h=60, a=false, window=wndSkin},
		{'imgc', id='btn3', src="img/btn3.png", x=190,y=40,w=60,h=60, a=false, window=wndWeapon},
		{'br'},
		{'imgc', id='btn4', src="img/btn4.png", x=30,y=120,w=60,h=60, a=false, window=wndSounds},
		{'imgc', id='btn5', src="img/btn5.png", x=110,y=120,w=60,h=60, a=false, window=wndCreateVehicle},


		{'imgc', id='btn6', src="img/btn6.png", x=110,y=200,w=140,h=140, a=false,  onclick=function() 
			if vip then
				exports.vip:VipPanel()
			else
						--toggleWindow(wndVipPanel)
						
				closeVehiclePanel()
			--	destroyVehiclePreview()
			--	destroySkinPreview()
			--	destroyWeaponPreview()

				hideAllWindows()
				imgloc = false

				exports.mascaras:closePanel()
				

				colorPicker.closeSelect()	
				addEventHandler('onClientRender',root,showvipimg)
			end
		end},

		{'imgc', id='btn7', src="img/btn7.png", x=30,y=200,w=60,h=60, a=false, onclick=function() exports.mascaras:togglePanel() end},
		{'imgc', id='btn8', src="img/btn8.png", x=30,y=280,w=60,h=60, a=false, onclick=function() if vip then exports.DogMod:DMCreateDog() else outputChatBox('DEBES SER VIP PARA USAR ESTA OPCION',255,0,0) end end},
		{'imgc', id='btn9', src="img/btn9.png", x=190,y=120,w=60,h=60, a=false, onclick=function() toggleWindow(wndLoc) end},  --[[toggleWindow(wndLoc)]]

		{'br'},
		{'br'},
		{'br'},
		{'br'},
		{'br'},
		{'br'},
		{'br'},
		{'br'},
		{'br'},
		{'br'},
		{'br'},
		{'br'},
		{'br'},
		{'br'},
		{'br'},
		{'br'},

		},
		oncreate = mainWndShow,
		onclose = mainWndClose
	}
	
	disableBySetting =
	{
		{parent=wndMain, id="antiram"},
		{parent=wndMain, id="disablewarp"},
		{parent=wndMain, id="disableknife"},
	}


function gotoloc(leaf)
	setPlayerPosition(leaf.x,leaf.y,leaf.z, false)
	exports.antispawnkill.onTeleport('',localPlayer)
	closeWindow(wndLoc)
	showCursor(false)
end

addEvent('showmapimg')
addEventHandler('showmapimg', root, showimg)



-----------------
-- Map preview
-----------------


--addEvent('showmapimg')
--addEventHandler('showmapimg', root, showimg)

--addEventHandler('onClientRender', root ,showimg)

wndLoc = {
	'wnd',
	text = 'Lugares',
	width = 300,
	x = 500,
	y = 0.2,
	controls = {
		--{'imgc', id='location', x="0", y="0", w="100", h="100", src='img/map.png', a=true},
		{
			'lst',
			id='locationschile',
			width=300,
			height=400,
			columns={
				{text='nombre', attr='name'}
			},
			rows={xml='data/locations_chile.xml', attrs={'file','name','x','y','z'}},
			onitemdoubleclick=gotoloc,
			ClickSpamProtected=true,
		},
		{'br'},
		{'btn', id='cerrar', closeswindow=true},
	}
}

function errMsg(msg)
	outputChatBox(msg,255,0,0)
end

addEventHandler('onClientResourceStart', resourceRoot,
	function()
		fadeCamera(true)
		getPlayers()
		setJetpackMaxHeight ( 9001 )
		triggerServerEvent('onLoadedAtClient', resourceRoot)
		createWindow(wndMain)
		createWindow(wndLoc)
		hideAllWindows()		
		
		--togglesentaodepana(false)

		bindKey('f1', 'down', toggleFRWindow)
		bindKey('f2', 'down', toggleLocWindow)

	--	guiCheckBoxSetSelected(getControl(wndMain, 'jetpack'), doesPedHaveJetPack(localPlayer))
	--	guiCheckBoxSetSelected(getControl(wndMain, 'falloff'), canPedBeKnockedOffBike(localPlayer))
	end
)

function toggleFRWindow()

	if getElementDimension(localPlayer) ~= 0 then return end

	if isWindowOpen(wndMain) then
		--if not isWindowOpen(wndLoc) then
		showCursor(false)
		--end
			-- nota al morir tiene que pasar lo mismo

		closeVehiclePanel()
	--	destroyVehiclePreview()
		--destroySkinPreview()
	--	destroyWeaponPreview()

		hideAllWindows()
		imgloc = false

		exports.mascaras:closePanel()
		

		colorPicker.closeSelect()
	else
		if guiGetInputMode() ~= "no_binds_when_editing" then
			guiSetInputMode("no_binds_when_editing")
		end
		showCursor(true)
		--imgskin = true
		showAllWindowsExc(wndLoc)
		--if selectedskin ~= nil  and isWindowOpen(wndSkin) then
		--	showSkinPreview(selectedskin)
		--end
		--if selectedvehicle ~= nil and isWindowOpen(wndCreateVehicle) then
		--	showVehiclePreview(selectedvehicle)
		--end
	--	if selectedweapon ~= nil and isWindowOpen(wndWeapon) then
	--		showWeaponPreview(selectedweapon)
	--	end
	end
end

addCommandHandler('fr', toggleFRWindow)

function toggleLocWindow()

	if getElementDimension(localPlayer) ~= 0 then return end

	if isWindowOpen(wndLoc) then
		if not isWindowOpen(wndMain) and not isVehiclePanelOpen() then
			showCursor(false)
		end
		closeWindow(wndLoc)
		--hideAllWindows()
	else
		if guiGetInputMode() ~= "no_binds_when_editing" then
			guiSetInputMode("no_binds_when_editing")
		end
		showCursor(true)
		toggleWindow(wndLoc)
	end
end

addCommandHandler('loc', toggleLocWindow)

function getPlayers()
	g_PlayerData = {}
	table.each(getElementsByType('player'), joinHandler)
end


function joinHandler(player)
	-- addEventHandler('onClientRender', root, paneo)

	if (not g_PlayerData) then return end
	g_PlayerData[player or source] = { name = getPlayerName(player or source), gui = {} }
end

function quitHandler()
	if (not g_PlayerData) then return end
	local veh = getPedOccupiedVehicle(source)
	local seat = (veh and getVehicleController(veh) == localPlayer) and 0 or 1
	if seat == 0 then
		onExitVehicle(veh,0)
	end
	table.each(g_PlayerData[source].gui, destroyElement)
	g_PlayerData[source] = nil
end

function wastedHandler()
	if source == localPlayer then

	onExitVehicle()

	showCursor(false)
--	destroySkinPreview()
	--destroyWeaponPreview()

	hideAllWindows()
	imgloc = false

	exports.mascaras:closePanel()

	colorPicker.closeSelect()
	else
		local veh = getPedOccupiedVehicle(source)
		local seat = (veh and getVehicleController(veh) == localPlayer) and 0 or 1
		if seat == 0 then
			onExitVehicle(veh,0)
		end
	end
end
addEventHandler('onClientPlayerWasted', root, wastedHandler)

local function removeForcedFade()
	removeEventHandler("onClientPreRender",root,forceFade)
	fadeCamera(true)
end



local function checkCustomSpawn()
	
	exports.mascaras:updateMask()
	
	if type(customSpawnTable) == "table" then
		local x,y,z = unpack(customSpawnTable)
		setPlayerPosition(x,y,z,true)
		customSpawnTable = false
		setTimer(removeForcedFade,100,1)
	end

end

addEventHandler('onClientPlayerJoin', root, joinHandler)
addEventHandler('onClientPlayerQuit', root, quitHandler)
addEventHandler("onClientElementDestroy", root, onExitVehicle)
addEventHandler("onClientPlayerSpawn", localPlayer, checkCustomSpawn)

function getPlayerName(player)
	return g_settings["removeHex"] and player.name:gsub("#%x%x%x%x%x%x","") or player.name
end

addEventHandler('onClientResourceStop', resourceRoot,
	function()
		showCursor(false)
		setPedAnimation(localPlayer, false)
	end
)

function setVehicleGhost(sourceVehicle,value)

	  local vehicles = getElementsByType("vehicle")
	  for _,vehicle in ipairs(vehicles) do
		local vehicleGhost = hasDriverGhost(vehicle)
		if isElement(sourceVehicle) and isElement(vehicle) then
		   setElementCollidableWith(sourceVehicle,vehicle,not value)
		   setElementCollidableWith(vehicle,sourceVehicle,not value)
		end
		if value == false and vehicleGhost == true and isElement(sourceVehicle) and isElement(vehicle) then
			setElementCollidableWith(sourceVehicle,vehicle,not vehicleGhost)
			setElementCollidableWith(vehicle,sourceVehicle,not vehicleGhost)
		end
	end

end

local function onStreamIn()

	if source.type ~= "vehicle" then return end
	setVehicleGhost(source,hasDriverGhost(source))

end

local function onLocalSettingChange(key,value)

	g_PlayerData[source][key] = value

	if key == "ghostmode" then
		local sourceVehicle = getPedOccupiedVehicle(source)
		if sourceVehicle then
			setVehicleGhost(sourceVehicle,hasDriverGhost(sourceVehicle))
		end
	end

end

local function renderKnifingTag()
	if not g_PlayerData then return end
	for _,p in ipairs (getElementsByType ("player", root, true)) do
		if g_PlayerData[p] and g_PlayerData[p].knifing then
			local px,py,pz = getPedBonePosition(p, 6)
			local x,y,d = getScreenFromWorldPosition (px, py, pz+0.5)
			if x and y and d < 20 then
				dxDrawText ("Disabled Knifing", x+1, y+1, x, y, tocolor (0, 0, 0), 0.5, "bankgothic", "center")
				dxDrawText ("Disabled Knifing", x, y, x, y, tocolor (220, 220, 0), 0.5, "bankgothic", "center")
			end
		end
    end
end

addEventHandler ("onClientRender", root, renderKnifingTag)

addEvent("onClientFreeroamLocalSettingChange",true)
addEventHandler("onClientFreeroamLocalSettingChange",root,onLocalSettingChange)
addEventHandler("onClientPlayerStealthKill",localPlayer,cancelKnifeEvent)
addEventHandler("onClientElementStreamIn",root,onStreamIn)