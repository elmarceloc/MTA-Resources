
--[[
-- mapea las teclas de acuerdo a la tabla de arriba
addEventHandler("onClientKey",root,function(btn,pr)
	if keys[btn] and not pr then		
		if not isChatBoxInputActive() then
			-- con esto pones un emoji
			triggerServerEvent("emojiSystem:sendEmojiToServer",localPlayer,keys[btn]) 
		end
	end
end)
]]--
emojis = {}
timers = {}


sound = {}


addEvent("emojiSystem:sendEmojiToClient",true)
addEventHandler("emojiSystem:sendEmojiToClient",root,function(filePath,source)
	emojis[source] = {filePath,getTickCount(),source}
	if timers[source] and isTimer(timers[source]) then killTimer(timers[source]) end
	timers[source] = setTimer(function(pl)
		emojis[pl] = nil
		timers[pl] = nil
	end,7000,1,source)
end)

local sw,sh = guiGetScreenSize()
addEventHandler("onClientRender",root,function()
	local now = getTickCount()
	for pl,t in pairs(emojis) do
		if t[3] and isElement(t[3]) then
			local x,y,z = getElementPosition(t[3]) -- pocicion del jugador
			local x2,y2,z2 = getElementPosition(getCamera()) -- pocicion del camara
			local distance = getDistanceBetweenPoints3D(x,y,z,x2,y2,z2) -- distancia entre el jugador y la camara

			distanceSize = distance/0.6

			if distance < 70 then -- si esta a menos de 70 m , se ve la wea

				-- muestra el emoji apuntando a la camara

				local sx,sy = getScreenFromWorldPosition(x,y,z+0.95,0.06)
				if sx and sy then
					local size = interpolateBetween(0,0,0,sw/2,0,0,(now-t[2])/250,"Linear")
					if (now - t[2]) >= 6500 then
						size = interpolateBetween(sw/2,0,0,0,0,0,(now-t[2]-6500)/500,"Linear")
					end
					dxDrawImage(sx -size/distanceSize/2,sy-size/distanceSize-20,size/distanceSize,size/distanceSize,t[1],math.sin(now/400)*20)
				end
			end
		end
	end
end)


function playanimation(thePlayer,group,anim,duration)
    setPedAnimation(thePlayer, group, anim, duration, true, false, true, false)
end
addEvent('playanimation',true)
addEventHandler("playanimation",root,playanimation)


function stop_sound_client(player)
	local player_name = getPlayerName(player)
    destroyElement(sound[player_name])
	sound[player_name] = nil
end
addEvent("emojiSystem:stop_sound", true)
addEventHandler("emojiSystem:stop_sound", root, stop_sound_client)
--addEventHandler('onClientWasted', root, stop_sound_client)


addEvent("emojiSystem:playsound",true)
addEventHandler("emojiSystem:playsound",root,function(name,theplayer)
	local x,y,z = getElementPosition(theplayer)
	local player_name = getPlayerName(theplayer)

    sound[player_name] = playSound3D('sounds/'.. tostring(name) ..'.mp3',x,y,z,true)	
	attachElements(sound[player_name], theplayer)
	setSoundVolume(sound[player_name], 0.25)

end)



--[[
function sirala(t)
	local t1 = {}
	for a,b in pairs(t) do
		t1[#t1+1] = {a,b}
	end
	table.sort(t1,function(a,b) return a[1]<b[1] end)
	return t1
end

panel = guiCreateLabel((sw-400)/2,(sh-52)/2,400,52,"",false)
guiSetVisible(panel,false)
i = 0
for _,t in pairs(sirala(keys)) do
	guiCreateStaticImage(i*40,0,36,36,t[2],false,panel)
	local label = guiCreateLabel(i*40,36,36,16,"["..t[1].."]",false,panel)
	guiSetFont(label,"default-bold-small")
	guiLabelSetHorizontalAlign(label,"center")
	guiLabelSetVerticalAlign(label,"center")
	i = i + 1
end

addCommandHandler("emojiler",function()
	guiSetVisible(panel,true)
	setTimer(guiSetVisible,5000,1,panel,false)
end)
]]--
