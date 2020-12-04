
IMGURL = "images/lock.png"
dxText = "Vehicle Locked"

sx, sy = guiGetScreenSize()

--[[Rec1_x = 561/sx
Rec1_y = 726/sy
Rec2_x = 562/sx
Rec2_y = 727/sy
Text_x = 570/sx
Text_y = 742/sy
IMG_x = 585/sx
IMG_y = 731/sy
]]

x, y = 1366, 768

Rec1_x = 561
Rec1_y = 726
Rec2_x = 562
Rec2_y = 727
Text_x = 570
Text_y = 742
IMG_x = 585
IMG_y = 731



function Bloqueado()
	addEventHandler("onClientRender", root, gui1)
	dxText = "Vehicle Locked"
	IMGURL = "images/lock.png"
	t1 = setTimer(removeGui, 3000, 1)
	killTimer(t2)
	sonido()
end
addEvent("Blq", true)
addEventHandler("Blq", getRootElement(), Bloqueado)

function DesBloqueado()
	addEventHandler("onClientRender", root, gui1)
	dxText = "Vehicle Unlocked"
	IMGURL = "images/unlock.png"
	t2 = setTimer(removeGui, 3000, 1)
	killTimer(t1)
	sonido()
end
addEvent("unBlq", true)
addEventHandler("unBlq", getRootElement(), DesBloqueado)

function removeGui()
	removeEventHandler("onClientRender", root, gui1)
end

function sonido()
		local sound = playSound("sounds/sonido.mp3") 
		setSoundVolume(sound, 0.5)
end
addEvent("onSound", true)
addEventHandler("onSound", getLocalPlayer(), sonido)



    function gui1()
        dxDrawRectangle((Rec1_x/x)*sx, (Rec1_y/y)*sy, (234/x)*sx, (43/y)*sy, tocolor(0, 0, 0, 50), true) --561, 726, 234, 43
        dxDrawRectangle((Rec2_x/x)*sx, (Rec2_y/y)*sy, (232/x)*sx, (41/y)*sy, tocolor(0, 0, 0, 160), true) --562, 727, 232, 41
        dxDrawText(dxText, (Text_x/x)*sx, (Text_y/y)*sy, (814/x)*sx, (758/y)*sy, tocolor(255, 69, 59, 255), 1.00, "default-bold", "center", "top", false, false, true, false, false) --570, 742, 814, 758
        dxDrawImage((IMG_x/x)*sx, (IMG_y/y)*sy, (37/x)*sx, (34/y)*sy, IMGURL, 0, 0, 0, tocolor(255, 255, 255, 255), true) --585, 731, 37, 34
    end

