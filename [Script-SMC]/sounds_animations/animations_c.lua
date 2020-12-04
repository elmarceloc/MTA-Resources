local x, y = guiGetScreenSize ()
local relposx = x/2
local medX = x/2
local ancho = -3780
local sizeX = ancho/3
local mitSize = sizeX*0.5
local botX = medX-mitSize
local relposx = y/2
local medX2 = y/2
local ancho2 = -2160
local sizeX2 = ancho2/3
local mitSize2 = sizeX2*0.5
local botX2 = medX2-mitSize2

animations = {}
painel = {
	[1] = false
}

function painelanim ()
	local mx,my = getCursorPosition ()
	local fullx,fully = guiGetScreenSize()
	cursorx,cursory = mx*fullx,my*fully
		
	dxDrawImage ( botX+sizeX+550, botX2+sizeX2+290, 120, 120,"Archivos/Imagenes/mouse.png", cursorx+cursory, 0, 0, tocolor ( 255, 255, 255) )
	dxDrawImage ( botX+sizeX+550, botX2+sizeX2+80, 120, 120,"Archivos/Imagenes/fuck.png", 0, 0, 0, tocolor ( 255, 255, 255, isCursorOnElement(botX+sizeX+550, botX2+sizeX2+80, 120, 120) and 255 or 100 ))
	dxDrawImage ( botX+sizeX+440, botX2+sizeX2+140, 120, 120,"Archivos/Imagenes/chat.png", 0, 0, 0, tocolor ( 255, 255, 255, isCursorOnElement(botX+sizeX+440, botX2+sizeX2+140, 120, 120) and 255 or 100))
	dxDrawImage ( botX+sizeX+350, botX2+sizeX2+230, 120, 120,"Archivos/Imagenes/smile.png", 0, 0, 0, tocolor ( 255, 255, 255, isCursorOnElement(botX+sizeX+350, botX2+sizeX2+230, 120, 120) and 255 or 100))
	dxDrawImage ( botX+sizeX+360, botX2+sizeX2+350, 120, 120,"Archivos/Imagenes/handsup.png", 0, 0, 0, tocolor ( 255, 255, 255, isCursorOnElement(botX+sizeX+360, botX2+sizeX2+350, 120, 120) and 255 or 100))
	dxDrawImage ( botX+sizeX+440, botX2+sizeX2+450, 120, 120,"Archivos/Imagenes/sentar.png", 0, 0, 0, tocolor ( 255, 255, 255, isCursorOnElement(botX+sizeX+440, botX2+sizeX2+450, 120, 120) and 255 or 100))
	dxDrawImage ( botX+sizeX+550, botX2+sizeX2+490, 120, 120,"Archivos/Imagenes/cancel.png", 0, 0, 0, tocolor ( 255, 255, 255, isCursorOnElement(botX+sizeX+550, botX2+sizeX2+490, 120, 120) and 255 or 100))
	dxDrawImage ( botX+sizeX+665, botX2+sizeX2+150, 120, 120,"Archivos/Imagenes/smoke.png", 0, 0, 0, tocolor ( 255, 255, 255, isCursorOnElement(botX+sizeX+665, botX2+sizeX2+150, 120, 120) and 255 or 100))
	dxDrawImage ( botX+sizeX+760, botX2+sizeX2+230, 120, 120,"Archivos/Imagenes/sexy.png", 0, 0, 0, tocolor ( 255, 255, 255, isCursorOnElement(botX+sizeX+760, botX2+sizeX2+230, 120, 120) and 255 or 100))
	dxDrawImage ( botX+sizeX+750, botX2+sizeX2+350, 120, 120,"Archivos/Imagenes/dance.png", 0, 0, 0, tocolor ( 255, 255, 255, isCursorOnElement(botX+sizeX+750, botX2+sizeX2+350, 120, 120) and 255 or 100))
	dxDrawImage ( botX+sizeX+665, botX2+sizeX2+450, 120, 120,"Archivos/Imagenes/espere.png", 0, 0, 0, tocolor ( 255, 255, 255, isCursorOnElement(botX+sizeX+665, botX2+sizeX2+450, 120, 120) and 255 or 100) )
end



function animations.click (_, estado)
	if painel[1] == true then
		if estado == "down" then
			local x,y,z = getElementPosition(theplayer)
			if isCursorOnElement(botX+sizeX+550, botX2+sizeX2+80, 120, 120) then
				playSound("Archivos/Sonidos/click.mp3")
				triggerServerEvent("anim.fuck", localPlayer)

				triggerServerEvent('sound',root,'fornite',false,'BD_Panic_Loop','6500',localPlayer)

			elseif isCursorOnElement(botX+sizeX+440, botX2+sizeX2+140, 120, 120) then
				playSound("Archivos/Sonidos/click.mp3")
				triggerServerEvent("anim.chat", localPlayer)
			elseif isCursorOnElement(botX+sizeX+665, botX2+sizeX2+150, 120, 120) then
				playSound("Archivos/Sonidos/click.mp3")
				sound = playSound("Archivos/Sonidos/smoke.mp3")
				setTimer(stopSound, 40000, 1, sound)
				triggerServerEvent("anim.smoke", localPlayer)
			elseif isCursorOnElement(botX+sizeX+760, botX2+sizeX2+230, 120, 120) then
				playSound("Archivos/Sonidos/click.mp3")
				triggerServerEvent("anim.sexy", localPlayer)
			elseif isCursorOnElement(botX+sizeX+750, botX2+sizeX2+350, 120, 120) then
				playSound("Archivos/Sonidos/click.mp3")
				triggerServerEvent("anim.dance", localPlayer)
			elseif isCursorOnElement(botX+sizeX+665, botX2+sizeX2+450, 120, 120) then
				playSound("Archivos/Sonidos/click.mp3")
				triggerServerEvent("anim.espere", localPlayer)
			elseif isCursorOnElement(botX+sizeX+440, botX2+sizeX2+450, 120, 120) then
				playSound("Archivos/Sonidos/click.mp3")
				triggerServerEvent("anim.sentar", localPlayer)
			elseif isCursorOnElement(botX+sizeX+360, botX2+sizeX2+350, 120, 120) then
				playSound("Archivos/Sonidos/click.mp3")
				triggerServerEvent("anim.handsup", localPlayer)
			elseif isCursorOnElement(botX+sizeX+350, botX2+sizeX2+230, 120, 120) then
				playSound("Archivos/Sonidos/click.mp3")
				triggerServerEvent("anim.smile", localPlayer)
			elseif isCursorOnElement(botX+sizeX+550, botX2+sizeX2+490, 120, 120) then
				playSound("Archivos/Sonidos/click.mp3")
				stopSound(sound)
				triggerServerEvent("anim.cancel", localPlayer)
			end
		end
	end
end
addEventHandler("onClientClick", root, animations.click )

function playsound(file,block,anim,duration,theplayer)
	
	local x,y,z = getElementPosition(theplayer)
    sound2 = playSound3D('animations/'.. file ..'.ogg',x,y,z)	
	attachElements(sound2, theplayer)
	
end

addEvent("playsound", true)
addEventHandler("playsound", root, playsound)




function abrir ()
	if not painel[1] then 
		addEventHandler("onClientRender", root, painelanim)
		playSound("Archivos/Sonidos/abrir.mp3")
	else
		removeEventHandler("onClientRender", root, painelanim)
		showCursor(false)
	end

	painel[1] = not painel[1]
	showCursor(painel[1])
end
--bindKey("2", "both", abrir)


function isCursorOnElement(x,y,w,h)
	if (not isCursorShowing()) then
		return false
	end
	local mx,my = getCursorPosition ()
	local fullx,fully = guiGetScreenSize()
	cursorx,cursory = mx*fullx,my*fully
	if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
		return true
	else
		return false
	end
end