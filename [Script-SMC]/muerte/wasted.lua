local screenW,screenH = guiGetScreenSize()
local resW,resH = 1366,768
local sW,sH =  (screenW/resW), (screenH/resH)

local TIME_TO_WAIT = 5000 --The milliseconds to wait before spectating the person
local WASTED = false
local killText = ""

local Fonts = 
{
	["KillTextFont"] = "font/PRICEDOWN.TTF",
}
local KillTextF = dxCreateFont(Fonts["KillTextFont"], 14)
local KillTextB = dxCreateFont(Fonts["KillTextFont"], 76)

function getKillString(player, killer, weapon, bodypart)

    if player then
        killText = "gg"
    end --if

    if killer then
        killText = getPlayerName(killer) .. " te mato"
    end 
end 

function drawKillText()

	dxDrawText(killText, 550*sW, 410*sH, 870*sW, 490*sH, tocolor(200, 200, 200, 255), 1, KillTextF, "right", "top", false, false, true, false, true)

	dxDrawText("ELIMINADO", 526*sW, 345*sH, 840*sW, 404*sH, tocolor(255, 0, 0, 255), 1, KillTextB, "center", "center", false, false, true, false, true)
end 
------------------------------
------------ OLD Film --------
------------------------------
local screenWidth, screenHeight = guiGetScreenSize()
local myScreenSource = dxCreateScreenSource(screenWidth, screenHeight)
local flickerStrength = 10

function createShader()
    oldFilmShader, oldFilmTec = dxCreateShader("shaders/old_film.fx")
end


function updateShader()
    if oldFilmShader and WASTED then
		upDateScreenSource()
        local flickering = math.random(100 - flickerStrength, 100)/100
        dxSetShaderValue(oldFilmShader, "ScreenSource", myScreenSource);
        dxSetShaderValue(oldFilmShader, "Flickering", flickering);
        dxDrawImage(0, 0, screenWidth, screenHeight, oldFilmShader)
    end
end
addEventHandler("onClientPreRender", root, updateShader)


function upDateScreenSource()
    dxUpdateScreenSource(myScreenSource)
end
------------------------------
--------------- Death --------
------------------------------
function OnWasted(killer, weapon, bodypart)
	WASTED = true
	getKillString(source, killer, weapon, bodypart)
	addEventHandler("onClientRender", getRootElement(), drawKillText)
	showChat(false)
	createShader()
	local wasted = playSound("sounds/wasted.mp3")
    setSoundVolume(wasted, 0.8)
	local imgD = guiCreateStaticImage( 0, 0, 1366*sW, 768*sH, "images/line.png", true )
	local imgV = guiCreateStaticImage( 0, 0, 1366*sW, 768*sH, "images/vignette1.dds", true )
	setTimer(function() 
			destroyElement(imgD) 
			destroyElement(imgV) 
	end, 4000, 1)
	setTimer(function()	fadeCamera(false, 3) end, 2000, 1)	
end
addEventHandler ( "onClientPlayerWasted", getLocalPlayer(), OnWasted)

function OnSpawn()
	setTimer(function() fadeCamera(true, 3)	end, 700, 1)	
	showChat(true)
	WASTED = false
	if oldFilmShader ~= nil then
	removeEventHandler("onClientRender", getRootElement(), drawKillText)
	destroyElement(oldFilmShader)
	end
end
addEventHandler ( "onClientPlayerSpawn", getLocalPlayer(), OnSpawn)
