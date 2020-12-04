		local screenW, screenH = guiGetScreenSize()
		local centerx = screenW/2
		local width = 64*6+20+50+20
		local doorsamount = 0

		--------------[[GUI]]--------------
        local gui = guiCreateWindow(centerx-width/2, 180, width, 260, 'Panel de vehículo', false)
		guiWindowSetSizable(gui, false)
		
		Boton_VehicleInfo = guiCreateStaticImage(20, 72, 64, 64, 'img/btn11.png' or '', false, gui)
		Boton_Repair = guiCreateStaticImage(20+64+10, 72, 64, 64, 'img/btn12.png' or '', false, gui)
		Boton_Flip = guiCreateStaticImage(20+64*2+20, 72, 64, 64, 'img/btn13.png' or '', false, gui)
		Boton_Nitro = guiCreateStaticImage(20+64*3+30, 72, 64, 64, 'img/btn14.png' or '', false, gui)
		Boton_Engine = guiCreateStaticImage(20+64*4+40, 72, 64, 64, 'img/btn15.png' or '', false, gui)
		Boton_Lights = guiCreateStaticImage(20+64*5+50, 72, 64, 64, 'img/btn16.png' or '', false, gui)
		
		
		Boton_Lock = guiCreateStaticImage(20, 144, 64, 64, 'img/btn17.png' or '', false, gui)
		Boton_Color = guiCreateStaticImage(20+64+10, 144, 64, 64, 'img/btn18.png' or '', false, gui)
		Boton_Skin = guiCreateStaticImage(20+64*2+20, 144, 64, 64, 'img/btn19.png' or '', false, gui)
		Boton_Doors = guiCreateStaticImage(20+64*3+30, 144, 64, 64, 'img/btn20.png' or '', false, gui)
		Boton_Suspension = guiCreateStaticImage(20+64*4+40, 144, 64, 64, 'img/btn21.png' or '', false, gui)
		Boton_Radio = guiCreateStaticImage(20+64*5+50, 144, 64, 64, 'img/btn22.png' or '', false, gui)
		--Boton_Neon = guiCreateStaticImage(20+64*5+50, 144, 64, 64, 'img/btn1.png' or '', false, gui)
		
		Boton_Close = guiCreateButton(width-101, 220, 101, 26, "Cerrar", false, gui)
		

		--------------[[GUI NITRO]]--------------
        nitro_panel = guiCreateWindow(100, 216, 262, 127, "Nitro", false)
        guiWindowSetSizable(nitro_panel, false)

        gridlist = guiCreateGridList(10, 29, 160, 86, false, nitro_panel)
        guiGridListAddColumn(gridlist, "Tipo:", 0.9)
        for i = 1, 3 do
            guiGridListAddRow(gridlist)
        end
        guiGridListSetItemText(gridlist, 0, 1, "Nitro x 2", false, false)
        guiGridListSetItemText(gridlist, 1, 1, "Nitro x 5", false, false)
        guiGridListSetItemText(gridlist, 2, 1, "Nitro x 10", false, false)
        add_nitro = guiCreateButton(180, 29, 69, 27, "Agregar", false, nitro_panel)
        guiSetProperty(add_nitro, "NormalTextColour", "FFAAAAAA")
        close_nitro = guiCreateButton(180, 66, 69, 27, "Cerrar", false, nitro_panel)
		guiSetProperty(close_nitro, "NormalTextColour", "FFAAAAAA")
		
		--------------[[GUI INFO]]--------------

        gui_info = guiCreateWindow(0, 0, 200, 116, "Información del vehículo", false)
        guiWindowSetSizable(gui_info, false)

        Label_Vehicle = guiCreateLabel(10, 29, 50, 15, "Vehículo:", false, gui_info)
        Labe_VHealth = guiCreateLabel(10, 54, 110, 15, "Vida del vehículo:", false, gui_info)
        Valor_Vehicle = guiCreateLabel(70, 29, 129, 15, "none", false, gui_info)
		Valor_VehicleH = guiCreateLabel(120, 54, 89, 15, "none", false, gui_info)
		
		Close_Info = guiCreateButton(64, 79, 69, 23, "Cerrar", false, gui_info)

		--------------[[GUI Doors]]--------------
		
		gui_doors = guiCreateWindow(0, 0, 220, 160, "Puertas", false)
		
		guiWindowSetSizable(gui_doors, false)
	
		fleft_Button = guiCreateButton(125, 29, 69, 23, "Abrir", false, gui_doors)
		fleft_Vehicle = guiCreateLabel(10, 29, 110, 15, "Delantera izquierda:", false, gui_doors)

		fright_Button = guiCreateButton(125, 54, 69, 23, "Abrir", false, gui_doors)
		fright_Vehicle = guiCreateLabel(10, 54, 110, 15, "Delantera derecha:", false, gui_doors)

		rleft_Button = guiCreateButton(125, 79, 69, 23, "Abrir", false, gui_doors)
		rleft_Vehicle = guiCreateLabel(10, 79, 110, 15, "Trasera izquierda:", false, gui_doors)

		rright_Button = guiCreateButton(125, 104, 69, 23, "Abrir", false, gui_doors)
		rright_Vehicle = guiCreateLabel(10, 104, 110, 15, "Trasera derecha:", false, gui_doors)

		CloseDoorsBtn = guiCreateButton(10, 130, 69, 23, "Cerrar", false, gui_doors)

		--------------[[GUI Suspencion]]--------------

		gui_suspension = guiCreateWindow(0,0, 220, 120, "Suspension", false)

		upsuspencion = guiCreateButton(26, 29, 160, 30, "Aumentar suspension", false, gui_suspension)
		downsuspencion = guiCreateButton(26, 70, 160, 30, "Disminuir suspension", false, gui_suspension)

		CloseSuspensionBtn = guiCreateButton(10, 130, 69, 23, "Cerrar", false, gui_suspension)


		--------------[[GUI's settings]]--------------
		guiSetVisible(gui, false)
		guiSetVisible(nitro_panel, false)
		guiSetVisible(gui_info, false)
		guiSetVisible(gui_doors, false)
		guiSetVisible(gui_suspension, false)

		guiSetVisible(fleft_Button, false)
		guiSetVisible(fright_Button, false)
		guiSetVisible(rleft_Button, false)
		guiSetVisible(rright_Button, false)

		
		guiSetVisible(fleft_Vehicle, false)
		guiSetVisible(fright_Vehicle, false)
		guiSetVisible(rleft_Vehicle, false)
		guiSetVisible(rright_Vehicle, false)
		----------------------------------------------
		
local function drawLife()

--	if not isElement(getPedOccupiedVehicle(getLocalPlayer())) then return end


	local gx,gy = guiGetPosition(gui,false)

	guiSetPosition(gui_doors,gx,gy+280,false)
	guiSetPosition(gui_suspension,gx+240,gy+280,false)
	guiSetPosition(gui_info,gx-220,gy,false)
	guiSetPosition(nitro_panel,gx-280,gy+130,false)


	if guiGetVisible(gui) then
		x,y = guiGetPosition(gui,false)
		dxDrawRectangle(x+20-3,y-50-3,441,36,tocolor(0,0,0,255))
		dxDrawRectangle(x+20,y-50,math.floor(getElementHealth(getPedOccupiedVehicle(getLocalPlayer())))/2.3,30,tocolor(120,0,0))
		dxDrawBorderedText(1,255,'Salud del vehículo', x+20+130, y-50, 100, 100, tocolor(255, 255, 255, 255), 1.00, pricedown3, "left", "top", false, false, false, false, false)
	end
end

addEventHandler('onClientRender',getRootElement(),drawLife)

function openVehiclePanel()
	local theVehicle = getPedOccupiedVehicle (getLocalPlayer())
	if theVehicle and getVehicleController ( theVehicle ) == getLocalPlayer() then
		if (guiGetVisible(gui)) then
			guiSetVisible(gui, false)
			guiSetVisible(nitro_panel, false)
			guiSetVisible(gui_info, false)
			guiSetVisible(gui_doors, false)
			guiSetVisible(gui_suspension, false)
			colorPicker.closeSelect()
			exports["WLC-Radio"]:hide()


			if not isWindowOpen(wndMain) and not isWindowOpen(wndLoc) then 
				showCursor(false)
			end
		else
			guiSetVisible(gui, true)
			showCursor(true)
		end
	end
end
bindKey("F3", "down", openVehiclePanel)

function isVehiclePanelOpen()
	return guiGetVisible(gui)
end

function closeVehiclePanel()
	if (guiGetVisible(gui)) then
		guiSetVisible(gui, false)
		guiSetVisible(nitro_panel, false)
		guiSetVisible(gui_info, false)
		guiSetVisible(gui_doors, false)
		guiSetVisible(gui_suspension, false)
		removeEventHandler('onClientRender', getRootElement(),drawLife)
		colorPicker.closeSelect()
		exports["WLC-Radio"]:hide()

		if not isWindowOpen(wndMain) and not isWindowOpen(wndLoc) then
			showCursor(false)
		end
	else
		if not isWindowOpen(wndMain) then
			guiSetVisible(gui, true)
			showCursor(true)
		end
	end
end

addEventHandler("onClientGUIClick", Boton_Close, closeVehiclePanel, false)

function ShowVehicleInfo()
	if (guiGetVisible(gui) == true) then
		if (guiGetVisible(gui_info) == false) then
			vehiclo = getVehicleName(getPedOccupiedVehicle(getLocalPlayer()))
			vida_vehiculo = math.floor(getElementHealth(getPedOccupiedVehicle(getLocalPlayer())))
			guiSetText(Valor_Vehicle, vehiclo)
			guiSetText(Valor_VehicleH, vida_vehiculo)
			guiSetVisible(gui_info, true)
		else
			guiSetVisible(gui_info, false)
		end
	end
 end
addEventHandler("onClientGUIClick", Boton_VehicleInfo, ShowVehicleInfo, false)
 
function CloseVehicleInfo()
	guiSetVisible(gui_info, false)
end
addEventHandler("onClientGUIClick", Close_Info, CloseVehicleInfo, false)

function CloseDoors()
	guiSetVisible(gui_doors, false)
end
addEventHandler("onClientGUIClick", CloseDoorsBtn, CloseDoors, false)
 

function CloseSuspension()
	guiSetVisible(gui_doors, false)
end
addEventHandler("onClientGUIClick", CloseSuspensionBtn, CloseSuspension, false)

function BotonReparar()
	local theVehicle = getPedOccupiedVehicle (getLocalPlayer())
	local id = getElementModel(theVehicle)	
	if theVehicle and getVehicleController ( theVehicle ) == getLocalPlayer() then

		if id == 520 or id == 432 then
			outputChatBox('Este vehículo no puede ser reparado, estaría muy brigido',255,0,0)
			return
		end

		fixVehicle(theVehicle)
		triggerServerEvent("Reparado", getLocalPlayer())
	end
end
addEventHandler("onClientGUIClick", Boton_Repair, BotonReparar, false)

function BotonFlip()
	local theVehicle = getPedOccupiedVehicle (getLocalPlayer())
	if theVehicle and getVehicleController ( theVehicle ) == getLocalPlayer() then
		setElementRotation(theVehicle, 0, 0, 0)
		triggerServerEvent("Flip", getLocalPlayer())
	end
end
addEventHandler("onClientGUIClick", Boton_Flip, BotonFlip, false)

function ShowPanelNitro()
	local theVehicle = getPedOccupiedVehicle (getLocalPlayer())
	if theVehicle and getVehicleController ( theVehicle ) == getLocalPlayer() then
		if (guiGetVisible(gui) == true) then
			if (guiGetVisible(nitro_panel) == false) then
				guiSetVisible(nitro_panel, true)
				else
				guiSetVisible(nitro_panel, false)
			end
		end
	end
end
addEventHandler("onClientGUIClick", Boton_Nitro, ShowPanelNitro, false)

function hidePanelNitro()
	guiSetVisible(nitro_panel, false)
end
addEventHandler("onClientGUIClick", close_nitro, hidePanelNitro, false)

function addNitrogeno()
	local theVehicle = getPedOccupiedVehicle (getLocalPlayer())
	local row, col = guiGridListGetSelectedItem(gridlist)
	if ( row == 0 ) and ( col == 1) then --x 2
		addVehicleUpgrade(theVehicle, 1009)
		triggerServerEvent("nitro2", getLocalPlayer())
	elseif ( row == 1 ) and ( col == 1) then --x 5
		addVehicleUpgrade(theVehicle, 1008)
		triggerServerEvent("nitro5", getLocalPlayer())
	elseif ( row == 2 ) and ( col == 1) then --x 10
		addVehicleUpgrade(theVehicle, 1010)
		triggerServerEvent("nitro10", getLocalPlayer())
	end
end
addEventHandler("onClientGUIClick", add_nitro, addNitrogeno, false)

function OnEnterVehicle()
	local theVehicle = getPedOccupiedVehicle (getLocalPlayer())
		guiSetProperty(Boton_Engine, "NormalTextColour", "FFFC0000")
		--guiSetText(Boton_Engine,"Stop engine")
		setVehicleOverrideLights ( theVehicle, 2 )
		guiSetProperty(Boton_Lights, "NormalTextColour", "FFFC0000")
		--guiSetText(Boton_Lights,"Stop lights")
end
addEventHandler("onClientVehicleEnter", getRootElement(), OnEnterVehicle)

function Motor()
	local theVehicle = getPedOccupiedVehicle (getLocalPlayer())
	if ( getVehicleEngineState ( theVehicle ) == true ) then
		setVehicleEngineState ( theVehicle, false )
		guiSetProperty(Boton_Engine, "NormalTextColour", "FF0BFD00")
		--guiSetText(Boton_Engine,"Start engine")
		triggerServerEvent("motorOff", getLocalPlayer())
	else
		setVehicleEngineState ( theVehicle, true )
		guiSetProperty(Boton_Engine, "NormalTextColour", "FFFC0000")
		--guiSetText(Boton_Engine,"Stop engine")
		triggerServerEvent("motorOn", getLocalPlayer())
	end
end
addEventHandler("onClientGUIClick", Boton_Engine, Motor, false)

function Luces()
	local theVehicle = getPedOccupiedVehicle (getLocalPlayer())
	if ( getVehicleOverrideLights ( theVehicle ) == 1 ) then  
		setVehicleOverrideLights ( theVehicle, 2 )
		guiSetProperty(Boton_Lights, "NormalTextColour", "FFFC0000")
		--guiSetText(Boton_Lights,"Stop lights")
		triggerServerEvent("lucesOn", getLocalPlayer())
	else
		setVehicleOverrideLights ( theVehicle, 1 )  --off  
		guiSetProperty(Boton_Lights, "NormalTextColour", "FF0BFD00")
		--guiSetText(Boton_Lights,"Start lights")
		triggerServerEvent("lucesOff", getLocalPlayer())
    end
end
addEventHandler("onClientGUIClick", Boton_Lights, Luces, false)

function Bloqueo ()
	local theVehicle = getPedOccupiedVehicle (getLocalPlayer())
	if isVehicleLocked ( theVehicle ) then 
		setVehicleLocked ( theVehicle, false )
		--guiSetProperty(Boton_Lock, "NormalTextColour", "FF0BFD00")
		--guiSetText(Boton_Lock, "Lock")
		triggerServerEvent("unLock", getLocalPlayer())
	else
		setVehicleLocked ( theVehicle, true )
		--guiSetProperty(Boton_Lock, "NormalTextColour", "FFFC0000")
		--guiSetText(Boton_Lock, "Unlock")
		triggerServerEvent("Lock", getLocalPlayer())
end
end
addEventHandler("onClientGUIClick", Boton_Lock, Bloqueo, false)

function Color ()
	if (guiGetVisible(gui) == true) then
		openColorPicker()
	end

end
addEventHandler("onClientGUIClick", Boton_Color, Color , false)

local function Skin ()
	if velocimeterSkin < g_settings["velocimetros"] then
		velocimeterSkin = velocimeterSkin+1
	else
		velocimeterSkin = 1
	end
	--outputChatBox(velocimeterSkin)
end
addEventHandler("onClientGUIClick", Boton_Skin, Skin , false)


local function Doors ()

	local theVehicle = getPedOccupiedVehicle (getLocalPlayer())
	local type = getVehicleType ( theVehicle )
	doorsamount = getVehicleMaxPassengers(theVehicle)+1

	if (guiGetVisible(gui) == true) then
		
		if (guiGetVisible(gui_doors) == false) then

			if(type == 'Bike' or type == 'BMX' or type == 'Boat') then
				outputChatBox("No tiene puertas po' weon",255,0,0)
				return
			end
			
			if getVehicleDoorOpenRatio ( theVehicle, 2 ) == 0 then
				guiSetText(fleft_Button, 'Abrir')
			else
				guiSetText(fleft_Button, 'Cerrar')
			end
			if getVehicleDoorOpenRatio ( theVehicle, 3 ) == 0 then
				guiSetText(fright_Button, 'Abrir')
			else
				guiSetText(fright_Button, 'Cerrar')
			end
			if getVehicleDoorOpenRatio ( theVehicle, 4 ) == 0 then
				guiSetText(rleft_Button, 'Abrir')
			else
				guiSetText(rleft_Button, 'Cerrar')
			end
			if getVehicleDoorOpenRatio ( theVehicle, 5 ) == 0 then
				guiSetText(rright_Button, 'Abrir')
			else
				guiSetText(rright_Button, 'Cerrar')
			end


			if doorsamount > 0 then
				guiSetVisible(fleft_Button, true)
				guiSetVisible(fleft_Vehicle, true)
			end
			if doorsamount > 1 then
				guiSetVisible(fright_Button, true)
				guiSetVisible(fright_Vehicle, true)
			end
			if doorsamount > 2 then
				guiSetVisible(rleft_Button, true)
				guiSetVisible(rleft_Vehicle, true)
			end
			if doorsamount > 3 then
				guiSetVisible(rright_Button, true)
				guiSetVisible(rright_Vehicle, true)
			end
			
			guiSetVisible(gui_doors, true)

		else
			guiSetVisible(gui_doors, false)
		end
	end
end
addEventHandler("onClientGUIClick", Boton_Doors, Doors , false)



local function Suspension ()
	local theVehicle = getPedOccupiedVehicle (getLocalPlayer())
	local type = getVehicleType ( theVehicle )
	local id = getElementModel(theVehicle)	

	if id == 422 then
		outputChatBox('No trates de bugiar la wea ctm XD',255,0,0)

		return
	end


	if (guiGetVisible(gui) == true) then
		if(type == 'Bike' or type == 'BMX' or type == 'Boat') then
			outputChatBox("No se puede hacer la suspension en este vehículo",255,0,0)
			return
		end

		if (guiGetVisible(gui_suspension) == false) then
			
			guiSetVisible(gui_suspension, true)

		else
			guiSetVisible(gui_suspension, false)
		end
	end
end
addEventHandler("onClientGUIClick", Boton_Suspension, Suspension , false)

local function Radio ()
	exports["WLC-Radio"]:showGUI()
end
addEventHandler("onClientGUIClick", Boton_Radio, Radio , false)

function suspencion(up)
	local theVehicle = getPedOccupiedVehicle (getLocalPlayer())
	if not theVehicle then return end
	local suspencion = (getVehicleHandling(theVehicle)['suspensionLowerLimit']) -- Get actual car handling for lower
	--setVehiclePlateText( theVehicle, "lol-94")

	if up then
		triggerServerEvent("upsuspension", localPlayer)
	else
		triggerServerEvent("downsuspension", localPlayer)
	end
end


addEventHandler("onClientGUIClick", upsuspencion, function() suspencion(true) end, false)
addEventHandler("onClientGUIClick", downsuspencion, function() suspencion(false) end, false)



function toggle_door(door)
	local theVehicle = getPedOccupiedVehicle (getLocalPlayer())
	if not theVehicle then return end


	if getVehicleDoorOpenRatio ( theVehicle, door ) == 0 then
		setVehicleDoorOpenRatio(theVehicle, door, 1, 2500)

		if door == 2 then
			guiSetText(fleft_Button, 'Cerrar')
		elseif door == 3 then
			guiSetText(fright_Button, 'Cerrar')
		elseif door == 4 then
			guiSetText(rleft_Button, 'Cerrar')
		elseif door == 5 then
			guiSetText(rright_Button, 'Cerrar')
		end

	else

		if door == 2 then
			guiSetText(fleft_Button, 'Abrir')
		elseif door == 3 then
			guiSetText(fright_Button, 'Abrir')
		elseif door == 4 then
			guiSetText(rleft_Button, 'Abrir')
		elseif door == 5 then
			guiSetText(rright_Button, 'Abrir')
		end

		setVehicleDoorOpenRatio(theVehicle, door, 0, 1500)
	end

end

addEventHandler("onClientGUIClick", fleft_Button, function() toggle_door(2) end, false)
addEventHandler("onClientGUIClick", fright_Button, function() toggle_door(3) end, false)
addEventHandler("onClientGUIClick", rright_Button, function() toggle_door(5) end, false)
addEventHandler("onClientGUIClick", rleft_Button, function() toggle_door(4) end, false)