--// Vehicle Save&Load GUI
--// Updated 29.1.2015
--// By TexTra Y BlooD

--// Feel free to modify in any way you want
--// but please do not reupload this anywhere.
--// Thank you.

--//
--// Tables
--//

local getHandlingTable = {
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

--//
--// Create or load the XML file
--//

function ClientResourceStart()
	if source ~= getResourceRootElement() then return end 
	local xmlRootTree = xmlLoadFile("data.xml") 
	if xmlRootTree then 
		return
	else 
		xmlRootTree = xmlCreateFile("data.xml","root") 
		xmlSaveFile(xmlRootTree)
		xmlUnloadFile(xmlRootTree)
	end
end
addEventHandler("onClientResourceStart",root,ClientResourceStart)

function updateList()
	guiGridListClear(gui["gridList"])
	node = 0
	local xmlRootTree = xmlLoadFile("data.xml") 
	if xmlRootTree then
		for _,asd in ipairs(xmlNodeGetChildren(xmlRootTree)) do
			vmd = xmlFindChild(xmlRootTree, "vehicle", node)
			vmdl = xmlFindChild(vmd, "desc", 0)
			vnmnd = xmlFindChild(vmd, "name", 0)
			name = xmlNodeGetValue(vmdl)
			vehName = xmlNodeGetValue(vnmnd)
			node = node + 1
			row = guiGridListAddRow(gui["gridList"])
			guiGridListSetItemText(gui["gridList"],row,column,tostring(vehName)..": "..tostring(name),false,false)
		end
	end
	if xmlRootTree then
		xmlSaveFile(xmlRootTree)
		xmlUnloadFile(xmlRootTree)
	end
end

--//
--// The GUI
--//
gui = {}
gui._placeHolders = {}

function build_Dialog()
	local screenWidth, screenHeight = guiGetScreenSize()
	local windowWidth, windowHeight = 221, 407
	
	gui["_root"] = guiCreateWindow(screenWidth-231, screenHeight-417, windowWidth, windowHeight, "GARAGE", false)
	gui["close"] = guiCreateButton(180, 25, 30, 30, "x", false, gui["_root"])
	addEventHandler ( "onClientGUIClick", gui["close"], close )

	gui["gridList"] = guiCreateGridList ( 0.00, 0.15, 1.00, 0.647, true, gui["_root"])
	gui["editBox"] = guiCreateEdit(0.0,0.83,1.00,0.075,"",true,gui["_root"])
	guiEditSetMaxLength(gui["editBox"],16)
	column = guiGridListAddColumn(gui["gridList"],"Mis vehículos",0.85)
	guiGridListSetSortingEnabled(gui["gridList"],false)
	guiWindowSetSizable(gui["_root"], false)
	gui["saveB"] = guiCreateButton(10, 375, 61, 23, "Guardar", false, gui["_root"])
	if on_saveB_clicked then
		addEventHandler("onClientGUIClick", gui["saveB"], on_saveB_clicked, false)
	end
	gui["deleteB"] = guiCreateButton(150, 375, 61, 23, "Borrar", false, gui["_root"])
	if on_deleteB_clicked then
		addEventHandler("onClientGUIClick", gui["deleteB"], on_deleteB_clicked, false)
	end
	gui["loadB"] = guiCreateButton(80, 375, 61, 23, "Cargar", false, gui["_root"])
	if on_loadB_clicked then
		addEventHandler("onClientGUIClick", gui["loadB"], on_loadB_clicked, false)
	end
	guiSetVisible(gui["_root"],false)
	setElementData(gui["gridList"],"expanded","none")
	node = nil
	updateList()
	return gui, windowWidth, windowHeight
end
addEventHandler("onClientResourceStart",getResourceRootElement(getThisResource()),build_Dialog)

function on_saveB_clicked(button, state, absoluteX, absoluteY)
	
	if (button ~= "left") or (state ~= "up") then
		return
	end
	local xmlRootTree = xmlLoadFile("data.xml") 
	if xmlRootTree then
		local veh = getPedOccupiedVehicle(localPlayer)
		if not veh then
			outputChatBox("No se puede guardar mientras esta fuera del vehículo.",255,255,0)
			return
		end
		local dr,seat = getVehicleOccupant(veh)
		if dr == localPlayer then
			local xmlVeh = xmlCreateChild(xmlRootTree,"vehicle") 
			local xmlModel = xmlCreateChild(xmlVeh,"model") 
			local xmlName = xmlCreateChild(xmlVeh,"name") 
			local xmlDesc = xmlCreateChild(xmlVeh,"desc") 
			local xmlParts = xmlCreateChild(xmlVeh,"parts") 
			local xmlPaintJob = xmlCreateChild(xmlVeh,"paintjob") 
			local xmlColor = xmlCreateChild(xmlVeh,"color") 
			local xmlHLColor = xmlCreateChild(xmlVeh,"headlcolor") 
			local xmlHandling = xmlCreateChild(xmlVeh,"handling") 
			local name = getVehicleName(veh)
			local id = getVehicleModelFromName(name)
			local vc1r, vc1g, vc1b, vc2r, vc2g, vc2b = getVehicleColor(veh,true)
			local upgrades = getVehicleUpgrades(veh)
			local upgradeJSON = toJSON(upgrades)
			local paintjob = getVehiclePaintjob(veh)
			local headR, headG, headB = getVehicleHeadLightColor(veh)
			local colorTable = { vc1r, vc1g, vc1b, vc2r, vc2g, vc2b }
			local hColorTable = { headR, headG, headB }
			local colorJSON = toJSON(colorTable)
			local hColorJSON = toJSON(hColorTable)
			local text = guiGetText(gui["editBox"])
			local handlingTable = {}
			xmlNodeSetValue (xmlModel,tostring(id)) 
			xmlNodeSetValue (xmlParts,tostring(upgradeJSON)) 
			xmlNodeSetValue (xmlPaintJob,tostring(paintjob)) 
			xmlNodeSetValue (xmlName,tostring(name)) 
			xmlNodeSetValue (xmlColor,tostring(colorJSON)) 
			xmlNodeSetValue (xmlHLColor,tostring(hColorJSON))
			xmlNodeSetValue (xmlDesc,tostring(text)) 
			loop = 1
			for k,v in ipairs(getHandlingTable) do
				local value = getVehicleHandling(veh)[getHandlingTable[loop]]
				table.insert(handlingTable,value)
				loop = loop + 1
			end
			loop = 1
			xmlNodeSetValue (xmlHandling,toJSON(handlingTable)) 
			local row = guiGridListAddRow(gui["gridList"])
			if text == "" then
				text = "No description set"
			end
			guiGridListSetItemText(gui["gridList"],row,column,tostring(name)..": "..tostring(text),false,false)
			outputChatBox("Vehículo guardado!",0,255,0)
		else
			outputChatBox("Sólo se le permite guardarlo al conductor del vehículo.",255,255,0)
		end
	end
	if xmlRootTree then
		xmlSaveFile(xmlRootTree)
		xmlUnloadFile(xmlRootTree)
	end
end

delCount = 0

function resetCount()
	delCount = 0
end

function on_deleteB_clicked(button, state, absoluteX, absoluteY)
	if (button ~= "left") or (state ~= "up") then
		return
	end
	local xmlRootTree = xmlLoadFile("data.xml") 
	if xmlRootTree then
		local row,col = guiGridListGetSelectedItem(gui["gridList"])
		if row and col and row ~= -1 and col ~= -1 then
			if delCount == 0 then
				outputChatBox("Hacer 2 Clic Para Borrar El Auto Seleccionado.",255,255,0)
				delCount = 1
				cTimer = setTimer(resetCount,3000,1)
				return
			end
			if isTimer(cTimer) then
				local toBeDeleted = xmlFindChild(xmlRootTree, "vehicle", row)
				xmlDestroyNode(toBeDeleted)
				xmlSaveFile(xmlRootTree)
				updateList()
				outputChatBox("Vehiculo Borrado!",0,255,0)
				delCount = 0
			end
		else
			outputChatBox("Ningún Vehiculo Seleccionado.",255,255,0)
		end
	end
	if xmlRootTree then
		xmlSaveFile(xmlRootTree)
		xmlUnloadFile(xmlRootTree)
	end
end

function on_loadB_clicked(button, state, absoluteX, absoluteY)
	if (button ~= "left") or (state ~= "up") then
		return
	end
	local xmlRootTree = xmlLoadFile("data.xml") 
	if xmlRootTree then
		local row,col = guiGridListGetSelectedItem(gui["gridList"])
		if row and col and row ~= -1 and col ~= -1 then
			local vmd = xmlFindChild(xmlRootTree, "vehicle", row)
			local vmdl = xmlFindChild(vmd, "model", 0)
			local vnmnd = xmlFindChild(vmd, "name", 0)
			local vupgrds = xmlFindChild(vmd, "parts", 0)
			local vpj = xmlFindChild(vmd, "paintjob", 0)
			local vclr = xmlFindChild(vmd, "color", 0)
			local vhclr = xmlFindChild(vmd, "headlcolor", 0)
			local vhand = xmlFindChild(vmd, "handling", 0)
			local upgrades = xmlNodeGetValue (vupgrds)
			local paintjob = xmlNodeGetValue (vpj)
			local colors = xmlNodeGetValue (vclr)
			local hlcolors = xmlNodeGetValue (vhclr)
			local handling = xmlNodeGetValue (vhand)
			local saver = xmlFindChild(vmd, "saver", 0)
			local rz = getPedRotation(getLocalPlayer())
			local model = xmlNodeGetValue (vmdl)
			local x,y,z = getElementPosition(getLocalPlayer())
			local rx,ry,rz = getElementRotation(getLocalPlayer())
			if model == "nil" then 
				return
			else
				triggerServerEvent("createVehicleFromGUI",localPlayer,model,upgrades,paintjob,colors,hlcolors,handling,x,y,z,rz)
			end
		else
			outputChatBox("Ningún Vehiculo Seleccionado.",255,255,0)
		end
	end
	if xmlRootTree then
		xmlSaveFile(xmlRootTree)
		xmlUnloadFile(xmlRootTree)
	end
end

function close ()
	guiSetVisible(gui["_root"],false)
	showCursor(false)

end

function wasted()
    close()
end
addEventHandler('onClientPlayerWasted',root,wasted)

function showGui()
    
	if not guiGetVisible(gui["_root"]) then
	    if getElementDimension(localPlayer) ~= 0 then return end    
	    
		guiSetVisible(gui["_root"],true)
		showCursor(true)
	else
		guiSetVisible(gui["_root"],false)
		showCursor(false)
	end
end
bindKey("F1","down",showGui)