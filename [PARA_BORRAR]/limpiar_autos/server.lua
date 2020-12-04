local x,y,z = 1911.2, -1776, 12
local Marker = createMarker(x, y, z, "cylinder", 5, 255, 0, 0, 150)
local blip = exports.customblips:createCustomBlip(x, y, 20, 20, "icon.png")
local gate = createObject(968, 1915.5, -1771.80, 13, 0, -90)
local gate1 = createObject(968, 1915.5, -1780.85, 16, 0, -90)
 
 addEventHandler("onMarkerHit", Marker,
function (hitPlayer, matchingDimension)
    local theVehicle = getPlayerOccupiedVehicle(hitPlayer)
    if (theVehicle) then
        setElementData(source, "Cleaned", true)
        fadeCamera(source, false, 2.5, 0, 0, 0)
        setTimer(fadeCamera, 2500, 1, source, true, 2.5)
        moveObject(gate, 9000, 1915.5, -1771.80, 16)
        moveObject(gate1, 2000, 1915.5, -1780.85, 13)
        outputChatBox("Your Welcome in car wash", source, 0, 255, 255)
    end
end)

addEventHandler("onMarkerLeave", Marker,
function ()
    moveObject(gate, 2000, 1915.5, -1771.80, 13)
    moveObject(gate1, 9000, 1915.5, -1780.85, 16)
end)