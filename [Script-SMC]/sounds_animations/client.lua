sounds = {}


function count (xml, subnode) 
    while node ~= false do  
        node = xmlFindChild (xml, subnode, index) 
        index = index + 1 
    end 
    return index-2
end


function tablelength(T)
	local count = 0
	for _ in ipairs(T) do count = count + 1 end
	return count
end

node = true
index = 0
		

local screenW, screenH = guiGetScreenSize()

local centerx = screenW/2
local centery = screenH/2

local images_wheel = { }

local angle = 0

local wheelW,wheelH = 512,512

local wheelcenterX , wheelcenterY = (screenW - wheelW) /2 , (screenH - wheelH) /2


local blurStrength = 8

local myScreenSource = dxCreateScreenSource(screenW, screenH)


local wheel=false


function render()
	--------------------
	-- Wheel
	--------------------

	if wheel then

		local mx, my =  getCursorPosition();
		local xr,yr = mx*screenW-centerx, -(my*screenH-centery)
		
		if mx*screenW>=centerx and my*screenH<centery then
			angle= math.atan(yr/xr) *180/math.pi
		elseif mx*screenW-centerx<0 then
			angle= math.atan(yr/xr) *180/math.pi +180
		else
			angle= math.atan(yr/xr) *180/math.pi +360
		end
				
		local images = tablelength(images_wheel[usedSkinSound])

		local selected = math.floor(images*angle/360)	

		for i,url in pairs(images_wheel[usedSkinSound]) do 
		
			local opacity = 160
			
			if selected == i-1 then
				opacity = 255
			end
						
			dxDrawImage(wheelcenterX,wheelcenterY,wheelW,wheelH,url,0,0,0,tocolor(255,255,255,opacity))
		end
		
		dxDrawCircle(wheelcenterX+wheelW/2,wheelcenterY+imageW/2,256,0,360,tocolor(0,0,0,50),tocolor(0,0,0,0),128)
		
		
		dxDrawImage(wheelcenterX,wheelcenterY,wheelW,wheelH,'wheel.png',0,0,0,tocolor(0,0,0,100))
	end

end
addEventHandler('onClientRender',getRootElement(),render)
addEventHandler("onClientPreRender", root,
function()
    if (blurShader) then
        dxUpdateScreenSource(myScreenSource)
        
        dxSetShaderValue(blurShader, "ScreenSource", myScreenSource);
        dxSetShaderValue(blurShader, "BlurStrength", blurStrength);
		dxSetShaderValue(blurShader, "UVSize", screenW, screenH);
		
        dxDrawImage(0, 0, screenW, screenH, blurShader)
    end
end)


canplay = true;


sounds_skins = xmlLoadFile("sounds.xml") 

function playerPressedKey(button, press)
	if not canplay then

		sendstopskinsound()

	end
	if(button == '1') then
		
		local skins = xmlFindChild(sounds_skins, "skins",0) 
		
		
		if (skins) then		
			
			
		local skinslenght = count(skins, 'skin')
		
		node = true
		index = 0
		
		-- por cada skin...
		for i= 0,skinslenght do 


			local skin = xmlFindChild(skins, "skin",i) 
			local skinparams =  xmlNodeGetAttributes(skin)
			
			local id = skinparams.id
			local name = skinparams.name

			local soundslenght = count(skin, 'sound')
			
			node = true
			index = 0
			
			table.insert(images_wheel,{})

			-- por cada sonido de esa skin...
			for j = 0,soundslenght do
				
				local sound = xmlFindChild(skin, "sound",j) 
				local soundparams =  xmlNodeGetAttributes(sound)
				
				local block = soundparams.block
				local anim = soundparams.anim
				local duration = soundparams.duration
				local file = soundparams.file
				
				--if getElementModel(localPlayer) == tonumber(id) and press and button == tostring(j+1) then
				--	sendskinsound(block,anim,duration,file)
				--end
				
				--wheel
				local numDiv = soundslenght+1

				table.insert(images_wheel[tablelength(images_wheel)],'imgs/'..name.. tostring(j+1) .. '.png') 
				
				if exports.freeroam_mtachile:isWindowOpenGlobal() then
					if getElementModel(localPlayer) == tonumber(id) then
						if press then
							
							usedSkinSound = i+1

							wheel=true
							showCursor(true)
							setCursorPosition(centerx, centery)
							if getVersion ().sortable < "1.3.1" then
								-- outputChatBox("Incompatible.")
								return
							else
								blurShader, blurTec = dxCreateShader("BlurShader.fx")
								
								if (not blurShader) then
									-- outputChatBox("Could not create blur shader. Please use debugscript 3.")
								else
									--outputChatBox(blurTec .. " was started.")
								end
							end
						end
						if not press then

							wheel=false
							
							if (blurShader) then
								destroyElement(blurShader)
								blurShader = nil
							end
							
							
							showCursor(false)
							
							if math.floor(numDiv*angle/360) == j then
								sendskinsound(block,anim,duration,file)
								
							end
							
						end
					end
				end
			end
		end
	elseif(button == '2') then
		--outputChatBox('2')
	end
end

end
--xmlUnloadFile(sounds_skins)    
addEventHandler("onClientKey", root, playerPressedKey)



function stop()
	removeEventHandler("onClientKey", root, playerPressedKey)
end

function resume()
	addEventHandler("onClientKey", root, playerPressedKey)
end

function sendstopskinsound()
	triggerServerEvent('stop',root,localPlayer)
end

function stopskinsound(playername)
	destroyElement(sounds[playername])
	sounds[playername] = nil
	canplay = true
end
addEvent("stopskinsound", true)
addEventHandler("stopskinsound", root, stopskinsound)


function sendskinsound(block,anim,duration,sonido)
	if canplay  then
		triggerServerEvent('sound',root,sonido,block,anim,duration,localPlayer)
	else
		--outputChatBox('Ya estas haciendo un sonido',255,0,0)
	end
end

function playskinsound(sound ,theplayer, playername)
	local x,y,z = getElementPosition(theplayer)
	sounds[playername] = playSound3D('sounds/'.. tostring(sound) ..'.ogg',x,y,z)	
	local lenght = getSoundLength(sounds[playername])*1000
	canplay = false;
	if canplay then 
		setTimer(function()
			canplay = true
		end,lenght,1)
	end
	attachElements(sounds[playername], theplayer)
end

addEvent("playskinsound", true)
addEventHandler("playskinsound", root, playskinsound, sound, theplayer)
	