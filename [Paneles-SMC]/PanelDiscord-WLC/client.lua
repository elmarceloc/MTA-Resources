local sx,sy = guiGetScreenSize() 

local color = tocolor ( 255,255,255,255)
local color2 = tocolor (255,255,255,255)
local screenW, screenH = guiGetScreenSize()

local panelShowing = false
-- Cor: 27,161,10

function mainRender()
    if (panelShowing) then
        dxDrawLine((screenW * 0.2796) - 1, (screenH * 0.4167) - 1, (screenW * 0.2796) - 1, screenH * 0.6953, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(screenW * 0.5000, (screenH * 0.4167) - 1, (screenW * 0.2796) - 1, (screenH * 0.4167) - 1, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine((screenW * 0.2796) - 1, screenH * 0.6953, screenW * 0.5000, screenH * 0.6953, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(screenW * 0.5000, screenH * 0.6953, screenW * 0.5000, (screenH * 0.4167) - 1, tocolor(0, 0, 0, 255), 1, false)
        dxDrawRectangle(screenW * 0.2796, screenH * 0.4167, screenW * 0.2204, screenH * 0.2786, tocolor(0, 0, 0, 179), false)
        dxDrawLine((screenW * 0.2870) - 1, (screenH * 0.6432) - 1, (screenW * 0.2870) - 1, screenH * 0.6875, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(screenW * 0.3785, (screenH * 0.6432) - 1, (screenW * 0.2870) - 1, (screenH * 0.6432) - 1, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine((screenW * 0.2870) - 1, screenH * 0.6875, screenW * 0.3785, screenH * 0.6875, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(screenW * 0.3785, screenH * 0.6875, screenW * 0.3785, (screenH * 0.6432) - 1, tocolor(0, 0, 0, 255), 1, false)
        if isInSlot(screenW * 0.2870, screenH * 0.6432, screenW * 0.0915, screenH * 0.0443) then
            dxDrawRectangle(screenW * 0.2870, screenH * 0.6432, screenW * 0.0915, screenH * 0.0443, tocolor(27, 161, 10, 255), false)
        else
            dxDrawRectangle(screenW * 0.2870, screenH * 0.6432, screenW * 0.0915, screenH * 0.0443, tocolor(254, 254, 254, 62), false)

        end
        if isInSlot(screenW * 0.3975, screenH * 0.6419, screenW * 0.0915, screenH * 0.0443) then
            dxDrawRectangle(screenW * 0.3975, screenH * 0.6419, screenW * 0.0915, screenH * 0.0443, tocolor(27, 161, 10, 255), false)
        else
            dxDrawRectangle(screenW * 0.3975, screenH * 0.6419, screenW * 0.0915, screenH * 0.0443, tocolor(254, 254, 254, 62), false)
        end
        dxDrawText("COPIAR", screenW * 0.2862, screenH * 0.6432, screenW * 0.3785, screenH * 0.6888, tocolor(255, 255, 255, 255), 1.40, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("CERRAR", screenW * 0.3975, screenH * 0.6419, screenW * 0.4898, screenH * 0.6875, tocolor(255, 255, 255, 255), 1.40, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawLine((screenW * 0.3975) - 1, (screenH * 0.6419) - 1, (screenW * 0.3975) - 1, screenH * 0.6862, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(screenW * 0.4890, (screenH * 0.6419) - 1, (screenW * 0.3975) - 1, (screenH * 0.6419) - 1, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine((screenW * 0.3975) - 1, screenH * 0.6862, screenW * 0.4890, screenH * 0.6862, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(screenW * 0.4890, screenH * 0.6862, screenW * 0.4890, (screenH * 0.6419) - 1, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine((screenW * 0.2921) - 1, (screenH * 0.4375) - 1, (screenW * 0.2921) - 1, screenH * 0.6133, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(screenW * 0.4817, (screenH * 0.4375) - 1, (screenW * 0.2921) - 1, (screenH * 0.4375) - 1, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine((screenW * 0.2921) - 1, screenH * 0.6133, screenW * 0.4817, screenH * 0.6133, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(screenW * 0.4817, screenH * 0.6133, screenW * 0.4817, (screenH * 0.4375) - 1, tocolor(0, 0, 0, 255), 1, false)
        dxDrawRectangle(screenW * 0.2921, screenH * 0.4375, screenW * 0.1896, screenH * 0.1758, tocolor(253, 254, 253, 62), false)
        --dxDrawText("Para Copiar Nosso Discord Basta\nClicar em \"Cópiar\"", screenW * 0.2921, screenH * 0.4661, screenW * 0.4817, screenH * 0.5313, tocolor(255, 255, 255, 255), 1.30, "default", "left", "top", false, true, false, false, false)
        dxDrawText("https://discord.gg/ZMhSH4J", screenW * 0.2928, screenH * 0.5560, screenW * 0.4780, screenH * 0.6003, tocolor(255, 255, 255, 255), 1.50, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawLine((screenW * 0.2804) - 1, (screenH * 0.3698) - 1, (screenW * 0.2804) - 1, screenH * 0.4167, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(screenW * 0.5000, (screenH * 0.3698) - 1, (screenW * 0.2804) - 1, (screenH * 0.3698) - 1, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine((screenW * 0.2804) - 1, screenH * 0.4167, screenW * 0.5000, screenH * 0.4167, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(screenW * 0.5000, screenH * 0.4167, screenW * 0.5000, (screenH * 0.3698) - 1, tocolor(0, 0, 0, 255), 1, false)
        dxDrawRectangle(screenW * 0.2804, screenH * 0.3698, screenW * 0.2196, screenH * 0.0469, tocolor(27, 161, 10, 182), false)
        dxDrawText("Discord", screenW * 0.2936, screenH * 0.3828, screenW * 0.4817, screenH * 0.4258, tocolor(255, 255, 255, 255), 1.30, "default-bold", "center", "top", false, false, false, false, false)
        dxDrawText("By FoxRed", screenW * 0.4444, screenH * 0.3906, screenW * 0.5000, screenH * 0.4167, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
		
    end
end
addEventHandler("onClientRender", root, mainRender)

function render()
panelShowing = true
showCursor(true)
end
addCommandHandler("discord",render)
        

function teszt(b,s)
    if (b == "mouse1") then
        if (s) then
            if (panelShowing) then
                if isInSlot(screenW * 0.3975, screenH * 0.6419, screenW * 0.0915, screenH * 0.0443) then
                    showCursor(false)
                    panelShowing = false
                end
                
                if isInSlot(screenW * 0.2870, screenH * 0.6432, screenW * 0.0915, screenH * 0.0443) then
                    setClipboard("https://discord.gg/ZMhSH4J")
                    outputChatBox("#FF0000[MTA-CHILE] #FFFFFFCopiado con éxito", 40,160,220,true)
                end
            end
        end
    end
end

addEventHandler("onClientKey", root, teszt)

function isInSlot(xS,yS,wS,hS)
	if(isCursorShowing()) then
		XY = {guiGetScreenSize()}
		local cursorX, cursorY = getCursorPosition()
		cursorX, cursorY = cursorX*XY[1], cursorY*XY[2]
		if (isInBox(xS,yS,wS,hS, cursorX, cursorY)) then
			return true
		else
			return false
		end
	end	
end
function isInBox(dX, dY, dSZ, dM, eX, eY)
	if(eX >= dX and eX <= dX+dSZ and eY >= dY and eY <= dY+dM) then
		return true
	else
		return false
	end
end