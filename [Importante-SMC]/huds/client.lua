local screenW, screenH = guiGetScreenSize()

local centerx = screenW/2
local centery = screenH/2


node = true
index = 0

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

function count (xml, subnode) 
    while node ~= false do  
        node = xmlFindChild (xml, subnode, index) 
        index = index + 1 
    end 
    return index-2
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



---------------------------
-- Vehicle Name
---------------------------

local vehiclename = nil
local vehiclenameopacity = false
local vehicleopacity = 255



pricedown = dxCreateFont("pricedown.ttf",30) 
pricedown2 = dxCreateFont("pricedown.ttf",45) 
pricedown3 = dxCreateFont("pricedown.ttf",15) 




function onEnterVehicle(vehicle,seat)
	if source == localPlayer then
		vehicleopacity = 255
        
		local catalog = xmlLoadFile("vehicles.xml") 
		if catalog  then		 --and getElementModel(vehicle) ~= sentaodepanavehicleID
            
			local grouplenght = count(catalog, 'group')
            
			node = true
			index = 0
            
			for i= 0,grouplenght do 
                                
				local group = xmlFindChild(catalog, "group",i) 
				
                
				node = true
				index = 0
                                
				local subgroupslenght = count(group, 'group')
                
				node = true
				index = 0
                
				local vehicleslenght = count(group, 'vehicle')
                
                
				if subgroupslenght > 0 then
                    
					for j = 0,subgroupslenght do
                        
						local subgroup = xmlFindChild(group, "group",j) 
                        
						node = true
						index = 0
                        
                        
						local subgrouplenght = count(subgroup, 'vehicle')
                        
						for k = 0,subgrouplenght do
							local subvehicle = xmlFindChild(subgroup, "vehicle",k) 
                            
							local subvehicleparams = xmlNodeGetAttributes(subvehicle)
                            
							if getElementModel(vehicle) == tonumber(subvehicleparams.id) then
								vehiclename = subvehicleparams.name
                                
								setTimer(function() vehiclenameopacity = true end,2000,1)
							end
                            
						end
                        
					end
				else
					for j = 0,vehicleslenght do
						local vehicle_node = xmlFindChild(group, "vehicle",j) 
						local vehicleparams = xmlNodeGetAttributes(vehicle_node)
                        
						
						if getElementModel(vehicle) == tonumber(vehicleparams.id) then
							vehiclename = vehicleparams.name

							setTimer(function() vehiclenameopacity = true end,2000,1)
						end

					end

				end

			end
		end
	end
end

function onExitVehicle(vehicle,seat)
	if (eventName == "onClientPlayerVehicleExit" and source == localPlayer) or (eventName == "onClientElementDestroy" and getElementType(source) == "vehicle" and getPedOccupiedVehicle(localPlayer) == source) then
		vehiclename = nil
		vehiclenameopacity = false
        vehicleopacity = 0
    end
end

addEventHandler('onClientPlayerVehicleEnter', root, onEnterVehicle)
addEventHandler('onClientPlayerVehicleExit', root, onExitVehicle)


function huds()

	---------------------------
	-- Vehicle Name
	---------------------------


	if vehiclename then
		if vehiclenameopacity then
			if vehicleopacity > 0 then
				vehicleopacity = vehicleopacity -10
			end
		end
		if vehicleopacity > 0 then
			dxDrawBorderedText(5,vehicleopacity,vehiclename, 350, screenH-200, 100, 100, tocolor(255, 255, 255, vehicleopacity), 1.00, pricedown2, "left", "top", false, false,false,false)
		end
	end
	

	--------------------
	-- Wapons
	--------------------
	
	local weaponID = getPedWeapon (localPlayer) -- Get weapon ID

	--outputChatBox(weaponID)

	local weapons = getPedWeapons(localPlayer)
	table.insert(weapons, 1, 0)   
	
	local usingIndex = tablefind(weapons, weaponID)
			
	local beforeIndex = 1
	local afterIndex = 1
	
	beforeIndex = usingIndex -1
	afterIndex = usingIndex + 1
	
	if tablelength(weapons) == usingIndex then
		afterIndex = 1
	end
	
	if 1 == usingIndex then
		beforeIndex = tablelength(weapons)
	end
	
	
	if tablelength(weapons) ~= 1 then
		dxDrawImage(screenW-300,30,64,64,"weapons/".. weapons[beforeIndex] .. ".png",0.0,0.0,0.0,tocolor(255,255,255,100),false) -- Weapon icons image. Check the icons file if you want to take and replace weapon icons.
		if tablelength(weapons) ~= 2 then
			dxDrawImage(screenW-110,30,64,64,"weapons/".. weapons[afterIndex] .. ".png",0.0,0.0,0.0,tocolor(255,255,255,100),false) -- Weapon icons image. Check the icons file if you want to take and replace weapon icons.
		end
	end
	dxDrawImage(screenW-220,20,96,96,'weapons/'.. weapons[usingIndex] .. '.png',0.0,0.0,0.0,tocolor(255,255,255,255),false) -- Weapon icons image. Check the icons file if you want to take and replace weapon icons.
    
    --------------------
	-- Life bars
	--------------------
	
	local life =  getElementHealth(localPlayer)
	local oxigen =  getPedOxygenLevel(localPlayer)
	local armor = getPedArmor(localPlayer)
	local money = getPlayerMoney(localPlayer)
	
	local ly = 130
	local ay = 0
	local oy = 0
	local my = 0
	
	-- Dibujar vida
	dxDrawRectangle(screenW-275+life*2,ly-1,(100-life)*2,16+3,tocolor(0,0,0,180))
	
	if armor > 0 then
		ay = 155
		oy = 180
		my = 175
		
		dxDrawRectangle(screenW-275+armor*2,ay-1,(100-armor)*2,16+3,tocolor(0,0,0,180))
		
		dxDrawRectangle(screenW-275,ay,armor*2,16,tocolor(255,255,255,180))
		
		dxDrawLine(screenW-275-2,ay,100*2+screenW-275+2,16+ay-16,tocolor(0,0,0),3)
		dxDrawLine(screenW-275-2,ay+16,100*2+screenW-275+2,16+ay,tocolor(0,0,0),3)
		dxDrawLine(screenW-275,ay,100*2+screenW-275-100*2,32+ay-16,tocolor(0,0,0),3)
		dxDrawLine(screenW-275+100*2,ay,100*2+screenW-275,32+ay-16,tocolor(0,0,0),3)
	else
		my = 150
		oy = 155
	end
	
	if isElementInWater(localPlayer) then
		if armor > 0 then
			my = 195
		else
			my = 175
		end
		-- oxigen
		dxDrawRectangle(screenW-275+oxigen/5,oy-1,(1000-oxigen)/5,16+3,tocolor(0,0,0,180))
		
		dxDrawRectangle(screenW-275,oy,oxigen/5,16,tocolor(0,80,255,180))
		
		dxDrawLine(screenW-275-2,oy,100*2+screenW-275+2,16+oy-16,tocolor(0,0,0),3)
		dxDrawLine(screenW-275-2,oy+16,100*2+screenW-275+2,16+oy,tocolor(0,0,0),3)
		dxDrawLine(screenW-275,oy,100*2+screenW-275-100*2,32+oy-16,tocolor(0,0,0),3)
		dxDrawLine(screenW-275+100*2,oy,100*2+screenW-275,32+oy-16,tocolor(0,0,0),3)
		
	end
	-- poner palos
	if money > 1000 then
		dxDrawBorderedText(3,255,math.floor(money/1000)  ..' Lucas', screenW-250, my, 100, 100, tocolor(49, 88, 41, 255), 1.00, pricedown, "left", "top", false, false, false, false, false)
	else
		dxDrawBorderedText(3,255,money  ..' Pesos', screenW-250, my, 100, 100, tocolor(49, 88, 41, 255), 1.00, pricedown, "left", "top", false, false, false, false, false)
	end

	local lr,lb,lw = 100/3
	-- white
	if life > 100*(2/3) then
		lw = life*2-(2/3)*100*2
	end
	--blue
	if life > 100*(1/3) and life < 100*(2/3) then
		lb = life*2-(1/3)*100*2
	elseif life > 100*(1/3) then
		lb = 100/3*2
	else
		lb = 0
	end
	-- red
	if life > 0 and life < 100*(1/3) then
		lr = life*2
	elseif life > 0 then
		lr = 100/3*2
	else
		lr = 0
	end
	
	dxDrawRectangle(screenW-275+(2/3)*200,ly,lw,16,tocolor(255,0,0,180))
	dxDrawRectangle(screenW-275+(1/3)*200,ly,lb,16,tocolor(180,0,0,180))
	dxDrawRectangle(screenW-275,ly,lr,16,tocolor(105,0,0,180))

	dxDrawLine(screenW-275-2,ly,100*2+screenW-275+2,16+ly-16,tocolor(0,0,0),3)
	dxDrawLine(screenW-275-2,ly+16,100*2+screenW-275+2,16+ly,tocolor(0,0,0),3)
	dxDrawLine(screenW-275,ly,100*2+screenW-275-100*2,32+ly-16,tocolor(0,0,0),3)
	dxDrawLine(screenW-275+100*2,ly,100*2+screenW-275,32+ly-16,tocolor(0,0,0),3)
	
	--------------------
	-- Time
	--------------------

	local timehour, timeminute = getTime()
	
	dxDrawBorderedText(2,255,timehour..":"..timeminute, screenW-115, 100, 100, 100, tocolor(255, 255, 255, 255), 1.00, pricedown3, "left", "top", false, false,false,false)
	

	--------------------
	-- Ammo
	--------------------

	local ammo = tostring(getPedTotalAmmo (localPlayer))

	dxDrawBorderedText(2,255,ammo, screenW-235 -string.len(ammo)*7 , 100, 100, 100, tocolor(255, 255, 255, 255), 1.00, pricedown3, "left", "top", false, false,false,false)

end

function showhuds()
    -- coloca visible los huds customs
    addEventHandler('onClientRender',root,huds)

    -- oculta todos los huds menos el mapa
    setPlayerHudComponentVisible('vehicle_name',false)
    setPlayerHudComponentVisible('ammo',false)
    setPlayerHudComponentVisible('health',false)
    setPlayerHudComponentVisible('breath',false)
    setPlayerHudComponentVisible('armour',false)
    setPlayerHudComponentVisible('money',false)
    setPlayerHudComponentVisible('clock',false)
    setPlayerHudComponentVisible('weapon',false)
    setPlayerHudComponentVisible("radio", false) 
    
    -- pone visible el mapa
    setPlayerHudComponentVisible("radar", true ) 
      

end

addEvent('show',true)
addEventHandler('show',root,showhuds)


function hidehuds()
    removeEventHandler('onClientRender',root,huds)

    setPlayerHudComponentVisible('vehicle_name',false)
    setPlayerHudComponentVisible('ammo',false)
    setPlayerHudComponentVisible('health',false)
    setPlayerHudComponentVisible('breath',false)
    setPlayerHudComponentVisible('armour',false)
    setPlayerHudComponentVisible('money',false)
    setPlayerHudComponentVisible('clock',false)
    setPlayerHudComponentVisible('weapon',false)
    setPlayerHudComponentVisible("radio", false) 

    -- pone visible el mapa
    setPlayerHudComponentVisible("radar", false ) 


end

addEventHandler('onClientResourceStart',root, showhuds)


addEvent('onlogin',true)
addEventHandler('onlogin',root,showhuds)


addEvent('hide',true)
addEventHandler('hide',root,hidehuds)