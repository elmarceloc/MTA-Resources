isBike = {[509]=true, [481]=true, [510]=true} -- rowery

addEvent("onChooseInteractionV1", true)
addEventHandler("onChooseInteractionV1", root, function()
	local vehicle = getPedOccupiedVehicle(source)
	if vehicle then
		if isBike[getElementModel(vehicle)] then return end
		local engine = getVehicleEngineState(vehicle)
		if engine == false then
			setVehicleEngineState(vehicle, true)
			outputChatBox("* O motor do carro foi 'LIGADO'", source)
		else
			if getElementData(vehicle, "vehicle_fuel") == 0 then
				outputChatBox("* Você pode ligar o motor, sem combustível.", plr)
				return
			end
			if getElementData(vehicle, "vehicle_mileage") == 10000 then
				outputChatBox("* Você pode ligar o motor, quilometragem muito alta.", plr)
				return
			end
			setVehicleEngineState(vehicle, false)
			outputChatBox("* O motor do carro está 'DESLIGADO'", source)
		end
	end
end)

addEvent("onChooseInteractionV2", true)
addEventHandler("onChooseInteractionV2", root, function()
	local vehicle = getPedOccupiedVehicle(source)
	if vehicle then
		if isBike[getElementModel(vehicle)] then return end
		if getVehicleOverrideLights(vehicle) ~= 2 then
			setVehicleOverrideLights(vehicle, 2)
			outputChatBox("* Farol foi 'LIGADO'", source)
		else
			setVehicleOverrideLights(vehicle, 1)
			outputChatBox("* Farol foi 'DESLIGADO'", source)
		end
	end
end)

addEvent("onChooseInteractionV3", true)
addEventHandler("onChooseInteractionV3", root, function()
	local vehicle = getPedOccupiedVehicle(source)
	if vehicle then
		if isBike[getElementModel(vehicle)] then return end
		outputChatBox("* POR FAVOR, USE A TECLA 'L'", source)
	end
end)

addEvent("onChooseInteractionV4", true)
addEventHandler("onChooseInteractionV4", root, function()
	local vehicle = getPedOccupiedVehicle(source)
	if vehicle then
		--if not getElementData(vehicle, "pojazd_zrespiony") then return end
		if isBike[getElementModel(vehicle)] then return end
		local sx,sy,sz = getElementVelocity(vehicle)
		local aspeed = (sx^2 + sy^2 + sz^2)^(0.5)
		local kmh = aspeed * 180
		if kmh < 2 then
			if isElementFrozen(vehicle) then
				setElementFrozen(vehicle, false)
				outputChatBox("* Freio de mão 'DESLIGADO'", source)
			else
				setElementFrozen(vehicle, true)
				outputChatBox("* Freio de mão 'LIGADO'", source)
			end
		end
	end
end)