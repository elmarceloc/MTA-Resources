local gtafont_scale = 3.5
local gtafont = dxCreateFont("OLD.ttf",9*gtafont_scale,true) 

local blackscreen = 0
local tefunaronopacity = 0

local screenW, screenH = guiGetScreenSize()


myW = 1366
myH = 768

fw = screenW/myW
fh = screenH/myH


function dxDrawBorderedText(border,bgopacity,text, left, top, right, bottom, color, scale, font, alignX, alignY, clip, wordBreak,postGUI) 
    for oX = -border, border do -- Border size
		for oY = -border, border do -- Border size
            dxDrawText(text, left + oX, top + oY, right + oX, bottom + oY, tocolor(0, 0, 0, bgopacity), scale, font, alignX, alignY, clip, wordBreak,postGUI) 
        end
    end 
    dxDrawText(text, left, top, right, bottom, color, scale, font, alignX, alignY, clip, wordBreak, postGUI) 
end 

function fadeout()
	blackscreen = blackscreen-4
	dxDrawRectangle(0,0,screenW,screenH,tocolor(0,0,0, blackscreen))
	if blackscreen < 5 then removeEventHandler("onClientRender", root, fadeout) end
end



function tefunaron()
	if blackscreen > 0 and blackscreen < 255 then
		blackscreen = blackscreen+2
	end
	if tefunaronopacity > 0 and tefunaronopacity < 250 then
		tefunaronopacity = tefunaronopacity+5
	end
    
	local wastedlen = string.len(wastedtext)
   -- dxDrawText('wastedtext',0,0, 100, 100, tocolor(255, 255, 255, tefunaronopacity), 9/gtafont_scale, 'arial', "left", "top", false, false,false,false) 

	dxDrawBorderedText(6,tefunaronopacity,wastedtext, (screenW/2-wastedlen*25), screenH/2-80, 100, 100, tocolor(255, 255, 255, tefunaronopacity), 9/gtafont_scale, gtafont, "left", "top", false, false,false,false)
	dxDrawRectangle(0,0,screenW,screenH,tocolor(0,0,0, blackscreen))

end

function wastedHandler(killer,weapon)

    if source == localPlayer then
        local finthechat = math.floor(math.random(0,3))
        if weapon == 54 then 
			wastedtext = 'Te sacaste la csm' 
		--elseif weapon == 4 then
		--	wastedtext = 'Te cogotio él ' .. getPlayerName(killer)
		elseif weapon == false then
			wastedtext = 'te autofunaste'
		else
			if finthechat then
 			  wastedtext = 'f en el chat'
			else
			  wastedtext = 'te funaron'
			end
		end

		--togglesentaodepana(false)
		blackscreen = 0


		tefunaronopacity = 1
		setTimer(function() blackscreen = 1 end ,500,1)

		addEventHandler("onClientRender", root, tefunaron)
		--setTimer(function() removeEventHandler("onClientRender", root, tefunaron) end,10000,1)

        --vehiclesound = nil
    end
end

addEventHandler('onClientPlayerWasted', root, wastedHandler)

function checkCustomSpawn()
    removeEventHandler("onClientRender", root, tefunaron)
    addEventHandler("onClientRender", root, fadeout)
end
addEventHandler("onClientPlayerSpawn", localPlayer, checkCustomSpawn)