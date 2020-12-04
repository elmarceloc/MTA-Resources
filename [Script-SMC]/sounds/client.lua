function playsound(leaf,theplayer)
	
	local x,y,z = getElementPosition(theplayer)
    sound2 = playSound3D('sounds/'.. tostring(leaf.file) ..'.ogg',x,y,z)	
	attachElements(sound2, theplayer)
	
end

addEvent("playsound", true)
addEventHandler("playsound", root, playsound)

function sendsound(leaf)
    triggerServerEvent('sound',root,leaf,localPlayer)
end