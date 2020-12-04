local screenW, screenH = guiGetScreenSize()

local roulette = {
	poses = {
		{2007.74731, 1873.15125, -29.33557},
		{2007.69470, 1866.69775, -29.33557},
		{2007.68335, 1859.54163, -29.33557},
		{2007.60339, 1851.95313, -29.33557},
		{2007.58203, 1843.60034, -29.33557},
	},
	numbers = {
		{rotation = {4, 3, 2, 1, 0, 360, 359, 358, 357, 356, 355}, number = 0, color = "green"},
		{rotation = {5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, number = 26, color = "black"},
		{rotation = {15, 16, 17, 18, 19, 20, 21, 22, 23}, number = 3, color = "red"},
		{rotation = {24, 25, 26, 27, 28, 29, 30, 31, 32, 33}, number = 35, color = "black"},
		{rotation = {34, 35, 36, 37, 38, 39, 40, 41, 42, 43}, number = 12, color = "red"},
		{rotation = {44, 45, 46, 47, 48, 49, 50, 51, 52, 53}, number = 28, color = "black"},
		{rotation = {54, 55, 56, 57, 58, 59, 60, 61, 62, 62}, number = 7, color = "red"},
		{rotation = {63, 64, 65, 66, 67, 68, 69, 70, 70, 71, 72}, number = 29, color = "black"},
		{rotation = {73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83}, number = 18, color = "red"},
		{rotation = {84, 85, 86, 87, 88, 89, 90, 91, 92}, number = 22, color = "black"},
		{rotation = {93, 94, 95, 96, 97, 98, 99, 100, 101, 102}, number = 9, color = "red"},
		{rotation = {103, 104, 105, 106, 107, 108, 109, 110, 111, 112}, number = 31, color = "black"},
		{rotation = {113, 114, 115, 116, 117, 118, 119, 120, 121, 122}, number = 14, color = "red"},
		{rotation = {123, 124, 125, 126, 127, 128, 129, 130, 131, 132}, number = 20, color = "black"},
		{rotation = {133, 134, 135, 136, 137, 138, 139, 140, 141}, number = 1, color = "red"},
		{rotation = {142, 143, 144, 145, 146, 147, 148, 149, 150, 151}, number = 33, color = "black"},
		{rotation = {152, 153, 154, 155, 156, 157, 158, 159, 160, 161}, number = 16, color = "red"},
		{rotation = {162, 163, 164, 165, 166, 167, 168, 169, 170}, number = 24, color = "black"},
		{rotation = {171, 172, 173, 174, 175, 176, 177, 178, 179, 180}, number = 5, color = "red"},
		{rotation = {181, 182, 183, 184, 185, 186, 187, 188, 189}, number = 10, color = "black"},
		{rotation = {190, 191, 192, 193, 194, 195, 196, 197, 198, 199}, number = 23, color = "red"},
		{rotation = {200, 201, 202, 203, 204, 205, 206, 207, 208}, number = 8, color = "black"},
		{rotation = {209, 210, 211, 212, 213, 214, 215, 216, 217, 218}, number = 30, color = "red"}, 
		{rotation = {219, 220, 221, 222, 223, 224, 225, 226, 227}, number = 11, color = "black"},
		{rotation = {228, 229, 230, 231, 232, 233, 234, 235, 236, 237}, number = 36, color = "red"},
		{rotation = {238, 239, 240, 241, 242, 243, 244, 245, 246, 247}, number = 13, color = "black"},
		{rotation = {248, 249, 250, 251, 252, 253, 254, 255, 256, 257}, number = 27, color = "red"},
		{rotation = {258, 259, 260, 261, 262, 263, 264, 265, 266, 267}, number = 6, color = "black"},
		{rotation = {268, 269, 270, 271, 272, 273, 274, 275, 276, 277}, number = 34, color = "red"},
		{rotation = {278, 279, 280, 281, 282, 283, 284, 285, 286}, number = 17, color = "black"},
		{rotation = {287, 288, 289, 290, 291, 292, 293, 294, 295, 296}, number = 25, color = "red"},
		{rotation = {297, 298, 299, 300, 301, 302, 303, 304, 305}, number = 2, color = "black"},
		{rotation = {306, 307, 308, 309, 310, 311, 312, 313, 314, 315}, number = 21, color = "red"},
		{rotation = {316, 317, 318, 319, 320, 321, 322, 323, 324, 325}, number = 4, color = "black"},
		{rotation = {326, 327, 328, 329, 330, 331, 332, 333, 334, 335}, number = 19, color = "red"},
		{rotation = {336, 337, 338, 339, 340, 341, 342, 343, 344}, number = 15, color = "black"},
		{rotation = {345, 346, 347, 348, 349, 350, 351, 352, 353, 354}, number = 32, color = "red"},
	},
	visible = false,
	fonts = {
		[1] = dxCreateFont("assets/fonts/gotham-medium.ttf", 10),
		[2] = dxCreateFont("assets/fonts/gotham-medium.ttf", 10),
		[3] = dxCreateFont("assets/fonts/gotham-light.ttf", 17),
	},
	active = false,
	rotation = math.random(0, 360),
	speed = 0,
	visible = false,
	sX = screenW/2-780/2,
	sY = screenH/2-450/2,
	message = {},
	rates = {},
	selected = false,
}

roulette.render = function ()
	if not roulette.visible then return end
	dxDrawImage(0, 0, screenW, screenH, "assets/roulette.png", 0, 0, 0)

	dxDrawRectangle(roulette.sX, roulette.sY, 780, 450, tocolor(10, 31, 31, 255))
	dxDrawRectangle(roulette.sX+2, roulette.sY+2, 780-4, 450-4, tocolor(30, 61, 61, 255))
	dxDrawShadow(roulette.sX, roulette.sY, 780, 450, 10, 31, 31, 100, 25, false)

	dxDrawImage(roulette.sX+15, roulette.sY+25, 270, 268, "assets/roulette/roulette_border.png", 0, 0, 0)


	if roulette.speed < 5 then
		roulette.speed = math.max(roulette.speed-0.025, 0)
	elseif roulette.speed < 2 then
		roulette.speed = math.max(roulette.speed-0.01, 0)
	else
		roulette.speed = math.max(roulette.speed-0.05, 0)
	end
	roulette.rotation = math.min(roulette.speed + roulette.rotation, 360)
	if roulette.rotation == 360 then roulette.rotation = 0 end
	
	if roulette.speed == 0 and roulette.active then
		--roulette.rotation = 0
		--outputChatBox("Выпало "..roulette.getNumber(roulette.rotation).." "..roulette.getColor(roulette.getNumber(roulette.rotation)))
		local data = {number = roulette.getNumber(roulette.rotation), color = roulette.getColor(roulette.getNumber(roulette.rotation))}
		local cash = roulette.getWin(data)
		if cash > 0 then
			roulette.sendMessage("Ganaste "..cash.." fichas!", function ()
				roulette.startTimer()
			end)
		else
			roulette.startTimer()
		end
		roulette.giveChips(cash)
		--exports.mtaAdmin:outputUnionLog(getPlayerName(localPlayer).." выиграл в рулетке "..cash.." фишек | Общий баланс: "..roulette.getChips().." фишек")
		roulette.rates = {}
		roulette.active = false 
	end

	dxDrawImage(roulette.sX+15, roulette.sY+25, 270, 268, "assets/roulette/roulette_number.png", roulette.rotation, 0, 0)

	roulette.dxDrawButtonRate(roulette.sX+300, roulette.sY+85, 30, 150, "0", 0, 100, 0, 255, -90)
	if roulette.isRate({color = "green"}) then
		dxDrawImage(roulette.sX+300, roulette.sY+85, 20, 20, "assets/chip.png")
	end
	for i = 1, 36 do
		r, g, b = 100, 0, 0
		color = "green"
		local x = math.floor((i-1)/3)*30 --math.floor((i-1)/12)*50
		local y = math.fmod(i-1, 3)*50 --math.fmod(i-1, 12)*30
		for id,value in pairs(roulette.numbers) do
			color = value.color
			if value.number == i then
				if value.color == "red" then
					r, g, b = 200, 0, 0
				elseif value.color == "black" then
					r, g, b = 0, 0, 0
				end
			end
		end
		roulette.dxDrawButtonRate(roulette.sX+330+x, roulette.sY+85+100-y, 30, 50, i, r, g, b, 255, -90)
		if roulette.isRate({number = i}) then
			dxDrawImage(roulette.sX+330+x, roulette.sY+85+100-y, 20, 20, "assets/chip.png")
		end
	end

	if isTimer(roulette.timer) then
		local time = string.format("%02d", math.floor(getTimerDetails(roulette.timer)/1000))
		dxDrawText("0:"..time, roulette.sX+300, roulette.sY+35, 300+roulette.sX+380, 30+roulette.sY+35, tocolor(255, 255, 255), 1, roulette.fonts[3], "center", "center")
	end

	roulette.dxDrawButtonRate(roulette.sX+330, roulette.sY+235, 120, 30, "1ST12", 0, 100, 0, 255, 0)
	if roulette.isRate({other = "1ST12"}) then
		dxDrawImage(roulette.sX+330, roulette.sY+235, 20, 20, "assets/chip.png")
	end

	roulette.dxDrawButtonRate(roulette.sX+450, roulette.sY+235, 120, 30, "2ND12", 0, 100, 0, 255, 0)
	if roulette.isRate({other = "2ND12"}) then
		dxDrawImage(roulette.sX+450, roulette.sY+235, 20, 20, "assets/chip.png")
	end
	roulette.dxDrawButtonRate(roulette.sX+570, roulette.sY+235, 120, 30, "3RD12", 0, 100, 0, 255, 0)
	if roulette.isRate({other = "3RD12"}) then
		dxDrawImage(roulette.sX+570, roulette.sY+235, 20, 20, "assets/chip.png")
	end

	roulette.dxDrawButtonRate(roulette.sX+330, roulette.sY+265, 60, 30, "1TO18", 0, 100, 0, 255, 0)
	if roulette.isRate({other = "1TO18"}) then
		dxDrawImage(roulette.sX+330, roulette.sY+265, 20, 20, "assets/chip.png")
	end

	roulette.dxDrawButtonRate(roulette.sX+390, roulette.sY+265, 60, 30, "EVEN", 0, 100, 0, 255, 0)
	if roulette.isRate({other = "EVEN"}) then
		dxDrawImage(roulette.sX+390, roulette.sY+265, 20, 20, "assets/chip.png")
	end

	roulette.dxDrawButtonRate(roulette.sX+450, roulette.sY+265, 60, 30, "", 200, 0, 0, 255, 0)
	if roulette.isRate({color = "red"}) then
		dxDrawImage(roulette.sX+450, roulette.sY+265, 20, 20, "assets/chip.png")
	end
	roulette.dxDrawButtonRate(roulette.sX+510, roulette.sY+265, 60, 30, "", 0, 0, 0, 255, 0)
	if roulette.isRate({color = "black"}) then
		dxDrawImage(roulette.sX+510, roulette.sY+265, 20, 20, "assets/chip.png")
	end


	roulette.dxDrawButtonRate(roulette.sX+570, roulette.sY+265, 60, 30, "ODD", 0, 100, 0, 255, 0)
	if roulette.isRate({other = "ODD"}) then
		dxDrawImage(roulette.sX+570, roulette.sY+265, 20, 20, "assets/chip.png")
	end

	roulette.dxDrawButtonRate(roulette.sX+630, roulette.sY+265, 60, 30, "19TO36", 0, 100, 0, 255, 0)
	if roulette.isRate({other = "19TO36"}) then
		dxDrawImage(roulette.sX+630, roulette.sY+265, 20, 20, "assets/chip.png")
	end

	roulette.dxDrawButtonRate(roulette.sX+690, roulette.sY+85, 30, 50, "2TO1", 0, 100, 0, 255, -90)
	if roulette.isRate({other = "2TO1_1"}) then
		dxDrawImage(roulette.sX+690, roulette.sY+85, 20, 20, "assets/chip.png")
	end
	roulette.dxDrawButtonRate(roulette.sX+690, roulette.sY+135, 30, 50, "2TO1", 0, 100, 0, 255, -90)
	if roulette.isRate({other = "2TO1_2"}) then
		dxDrawImage(roulette.sX+690, roulette.sY+135, 20, 20, "assets/chip.png")
	end
	roulette.dxDrawButtonRate(roulette.sX+690, roulette.sY+185, 30, 50, "2TO1", 0, 100, 0, 255, -90)
	if roulette.isRate({other = "2TO1_3"}) then
		dxDrawImage(roulette.sX+690, roulette.sY+185, 20, 20, "assets/chip.png")
	end

	if roulette.selected then
		local rateV, rateID = roulette.isRate(roulette.selected)
		if rateV then
			local width = dxGetTextWidth(rateV.rate, 1, roulette.fonts[1])
			dxDrawText(rateV.rate, roulette.sX+330, roulette.sY+300, 150, 30+roulette.sY+300, tocolor(255, 255, 255, 255), 1, roulette.fonts[1], "left", "center")
			dxDrawImage(roulette.sX+330+width+5, roulette.sY+300, 25, 25, "assets/chip.png", 0, 0, 0)
			dxDrawButton(roulette.sX+540, roulette.sY+300, 150, 30, "Cancelar apuesta")
		else
			roulette.summ = dxDrawEdit(roulette.sX+330, roulette.sY+300, 150, 30, "0-100", "roulette.rate")
			dxDrawButton(roulette.sX+540, roulette.sY+300, 150, 30, "Hacer una apuesta")

			dxDrawButton(roulette.sX+330, roulette.sY+340, 60, 30, "MIN")
			dxDrawButton(roulette.sX+400, roulette.sY+340, 60, 30, "MAX")
			dxDrawButton(roulette.sX+470, roulette.sY+340, 60, 30, "X2")
			dxDrawButton(roulette.sX+540, roulette.sY+340, 60, 30, "X/2")
		end
	end

	dxDrawText("TUS FICHAS: "..roulette.getChips(), roulette.sX+10, roulette.sY+420, 135+roulette.sX+5, 30+roulette.sY+420, tocolor(255, 255, 255), 1, roulette.fonts[1], "left", "center")
	local width = dxGetTextWidth("TUS FICHAS: "..roulette.getChips(), 1, roulette.fonts[1])

	dxDrawImage(roulette.sX+5+width+10, roulette.sY+422, 25, 25, "assets/chip.png", 0, 0, 0)

	if isTimer(roulette.timer) then
		dxDrawButton(roulette.sX+780-155, roulette.sY+455-40, 150, 30, "Cerrar")
	else
		if #roulette.rates == 0 then
			dxDrawButton(roulette.sX+780-155, roulette.sY+455-40, 150, 30, "Cerrar")
		end
	end

	if roulette.message.text then
		roulette.message.height = math.min(roulette.message.height + 50, 450)
		dxDrawRectangle(roulette.sX, roulette.sY, 780, roulette.message.height, tocolor(40, 61, 61, 200))
		if roulette.message.height == 450 then 
			roulette.message.alpha = math.min(roulette.message.alpha+25, 255)
			dxDrawText(roulette.message.text, roulette.sX, roulette.sY, 780+roulette.sX, 450+roulette.sY, tocolor(255, 255, 255, roulette.message.alpha), 1, roulette.fonts[3], "center", "center")
		
			dxDrawButton(roulette.sX+780/2-150/2, roulette.sY+370, 150, 40, "OK")
		end
	end
end

roulette.getWin = function (data)
	local cash = 0
	local color = data.color
	local number = data.number
	for i,v in pairs(roulette.rates) do
		if v.other then
			if (number % 2 == 0) then
				if v.other == "EVEN" then
					cash = cash+(v.rate*2)
				end
			else
				if v.other == "ODD" then
					cash = cash+(v.rate*2)
				end
			end
			if number <= 18 then
				if v.other == "1TO18" then
					cash = cash+(v.rate*2)
				end
			else
				if v.other == "19TO36" then
					cash = cash+(v.rate*2)
				end
			end
			if number <= 12 then
				if v.other == "1ST12" then
					cash = cash+(v.rate*3)
				end
			end
			if number <= 24 and number >= 13 then
				if v.other == "2ND12" then
					cash = cash+(v.rate*3)
				end
			end
			if number <= 36 and number >= 25 then
				if v.other == "3RD12" then
					cash = cash+(v.rate*3)
				end
			end
			local tableNumbers = {3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36}
			for id,num in pairs(tableNumbers) do
				if number == num then
					if v.other == "2TO1_1" then
						cash = cash+(v.rate*3)
					end
				end
			end
			local tableNumbers = {2, 5, 8, 11, 14, 17, 20, 23, 26, 29, 32, 35}
			for id,num in pairs(tableNumbers) do
				if number == num then
					if v.other == "2TO1_2" then
						cash = cash+(v.rate*3)
					end
				end
			end
			local tableNumbers = {1, 4, 7, 10, 13, 16, 19, 22, 25, 28, 31, 34}
			for id,num in pairs(tableNumbers) do
				if number == num then
					if v.other == "2TO1_3" then
						cash = cash+(v.rate*3)
					end
				end
			end
		end
		if v.number then
			if v.number == number then
				cash = cash+(v.rate*14)
			end
		else
			if v.color == "green" and color == "green" then
				cash = cash+(v.rate*14)
			else
				if v.color == color then
					cash = cash+(v.rate*2)
				end
			end
		end
	end
	return cash
end

roulette.isRate = function (data)
	local rate, rateID = false, false
	for i,v in pairs(roulette.rates) do
		if data.number then
			if v.number == data.number then
				rate, rateID = v, i
			end
		elseif data.other then
			if data.other == v.other then
				rate, rateID = v, i
			end
		else
			if data.color == v.color then
				rate, rateID = v, i
			end
		end
	end
	return rate, rateID
end

roulette.getNumber = function (rot)
	for i,v in pairs(roulette.numbers) do
		for _,vrot in pairs(v.rotation) do
			if math.floor(rot) == vrot then 
				return v.number
			end
		end
	end
end

roulette.getColor = function (numb)
	for i,v in pairs(roulette.numbers) do
		if v.number == numb then 
			return v.color
		end
	end
end


roulette.dxDrawButtonRate = function (x, y, w, h, text, r, g, b, a, rot)
	if cursorPosition(x, y, w, h) then
		dxDrawRectangle(x, y, w, h, tocolor(255, 255, 0, a))
		dxDrawShadow(x, y, w, h, 255, 255, 0, 100, 5, false)
	else
		dxDrawRectangle(x, y, w, h, tocolor(255, 255, 255, a))
	end
	dxDrawRectangle(x+2, y+2, w-4, h-4, tocolor(r, g, b, a))
	dxDrawText(text, x, y, w+x, h+y, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, false, false, false, rot)
end

addEventHandler("onClientClick", root, function (button, state)
	if button == "left" and state == "down" then
		if not roulette.visible then return end
		if roulette.message.text then
			if cursorPosition(roulette.sX+780/2-150/2, roulette.sY+370, 150, 40) then
				roulette.message.text = false
				if  roulette.message.func then
					roulette.message.func()
					roulette.message.func = false
				end
			end
		return end

		--dxDrawButton(roulette.sX+330, roulette.sY+340, 60, 30, "MIN")
		--	dxDrawButton(roulette.sX+400, roulette.sY+340, 60, 30, "MAX")
		--	dxDrawButton(roulette.sX+470, roulette.sY+340, 60, 30, "X2")
		--	dxDrawButton(roulette.sX+540, roulette.sY+340, 60, 30, "X/2")
		if cursorPosition(roulette.sX+330, roulette.sY+340, 60, 30) then
			edits.text["roulette.rate"] = 5
		end
		if cursorPosition(roulette.sX+400, roulette.sY+340, 60, 30) then
			if roulette.getChips() >= 100 then
				edits.text["roulette.rate"] = 100
			else
				edits.text["roulette.rate"] = roulette.getChips()
			end
		end
		if cursorPosition(roulette.sX+470, roulette.sY+340, 60, 30) then
			if roulette.summ == "" then roulette.summ = 5 end
			edits.text["roulette.rate"] = math.floor(math.min(roulette.summ*2, 100))
		end
		if cursorPosition(roulette.sX+540, roulette.sY+340, 60, 30) then
			if roulette.summ == "" then roulette.summ = 5 end
			edits.text["roulette.rate"] = math.floor(math.max(roulette.summ/2, 5))
		end
		if cursorPosition(roulette.sX+780-155, roulette.sY+455-40, 150, 30) then
			if isTimer(roulette.timer) or (not isTimer(roulette.timer) and #roulette.rates == 0) then
				if not roulette.visible then return end
				guiSetInputEnabled(false)
				roulette.visible = false
				showCursor(false)
				removeEventHandler("onClientRender", root, roulette.render)
				removeEventHandler("onClientKey", root, cancelEvent)
				if isTimer(roulette.timer) then killTimer(roulette.timer) end
				for i,v in pairs(roulette.rates) do
					roulette.giveChips(v.rate)
				end
				roulette.rates = {}
				roulette.speed = 0
				roulette.rotation = 0
			end
		end
		if cursorPosition(roulette.sX+540, roulette.sY+300, 150, 30) then
			if isTimer(roulette.timer) then
				local rateV, rateID = roulette.isRate(roulette.selected)
				if rateV then
					roulette.giveChips(rateV.rate)
					table.remove(roulette.rates, rateID)
					roulette.selected = false
				else
					if tonumber(roulette.summ) >= 5 and tonumber(roulette.summ) <= 100 and roulette.getChips() >= tonumber(roulette.summ) then
						roulette.selected.rate = roulette.summ
						roulette.takeChips(roulette.summ)
						table.insert(roulette.rates, roulette.selected)
						roulette.selected = false
					else
						roulette.sendMessage("No tienes fichas suficientes o tu apuesta supera el min/max establecido")
					end
				end
			end
		end
		if isTimer(roulette.timer) then
			if cursorPosition(roulette.sX+330, roulette.sY+235, 120, 30) then
				if not roulette.isRate({other = "2ND12"}) and not roulette.isRate({other = "3RD12"}) then
					roulette.selected = {other = "1ST12"}
				else
					roulette.sendMessage("No puedes apostar por esta celda!")
				end
			end
			if cursorPosition(roulette.sX+450, roulette.sY+235, 120, 30) then
				if not roulette.isRate({other = "1ST12"}) and not roulette.isRate({other = "3RD12"}) then
					roulette.selected = {other = "2ND12"}
				else
					roulette.sendMessage("No puedes apostar por esta celda!")
				end
			end
			if cursorPosition(roulette.sX+570, roulette.sY+235, 120, 30) then
				if not roulette.isRate({other = "1ST12"}) and not roulette.isRate({other = "2ND12"}) then
					roulette.selected = {other = "3RD12"}
				else
					roulette.sendMessage("No puedes apostar por esta celda!")
				end
			end
			if cursorPosition(roulette.sX+330, roulette.sY+265, 60, 30) then
				if not roulette.isRate({other = "19TO36"}) then
					roulette.selected = {other = "1TO18"}
				else
					roulette.sendMessage("No puedes apostar por esta celda!")
				end
			end
			if cursorPosition(roulette.sX+630, roulette.sY+265, 60, 30) then
				if not roulette.isRate({other = "1TO18"}) then
					roulette.selected = {other = "19TO36"}
				else
					roulette.sendMessage("No puedes apostar por esta celda!")
				end
			end
			if cursorPosition(roulette.sX+390, roulette.sY+265, 60, 30) then
				if not roulette.isRate({other = "ODD"}) then
					roulette.selected = {other = "EVEN"}
				else
					roulette.sendMessage("No puedes apostar por esta celda!")
				end
			end
			if cursorPosition(roulette.sX+570, roulette.sY+265, 60, 30) then
				if not roulette.isRate({other = "EVEN"}) then
					roulette.selected = {other = "ODD"}
				else
					roulette.sendMessage("No puedes apostar por esta celda!")
				end
			end
			if cursorPosition(roulette.sX+510, roulette.sY+265, 60, 30) then
				if not roulette.isRate({color = "red"}) then
					roulette.selected = {color = "black"}
				else
					roulette.sendMessage("No puedes apostar por esta celda!")
				end
			end
			if cursorPosition(roulette.sX+450, roulette.sY+265, 60, 30) then
				if not roulette.isRate({color = "black"}) then
					roulette.selected = {color = "red"}
				else
					roulette.sendMessage("No puedes apostar por esta celda!")
				end
			end
			if cursorPosition(roulette.sX+300, roulette.sY+85, 30, 150) then
				roulette.selected = {color = "green"}
			end
			if cursorPosition(roulette.sX+690, roulette.sY+85, 30, 50) then
				if not roulette.isRate({other = "2TO1_2"}) and not roulette.isRate({other = "2TO1_3"}) then
					roulette.selected = {other = "2TO1_1"}
				else
					roulette.sendMessage("No puedes apostar por esta celda!")
				end
			end
			if cursorPosition(roulette.sX+690, roulette.sY+135, 30, 50) then
				if not roulette.isRate({other = "2TO1_1"}) and not roulette.isRate({other = "2TO1_3"}) then
					roulette.selected = {other = "2TO1_2"}
				else
					roulette.sendMessage("No puedes apostar por esta celda!")
				end
			end
			if cursorPosition(roulette.sX+690, roulette.sY+185, 30, 50) then
				if not roulette.isRate({other = "2TO1_1"}) and not roulette.isRate({other = "2TO1_2"}) then
					roulette.selected = {other = "2TO1_3"}
				else
					roulette.sendMessage("No puedes apostar por esta celda!")
				end
			end
			for i = 1, 36 do
				local x = math.floor((i-1)/3)*30 --math.floor((i-1)/12)*50
				local y = math.fmod(i-1, 3)*50 --math.fmod(i-1, 12)*30
				if cursorPosition(roulette.sX+330+x, roulette.sY+85+100-y, 30, 50) then
					local color = "green"
					for _,value in pairs(roulette.numbers) do
						if value.number == i then
							color = value.color
						end
					end
					roulette.selected = {color = value, number = i}
				end
			end
		end
	end
end)

roulette.startTimer = function ()
	roulette.timer = setTimer(function ()
		if roulette.speed == 0 then
			roulette.speed = math.random(10, 20)
			roulette.rotation = math.random(0, 360)
			roulette.active = true
			roulette.selected = false
		end
	end, 30000, 1)
end

for i,v in pairs(roulette.poses) do
	roulette.marker = createMarker(v[1], v[2], v[3], "cylinder", 0.75, 0, 255, 100, 100)
	setElementInterior(roulette.marker, v[4])
	setElementDimension(roulette.marker, v[5])
	addEventHandler("onClientMarkerHit", roulette.marker, function(element, dim)
		if element == localPlayer and dim then
			if not isPedInVehicle(localPlayer) then
				local verticalDistance = Vector3(getElementPosition(localPlayer)).z - Vector3(getElementPosition(source)).z
				if verticalDistance > 3 or verticalDistance < -1 then
		    	    return
		    	end

		    	roulette.visible = true
				showCursor(true)
				addEventHandler("onClientRender", root, roulette.render)
				addEventHandler("onClientKey", root, cancelEvent)
				roulette.speed = 0
				roulette.rotation = math.random(0, 360)
				roulette.active = false
				for i,v in pairs(roulette.rates) do
					roulette.giveChips(v.rate)
				end
				roulette.rates = {}
				roulette.startTimer()
			end
		end
	end)
end

roulette.sendMessage = function (message, func)
	if func then
		roulette.message.func = func
	end
	roulette.message.text = message
	roulette.message.alpha = 0
	roulette.message.height = 0
end

roulette.giveChips = function(amount)
	setElementData(localPlayer, "casino:chips", (tonumber(getElementData(localPlayer, "casino:chips")) or 0) + amount)
end

roulette.takeChips = function(amount)
	setElementData(localPlayer, "casino:chips", (tonumber(getElementData(localPlayer, "casino:chips")) or 0) - amount)
end

roulette.getChips = function()
	local data = tonumber(getElementData(localPlayer, "casino:chips")) or 0
	return data
end
