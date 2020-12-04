local screenW, screenH = guiGetScreenSize()

local blackjack = {
	poses = {
		{2018.56555, 1871.12097, -29.33408,0,6},
		{2018.59717, 1868.24524, -29.33562,0,6},
		{2018.53650, 1859.29614, -29.33562,0,6},
		{2018.62170, 1855.60229, -29.33562,0,6},
		{2018.64075, 1845.40051, -29.33343,0,6},
	},
	visible = false,
	cards = {
		{"assets/cards/1.png", 6},
		{"assets/cards/2.png", 7},
		{"assets/cards/3.png", 8},
		{"assets/cards/4.png", 9},
		{"assets/cards/5.png", 10},
		{"assets/cards/6.png", 2},
		{"assets/cards/7.png", 3},
		{"assets/cards/8.png", 4},
		{"assets/cards/9.png", 11},
		{"assets/cards/10.png", 6},
		{"assets/cards/11.png", 7},
		{"assets/cards/12.png", 8},
		{"assets/cards/13.png", 9},
		{"assets/cards/14.png", 10},
		{"assets/cards/15.png", 2},
		{"assets/cards/16.png", 3},
		{"assets/cards/17.png", 4},
		{"assets/cards/18.png", 11},
		{"assets/cards/19.png", 6},
		{"assets/cards/20.png", 7},
		{"assets/cards/21.png", 8},
		{"assets/cards/22.png", 9},
		{"assets/cards/23.png", 10},
		{"assets/cards/24.png", 2},
		{"assets/cards/25.png", 3},
		{"assets/cards/26.png", 4},
		{"assets/cards/27.png", 11},
		{"assets/cards/28.png", 6},
		{"assets/cards/29.png", 7},
		{"assets/cards/30.png", 8},
		{"assets/cards/31.png", 9},
		{"assets/cards/32.png", 10},
		{"assets/cards/33.png", 2},
		{"assets/cards/34.png", 3},
		{"assets/cards/35.png", 4},
		{"assets/cards/36.png", 11},
	},
	dealer = {
		[1] = 0,
		[2] = 0,
		[3] = 0,
		[4] = 0,
		[5] = 0,
	},
	source = {
		[1] = 0,
		[2] = 0,
		[3] = 0,
		[4] = 0,
		[5] = 0,
	},		 
	fonts = {
		[1] = dxCreateFont("assets/fonts/gotham-medium.ttf", 13),
		[2] = dxCreateFont("assets/fonts/gotham-medium.ttf", 10),
		[3] = dxCreateFont("assets/fonts/gotham-light.ttf", 17),
	},
	used = {},
	active = false,
	sX = screenW/2-780/2,
	sY = screenH/2-450/2,
	message = {},
}

blackjack.render = function ()
	if not blackjack.visible then return end
	dxDrawImage(0, 0, screenW, screenH, "assets/blackjack.png", 0, 0, 0)


	dxDrawRectangle(blackjack.sX, blackjack.sY, 780, 450, tocolor(10, 31, 31, 255))
	dxDrawRectangle(blackjack.sX+2, blackjack.sY+2, 780-4, 450-4, tocolor(30, 61, 61, 255))
	dxDrawShadow(blackjack.sX, blackjack.sY, 780, 450, 10, 31, 31, 100, 25, false)

	dxDrawRectangle(blackjack.sX, blackjack.sY, 190, 85, tocolor(10, 31, 31, 255))
	dxDrawText("TUS FICHAS", blackjack.sX+5, blackjack.sY+5, 180+blackjack.sX+5, 30+blackjack.sY+5, tocolor(255, 255, 255), 1, blackjack.fonts[1], "center", "center")
	
	dxDrawImage(blackjack.sX+5, blackjack.sY+45, 30, 30, "assets/chip.png", 0, 0, 0)
	dxDrawText(blackjack.getChips(), blackjack.sX+40, blackjack.sY+45, 135+blackjack.sX+40, 30+blackjack.sY+45, tocolor(255, 255, 255), 1, blackjack.fonts[2], "center", "center")

	dxDrawRectangle(blackjack.sX+190, blackjack.sY, 2, 450, tocolor(10, 31, 31, 255))

	if blackjack.active == false then
		dxDrawText("TU APUESTA", blackjack.sX+5, blackjack.sY+170, 180+blackjack.sX+5, 30+blackjack.sY+170, tocolor(255, 255, 255), 1, blackjack.fonts[1], "center", "center")

		dxDrawButton(blackjack.sX+30, blackjack.sY+210, 60, 30, "MIN")
		dxDrawButton(blackjack.sX+95, blackjack.sY+210, 60, 30, "MAX")
		dxDrawButton(blackjack.sX+30, blackjack.sY+245, 60, 30, "X2")
		dxDrawButton(blackjack.sX+95, blackjack.sY+245, 60, 30, "X/2")

		blackjack.summ = dxDrawEdit(blackjack.sX+10, blackjack.sY+290, 170, 30, "5 - 100", "blackjack.rate")
		dxDrawButton(blackjack.sX+10, blackjack.sY+325, 170, 30, "Hacer una apuesta")

		dxDrawButton(blackjack.sX+10, blackjack.sY+410, 170, 30, "Cerrar")
	end
	if blackjack.active then
		dxDrawText("TU TURNO", blackjack.sX+5, blackjack.sY+170, 180+blackjack.sX+5, 30+blackjack.sY+170, tocolor(255, 255, 255), 1, blackjack.fonts[1], "center", "center")

		dxDrawButton(blackjack.sX+10, blackjack.sY+210, 170, 30, "Tomar una carta")
		dxDrawButton(blackjack.sX+10, blackjack.sY+245, 170, 30, "Pasar")
		dxDrawButton(blackjack.sX+10, blackjack.sY+310, 170, 30, "Retirarse")
	end


	dxDrawText("Crupier", blackjack.sX+220, blackjack.sY+20, 100+blackjack.sX+220, 30+blackjack.sY+20, tocolor(255, 255, 255), 1, blackjack.fonts[1], "left", "center")
	dxDrawText(blackjack.getScore("dealer"), blackjack.sX+640, blackjack.sY+20, 100+blackjack.sX+640, 30+blackjack.sY+20, tocolor(255, 255, 255), 1, blackjack.fonts[1], "right", "center")
	for i,v in pairs(blackjack.dealer) do
		if v == 0 then
			if i <= 2 then
				dxDrawImage(blackjack.sX+220+105*(i-1), blackjack.sY+60, 100, 142, "assets/cards/0.png")
			end
		else
			dxDrawImage(blackjack.sX+220+105*(i-1), blackjack.sY+60, 100, 142, "assets/cards/"..v..".png")
		end
	end

	for i=1, 5 do
		dxDrawImage(blackjack.sX+220+105*(i-1), blackjack.sY+60, 100, 142, "assets/cards/border.png")
	end

	dxDrawText("Tú", blackjack.sX+220, blackjack.sY+230, 100+blackjack.sX+220, 30+blackjack.sY+230, tocolor(255, 255, 255), 1, blackjack.fonts[1], "left", "center")
	dxDrawText(blackjack.getScore("source"), blackjack.sX+640, blackjack.sY+230, 100+blackjack.sX+640, 30+blackjack.sY+230, tocolor(255, 255, 255), 1, blackjack.fonts[1], "right", "center")
	for i,v in pairs(blackjack.source) do
		if v == 0 then
			if i <= 2 then
				dxDrawImage(blackjack.sX+220+105*(i-1), blackjack.sY+270, 100, 142, "assets/cards/0.png")
			end
		else
			dxDrawImage(blackjack.sX+220+105*(i-1), blackjack.sY+270, 100, 142, "assets/cards/"..v..".png")
		end
	end

	for i=1, 5 do
		dxDrawImage(blackjack.sX+220+105*(i-1), blackjack.sY+270, 100, 142, "assets/cards/border.png")
	end

	if blackjack.message.text then
		blackjack.message.height = math.min(blackjack.message.height + 50, 450)
		dxDrawRectangle(blackjack.sX, blackjack.sY, 780, blackjack.message.height, tocolor(40, 61, 61, 200))
		if blackjack.message.height == 450 then 
			blackjack.message.alpha = math.min(blackjack.message.alpha+25, 255)
			dxDrawText(blackjack.message.text, blackjack.sX, blackjack.sY, 780+blackjack.sX, 450+blackjack.sY, tocolor(255, 255, 255, blackjack.message.alpha), 1, blackjack.fonts[3], "center", "center")
		
			dxDrawButton(blackjack.sX+780/2-150/2, blackjack.sY+370, 150, 40, "OK")
		end
	end
end

for i,v in pairs(blackjack.poses) do
	blackjack.marker = createMarker(v[1], v[2], v[3], "cylinder", 0.75, 100, 255, 100, 100)
	setElementInterior(blackjack.marker, v[4])
	setElementDimension(blackjack.marker, v[5])
	addEventHandler("onClientMarkerHit", blackjack.marker, function(element, dim)
		if element == localPlayer and dim then
			if not isPedInVehicle(localPlayer) then
				local verticalDistance = Vector3(getElementPosition(localPlayer)).z - Vector3(getElementPosition(source)).z
				if verticalDistance > 3 or verticalDistance < -1 then
		    	    return
		    	end
		    	blackjack.visible = true
				showCursor(true)
				addEventHandler("onClientRender", root, blackjack.render)
			--	showChat(false)
				addEventHandler("onClientKey", root, cancelEvent)
			end
		end
	end)
end

blackjack.click = function (button, state)
	if button == "left" and state == "down" then
		if not blackjack.visible then return end
		if blackjack.message.text then
			if cursorPosition(blackjack.sX+780/2-150/2, blackjack.sY+370, 150, 40) then
				blackjack.message.text = false
				if  blackjack.message.func then
					blackjack.message.func()
					blackjack.message.func = false
				end
			end
		return end
		if blackjack.active == false then
			if cursorPosition(blackjack.sX+30, blackjack.sY+210, 60, 30) then
				edits.text["blackjack.rate"] = 5
			end
			if cursorPosition(blackjack.sX+95, blackjack.sY+210, 60, 30) then
				if blackjack.getChips() >= 100 then
					edits.text["blackjack.rate"] = 100
				else
					edits.text["blackjack.rate"] = blackjack.getChips()
				end
			end
			if cursorPosition(blackjack.sX+30, blackjack.sY+245, 60, 30) then
				if blackjack.summ == "" then blackjack.summ = 5 end
				edits.text["blackjack.rate"] = math.floor(math.min(blackjack.summ*2, 100))
			end
			if cursorPosition(blackjack.sX+95, blackjack.sY+245, 60, 30) then
				if blackjack.summ == "" then blackjack.summ = 5 end
				edits.text["blackjack.rate"] = math.floor(math.max(blackjack.summ/2, 5))
			end
			if cursorPosition(blackjack.sX+10, blackjack.sY+325, 170, 30) then
				if blackjack.summ and tonumber(blackjack.summ) and tonumber(blackjack.summ) >= 5 and tonumber(blackjack.summ) <= tonumber(blackjack.getChips()) and tonumber(blackjack.summ) <= 100 then
					blackjack.start()
				else 
					blackjack.sendMessage("No tienes fichas suficientes o tu apuesta supera el min/max establecido")
				end
			end
			if cursorPosition(blackjack.sX+10, blackjack.sY+410, 170, 30) then
				blackjack.visible = false
				guiSetInputEnabled(false)
				showCursor(false)
				removeEventHandler("onClientRender", root, blackjack.render)
				--showChat(true)
				removeEventHandler("onClientKey", root, cancelEvent)
			end
		else
			if cursorPosition(blackjack.sX+10, blackjack.sY+210, 170, 30) then
				blackjack.giveCard("source")
			end
			if cursorPosition(blackjack.sX+10, blackjack.sY+310, 170, 30) then
				blackjack.sendMessage("¡Te rendiste!", function ()
					blackjack.stop()
				end)
			end
			if cursorPosition(blackjack.sX+10, blackjack.sY+245, 170, 30) then
				blackjack.getWinner()
			end
		end 
	end
end
addEventHandler("onClientClick", root, blackjack.click) 

blackjack.start = function ()
	blackjack.active = true
	blackjack.rate = blackjack.summ
	blackjack.takeChips(blackjack.rate)
	blackjack.giveCard("dealer")
	blackjack.giveCard("dealer")
	blackjack.giveCard("source")
	blackjack.giveCard("source")
end

blackjack.stop = function ()
	blackjack.active = false
	blackjack.used = {}
	blackjack.dealer = {
		[1] = 0,
		[2] = 0, 
		[3] = 0,
		[4] = 0,
		[5] = 0,
	}
	blackjack.source = {
		[1] = 0,
		[2] = 0,
		[3] = 0,
		[4] = 0,
		[5] = 0,
	}
end

blackjack.getWinner = function ()
	for i = 1, 3 do
		if blackjack.getScore("dealer") < 17 then
			blackjack.giveCard("dealer")
		end
	end
	if blackjack.getScore("dealer") == 21 then
		blackjack.sendMessage("¡Perdiste!", function ()
			blackjack.stop()
		end)
	return end

	if blackjack.getScore("dealer") > 21 then
		blackjack.sendMessage("Ganaste "..(blackjack.rate*2).." fichas", function ()
			blackjack.giveChips(blackjack.rate*2)
			--exports.mtaAdmin:outputUnionLog(getPlayerName(localPlayer).." выиграл в 21 "..math.floor(blackjack.rate*2).." фишек | Общий баланс: "..blackjack.getChips().." фишек")
			blackjack.stop()
		end)
	return end

	if blackjack.getScore("dealer") == blackjack.getScore("source") then
		blackjack.sendMessage("¡Dibujar!\nFuiste devuelto "..blackjack.rate.."fichas", function ()
			blackjack.giveChips(blackjack.rate)
			blackjack.stop()
		end)
	return end

	if blackjack.getScore("dealer") > blackjack.getScore("source") then
		blackjack.sendMessage("¡Perdiste!", function ()
			blackjack.stop()
		end)
	return end

	if blackjack.getScore("dealer") < blackjack.getScore("source") then
		blackjack.sendMessage("Ganaste "..(blackjack.rate*2).." fichas", function ()
			blackjack.giveChips(blackjack.rate*2)
			--exports.mtaAdmin:outputUnionLog(getPlayerName(localPlayer).." выиграл в 21 "..math.floor(blackjack.rate*2).." фишек | Общий баланс: "..blackjack.getChips().." фишек")
			blackjack.stop()
		end)
	return end
end

blackjack.getScore = function (element)
	local score = 0
	for _,val in pairs(blackjack[element]) do
		for i,v in pairs(blackjack.cards) do
			if val == i then
				score = score + v[2]
			end
		end
	end
	return score
end

blackjack.giveCard = function (element)
	local card = blackjack.getNewCard(element)
	if card and card <= 5 then
		repeat random = math.random(1, #blackjack.cards) until blackjack.isCard(random) == false
		blackjack[element][card] = random
		table.insert(blackjack.used, random)

		if blackjack.getScore(element) == 22 and blackjack.getNewCard(element) == 3 then
			if element == "source" then
				blackjack.sendMessage("DOS AS - ¡ESTO ES MOSCÚ!\nGanaste "..math.floor(blackjack.rate*2.5).." fichas", function ()
					blackjack.giveChips(math.floor(blackjack.rate*2.5))
					--exports.mtaAdmin:outputUnionLog(getPlayerName(localPlayer).." выиграл в 21 "..math.floor(blackjack.rate*2.5).." фишек | Общий баланс: "..blackjack.getChips().." фишек")
					blackjack.stop()
				end)
				return
			elseif element == "dealer" then
				blackjack.sendMessage("DOS AS - ¡ESTO ES MOSCÚ!\nPero no contigo, ¡has perdido!", function ()
					blackjack.stop()
				end)
				return
			end
		end

		if blackjack.getScore(element) > 21 then
			if element == "source" then
				blackjack.sendMessage("¡Perdiste!", function ()
					blackjack.stop()
				end)
				return
			elseif element == "dealer" then
				blackjack.sendMessage("Ganaste "..(blackjack.rate*2).." fichas", function ()
					blackjack.giveChips(blackjack.rate*2)
					--exports.mtaAdmin:outputUnionLog(getPlayerName(localPlayer).." выиграл в 21 "..math.floor(blackjack.rate*2).." фишек | Общий баланс: "..blackjack.getChips().." фишек")
					blackjack.stop()
				end)
			end
			return
		elseif blackjack.getScore(element) == 21 then
			if element == "source" then
				blackjack.sendMessage("Ganaste "..math.floor(blackjack.rate*2.5).." fichas", function ()
					blackjack.giveChips(math.floor(blackjack.rate*2.5))
					--exports.mtaAdmin:outputUnionLog(getPlayerName(localPlayer).." выиграл в 21 "..math.floor(blackjack.rate*2.5).." фишек | Общий баланс: "..blackjack.getChips().." фишек")
					blackjack.stop()
				end)
				return
			elseif element == "dealer" then
				blackjack.sendMessage("¡Perdiste!", function ()
					blackjack.stop()
				end)
				return
			end
		end
		local card = blackjack.getNewCard(element)
		if not card or card > 5 then
			blackjack.getWinner()
		end
	end
end

blackjack.isCard = function (card)
	for i,v in pairs(blackjack.used) do
		if v == card then
			return true
		end
	end
	return false
end


blackjack.getNewCard = function (element)
	for i = 1, 5 do
		if blackjack[element][i] == 0 then
			return i
		end
	end
	return false
end

blackjack.sendMessage = function (message, func)
	if func then
		blackjack.message.func = func
	end
	blackjack.message.text = message
	blackjack.message.alpha = 0
	blackjack.message.height = 0
end

blackjack.giveChips = function(amount)
	setElementData(localPlayer, "casino:chips", (tonumber(getElementData(localPlayer, "casino:chips")) or 0) + amount)
end

blackjack.takeChips = function(amount)
	setElementData(localPlayer, "casino:chips", (tonumber(getElementData(localPlayer, "casino:chips")) or 0) - amount)
end

blackjack.getChips = function()
	local data = tonumber(getElementData(localPlayer, "casino:chips")) or 0
	return data
end