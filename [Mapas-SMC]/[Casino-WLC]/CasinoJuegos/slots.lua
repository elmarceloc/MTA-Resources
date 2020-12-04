local screenW, screenH = guiGetScreenSize()

local slots = {
	poses = {
		{2050.48120, 1864.61584, -29.33562},
		{2050.48340, 1859.94800, -29.33562},
		{2047.84485, 1860.29871, -29.33562},
		{2048.02563, 1864.84241, -29.33562},
		
		{2050.42310, 1853.30701, -29.33562},
		{2047.16638, 1853.38086, -29.33562},
		{2050.37085, 1850.93262, -29.33562},
		{2047.15906, 1851.04358, -29.33562},
		
		{2041.60901, 1853.41113, -29.33562},
		{2038.43176, 1853.36401, -29.33562},
		{2038.37146, 1851.07764, -29.33562},
		{2041.53003, 1850.87024, -29.33562},
		
		{2033.16602, 1853.22351, -29.33562},
		{2029.88037, 1853.04077, -29.33562},
		{2033.10693, 1850.83850, -29.33562},
		{2029.85376, 1850.83203, -29.33562},
		
		{2050.22021, 1847.95996, -29.33562},
		{2047.06995, 1848.11316, -29.33562},
		{2050.29517, 1845.43176, -29.33562},
		{2047.08167, 1845.58374, -29.33562},
		
		{2041.62842, 1845.63879, -29.33562},
		{2038.38452, 1845.62976, -29.33562},
		{2041.56055, 1847.93213, -29.33562},
		{2038.33691, 1847.88477, -29.33562},
		
		{2032.99622, 1847.97058, -29.33562},
		{2029.81458, 1848.08557, -29.33562},
		{2029.77808, 1845.68152, -29.33562},
		{2033.02808, 1845.77747, -29.33562},
	},
	visible = false,
	fonts = {
		[1] = dxCreateFont("assets/fonts/gotham-medium.ttf", 10),
		[2] = dxCreateFont("assets/fonts/gotham-medium.ttf", 10),
		[3] = dxCreateFont("assets/fonts/gotham-light.ttf", 17),
		[4] = dxCreateFont("assets/fonts/gotham-light.ttf", 10),
	},
	active = false,
	visible = false,
	message = {},
	rates = {},
	selected = false,
	sX = screenW/2-780/2,
	sY = screenH/2-450/2,
	table = {},
	message = {}

}


slots.startTick = 5000
slots.rate = 0
slots.win = 0
slots.renderTarget = dxCreateRenderTarget( 450, 300, true )

slots.combinations = {
	{1, 1, 1, 20},
	{2, 2, 2, 10},
	{3, 3, 3, 8},
	{4, 4, 4, 15},
	{5, 5, 5, 5},
	{6, 6, 6, 3},
	{7, 7, 7, 12},
	{8, 8, 8, 25},

	{2, 0, 0, 2},
	{0, 2, 0, 2},
	{0, 0, 2, 2},

	{3, 6, 0, 2},
	{0, 6, 3, 2},
	{0, 3, 6, 2},
	{6, 3, 0, 2},

	{8, 1, 2, 20},
	--{8, 2, 1, 20},
	--{1, 2, 8, 20},
	--{1, 8, 2, 20},
	--{2, 8, 1, 20},
	--{2, 1, 8, 20},

}

slots.comb = false

slots.reload = function ()
	for i=1, 63 do
		slots.table[i] = math.random(1,8)
	end
end

slots.reload()

slots.render = function ()
	if not slots.visible then return end
	--dxDrawImage(0, 0, screenW, screenH, "assets/slots.png", 0, 0, 0)
	dxDrawImage(0, 0, screenW, screenH, "assets/slots.png", 0, 0, 0)
	if slots.comb then
		for i,v in pairs(slots.combinations) do
			local xI = slots.sX+800
			local yI = slots.sY+30*(i-1)
			if i >= 16 then
				xI = slots.sX+925
				yI = slots.sY+30*(i-16)
			end
			if i >= 31 then
				xI = slots.sX-140
				yI = slots.sY+30*(i-31)
			end
			if i >= 46 then
				xI = slots.sX-265
				yI = slots.sY+30*(i-46)
			end
			dxDrawRectangle(xI-1, yI-1, 125, 30, tocolor(30, 61, 61, 200))
			if v[1] >= 1 then
				dxDrawImage(xI+0, yI, 25, 25, "assets/slots/"..v[1]..".png")
			end
			if v[2] >= 1 then
				dxDrawImage(xI+30, yI, 25, 25, "assets/slots/"..v[2]..".png")
			end
			if v[3] >= 1 then
				dxDrawImage(xI+60, yI, 25, 25, "assets/slots/"..v[3]..".png")
			end
			dxDrawText("x"..v[4],(xI+90)*2, (yI)*2, 25, 25, tocolor(255, 255, 255), 1, slots.fonts[4], "center", "center")
		end
	end
	dxDrawRectangle(slots.sX, slots.sY, 780, 450, tocolor(10, 31, 31, 255))
	dxDrawRectangle(slots.sX+2, slots.sY+2, 780-4, 450-4, tocolor(30, 61, 61, 255))
	dxDrawShadow(slots.sX, slots.sY, 780, 450, 10, 31, 31, 100, 25, false)
		local now = getTickCount()
		local progress = (now - slots.startTick) / 6000
		local progress2 = (now - slots.startTick) / 8500
		local progress3 = (now - slots.startTick) / 10000
		roll1 = interpolateBetween ( 0, 0, 0, 3000, 0, 0, progress, "OutQuad")
		roll2 = interpolateBetween ( 0, 0, 0, 4250, 0, 0, progress2, "OutQuad")
		roll3 = interpolateBetween ( 0, 0, 0, 5000, 0, 0, progress3, "OutQuad")
		dxSetRenderTarget(slots.renderTarget)
		dxDrawRectangle(0, 0, 450, 300, tocolor(30, 61, 61))
		for i,v in pairs(slots.table) do
			dxDrawImage(25, -25+125*(i-1)-roll1, 100, 100, "assets/slots/"..v..".png")
		end

		for i,v in pairs(slots.table) do
			dxDrawImage(175, -25+125*(i-1)-roll2, 100, 100, "assets/slots/"..v..".png")
		end
		for i,v in pairs(slots.table) do
			dxDrawImage(325, -25+125*(i-1)-roll3, 100, 100, "assets/slots/"..v..".png")
		end
	dxSetRenderTarget()
	dxDrawShadow(slots.sX+35-2, slots.sY+35-2, 454, 304, 10, 31, 31, 100, 25, false)
	dxDrawRectangle(slots.sX+35-2, slots.sY+35-2, 454, 304, tocolor(10, 31, 31))
	dxDrawImage(slots.sX+35, slots.sY+35, 450, 300, slots.renderTarget)

	dxDrawRecText(slots.sX+35, slots.sY+350, 200, 35, "Tu apuesta: "..slots.rate)
	dxDrawRecText(slots.sX+285, slots.sY+350, 200, 35, "Ganancias: "..slots.win)

	slots.summ = dxDrawEdit(slots.sX+535, slots.sY+35, 200, 35, "5 - 10", "slots.rate")
	dxDrawButton(slots.sX+535, slots.sY+75, 200, 35, "Apostar")

	dxDrawButton(slots.sX+535, slots.sY+115, 200, 35, "Tirar")
	dxDrawButton(slots.sX+535, slots.sY+155, 200, 35, "Combinaciones")


	--dxDrawImage(slots.sX+15, slots.sY+25, 270, 268, "assets/slots/slots_border.png", 0, 0, 0)

	dxDrawText("TUS FICHAS: "..slots.getChips(), slots.sX+10, slots.sY+420, 135+slots.sX+5, 30+slots.sY+420, tocolor(255, 255, 255), 1, slots.fonts[1], "left", "center")
	local width = dxGetTextWidth("TUS FICHAS: "..slots.getChips(), 1, slots.fonts[1])

	dxDrawImage(slots.sX+5+width+10, slots.sY+422, 25, 25, "assets/chip.png", 0, 0, 0)

	dxDrawButton(slots.sX+780-155, slots.sY+455-40, 150, 30, "Cerrar")

	if math.round(roll3, 0) == math.round(5000, 0) and slots.active then
		slots.active = false
		amount = 0
		for i,v in pairs(slots.combinations) do
			if v[1] ~= 0 and v[2] ~= 0 and v[3] ~= 0 then
				if slots.table[26] == v[1] and v[2] == slots.table[36] and v[3] == slots.table[42] then
					amount = amount + slots.rate*v[4]
				end
			elseif v[1] ~= 0 and v[2] == 0 and v[3] == 0 then
				if slots.table[26] == v[1] then
					amount = amount + slots.rate*v[4]
				end
			elseif v[1] == 0 and v[2] ~= 0 and v[3] == 0 then
				if slots.table[36] == v[2] then
					amount = amount + slots.rate*v[4]
				end
			elseif v[1] == 0 and v[2] == 0 and v[3] ~= 0 then
				if slots.table[42] == v[3] then
					amount = amount + slots.rate*v[4]
				end
			elseif v[1] ~= 0 and v[2] ~= 0 and v[3] == 0 then
				if slots.table[36] == v[2] and slots.table[26] == v[1] then
					amount = amount + slots.rate*v[4]
				end
			elseif v[1] == 0 and v[2] ~= 0 and v[3] ~= 0 then
				if slots.table[36] == v[2] and slots.table[42] == v[3] then
					amount = amount + slots.rate*v[4]
				end
			elseif v[1] ~= 0 and v[2] == 0 and v[3] ~= 0 then
				if slots.table[26] == v[1] and slots.table[42] == v[3] then
					amount = amount + slots.rate*v[4]
				end
			end
		end
		slots.win = amount
		slots.giveChips(slots.win)
		--exports.mtaAdmin:outputUnionLog(getPlayerName(localPlayer).." выиграл в слотах "..slots.win.." фишек | Общий баланс: "..slots.getChips().." фишек")
		--outputChatBox (slots.table[26]..", "..slots.table[36]..", "..slots.table[42])
	end

	if slots.message.text then
		slots.message.height = math.min(slots.message.height + 50, 450)
		dxDrawRectangle(slots.sX, slots.sY, 780, slots.message.height, tocolor(40, 61, 61, 200))
		if slots.message.height == 450 then 
			slots.message.alpha = math.min(slots.message.alpha+25, 255)
			dxDrawText(slots.message.text, slots.sX, slots.sY, 780+slots.sX, 450+slots.sY, tocolor(255, 255, 255, slots.message.alpha), 1, slots.fonts[3], "center", "center")
		
			dxDrawButton(slots.sX+780/2-150/2, slots.sY+370, 150, 40, "OK")
		end
	end
end

addEventHandler("onClientClick", root, function (button, state)
	if button == "left" and state == "down" then
		if not slots.visible then return end
		if slots.message.text then
			if cursorPosition(slots.sX+780/2-150/2, slots.sY+370, 150, 40) then
				slots.message.text = false
				if  slots.message.func then
					slots.message.func()
					slots.message.func = false
				end
			end
		return end
		if cursorPosition(slots.sX+535, slots.sY+155, 200, 35) then
			if not slots.visible then return end
			slots.comb = not slots.comb 
		end
		if cursorPosition(slots.sX+780-155, slots.sY+455-40, 150, 30) then
			if not slots.visible then return end
			if slots.active == true then return end
			guiSetInputEnabled(false)
			slots.visible = false
			showCursor(false)
			if isEventHandlerAdded("onClientRender", root, slots.render) then
				removeEventHandler("onClientRender", root, slots.render)
			end
			if isEventHandlerAdded("onClientKey", root, cancelEvent) then
				removeEventHandler("onClientKey", root, cancelEvent)
			end
			setElementData(localPlayer, "showHUD", true)
		end
		if cursorPosition(slots.sX+535, slots.sY+115, 200, 35) then
			if not slots.visible then return end
			if slots.active == true then return end
			if slots.getChips() >= tonumber(slots.rate) then
				if tonumber(slots.rate) >= 5 then
					slots.reload()
					slots.startTick = getTickCount()
					slots.active = true
					slots.takeChips(slots.rate)
					slots.win = 0
				end
			else
				slots.sendMessage("No hay suficientes fichas!")
			end
		end
		if cursorPosition(slots.sX+535, slots.sY+75, 200, 35) then
			if not slots.visible then return end
			if slots.active == true then return end
			if slots.summ and tonumber(slots.summ) and tonumber(slots.summ) >= 1 and tonumber(slots.summ) <= 10 and slots.getChips() >= tonumber(slots.summ) then
				slots.rate = slots.summ
			else
				slots.sendMessage("No tienes fichas suficientes o tu apuesta supera el min/max establecido")
			end
		end
	end
end)

for i,v in pairs(slots.poses) do
	slots.marker = createMarker(v[1], v[2], v[3], "cylinder", 0.75, 255, 255, 100, 100)
	setElementInterior(slots.marker, v[4])
	setElementDimension(slots.marker, v[5])
	addEventHandler("onClientMarkerHit", slots.marker, function(element, dim)
		if element == localPlayer and dim then
			if not isPedInVehicle(localPlayer) then
				local verticalDistance = Vector3(getElementPosition(localPlayer)).z - Vector3(getElementPosition(source)).z
				if verticalDistance > 3 or verticalDistance < -1 then
		    	    return
		    	end

		    	slots.visible = true
				showCursor(true)
				if not isEventHandlerAdded("onClientRender", root, slots.render) then
					addEventHandler("onClientRender", root, slots.render)
				end
				if not isEventHandlerAdded("onClientKey", root, cancelEvent) then
					addEventHandler("onClientKey", root, cancelEvent)
				end
				setElementData(localPlayer, "showHUD", false)
			end
		end
	end)
end

slots.giveChips = function(amount)
	setElementData(localPlayer, "casino:chips", (tonumber(getElementData(localPlayer, "casino:chips")) or 0) + amount)
end

slots.takeChips = function(amount)
	setElementData(localPlayer, "casino:chips", (tonumber(getElementData(localPlayer, "casino:chips")) or 0) - amount)
end

slots.getChips = function()
	local data = tonumber(getElementData(localPlayer, "casino:chips")) or 0
	return data
end

local enabled = false
 
addCommandHandler("ccam", function()
    enabled = not enabled
    if enabled then
        start = getTickCount()
        dx, dy, dz, lx, ly, lz = getCameraMatrix()
        addEventHandler("onClientPreRender", root, interpolateCam)
    else
        start = nil
        setCameraTarget(localPlayer)
        removeEventHandler("onClientPreRender", root, interpolateCam)
    end
end)
 
function interpolateCam()
    local now = getTickCount()
    local endTime = start + 2000
    local elapsedTime = now - start
    local duration = endTime - start
    local progress = elapsedTime / duration
    local px, py, pz = getElementPosition(localPlayer)
    local x, y, z = interpolateBetween ( dx, dy, dz, dx+4, dy+4, dz, progress, "OutQuad")
    setCameraMatrix(x, y, z, px, py, pz+0.6, 0, 0)
end

slots.sendMessage = function (message, func)
	if func then
		slots.message.func = func
	end
	slots.message.text = message
	slots.message.alpha = 0
	slots.message.height = 0
end