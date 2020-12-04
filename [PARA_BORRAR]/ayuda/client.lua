local helpPanel = false
local scx,scy = guiGetScreenSize()
local px = scx/1920
local sizeX,sizeY = 1110*px,875*px
local posX,posY = scx/2-sizeX/2,scy/2-sizeY/2
local bClicked = false

local myfont = dxCreateFont("fonts/Exo2.otf",20)

local function isCursorOverRectangle(x,y,w,h)
	if isCursorShowing() then
		local mx,my = getCursorPosition()
		local cursorx,cursory = mx*scx,my*scy
		if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
			return true
		end
	end
return false
end

function drawPanel()
dxDrawRectangle(posX, posY+125*px, 1110*px, 750*px, tocolor(60, 60, 60, 150), false)
dxDrawRectangle(posX, posY+125*px, 1110*px, 63*px, tocolor(60, 60, 60, 150), false)
dxDrawImage(posX, posY, 420*px, 58*px, "img/logo.png")

dxDrawImage(posX+2*px, posY+70*px, 55*px, 45*px, "img/arrow_l.png")
if isCursorOverRectangle(posX+2*px, posY+70*px, 55*px, 45*px) then
dxDrawImage(posX+2*px, posY+70*px, 55*px, 45*px, "img/arrow_l.png")
end
dxDrawImage(posX+1053*px,posY+70*px, 55*px, 45*px, "img/arrow_r.png")
if isCursorOverRectangle(posX+1053*px,posY+70*px, 55*px, 45*px) then
dxDrawImage(posX+1053*px,posY+70*px, 55*px, 45*px, "img/arrow_r.png")
end

dxDrawImage(posX+63*px, posY+70*px, 160*px, 45*px, "img/b_obsh.png")
if isCursorOverRectangle(posX+63*px, posY+70*px, 160*px, 45*px) then
dxDrawImage(posX+63*px, posY+70*px, 160*px, 45*px, "img/b_obsh.png")
if getKeyState("mouse1") then
if bClicked == false then
addEventHandler("onClientRender",root,panel_obsh)
removeEventHandler("onClientRender",root,panel_prav)
removeEventHandler("onClientRender",root,panel_uprav)
removeEventHandler("onClientRender",root,panel_com)
removeEventHandler("onClientRender",root,panel_map)
removeEventHandler("onClientRender",root,panel_jobs)
bClicked = true
end
else
bClicked = false
end
end

dxDrawImage(posX+227*px, posY+70*px, 160*px, 45*px, "img/b_prav.png")
if isCursorOverRectangle(posX+227*px, posY+70*px, 160*px, 45*px) then
dxDrawImage(posX+227*px, posY+70*px, 160*px, 45*px, "img/b_prav.png")
if getKeyState("mouse1") then
if bClicked == false then
addEventHandler("onClientRender",root,panel_prav)
removeEventHandler("onClientRender",root,panel_obsh)
removeEventHandler("onClientRender",root,panel_uprav)
removeEventHandler("onClientRender",root,panel_com)
removeEventHandler("onClientRender",root,panel_map)
removeEventHandler("onClientRender",root,panel_jobs)
bClicked = true
end
else
bClicked = false
end
end

dxDrawImage(posX+393*px, posY+70*px, 160*px, 45*px, "img/b_uprav.png")
if isCursorOverRectangle(posX+393*px, posY+70*px, 160*px, 45*px) then
dxDrawImage(posX+393*px, posY+70*px, 160*px, 45*px, "img/b_uprav.png")
if getKeyState("mouse1") then
if bClicked == false then
addEventHandler("onClientRender",root,panel_uprav)
removeEventHandler("onClientRender",root,panel_prav)
removeEventHandler("onClientRender",root,panel_obsh)
removeEventHandler("onClientRender",root,panel_com)
removeEventHandler("onClientRender",root,panel_map)
removeEventHandler("onClientRender",root,panel_jobs)
bClicked = true
end
else
bClicked = false
end
end

dxDrawImage(posX+558*px, posY+70*px, 160*px, 45*px, "img/b_com.png")
if isCursorOverRectangle(posX+558*px, posY+70*px, 160*px, 45*px) then
dxDrawImage(posX+558*px, posY+70*px, 160*px, 45*px, "img/b_com.png")
if getKeyState("mouse1") then
if bClicked == false then
addEventHandler("onClientRender",root,panel_com)
removeEventHandler("onClientRender",root,panel_prav)
removeEventHandler("onClientRender",root,panel_uprav)
removeEventHandler("onClientRender",root,panel_obsh)
removeEventHandler("onClientRender",root,panel_map)
removeEventHandler("onClientRender",root,panel_jobs)
bClicked = true
end
else
bClicked = false
end
end

dxDrawImage(posX+723*px, posY+70*px, 160*px, 45*px, "img/b_map.png")
if isCursorOverRectangle(posX+723*px, posY+70*px, 160*px, 45*px) then
dxDrawImage(posX+723*px, posY+70*px, 160*px, 45*px, "img/b_map.png")
if getKeyState("mouse1") then
if bClicked == false then
addEventHandler("onClientRender",root,panel_map)
removeEventHandler("onClientRender",root,panel_com)
removeEventHandler("onClientRender",root,panel_prav)
removeEventHandler("onClientRender",root,panel_uprav)
removeEventHandler("onClientRender",root,panel_obsh)
removeEventHandler("onClientRender",root,panel_jobs)
bClicked = true
end
else
bClicked = false
end
end

dxDrawImage(posX+888*px, posY+70*px, 160*px, 45*px, "img/b_jobs.png")
if isCursorOverRectangle(posX+888*px, posY+70*px, 160*px, 45*px) then
dxDrawImage(posX+888*px, posY+70*px, 160*px, 45*px, "img/b_jobs.png")
if getKeyState("mouse1") then
if bClicked == false then
addEventHandler("onClientRender",root,panel_jobs)
removeEventHandler("onClientRender",root,panel_map)
removeEventHandler("onClientRender",root,panel_com)
removeEventHandler("onClientRender",root,panel_prav)
removeEventHandler("onClientRender",root,panel_uprav)
removeEventHandler("onClientRender",root,panel_obsh)
bClicked = true
end
else
bClicked = false
end
end
end

function panel_obsh()
dxDrawText ("ОБЩАЯ ИНФОРМАЦИЯ", posX+15*px, posY+142*px, 1090*px, 680*px, tocolor( 150, 150, 150, 200 ), 1, myfont)
dxDrawImage(posX+63*px, posY+70*px, 160*px, 45*px, "img/b_obsh_h.png")
dxDrawImage(posX+2*px, posY+187*px, 1090*px, 680*px, "img/general.png")
end

function panel_prav()
dxDrawText ("ПРАВИЛА", posX+15*px, posY+142*px, 1090*px, 680*px, tocolor( 150, 150, 150, 200 ), 1, myfont)
dxDrawImage(posX+227*px, posY+70*px, 160*px, 45*px, "img/b_prav_h.png")
end

function panel_uprav()
dxDrawText ("УПРАВЛЕНИЕ", posX+15*px, posY+142*px, 1090*px, 680*px, tocolor( 150, 150, 150, 200 ), 1, myfont)
dxDrawImage(posX+393*px, posY+70*px, 160*px, 45*px, "img/b_uprav_h.png")
dxDrawImage(posX+2*px, posY+187*px, 1090*px, 680*px, "img/keyboard.png")
end

function panel_com()
dxDrawText ("КОМАНДЫ", posX+15*px, posY+142*px, 1090*px, 680*px, tocolor( 150, 150, 150, 200 ), 1, myfont)
dxDrawImage(posX+558*px, posY+70*px, 160*px, 45*px, "img/b_com_h.png")
dxDrawImage(posX+2*px, posY+187*px, 1090*px, 680*px, "img/commands.png")
end

function panel_map()
dxDrawText ("ОТМЕТКИ НА КАРТЕ", posX+15*px, posY+142*px, 1090*px, 680*px, tocolor( 150, 150, 150, 200 ), 1, myfont)
dxDrawImage(posX+723*px, posY+70*px, 160*px, 45*px, "img/b_map_h.png")
dxDrawImage(posX+2*px, posY+187*px, 1090*px, 680*px, "img/blip_info.png")
end

function panel_jobs()
dxDrawText ("РАБОТЫ", posX+15*px, posY+142*px, 1090*px, 680*px, tocolor( 150, 150, 150, 200 ), 1, myfont)
dxDrawImage(posX+888*px, posY+70*px, 160*px, 45*px, "img/b_jobs_h.png")
dxDrawImage(posX+2*px, posY+187*px, 1090*px, 680*px, "img/jobs.png")
end

function openMenu()
	if helpPanel then
		removeEventHandler("onClientRender",root,drawPanel)
		removeEventHandler("onClientRender",root,panel_obsh)
		removeEventHandler("onClientRender",root,panel_prav)
		removeEventHandler("onClientRender",root,panel_uprav)
		removeEventHandler("onClientRender",root,panel_com)
		removeEventHandler("onClientRender",root,panel_map)
		removeEventHandler("onClientRender",root,panel_jobs)
		showCursor(false)
		showChat(false)
	else
		addEventHandler("onClientRender",root,drawPanel)
		showCursor(true)
		showChat(false)
	end
	helpPanel = not helpPanel
end
bindKey("F7","down",openMenu)