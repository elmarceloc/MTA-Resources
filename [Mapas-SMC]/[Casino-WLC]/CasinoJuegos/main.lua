local screenW, screenH = guiGetScreenSize()

local main = {
	poses = {
		{1934.69604, 1854.05505, -29.34094},
		{1934.46887, 1857.08264, -29.34094},
	},		
	visible = false,
	sX = screenW/2-400/2,
	sY = screenH/2-250/2,
	fonts = {
		[1] = dxCreateFont("assets/fonts/gotham-medium.ttf", 10),
		[2] = dxCreateFont("assets/fonts/gotham-light.ttf", 14),
	},
	prices = {
		buy = 5000,
		sell = 4500,
	},
	message = {},
}


main.render = function ()
	if main.visible then
		dxDrawImage(0, 0, screenW, screenH, "assets/main.png")

		dxDrawRectangle(main.sX, main.sY, 400, 250, tocolor(10, 31, 31, 255))
		dxDrawRectangle(main.sX+2, main.sY+2, 400-4, 250-4, tocolor(30, 61, 61, 255))
		dxDrawShadow(main.sX, main.sY, 400, 250, 10, 31, 31, 100, 25, false)

		dxDrawRectangle(main.sX, main.sY, 400, 60, tocolor(10, 31, 31, 255))

		dxDrawText("TUS FICHAS", main.sX+5, main.sY+5, 115+main.sX+5, 25+main.sY+5, tocolor(255, 255, 255), 1, main.fonts[1], "center", "center")
		
		dxDrawImage(main.sX+5, main.sY+32, 25, 25, "assets/chip.png", 0, 0, 0)
		dxDrawText(main.getChips(), main.sX+40, main.sY+30, 70+main.sX+40, 30+main.sY+30, tocolor(255, 255, 255), 1, main.fonts[1], "center", "center")

		dxDrawText("Tu dinero: $ "..getPlayerMoney(localPlayer).." \nPrecio Compra: $ 5.000 u.\nPrecio Canje: $ 4.500 u.", main.sX+320, main.sY+5, 70+main.sX+320, 30+main.sY+30, tocolor(255, 255, 255), 1, main.fonts[1], "right", "center")

		main.buy = dxDrawEdit(main.sX+200/2-150/2, main.sY+125, 150, 30, "0", "main.buy")
		dxDrawButton(main.sX+200/2-150/2, main.sY+165, 150, 30, "Comprar")

		if main.buy and tonumber(main.buy) and tonumber(main.buy) >= 0 then
		else
			main.buy = 0
		end
		dxDrawText("COMPRAR FICHAS\nPagas:\n"..main.buy*main.prices.buy.." CLP", main.sX+200/2-150/2, main.sY+75, 150+main.sX+200/2-150/2, 30+main.sY+75, tocolor(255, 255, 255), 1, main.fonts[1], "center", "center")

		main.sell = dxDrawEdit(main.sX+600/2-150/2, main.sY+125, 150, 30, "0", "main.sell")
		dxDrawButton(main.sX+600/2-150/2, main.sY+165, 150, 30, "Entregar")

		if main.sell and tonumber(main.sell) and tonumber(main.sell) >= 0 then
		else
			main.sell = 0
		end
		dxDrawText("CAMBIAR FICHAS\nObtienes:\n"..main.sell*main.prices.sell.." CLP", main.sX+600/2-150/2, main.sY+75, 150+main.sX+600/2-150/2, 30+main.sY+75, tocolor(255, 255, 255), 1, main.fonts[1], "center", "center")

		dxDrawButton(main.sX+5, main.sY+215, 390, 30, "Cerrar")

		if main.message.text then
			main.message.height = math.min(main.message.height+25, 250)
			dxDrawRectangle(main.sX, main.sY, 400, main.message.height, tocolor(40, 61, 61, 200))
			if main.message.height == 250 then
				main.message.alpha = math.min(main.message.alpha+25, 255)
				dxDrawText(main.message.text, main.sX, main.sY, 400+main.sX, 250+main.sY, tocolor(255, 255, 255, main.message.alpha), 1, main.fonts[2], "center", "center")
			
				dxDrawButton(main.sX+400/2-100/2, main.sY+200, 100, 30, "OK")
			end
		end
	end
end 

main.click = function (button, state)
	if button ~= "left" or state ~= "down" then return end
	if main.visible then
		if main.message.text then
			if cursorPosition(main.sX+400/2-150/2, main.sY+200, 100, 30) then
				main.message.text = false
				if  main.message.func then
					main.message.func()
					main.message.func = false
				end
			end
		return end
		if cursorPosition(main.sX+200/2-150/2, main.sY+165, 150, 30) then
			if main.buy and tonumber(main.buy) and tonumber(main.buy) >= 1 then
			else
				main.buy = 0
			end
			local price = main.buy*main.prices.buy
			if getPlayerMoney(localPlayer) >= tonumber(price) then
				if main.buy == 0 then main.sendMessage("Error en la compra!") return end
				takePlayerMoney(price)
				main.giveChips(main.buy)
				main.sendMessage("Has comprado con éxito "..main.buy.." fichas!")
				--exports.mtaAdmin:outputUnionLog(getPlayerName(localPlayer).." купил "..main.buy.." фишек в казино за "..price.." рублей | Общий баланс: "..main.getChips().." фишек")
			else
				main.sendMessage("Fondos insuficientes \ncomprar fichas!")
			end
		end
		if cursorPosition(main.sX+600/2-150/2, main.sY+165, 150, 30) and main.sell then
			if main.sell and tonumber(main.sell) and tonumber(main.sell) >= 1 then
			else
				main.sell = 0
			end
			local price = main.sell*main.prices.sell
			if main.getChips() >= tonumber(main.sell) then
				if main.sell == 0 then main.sendMessage("Error de entrega!") return end
				givePlayerMoney(price)
				main.takeChips(main.sell)
				main.sendMessage("Canjeaste exitosamente "..main.sell.." fichas!")
				--exports.mtaAdmin:outputUnionLog(getPlayerName(localPlayer).." сдал "..main.sell.." фишек в казино за "..price.." рублей | Общий баланс: "..main.getChips().." фишек")
			else
				main.sendMessage("No hay suficientes fichas para cambiar!")
			end
		end
		if cursorPosition(main.sX+5, main.sY+215, 390, 30) then
			guiSetInputEnabled(false)
			main.visible = false
			showCursor(false)
			removeEventHandler("onClientRender", root, main.render)
			removeEventHandler("onClientKey", root, cancelEvent)
			showChat(true)
		end
	end
end
addEventHandler("onClientClick", root, main.click)

for i,v in pairs(main.poses) do
	main.marker = createMarker(v[1], v[2], v[3], "cylinder", 1, 200, 200, 0, 100)
	setElementInterior(main.marker, v[4])
	setElementDimension(main.marker, v[5])
	addEventHandler("onClientMarkerHit", main.marker, function(element, dim)
		if element == localPlayer and dim then
			if not isPedInVehicle(localPlayer) then
				local verticalDistance = Vector3(getElementPosition(localPlayer)).z - Vector3(getElementPosition(source)).z
				if verticalDistance > 3 or verticalDistance < -1 then
		    	    return
		    	end
		    	main.visible = true
				showCursor(true)
				showChat(false)
				addEventHandler("onClientRender", root, main.render)
				addEventHandler("onClientKey", root, cancelEvent)
			end
		end
	end)
end

main.sendMessage = function (message, func)
	if func then
		main.message.func = func
	end
	main.message.text = message
	main.message.alpha = 0
	main.message.height = 0
end

main.giveChips = function(amount)
	setElementData(localPlayer, "casino:chips", (tonumber(getElementData(localPlayer, "casino:chips")) or 0) + amount)
end

main.takeChips = function(amount)
	setElementData(localPlayer, "casino:chips", (tonumber(getElementData(localPlayer, "casino:chips")) or 0) - amount)
end

main.getChips = function()
	local data = tonumber(getElementData(localPlayer, "casino:chips")) or 0
	return data
end


main.sound = playSound3D("http://air.radiorecord.ru:8102/rus_128", 2628.8767089844, 1199.4747314453, 9209.630859375)
setSoundMaxDistance(main.sound, 200)
