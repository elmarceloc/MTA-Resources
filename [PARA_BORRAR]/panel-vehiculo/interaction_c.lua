sx,sy = guiGetScreenSize()

interaction={}
interaction.show=nil
interaction.keyToggle = "lshift"

interaction.menu={}
interaction.menu[1] = guiCreateLabel(603/1280*sx, 158/720*sy, 76/1280*sx, 57/720*sy, "", false)
interaction.menu[2] = guiCreateLabel(735/1280*sx, 215/720*sy, 76/1280*sx, 57/720*sy, "", false)
interaction.menu[3] = guiCreateLabel(784/1280*sx, 322/720*sy, 76/1280*sx, 57/720*sy, "", false)
interaction.menu[4] = guiCreateLabel(739/1280*sx, 429/720*sy, 76/1280*sx, 57/720*sy, "", false)

function interactionRender()
	if interaction.show == true then
		dxDrawImage(257/1280*sx, 55/720*sy, 751/1280*sx, 574/720*sy, "images/interaction.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
	end
end

function toggleInteraction(value)
	local pojazd = getPedOccupiedVehicle(localPlayer)
	if pojazd or pojazd and getVehicleController(pojazd) then
		if value == true then
			for i,v in ipairs(interaction.menu) do
				showCursor(true,false)
				interaction.show = true
				guiSetVisible(interaction.menu[i], true)
			end
			addEventHandler("onClientRender", root, interactionRender)
		elseif value == false then
			for i,v in ipairs(interaction.menu) do
				showCursor(false)
				interaction.show = false
				guiSetVisible(interaction.menu[i], false)
			end
			removeEventHandler("onClientRender", root, interactionRender)
		end
	end
end

bindKey(interaction.keyToggle, "both", function(key, state)
    if state == "down" then
        toggleInteraction(true)
    elseif state == "up" then
        toggleInteraction(false)
    end
end)

addEventHandler("onClientGUIClick", interaction.menu[1], function() triggerServerEvent("onChooseInteractionV1", localPlayer) end)
addEventHandler("onClientGUIClick", interaction.menu[2], function() triggerServerEvent("onChooseInteractionV2", localPlayer) end)
addEventHandler("onClientGUIClick", interaction.menu[3], function() triggerServerEvent("onChooseInteractionV3", localPlayer) end)
addEventHandler("onClientGUIClick", interaction.menu[4], function() triggerServerEvent("onChooseInteractionV4", localPlayer) end)