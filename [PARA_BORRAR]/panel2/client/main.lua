--[[----------------------------------------------------
-- client script main
-- @author Banex
-- @update 02/11/2017 
----------------------------------------------------]]-- 

local sx,sy = guiGetScreenSize()
x,y =  (sx/1366), (sy/768)
fx, fy = x*35, y*44

options = {
	[1] = {
		{"HUD",true},
		{"Radar",true},
		{"Chat",true},
		{"Level",true},
		{"Notifications",true},
		{"NameTags",true}
	},
	[2] = {
		{"Modo Passivo"},
		{"View Longa"},
		{"Cair da Bike",true}
	},
	[3] = {
		"Reparar",
		"Virar",
		"Pintar"
	}
}

function openColorPicker()
	vehicle = getPedOccupiedVehicle(localPlayer)
	if (vehicle) then
		colorPicker.openSelect(colors)
	end
end

function closedColorPicker()
	local vehicle = getPedOccupiedVehicle(localPlayer)
	if (vehicle and isElement(vehicle)) then
		local r1, g1, b1, r2, g2, b2, r3, g3, b3, r4, g4, b4 = getVehicleColor(vehicle, true)
		local hr, hg, hb = getVehicleHeadLightColor(vehicle)
		triggerServerEvent("vehicleSetColor", resourceRoot, {r1, g1, b1, r2, g2, b2, r3, g3, b3, r4, g4, b4, hr, hg, hb})
	end
end

function onClientResourceStart()
	font = dxCreateFont("gfx/font.ttf", 25)
	font2 = dxCreateFont("gfx/font.ttf", 12)
	font3 = dxCreateFont("gfx/font.ttf", 10)
	font4 = dxCreateFont("gfx/font.ttf", 18)
	font5 = dxCreateFont("gfx/font.ttf", 22)
	font6 = dxCreateFont("gfx/font.ttf", 14)
	
	local dashBoardSwitch = function()
		if  (tick and ((getTickCount()-(tick or 0)) < 2000)) then
			return
		end
		if isEventHandlerAdded("onClientRender", root, paint) then
			colorPicker.closeSelect()
			tick = getTickCount()
			closeDash = true
			showCursor(false)
			playSound("sfx/fechar.mp3")
			setTimer(function()
				removeEventHandler("onClientRender", root, paint)
				showChat(true)
				setPlayerHudComponentVisible("ammo",true)
				setPlayerHudComponentVisible("armour",true)
				setPlayerHudComponentVisible("breath",true)
				setPlayerHudComponentVisible("clock",true)
				setPlayerHudComponentVisible("health",true)
				setPlayerHudComponentVisible("money",true)
				setPlayerHudComponentVisible("weapon",true)
				setPlayerHudComponentVisible("wanted",true)
				setPlayerHudComponentVisible("radar",true)
				setPlayerHudComponentVisible("area_name",true)
			end,2000,1)
		else
			tick = getTickCount()
			closeDash = false
			currentTab = "index"
			addEventHandler("onClientRender", root, paint)
			showCursor(true)
			showChat(false)
			setPlayerHudComponentVisible("ammo",false)
			setPlayerHudComponentVisible("armour",false)
			setPlayerHudComponentVisible("breath",false)
			setPlayerHudComponentVisible("clock",false)
			setPlayerHudComponentVisible("health",false)
			setPlayerHudComponentVisible("money",false)
			setPlayerHudComponentVisible("weapon",false)
			setPlayerHudComponentVisible("wanted",false)
			setPlayerHudComponentVisible("radar",false)
			setPlayerHudComponentVisible("area_name",false)
			playSound("sfx/abrir.mp3")
		end
	end

	bindKey("F1", "down", dashBoardSwitch)
	
	for k, v in pairs(options) do
		for k2, v2 in pairs(v) do
			if (v2[2]) then
				setElementData(localPlayer,v2[1],true)
			end	
		end
	end
	
end
addEventHandler("onClientResourceStart",resourceRoot,onClientResourceStart)

function paint()
	if (closeDash) then
		fx = interpolateBetween(x*35, 0, 0, -x*1332, 0, 0, (getTickCount()-tick)/1800, "InQuad")
	else
		fx = interpolateBetween(-x*1332, 0, 0, x*35, 0, 0, (getTickCount()-tick)/1800, "OutQuad")
	end

	dxDrawRectangle(fx, fy, x*1297, y*681, tocolor(0, 0, 0, 150))
	dxDrawBorder(fx, fy, x*1297, y*681, tocolor(0, 0, 0, 250),1)

	if isMouseInPosition(fx, fy, x*237, y*170) then
		color = tocolor(255, 255, 255, 5)
	else
		if (currentTab ~= "skins") then
			color = tocolor(0, 0, 0, 120)
		else
			color = tocolor(255, 255, 255, 5)
		end
	end
	dxDrawRectangle(fx, fy, x*237, y*170, color)
	dxDrawBorder(fx, fy, x*237, y*170, tocolor(0, 0, 0, 50),1)
	
	if isMouseInPosition(fx, fy+y*170, x*237, y*170) then
		color = tocolor(255, 255, 255, 5)
	else
		if (currentTab ~= "vehicles") then
			color = tocolor(0, 0, 0, 80)
		else
			color = tocolor(255, 255, 255, 5)
		end
	end
	dxDrawRectangle(fx, fy+y*170, x*237, y*170, color)
	dxDrawBorder(fx, fy+y*170, x*237, y*170, tocolor(0, 0, 0, 50),1)
	
	if isMouseInPosition(fx, fy+y*340, x*237, y*170) then
		color = tocolor(255, 255, 255, 5)
	else
		if (currentTab ~= "weapons") then
			color = tocolor(0, 0, 0, 120)
		else
			color = tocolor(255, 255, 255, 5)
		end
	end
	dxDrawRectangle(fx, fy+y*340, x*237, y*170, color)
	dxDrawBorder(fx, fy+y*340, x*237, y*170, tocolor(0, 0, 0, 50),1)

	if isMouseInPosition(fx, fy+y*510, x*237, y*170) then
		color = tocolor(255, 255, 255, 5)
	else
		if (currentTab ~= "options") then
			color = tocolor(0, 0, 0, 80)
		else
			color = tocolor(255, 255, 255, 5)
		end
	end
	dxDrawRectangle(fx, fy+y*510, x*237, y*170, color)
	dxDrawBorder(fx, fy+y*510, x*237, y*170, tocolor(0, 0, 0, 50),1)

	dxDrawImage(fx+x*93, fy+y*45, x*52, y*60, "gfx/user.png")
	dxDrawText("Скины",fx, fy+y*120, fx+x*237, y*10, tocolor(255, 255, 255, 250),y*1,font4,"center")
	dxDrawImage(fx+x*80, fy+y*217, x*75, y*60, "gfx/vehicle.png")
	dxDrawText("Транспорт",fx, fy+y*290, fx+x*237, y*10, tocolor(255, 255, 255, 250),y*1,font4,"center")
	dxDrawImage(fx+x*40, fy+y*385, x*174, y*60, "gfx/weapon.png")
	dxDrawText("Оружие",fx, fy+y*460, fx+x*237, y*10, tocolor(255, 255, 255, 250),y*1,font4,"center")
	dxDrawImage(fx+x*87, fy+y*555, x*62, y*60, "gfx/conf.png")
	dxDrawText("Настройки",fx, fy+y*630, fx+x*237, y*10, tocolor(255, 255, 255, 250),y*1,font4,"center")
	dxDrawLine(fx+x*237, fy, fx+x*237, fy+y*681, tocolor(0, 0, 0, 120),1)


	-------------------------- Tabs --------------------------
	if (currentTab == "index") then

		local name = getPlayerName(localPlayer)
		while name:find("#%x%x%x%x%x%x") do
			name = name:gsub("#%x%x%x%x%x%x","")
		end
		dxDrawText("Панель игрока  "..name,fx+x*260, fy+y*17, x*100, y*50, tocolor(255, 255, 255, 250),y*1,font)
		dxDrawText("выберите нужную опцию",fx+x*262, fy+y*59, x*100, y*50, tocolor(255, 255, 255, 250),y*1,font2)
		
		dxDrawRectangle(fx+x*237, fy+y*190, x*1060, y*255, tocolor(0, 0, 0, 60))
		dxDrawBorder(fx+x*237, fy+y*190, x*1060, y*255, tocolor(0, 0, 0, 100),1)
		dxDrawImage(fx+x*530, fy+y*229, x*458, y*194, "gfx/logo.png")
		dxDrawText("Наше сообщество Вконтакте",x*100, fy+y*417, fx+x*1294, y*50, tocolor(255, 255, 255, 250),y*1,font3,"right")
		dxDrawText("vk.com/mta_top_res",x*100, fy+y*429, fx+x*1294, y*50, tocolor(255, 255, 255, 250),y*1,font3,"right")
		
		dxDrawRectangle(fx+x*237, fy+y*657, x*1060, y*24, tocolor(0, 0, 0, 60))
		dxDrawBorder(fx+x*237, fy+y*657, x*1060, y*24, tocolor(0, 0, 0, 60),1)
		dxDrawText("© МТА РЕСУРСЫ | ЛУЧШИЕ РЕСУРСЫ ",fx+x*237, fy+y*657, fx+x*237+x*1060, fy+y*657+y*24, tocolor(255, 255, 255, 240),y*1,font3,"center","center")

	elseif (currentTab == "skins") then

	
		dxDrawRectangle(fx+x*237, fy, x*1060, y*168, tocolor(0, 0, 0, 60))
		dxDrawBorder(fx+x*237, fy, x*1060, y*168, tocolor(0, 0, 0, 100),1)
		dxDrawImage(fx+x*742, fy+y*36, x*52, y*60, "gfx/user.png")
		dxDrawText("Выберите скин",fx+x*237, fy+y*106, fx+x*1297, y*10, tocolor(255, 255, 255, 250),y*1,font5,"center")
		
		dxDrawRectangle(fx+x*399, fy+y*218, x*302, y*104, tocolor(0, 191, 255, 180))
		dxDrawBorder(fx+x*399, fy+y*218, x*302, y*104, tocolor(0, 0, 0, 120),1)
		dxDrawImage(fx+x*525, fy+y*226, x*50, y*50, "gfx/male.png")
		dxDrawText("Мужской",fx+x*399, fy+y*283, fx+x*701, y*10, tocolor(255, 255, 255, 250),y*1,font5,"center")
		dxDrawRectangle(fx+x*399, fy+y*322, x*302, y*328, tocolor(0, 0, 0, 60))
		dxDrawBorder(fx+x*399, fy+y*322, x*302, y*328, tocolor(0, 0, 0, 100),1)
		
		dxDrawRectangle(fx+x*838, fy+y*218, x*302, y*104, tocolor(255, 20, 147, 180))
		dxDrawBorder(fx+x*838, fy+y*218, x*302, y*104, tocolor(0, 0, 0, 120),1)
		dxDrawImage(fx+x*973, fy+y*226, x*32, y*50, "gfx/female.png")
		dxDrawText("Женский",fx+x*838, fy+y*283, fx+x*1140, y*10, tocolor(255, 255, 255, 250),y*1,font5,"center")
		dxDrawRectangle(fx+x*838, fy+y*322, x*302, y*328, tocolor(0, 0, 0, 60))
		dxDrawBorder(fx+x*838, fy+y*322, x*302, y*328, tocolor(0, 0, 0, 100),1)
		
		iA = 60
		if isMouseInPosition(fx+x*399, fy+y*322, x*302, y*20) then
			iA = 80
		end
		dxDrawRectangle(fx+x*399, fy+y*322, x*302, y*20, tocolor(0, 0, 0, iA))
		dxDrawText("HOME",fx+x*405, fy+y*324, x*10, y*10, tocolor(255, 255, 255, 250),y*1,font3)
		for k=1, math.min(#skinsM,7) do
			if isMouseInPosition(fx+x*399, fy+y*302+(y*40*k), x*302, y*39.999) then
				dxDrawRectangle(fx+x*399, fy+y*302+(y*40*k), x*302, y*40, tocolor(255, 255, 255, 240))
				dxDrawText(skinsM[k+(skinsMListPos or 0)][1],fx+x*416, fy+y*310+(y*40*k), x*10, y*10, tocolor(0, 0, 0, 250),y*1,font6)
			else
				dxDrawText(skinsM[k+(skinsMListPos or 0)][1],fx+x*416, fy+y*310+(y*40*k), x*10, y*10, tocolor(255, 255, 255, 250),y*1,font6)
			end
		end
		dxDrawRectangle(fx+x*399, fy+y*624, x*302, y*28, tocolor(0, 0, 0, 50))
		if isMouseInPosition(fx+x*399, fy+y*625, x*302, y*12) then
			dxDrawRectangle(fx+x*399, fy+y*625, x*302, y*12, tocolor(0, 0, 0, 20))
		end
		if isMouseInPosition(fx+x*399, fy+y*639, x*302, y*12) then
			dxDrawRectangle(fx+x*399, fy+y*639, x*302, y*12, tocolor(0, 0, 0, 20))
		end
		dxDrawImage(fx+x*543, fy+y*625, x*14, y*12, "gfx/arrow.png")
		dxDrawImage(fx+x*543, fy+y*639, x*14, y*12, "gfx/arrow.png",180)


		iA = 60
		if isMouseInPosition(fx+x*838, fy+y*322, x*302, y*20) then
			iA = 80
		end
		dxDrawRectangle(fx+x*838, fy+y*322, x*302, y*20, tocolor(0, 0, 0, iA))
		dxDrawText("HOME",fx+x*844, fy+y*324, x*10, y*10, tocolor(255, 255, 255, 250),y*1,font3)
		for k=1, math.min(#skinsF,7) do
			if isMouseInPosition(fx+x*838, fy+y*302+(y*40*k), x*302, y*39.999) then
				dxDrawRectangle(fx+x*838, fy+y*302+(y*40*k), x*302, y*40, tocolor(255, 255, 255, 240))
				dxDrawText(skinsF[k+(skinsFListPos or 0)][1],fx+x*855, fy+y*310+(y*40*k), x*10, y*10, tocolor(0, 0, 0, 250),y*1,font6)
			else
				dxDrawText(skinsF[k+(skinsFListPos or 0)][1],fx+x*855, fy+y*310+(y*40*k), x*10, y*10, tocolor(255, 255, 255, 250),y*1,font6)
			end
		end
		dxDrawRectangle(fx+x*838, fy+y*624, x*302, y*28, tocolor(0, 0, 0, 50))
		if isMouseInPosition(fx+x*838, fy+y*625, x*302, y*12) then
			dxDrawRectangle(fx+x*838, fy+y*625, x*302, y*12, tocolor(0, 0, 0, 20))
		end
		if isMouseInPosition(fx+x*838, fy+y*639, x*302, y*12) then
			dxDrawRectangle(fx+x*838, fy+y*639, x*302, y*12, tocolor(0, 0, 0, 20))
		end
		dxDrawImage(fx+x*982, fy+y*625, x*14, y*12, "gfx/arrow.png")
		dxDrawImage(fx+x*982, fy+y*639, x*14, y*12, "gfx/arrow.png",180)

	elseif (currentTab == "weapons") then	
	
	
		dxDrawRectangle(fx+x*237, fy, x*1060, y*168, tocolor(0, 0, 0, 60))
		dxDrawBorder(fx+x*237, fy, x*1060, y*168, tocolor(0, 0, 0, 100),1)
		dxDrawImage(fx+x*680, fy+y*36, x*174, y*60, "gfx/weapon.png")
		dxDrawText("Выберите оружие",fx+x*237, fy+y*106, fx+x*1297, y*10, tocolor(255, 255, 255, 250),y*1,font5,"center")
		
		dxDrawRectangle(fx+x*274, fy+y*218, x*302, y*104, tocolor(0, 64, 227, 180))
		dxDrawBorder(fx+x*274, fy+y*218, x*302, y*104, tocolor(0, 0, 0, 120),1)
		dxDrawImage(fx+x*338, fy+y*226, x*174, y*50, "gfx/primary.png")
		dxDrawText("Тяжелое",fx+x*274, fy+y*283, fx+x*576, y*10, tocolor(255, 255, 255, 250),y*1,font5,"center")
		dxDrawRectangle(fx+x*274, fy+y*322, x*302, y*328, tocolor(0, 0, 0, 60))
		dxDrawBorder(fx+x*274, fy+y*322, x*302, y*328, tocolor(0, 0, 0, 100),1)
		
		dxDrawRectangle(fx+x*615, fy+y*218, x*302, y*104, tocolor(0, 255, 150, 180))
		dxDrawBorder(fx+x*615, fy+y*218, x*302, y*104, tocolor(0, 0, 0, 120),1)
		dxDrawImage(fx+x*730, fy+y*226, x*73, y*50, "gfx/secondary.png")
		dxDrawText("Легкое",fx+x*615, fy+y*283, fx+x*917, y*10, tocolor(255, 255, 255, 250),y*1,font5,"center")
		dxDrawRectangle(fx+x*615, fy+y*322, x*302, y*328, tocolor(0, 0, 0, 60))
		dxDrawBorder(fx+x*615, fy+y*322, x*302, y*328, tocolor(0, 0, 0, 100),1)
		
		dxDrawRectangle(fx+x*953, fy+y*218, x*302, y*104, tocolor(0, 255, 255, 180))
		dxDrawBorder(fx+x*953, fy+y*218, x*302, y*104, tocolor(0, 0, 0, 120),1)
		dxDrawImage(fx+x*1076, fy+y*226, x*56, y*50, "gfx/tertiary.png")
		dxDrawText("Холодное",fx+x*953, fy+y*283, fx+x*1255, y*10, tocolor(255, 255, 255, 250),y*1,font5,"center")
		dxDrawRectangle(fx+x*953, fy+y*322, x*302, y*328, tocolor(0, 0, 0, 60))
		dxDrawBorder(fx+x*953, fy+y*322, x*302, y*328, tocolor(0, 0, 0, 100),1)
		
		iA = 60
		if isMouseInPosition(fx+x*274, fy+y*322, x*302, y*20) then
			iA = 80
		end
		dxDrawRectangle(fx+x*274, fy+y*322, x*302, y*20, tocolor(0, 0, 0, iA))
		dxDrawText("HOME",fx+x*280, fy+y*324, x*10, y*10, tocolor(255, 255, 255, 250),y*1,font3)
		for k=1, math.min(#primarias,7) do
			if isMouseInPosition(fx+x*274, fy+y*302+(y*40*k), x*302, y*39.999) then
				dxDrawRectangle(fx+x*274, fy+y*302+(y*40*k), x*302, y*40, tocolor(255, 255, 255, 240))
				dxDrawText(primarias[k+(primariasListPos or 0)][1],fx+x*291, fy+y*310+(y*40*k), x*10, y*10, tocolor(0, 0, 0, 250),y*1,font6)
			else
				dxDrawText(primarias[k+(primariasListPos or 0)][1],fx+x*291, fy+y*310+(y*40*k), x*10, y*10, tocolor(255, 255, 255, 250),y*1,font6)
			end
		end
		dxDrawRectangle(fx+x*274, fy+y*624, x*302, y*28, tocolor(0, 0, 0, 50))
		if isMouseInPosition(fx+x*274, fy+y*625, x*302, y*12) then
			dxDrawRectangle(fx+x*274, fy+y*625, x*302, y*12, tocolor(0, 0, 0, 20))
		end
		if isMouseInPosition(fx+x*274, fy+y*639, x*302, y*12) then
			dxDrawRectangle(fx+x*274, fy+y*639, x*302, y*12, tocolor(0, 0, 0, 20))
		end
		dxDrawImage(fx+x*418, fy+y*625, x*14, y*12, "gfx/arrow.png")
		dxDrawImage(fx+x*418, fy+y*639, x*14, y*12, "gfx/arrow.png",180)


		iA = 60
		if isMouseInPosition(fx+x*615, fy+y*322, x*302, y*20) then
			iA = 80
		end
		dxDrawRectangle(fx+x*615, fy+y*322, x*302, y*20, tocolor(0, 0, 0, iA))
		dxDrawText("HOME",fx+x*621, fy+y*324, x*10, y*10, tocolor(255, 255, 255, 250),y*1,font3)
		for k=1, math.min(#secundarias,7) do
			if isMouseInPosition(fx+x*615, fy+y*302+(y*40*k), x*302, y*39.999) then
				dxDrawRectangle(fx+x*615, fy+y*302+(y*40*k), x*302, y*40, tocolor(255, 255, 255, 240))
				dxDrawText(secundarias[k+(secundariasListPos or 0)][1],fx+x*632, fy+y*310+(y*40*k), x*10, y*10, tocolor(0, 0, 0, 250),y*1,font6)
			else
				dxDrawText(secundarias[k+(secundariasListPos or 0)][1],fx+x*632, fy+y*310+(y*40*k), x*10, y*10, tocolor(255, 255, 255, 250),y*1,font6)
			end
		end
		dxDrawRectangle(fx+x*615, fy+y*624, x*302, y*28, tocolor(0, 0, 0, 50))
		if isMouseInPosition(fx+x*615, fy+y*625, x*302, y*12) then
			dxDrawRectangle(fx+x*615, fy+y*625, x*302, y*12, tocolor(0, 0, 0, 20))
		end
		if isMouseInPosition(fx+x*615, fy+y*639, x*302, y*12) then
			dxDrawRectangle(fx+x*615, fy+y*639, x*302, y*12, tocolor(0, 0, 0, 20))
		end
		dxDrawImage(fx+x*759, fy+y*625, x*14, y*12, "gfx/arrow.png")
		dxDrawImage(fx+x*759, fy+y*639, x*14, y*12, "gfx/arrow.png",180)


		iA = 60
		if isMouseInPosition(fx+x*953, fy+y*322, x*302, y*20) then
			iA = 80
		end
		dxDrawRectangle(fx+x*953, fy+y*322, x*302, y*20, tocolor(0, 0, 0, iA))
		dxDrawText("HOME",fx+x*959, fy+y*324, x*10, y*10, tocolor(255, 255, 255, 250),y*1,font3)
		for k=1, math.min(#brancas,7) do
			if isMouseInPosition(fx+x*953, fy+y*302+(y*40*k), x*302, y*39.999) then
				dxDrawRectangle(fx+x*953, fy+y*302+(y*40*k), x*302, y*40, tocolor(255, 255, 255, 240))
				dxDrawText(brancas[k+(brancasListPos or 0)][1],fx+x*970, fy+y*310+(y*40*k), x*10, y*10, tocolor(0, 0, 0, 250),y*1,font6)
			else
				dxDrawText(brancas[k+(brancasListPos or 0)][1],fx+x*970, fy+y*310+(y*40*k), x*10, y*10, tocolor(255, 255, 255, 250),y*1,font6)
			end
		end
		dxDrawRectangle(fx+x*953, fy+y*624, x*302, y*28, tocolor(0, 0, 0, 50))
		if isMouseInPosition(fx+x*953, fy+y*625, x*302, y*12) then
			dxDrawRectangle(fx+x*953, fy+y*625, x*302, y*12, tocolor(0, 0, 0, 20))
		end
		if isMouseInPosition(fx+x*953, fy+y*639, x*302, y*12) then
			dxDrawRectangle(fx+x*953, fy+y*639, x*302, y*12, tocolor(0, 0, 0, 20))
		end
		dxDrawImage(fx+x*1097, fy+y*625, x*14, y*12, "gfx/arrow.png")
		dxDrawImage(fx+x*1097, fy+y*639, x*14, y*12, "gfx/arrow.png",180)

	elseif (currentTab == "options") then


		dxDrawRectangle(fx+x*237, fy, x*1060, y*168, tocolor(0, 0, 0, 60))
		dxDrawBorder(fx+x*237, fy, x*1060, y*168, tocolor(0, 0, 0, 100),1)
		dxDrawImage(fx+x*736, fy+y*36, x*62, y*60, "gfx/conf.png")
		dxDrawText("Опции",fx+x*237, fy+y*106, fx+x*1297, y*10, tocolor(255, 255, 255, 250),y*1,font5,"center")
		
		dxDrawRectangle(fx+x*237, fy+y*168, x*353, y*513, tocolor(0, 0, 0, 50))
		dxDrawBorder(fx+x*237, fy+y*168, x*353, y*513, tocolor(0, 0, 0, 80),1)
		dxDrawRectangle(fx+x*590, fy+y*168, x*353, y*513, tocolor(0, 0, 0, 50))
		dxDrawBorder(fx+x*590, fy+y*168, x*353, y*513, tocolor(0, 0, 0, 80),1)
		dxDrawRectangle(fx+x*944, fy+y*168, x*353, y*513, tocolor(0, 0, 0, 50))
		dxDrawBorder(fx+x*944, fy+y*168, x*353, y*513, tocolor(0, 0, 0, 80),1)
		
		dxDrawText("Интерфейс",fx+x*237, fy+y*214, fx+x*590, y*10, tocolor(255, 255, 255, 250),y*1,font5,"center")
		dxDrawText("Игра",fx+x*590, fy+y*214, fx+x*944, y*10, tocolor(255, 255, 255, 250),y*1,font5,"center")
		dxDrawText("Автомобиль",fx+x*944, fy+y*214, fx+x*1297, y*10, tocolor(255, 255, 255, 250),y*1,font5,"center")
		
		for k=1, 9 do
			if (k%2 == 1) then
				dxDrawRectangle(fx+x*237, fy+y*241+(k*y*44), x*1060, y*44, tocolor(0, 0, 0, 60))
			else
				dxDrawRectangle(fx+x*237, fy+y*241+(k*y*44), x*1060, y*44, tocolor(0, 0, 0, 25))
			end
			if (options[1][k]) then
				dxDrawText(options[1][k][1],fx+x*247, fy+y*250+(k*y*44), fx+x*590, y*10, tocolor(255, 255, 255, 250),y*1,font6)
				if (options[1][k][2]) then 
					dxDrawImage(fx+x*541,  fy+y*250+(k*y*44), x*36, y*22, "gfx/toggle-on.png")
				else
					dxDrawImage(fx+x*541,  fy+y*250+(k*y*44), x*36, y*22, "gfx/toggle-off.png")
				end
				
			end
			if (options[2][k]) then
				dxDrawText(options[2][k][1],fx+x*600, fy+y*250+(k*y*44), fx+x*590, y*10, tocolor(255, 255, 255, 250),y*1,font6)
				if (options[2][k][2]) then 
					dxDrawImage(fx+x*895,  fy+y*250+(k*y*44), x*36, y*22, "gfx/toggle-on.png")
				else
					dxDrawImage(fx+x*895,  fy+y*250+(k*y*44), x*36, y*22, "gfx/toggle-off.png")
				end
			end
			if (options[3][k]) then
				local color = tocolor(255, 255, 255)
				if (isMouseInPosition(fx+x*944, fy+y*241+(k*y*44), x*353.333, y*44)) then
					if (not colorPicker.isSelectOpen) then
						dxDrawRectangle(fx+x*944, fy+y*241+(k*y*44), x*353.333, y*44, tocolor(255, 255, 255, 200))
						color = tocolor(0,0,0)
					end
				end
				dxDrawText(options[3][k],fx+x*944, fy+y*250+(k*y*44), fx+x*1297, fy+y*250+(k*y*44)+y*22, color, y*1,font6,"center","center")
			end
		end
	elseif (currentTab == "vehicles") then
	
	
		dxDrawRectangle(fx+x*237, fy, x*1060, y*168, tocolor(0, 0, 0, 60))
		dxDrawBorder(fx+x*237, fy, x*1060, y*168, tocolor(0, 0, 0, 100),1)
		dxDrawImage(fx+x*721, fy+y*36, x*75, y*60, "gfx/vehicle.png")
		dxDrawText("Выберите автомобиль",fx+x*237, fy+y*106, fx+x*1297, y*10, tocolor(255, 255, 255, 250),y*1,font5,"center")
		
		dxDrawRectangle(fx+x*274, fy+y*218, x*302, y*104, tocolor(0, 255, 255, 180))
		dxDrawBorder(fx+x*274, fy+y*218, x*302, y*104, tocolor(0, 0, 0, 120),1)
		dxDrawImage(fx+x*354, fy+y*226, x*149, y*50, "gfx/car.png")
		dxDrawText("Авто",fx+x*274, fy+y*283, fx+x*576, y*10, tocolor(255, 255, 255, 250),y*1,font5,"center")
		dxDrawRectangle(fx+x*274, fy+y*322, x*302, y*328, tocolor(0, 0, 0, 60))
		dxDrawBorder(fx+x*274, fy+y*322, x*302, y*328, tocolor(0, 0, 0, 100),1)
		
		dxDrawRectangle(fx+x*615, fy+y*218, x*302, y*104, tocolor(255, 0, 82, 180))
		dxDrawBorder(fx+x*615, fy+y*218, x*302, y*104, tocolor(0, 0, 0, 120),1)
		dxDrawImage(fx+x*721, fy+y*226, x*89, y*50, "gfx/motocycle.png")
		dxDrawText("Мото",fx+x*615, fy+y*283, fx+x*917, y*10, tocolor(255, 255, 255, 250),y*1,font5,"center")
		dxDrawRectangle(fx+x*615, fy+y*322, x*302, y*328, tocolor(0, 0, 0, 60))
		dxDrawBorder(fx+x*615, fy+y*322, x*302, y*328, tocolor(0, 0, 0, 100),1)
		
		dxDrawRectangle(fx+x*953, fy+y*218, x*302, y*104, tocolor(0, 48, 255, 180))
		dxDrawBorder(fx+x*953, fy+y*218, x*302, y*104, tocolor(0, 0, 0, 120),1)
		dxDrawImage(fx+x*1056, fy+y*226, x*96, y*50, "gfx/helicopter.png")
		dxDrawText("Воздушный",fx+x*953, fy+y*283, fx+x*1255, y*10, tocolor(255, 255, 255, 250),y*1,font5,"center")
		dxDrawRectangle(fx+x*953, fy+y*322, x*302, y*328, tocolor(0, 0, 0, 60))
		dxDrawBorder(fx+x*953, fy+y*322, x*302, y*328, tocolor(0, 0, 0, 100),1)
		
		iA = 60
		if isMouseInPosition(fx+x*274, fy+y*322, x*302, y*20) then
			iA = 80
		end
		dxDrawRectangle(fx+x*274, fy+y*322, x*302, y*20, tocolor(0, 0, 0, iA))
		dxDrawText("HOME",fx+x*280, fy+y*324, x*10, y*10, tocolor(255, 255, 255, 250),y*1,font3)

		for k=1, math.min(#veiculos[veiculosCurrent or "index"],7) do
			if isMouseInPosition(fx+x*274, fy+y*302+(y*40*k), x*302, y*39.999) then
				dxDrawRectangle(fx+x*274, fy+y*302+(y*40*k), x*302, y*40, tocolor(255, 255, 255, 240))
				dxDrawText(veiculos[veiculosCurrent or "index"][k+(veiculosListPos or 0)][1],fx+x*291, fy+y*310+(y*40*k), x*10, y*10, tocolor(0, 0, 0, 250),y*1,font6)
			else
				dxDrawText(veiculos[veiculosCurrent or "index"][k+(veiculosListPos or 0)][1],fx+x*291, fy+y*310+(y*40*k), x*10, y*10, tocolor(255, 255, 255, 250),y*1,font6)
			end
		end
		dxDrawRectangle(fx+x*274, fy+y*624, x*302, y*28, tocolor(0, 0, 0, 50))
		if isMouseInPosition(fx+x*274, fy+y*625, x*302, y*12) then
			dxDrawRectangle(fx+x*274, fy+y*625, x*302, y*12, tocolor(0, 0, 0, 20))
		end
		if isMouseInPosition(fx+x*274, fy+y*639, x*302, y*12) then
			dxDrawRectangle(fx+x*274, fy+y*639, x*302, y*12, tocolor(0, 0, 0, 20))
		end
		dxDrawImage(fx+x*418, fy+y*625, x*14, y*12, "gfx/arrow.png")
		dxDrawImage(fx+x*418, fy+y*639, x*14, y*12, "gfx/arrow.png",180)


		iA = 60
		if isMouseInPosition(fx+x*615, fy+y*322, x*302, y*20) then
			iA = 80
		end
		dxDrawRectangle(fx+x*615, fy+y*322, x*302, y*20, tocolor(0, 0, 0, iA))
		dxDrawText("HOME",fx+x*621, fy+y*324, x*10, y*10, tocolor(255, 255, 255, 250),y*1,font3)
		for k=1, math.min(#motocicletas,7) do
			if isMouseInPosition(fx+x*615, fy+y*302+(y*40*k), x*302, y*39.999) then
				dxDrawRectangle(fx+x*615, fy+y*302+(y*40*k), x*302, y*40, tocolor(255, 255, 255, 240))
				dxDrawText(motocicletas[k+(motocicletasListPos or 0)][1],fx+x*632, fy+y*310+(y*40*k), x*10, y*10, tocolor(0, 0, 0, 250),y*1,font6)
			else
				dxDrawText(motocicletas[k+(motocicletasListPos or 0)][1],fx+x*632, fy+y*310+(y*40*k), x*10, y*10, tocolor(255, 255, 255, 250),y*1,font6)
			end
		end
		dxDrawRectangle(fx+x*615, fy+y*624, x*302, y*28, tocolor(0, 0, 0, 50))
		if isMouseInPosition(fx+x*615, fy+y*625, x*302, y*12) then
			dxDrawRectangle(fx+x*615, fy+y*625, x*302, y*12, tocolor(0, 0, 0, 20))
		end
		if isMouseInPosition(fx+x*615, fy+y*639, x*302, y*12) then
			dxDrawRectangle(fx+x*615, fy+y*639, x*302, y*12, tocolor(0, 0, 0, 20))
		end
		dxDrawImage(fx+x*759, fy+y*625, x*14, y*12, "gfx/arrow.png")
		dxDrawImage(fx+x*759, fy+y*639, x*14, y*12, "gfx/arrow.png",180)


		iA = 60
		if isMouseInPosition(fx+x*953, fy+y*322, x*302, y*20) then
			iA = 80
		end
		dxDrawRectangle(fx+x*953, fy+y*322, x*302, y*20, tocolor(0, 0, 0, iA))
		dxDrawText("HOME",fx+x*959, fy+y*324, x*10, y*10, tocolor(255, 255, 255, 250),y*1,font3)
		for k=1, math.min(#outros,7) do
			if isMouseInPosition(fx+x*953, fy+y*302+(y*40*k), x*302, y*39.999) then
				dxDrawRectangle(fx+x*953, fy+y*302+(y*40*k), x*302, y*40, tocolor(255, 255, 255, 240))
				dxDrawText(outros[k+(outrosListPos or 0)][1],fx+x*970, fy+y*310+(y*40*k), x*10, y*10, tocolor(0, 0, 0, 250),y*1,font6)
			else
				dxDrawText(outros[k+(outrosListPos or 0)][1],fx+x*970, fy+y*310+(y*40*k), x*10, y*10, tocolor(255, 255, 255, 250),y*1,font6)
			end
		end
		dxDrawRectangle(fx+x*953, fy+y*624, x*302, y*28, tocolor(0, 0, 0, 50))
		if isMouseInPosition(fx+x*953, fy+y*625, x*302, y*12) then
			dxDrawRectangle(fx+x*953, fy+y*625, x*302, y*12, tocolor(0, 0, 0, 20))
		end
		if isMouseInPosition(fx+x*953, fy+y*639, x*302, y*12) then
			dxDrawRectangle(fx+x*953, fy+y*639, x*302, y*12, tocolor(0, 0, 0, 20))
		end
		dxDrawImage(fx+x*1097, fy+y*625, x*14, y*12, "gfx/arrow.png")
		dxDrawImage(fx+x*1097, fy+y*639, x*14, y*12, "gfx/arrow.png",180)	
	end
	if (not colorPicker.isSelectOpen) then
		return
	end
	local vehicle = getPedOccupiedVehicle(localPlayer)
	if (vehicle and isElement(vehicle)) then
		local r, g, b = colorPicker.updateTempColors()
		local r1, g1, b1, r2, g2, b2, r3, g3, b3, r4, g4, b4  = getVehicleColor(vehicle, true)
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
			setVehicleHeadLightColor(vehicle, r, g, b)
		end
		setVehicleColor(vehicle, r1, g1, b1, r2, g2, b2, r3, g3, b3, r4, g4, b4)
	end
end

function onClientClick(button,state)
	if button == "left" and state == "up" then
		if isMouseInPosition(fx, fy, x*237, y*170) then -- skins
			currentTab = "skins"
			playSound("sfx/click.mp3")
		elseif isMouseInPosition(fx, fy+y*170, x*237, y*170) then -- vehicles
			currentTab = "vehicles"
			playSound("sfx/click.mp3")
		elseif isMouseInPosition(fx, fy+y*340, x*237, y*170) then -- weapons
			currentTab = "weapons"
			playSound("sfx/click.mp3")
		elseif isMouseInPosition(fx, fy+y*510, x*237, y*170) then -- options
			currentTab = "options"
			playSound("sfx/click.mp3")
		end

		if (currentTab == "skins") then

			for k=1, 7 do
				if isMouseInPosition(fx+x*399, fy+y*302+(y*40*k), x*302, y*39.999) then
					triggerServerEvent("setSkin", resourceRoot, skinsM[k+(skinsMListPos or 0)][2])
					playSound("sfx/click.mp3")
					return
				end
			end		
			if isMouseInPosition(fx+x*399, fy+y*322, x*302, y*20) then -- down
				skinsMListPos = 0
			end
			if isMouseInPosition(fx+x*399, fy+y*625, x*302, y*12) then -- up
				skinsMListPos = math.max(0,(skinsMListPos or 0) -1)
			end
			if isMouseInPosition(fx+x*399, fy+y*639, x*302, y*12) then -- down
				skinsMListPos = math.min((skinsMListPos or 0) + 1, #skinsM-math.min(#skinsM,7))
			end
			
			for k=1, 7 do
				if isMouseInPosition(fx+x*838, fy+y*302+(y*40*k), x*302, y*39.999) then
					triggerServerEvent("setSkin", resourceRoot, skinsF[k+(skinsFListPos or 0)][2])
					playSound("sfx/click.mp3")
					return
				end
			end		
			if isMouseInPosition(fx+x*838, fy+y*322, x*302, y*20) then -- down
				skinsFListPos = 0
			end
			if isMouseInPosition(fx+x*838, fy+y*625, x*302, y*12) then -- up
				skinsFListPos = math.max(0,(skinsFListPos or 0) -1)
			end
			if isMouseInPosition(fx+x*838, fy+y*639, x*302, y*12) then -- down
				skinsFListPos = math.min((skinsFListPos or 0) + 1, #skinsF-math.min(#skinsF,7))
			end

		elseif (currentTab == "weapons") then	
		
		
		
			for k=1, 7 do
				if isMouseInPosition(fx+x*274, fy+y*302+(y*40*k), x*302, y*39.999) then
					givePlayerWeapon(primarias[k+(primariasListPos or 0)][2])
					playSound("sfx/click.mp3")
					return
				end
			end		
			if isMouseInPosition(fx+x*274, fy+y*322, x*302, y*20) then -- down
				primariasListPos = 0
			end
			if isMouseInPosition(fx+x*274, fy+y*625, x*302, y*12) then -- up
				primariasListPos = math.max(0,(primariasListPos or 0) -1)
			end
			if isMouseInPosition(fx+x*274, fy+y*639, x*302, y*12) then -- down
				primariasListPos = math.min((primariasListPos or 0) + 1, #primarias-math.min(#primarias,7))
			end
			for k=1, 7 do
				if isMouseInPosition(fx+x*615, fy+y*302+(y*40*k), x*302, y*39.999) then
					givePlayerWeapon(secundarias[k+(secundariasListPos or 0)][2])
					playSound("sfx/click.mp3")
					return
				end
			end		
			if isMouseInPosition(fx+x*615, fy+y*322, x*302, y*20) then -- down
				secundariasListPos = 0
			end
			if isMouseInPosition(fx+x*615, fy+y*625, x*302, y*12) then -- up
				secundariasListPos = math.max(0,(secundariasListPos or 0) -1)
			end
			if isMouseInPosition(fx+x*615, fy+y*639, x*302, y*12) then -- down
				secundariasListPos = math.min((secundariasListPos or 0) + 1, #secundarias-math.min(#secundarias,7))
			end
			for k=1, 7 do
				if isMouseInPosition(fx+x*953, fy+y*302+(y*40*k), x*302, y*39.999) then
					if (not colorPicker.isSelectOpen) then
						givePlayerWeapon(brancas[k+(brancasListPos or 0)][2])
						playSound("sfx/click.mp3")
					end
					return
				end
			end		
			if isMouseInPosition(fx+x*953, fy+y*322, x*302, y*20) then -- down
				brancasListPos = 0
			end
			if isMouseInPosition(fx+x*953, fy+y*625, x*302, y*12) then -- up
				brancasListPos = math.max(0,(brancasListPos or 0) -1)
			end
			if isMouseInPosition(fx+x*953, fy+y*639, x*302, y*12) then -- down
				brancasListPos = math.min((brancasListPos or 0) + 1, #brancas-math.min(#brancas,7))
			end

		elseif (currentTab == "options") then	
		
		
			for k=1, 9 do
				if (options[1][k]) then
					if isMouseInPosition(fx+x*541,  fy+y*250+(k*y*44), x*36, y*22) then
						options[1][k][2] = not options[1][k][2]
						setElementData(localPlayer,options[1][k][1],options[1][k][2])
						playSound("sfx/click.mp3")
						return
					end
				end
				if (options[2][k]) then
					if isMouseInPosition(fx+x*895,  fy+y*250+(k*y*44), x*36, y*22) then
						options[2][k][2] = not options[2][k][2]
						setElementData(localPlayer,options[2][k][1],options[2][k][2])
						playSound("sfx/click.mp3")
					end
				end
				if (options[3][k]) then
					if (isMouseInPosition(fx+x*944, fy+y*241+(k*y*44), x*353.333, y*44)) then
						if (options[3][k] == "Pintar") then
							openColorPicker()
						elseif (options[3][k] == "Reparar") then
							triggerServerEvent("vehicleFix", resourceRoot)
						elseif (options[3][k] == "Virar") then
							triggerServerEvent("vehicleFlip", resourceRoot)
						end
						playSound("sfx/click.mp3")
					end
				end
			end
		
		elseif (currentTab == "vehicles") then
		
		
			for k=1, 7 do
				if isMouseInPosition(fx+x*274, fy+y*302+(y*40*k), x*302, y*39.999) then
					if (not veiculosCurrent) or (veiculosCurrent == "index") then
						veiculosCurrent = veiculos[veiculosCurrent or "index"][k+(veiculosListPos or 0)][1]
						return
					end
					givePlayerVehicle(veiculos[veiculosCurrent or "index"][k+(veiculosListPos or 0)][2])
					playSound("sfx/click.mp3")
					return
				end
			end		
			if isMouseInPosition(fx+x*274, fy+y*322, x*302, y*20) then -- down
				veiculosCurrent = "index"
				veiculosListPos = 0
			end
			if isMouseInPosition(fx+x*274, fy+y*625, x*302, y*12) then -- up
				veiculosListPos = math.max(0,(veiculosListPos or 0) -1)
			end
			if isMouseInPosition(fx+x*274, fy+y*639, x*302, y*12) then -- down
				veiculosListPos = math.min((veiculosListPos or 0) + 1, #veiculos[veiculosCurrent or "index"]-math.min(#veiculos[veiculosCurrent or "index"],7))
			end
			for k=1, 7 do
				if isMouseInPosition(fx+x*615, fy+y*302+(y*40*k), x*302, y*39.999) then
					givePlayerVehicle(motocicletas[k+(motocicletasListPos or 0)][2])
					playSound("sfx/click.mp3")
					return
				end
			end		
			if isMouseInPosition(fx+x*615, fy+y*322, x*302, y*20) then -- down
				motocicletasListPos = 0
			end
			if isMouseInPosition(fx+x*615, fy+y*625, x*302, y*12) then -- up
				motocicletasListPos = math.max(0,(motocicletasListPos or 0) -1)
			end
			if isMouseInPosition(fx+x*615, fy+y*639, x*302, y*12) then -- down
				motocicletasListPos = math.min((motocicletasListPos or 0) + 1, #motocicletas-math.min(#motocicletas,7))
			end
			for k=1, 7 do
				if isMouseInPosition(fx+x*953, fy+y*302+(y*40*k), x*302, y*39.999) then
					givePlayerVehicle(outros[k+(outrosListPos or 0)][2])
					playSound("sfx/click.mp3")
					return
				end
			end		
			if isMouseInPosition(fx+x*953, fy+y*322, x*302, y*20) then -- down
				outrosListPos = 0
			end
			if isMouseInPosition(fx+x*953, fy+y*625, x*302, y*12) then -- up
				outrosListPos = math.max(0,(outrosListPos or 0) -1)
			end
			if isMouseInPosition(fx+x*953, fy+y*639, x*302, y*12) then -- down
				outrosListPos = math.min((outrosListPos or 0) + 1, #outros-math.min(#outros,7))
			end
		end		
	end
end
addEventHandler("onClientClick",root,onClientClick)

function onClientElementDataChange(dataName, oldValue)
	if(dataName == "Cair da Bike") then
		local enabled = getElementData(localPlayer, dataName) or false
		if enabled then
			setPedCanBeKnockedOffBike(localPlayer, true)
		else
			setPedCanBeKnockedOffBike(localPlayer, false)
		end
	end
end
addEventHandler("onClientElementDataChange", localPlayer, onClientElementDataChange)

function onClientElementDataChange(dataName, oldValue)
	if(dataName == "Visão Longa") then
		local enabled = getElementData(localPlayer, dataName) or false
		if enabled then
			setFarClipDistance(3500)
		else
			resetFarClipDistance()
		end
	end
end
addEventHandler("onClientElementDataChange", localPlayer, onClientElementDataChange)

function onClientElementDataChange(dataName, oldValue)
	if(dataName == "Modo Passivo") then
		local enabled = getElementData(localPlayer, dataName) or false
		if enabled then
			local vehicle = getPedOccupiedVehicle(localPlayer)
			if (vehicle) then
				for k,v in ipairs(getElementsByType("vehicle")) do
					setElementCollidableWith(vehicle, v, false)
				end
				if (not isVehicleDamageProof(vehicle)) then
					local seat = getPedOccupiedVehicleSeat(localPlayer)
					if (seat == 0) then
						setVehicleDamageProof(vehicle,false)
					end
				end
			end
			setPedWeaponSlot(localPlayer, 0)
			toggleControl("fire", false)
			toggleControl("aim_weapon", false)
			toggleControl("next_weapon", false)
			toggleControl("previous_weapon", false)
		else
			local vehicle = getPedOccupiedVehicle(localPlayer)
			if (vehicle) then
				for k,v in ipairs(getElementsByType("vehicle")) do
					setElementCollidableWith(vehicle, v, true)
				end
				if  (not isVehicleDamageProof(vehicle)) then
					local seat = getPedOccupiedVehicleSeat(localPlayer)
					if (seat == 0) then
						setVehicleDamageProof(vehicle,true)
					end
				end
			end
			toggleControl("fire", true)
			toggleControl("aim_weapon", true)
			toggleControl("next_weapon", true)
			toggleControl("previous_weapon", true)
		end
	end
end
addEventHandler("onClientElementDataChange", localPlayer, onClientElementDataChange)

function onClientVehicleEnter(player)
	if (player == localPlayer) then
		if getElementData(player,"Modo Passivo") then
			for k,v in ipairs(getElementsByType("vehicle")) do
				setElementCollidableWith(source, v, false)
			end
		end
	end
end
addEventHandler("onClientVehicleEnter", root, onClientVehicleEnter)

function onClientVehicleExit(player)
	if (player == localPlayer) then
		if getElementData(player,"Modo Passivo") then
			for k,v in ipairs(getElementsByType("vehicle")) do
				setElementCollidableWith(source, v, true)
			end
		end
	end
end
addEventHandler("onClientVehicleExit", root, onClientVehicleExit)

function onClientPlayerDamage()
    if getElementData(source,"Modo Passivo") then
        cancelEvent()
    end
end
addEventHandler("onClientPlayerDamage", localPlayer,onClientPlayerDamage)

function onClientPlayerDamage(targetPlayer)
    if getElementData(targetPlayer,"Modo Passivo") then
        cancelEvent()
    end
end
addEventHandler("onClientPlayerStealthKill", localPlayer,onClientPlayerDamage)

addEventHandler('onClientRender', root,
function()
    for _, player in ipairs(getElementsByType('player')) do
        if isElementOnScreen(player) and getElementData(player, "Modo Passivo") and getElementData(player, "NameTags") then
            local x, y, z = getElementPosition(player)
            local cx, cy, cz = getCameraMatrix()
            local vx, vy, vz = getPedBonePosition(player, 8)
            local dist = getDistanceBetweenPoints3D(cx, cy, cz, vx, vy, vz)
            local drawDistance = 70.0
            if (dist < drawDistance or player == target) then
                if(isLineOfSightClear(cx, cy, cz, vx, vy, vz, true, false, false)) then
                    local x, y = getScreenFromWorldPosition (vx, vy, vz + 0.6)
                    if(x and y) then
                        local px, py = getScreenFromWorldPosition (vx, vy, vz + 0.3)
                        local w = dxGetTextWidth("Modo Passivo", 1, "default-bold")
                        local h = dxGetFontHeight(1, "default-bold")
                        dxDrawText("Modo Passivo", x - 1  - w / 2,y - 16 - h - 12, w, h, tocolor(0,0,0), 1, "default-bold")
                        dxDrawText("Modo Passivo", x - 0  - w / 2,y - 15 - h - 12, w, h, tocolor(255,255,255), 1, "default-bold")
                    end
                end
            end
        end
    end
end)

function givePlayerWeapon(weapon)
	triggerServerEvent("givePlayerWeapon", resourceRoot, weapon,500)
end

function givePlayerVehicle(vehicle)
	triggerServerEvent("givePlayerVehicle", resourceRoot, vehicle)
end

function dxDrawBorder(posX, posY,posW,posH,color,scale)
	dxDrawLine(posX, posY, posX+posW, posY, color, scale,false)
	dxDrawLine(posX, posY, posX, posY+posH, color, scale,false)
	dxDrawLine(posX, posY+posH, posX+posW, posY+posH, color, scale,false)
	dxDrawLine(posX+posW, posY, posX+posW, posY+posH, color, scale,false)
end

function isEventHandlerAdded(sEventName, pElementAttachedTo, func)
	if type(sEventName) == 'string' and isElement(pElementAttachedTo) and type(func) == 'function' then
		local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo)
		if type(aAttachedFunctions) == 'table' and #aAttachedFunctions > 0 then
			for i, v in ipairs(aAttachedFunctions) do
				if v == func then
					return true
				end
			end
		end
	end 
	return false
end

function isMouseInPosition(x,y,width,height)
	if not isCursorShowing() then
		return
	end
    local cx, cy = getCursorPosition()
    local cx, cy = (cx*sx), (cy*sy)
    if (cx >= x and cx <= x + width) and (cy >= y and cy <= y + height) then
        return true
    else
        return false
    end
end