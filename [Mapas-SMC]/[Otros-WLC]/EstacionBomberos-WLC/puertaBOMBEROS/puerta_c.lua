
local puertas = {
	{-2026.6999511719, 75.400001525879,32},
	{-2026.5999755859, 84, 32},
	{-2026.5999755859, 92.599998474121, 32},
}


local markers = {
	{-2025.68372, 71.28986, 28.39441 -1},
	{-2025.82446, 79.65733, 28.27479 -1},
	{-2025.64014, 88.28649, 28.28256 -1},
}

local sw,sh = guiGetScreenSize()

local inmarkers = {}
local outmarkers = {}

local puertasobjs = {}

local paneles = {}
local button = {}

local id = 1931
local time = 4000
local worldtext = 'INTERRUPTOR'

for i,puerta in ipairs(puertas) do 
	puertasobjs[i] = createObject (id, puerta[1], puerta[2], puerta[3], 0, 0, 0)
end

for j,marker in ipairs(markers) do 
	inmarkers[j] = createMarker (marker[1]-2, marker[2], marker[3], "cylinder", 1.4, 0, 255, 0, 0)
	outmarkers[j] = createMarker (marker[1]+0.5, marker[2], marker[3], "cylinder", 1.4, 0, 255, 0,0)


	addEventHandler("onClientMarkerHit", inmarkers[j],function(hitPlayer) showpanel(hitPlayer,j) end)
	addEventHandler("onClientMarkerHit", outmarkers[j],function(hitPlayer) showpanel(hitPlayer,j) end)
end

addEvent('move',true)
addEventHandler("move", root, function(time,puerta)
	local rx,ry,rz = getElementRotation(puertasobjs[puerta])
	if ry == 0 then
		moveObject(puertasobjs[puerta], time, puertas[puerta][1], puertas[puerta][2], puertas[puerta][3], 0, -90-ry, 0)
	elseif ry < 300 and ry > 200 then
		moveObject(puertasobjs[puerta], time, puertas[puerta][1], puertas[puerta][2], puertas[puerta][3], 0, 90-ry+270, 0)
	end
end)


for i = 1,4 do 
	paneles[i] = guiCreateWindow(sw/2-64, (sh/10)*4, 128, 128, "INTERRUPTOR", false)
	button[i] = guiCreateStaticImage (0, 0, 128, 128, "puertaBOMBEROS/interruptor.png", true, paneles[i])
	
	--local close = guiCreateButton (.8, 0.15, .15, .15, "X", true, paneles[i])
	guiSetVisible(paneles[i], false)
	guiWindowSetSizable(paneles[i], false)

	addEventHandler("onClientGUIClick", button[i], function()

		triggerServerEvent('rotatedoor',root, time,i)

		guiSetVisible(paneles[i], false)
		showCursor(false)

	end, false)

	--addEventHandler("onClientGUIClick", close, function()
	--	guiSetVisible(paneles[i], false)
	--	showCursor(false)
	--end, false)

end

function showpanel(hitPlayer,panel)
	if hitPlayer ~= localPlayer then return end
	local isVisible = guiGetVisible(paneles[panel])
	
	guiSetVisible(paneles[panel], not isVisible)
	showCursor(not isVisible)
end


----------------------------------------------------------------------------------------------------------------------------

function dxDrawTextOnElement(TheElement,text,height,distance,R,G,B,alpha,size,font)
    local x, y, z = getElementPosition(TheElement)
    local x2, y2, z2 = getCameraMatrix()
    local distance = distance or 20
    local height = height or 1
    local value1 = 2
	local value2 = 2

	if (isLineOfSightClear(x, y, z+2, x2, y2, z2)) then

        local sx, sy = getScreenFromWorldPosition(x+1, y, z+height)
		if(sx) and (sy) then

            local distanceBetweenPoints = getDistanceBetweenPoints3D(x, y, z, x2, y2, z2)
			if(distanceBetweenPoints < distance) then

                dxDrawText(text, sx+value1, sy+value2, sx, sy, tocolor(R or 255, G or 255, B or 255, alpha or 255), (size or 1)-(distanceBetweenPoints / distance), font or "arial", "center", "center", false, false, false, true, false)
            end
        end
    end
end

local Font = dxCreateFont("puertaBOMBEROS/Font.ttf", 13)

function wolrdTexts()

	local rx,ry,rz = getElementRotation(puertasobjs[1])

	for j,marker in ipairs(inmarkers) do 
		dxDrawTextOnElement(marker, worldtext, 2.1, 20, 212, 94, 15, 255, 1.2, Font)
	end

end
addEventHandler("onClientRender",getRootElement(), wolrdTexts)