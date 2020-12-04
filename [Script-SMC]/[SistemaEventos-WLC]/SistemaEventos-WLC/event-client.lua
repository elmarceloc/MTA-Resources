addEventHandler("onClientKey", root, function(button, press)
    if getElementData(getLocalPlayer(), "events:IsPlayerInEvent") then
        if button == "F1" or button == "F2" or button == "F3" or button == "F4" or
            button == "F5" or button == "F6" or button == "F7" or button == "F9" or
            button == "F10" or button == "k" or button == "l" or button == "x" or
            button == "u" or button == "o" or button == "j" then
            cancelEvent()
        end
    end
end)

addEvent("evententro", true)
function cancelVoarCarro(thePlayer)
    setWorldSpecialPropertyEnabled("aircars", false)
    setWorldSpecialPropertyEnabled("hovercars", false)
    setWorldSpecialPropertyEnabled("extrajump", false)
    setWorldSpecialPropertyEnabled("extrabunny", false)
    setGameSpeed(1)
end
addEventHandler("evententro", getRootElement(), cancelVoarCarro)

local sx, sy = guiGetScreenSize()
local px, py = 1600, 900
local x, y = (sx / px), (sy / py)

function dxCreateStatBar(startX, startY, width, height, color, outlinesize,
                         postGUI)
    dxDrawRectangle(startX, startY, width, height, tocolor(0, 0, 0, 150),
                    postGUI)
    dxDrawLine(startX, startY, startX + width, startY, tocolor(0, 0, 0, 240),
               outlinesize, postGUI)
    dxDrawLine(startX, startY, startX, startY + height, tocolor(0, 0, 0, 200),
               outlinesize, postGUI)
    dxDrawLine(startX, startY + height, startX + width, startY + height,
               tocolor(0, 0, 0, 200), outlinesize, postGUI)
    dxDrawLine(startX + width, startY, startX + width, startY + height,
               tocolor(0, 0, 0, 200), outlinesize, postGUI)
end
--[[

	function tempo()
	for _, v in pairs(getElementsByType("player")) do
		if ( getElementData(v, "noevento") )  then
			--setPlayerWantedLevel(v, getPlayerWnantedLevel(v)-1)
					tempoev = tonumber(getElementData(localPlayer, "tempodeeventosss")) or 0
				setElementData(localPlayer, "tempodeevento", tempoev-1)
		end
	
	end
end	 

setTimer(tempo, 1000, 0)
--]]
function secondsToTimeDesc(seconds)
    if seconds then
        local results = {}
        local sec = (seconds % 60)
        local min = math.floor((seconds % 3600) / 60)
        if min > 0 then
            table.insert(results, min ..
                             (min == 1 and " #FFFFFFminuto" or " #FFFFFFminutos"))
        end
        if sec > 0 then
            table.insert(results, sec ..
                             (sec == 1 and " #FFFFFFsegundo" or
                                 " #FFFFFFsegundos"))
        end

        return string.reverse(table.concat(results, ", "):reverse():gsub(" ,",
                                                                         " 00FF00#eFFFFFF# ",
                                                                         1))
    end
    return ""
end

function secondsToTimeDescRace(seconds)
    if seconds then
        local results = {}
        local sec = (seconds % 60)
        local min = math.floor((seconds % 3600) / 60)
        if min > 0 then
            table.insert(results, min ..
                             (min == 1 and "" or ""))
        end
        if sec > 0 then
            table.insert(results, sec ..
                             (sec == 1 and " " or
                                 ""))
        end

        return string.reverse(table.concat(results, ":"):reverse():gsub(" ,",
                                                                         "",
                                                                         1))
    end
    return ""
end



function dxDrawBorderedText(border,text, left, top, right, bottom, color, scale, font, alignX, alignY, clip, wordBreak, postGUI,colorCoded) 
    for oX = -border, border do -- Border size
		for oY = -border, border do -- Border size
            dxDrawText(text, left + oX, top + oY, right + oX, bottom + oY, tocolor(0, 0, 0), scale, font, alignX, alignY, clip, wordBreak,postGUI,colorCoded) 
        end
    end 
	dxDrawText(text, left, top, right, bottom, color, scale, font, alignX, alignY, clip, wordBreak, postGUI,colorCoded) 
end


kart = dxCreateFont("assets/kart.ttf",30) 

sx,sy = guiGetScreenSize()

function dxeve()
    if getElementData(getLocalPlayer(), "events:IsPlayerInEvent") then
        evet = tonumber(getElementData(localPlayer, "tempodeevento")) or 0
        

        if huds == 'race' then
            dxDrawImage(sx-310/3-256,64,310/3,140/3,'assets/time.png')
            dxDrawBorderedText(
                5,secondsToTimeDescRace(tonumber(evet)) .. "",
                sx-310/3-128,64, x * 500, y * 500, tocolor(	247, 247, 0, 255), 1,
                kart, "left", "top", false, false, false, true)
        elseif huds == 'br' then
            dxDrawText(wood,sx-70,sy-200)

            dxDrawImage(sx-100,sy-300,35*2,35*2,'assets/wood.png')


        
        else--if huds == 'race'
            if evet <= 60 then
                dxCreateStatBar(x * 400, y * 855, x * 380, y * 30,
                                tocolor(0, 0, 0, 60), 1, false)
            else
                dxCreateStatBar(x * 400, y * 855, x * 545, y * 30,
                                tocolor(0, 0, 0, 60), 1, false)
            end
    
            dxDrawText(
                "Tempo Evento: #00FF00" .. secondsToTimeDesc(tonumber(evet)) .. "",
                x * 410, y * 860, x * 500, y * 500, tocolor(255, 255, 255, 255), 1,
                'clear', "left", "top", false, false, false, true)
        end

    end
end
addEventHandler("onClientRender", root, dxeve)


addEvent('onHunds',true)
addEventHandler('onHunds',root,function(theHuds)
    huds = theHuds
end
)

addEventHandler("onClientResourceStart",
                getResourceRootElement(getThisResource()), function()
    setTimer(function()
        if getElementData(getLocalPlayer(), "events:IsPlayerInEvent") then
            if isElementInWater(getLocalPlayer()) then
                triggerServerEvent("removeinwater", localPlayer)
            else
                veiculo = getPedOccupiedVehicle(getLocalPlayer())
                if veiculo then
                    if isElementInWater(veiculo) then
                        triggerServerEvent("removeinwater", localPlayer)
                    end
                end
            end
        end
    end, 5000, 0)
end)

addEvent('onCheckpoints',true)
addEventHandler('onCheckpoints',root,function(thePlayer,checkpoints,vehicles,eid)

--[[ 	setElementData(thePlayer, 'checkpoint',0)


	for i,checkpoint in ipairs(checkpoints) do 
	
		local marker = createMarker(checkpoint[2],checkpoint[3],checkpoint[4])
		--local blip = createBlipAttachedTo(marker)


		setElementData(marker,'id',i)
		setElementData(marker,'eid',eid)


		setElementDimension(marker,2)
		--setElementDimension(blip,2)
		


	end ]]
	

end)