--[[----------------------------------------------------
-- server script main
-- @author Banex
-- @update 02/11/2017 
----------------------------------------------------]]--

local vehicles = {}

addEvent("givePlayerWeapon",true)
function givePlayerWeapon(weapon,ammount)
	giveWeapon(client,weapon,ammount, true)	
end
addEventHandler("givePlayerWeapon",resourceRoot,givePlayerWeapon)

addEvent("setSkin",true)
function setSkin(id)
	setElementModel(client,id)
end
addEventHandler("setSkin",resourceRoot,setSkin)

addEvent("vehicleSetColor",true)
function vehicleSetColor(color)
	local vehicle = getPedOccupiedVehicle(client)
	if (vehicle) then
		setVehicleColor(vehicle, color[1], color[2], color[3], color[4], color[5], color[6], color[7], color[8], color[9], color[10], color[11], color[12])
		setVehicleHeadLightColor(vehicle, color[13], color[14], color[15])
	end
end
addEventHandler("vehicleSetColor",resourceRoot,vehicleSetColor)

addEvent("vehicleFix",true)
function vehicleFix()
	local vehicle = getPedOccupiedVehicle(client)
	if (vehicle) then
		fixVehicle(vehicle)
	end
end
addEventHandler("vehicleFix",resourceRoot,vehicleFix)

addEvent("vehicleFlip",true)
function vehicleFlip()
	local vehicle = getPedOccupiedVehicle(client)
	if (vehicle) then
		local rX, rY, rZ = getElementRotation(vehicle)
		setElementRotation(vehicle, 0, 0, (rX > 90 and rX < 270) and (rZ + 180) or rZ)
	end
end
addEventHandler("vehicleFlip",resourceRoot,vehicleFlip)

addEvent("givePlayerVehicle",true)
function givePlayerVehicle(id)
	if (vehicles[client] and isElement(vehicles[client])) then
		destroyElement(vehicles[client])
	end
	local x,y,z = getElementPosition(client)
	local rot = getPedRotation(client)
	vehicles[client] = createVehicle(id, x, y, z, 0, 0, rot)
	setElementInterior(vehicles[client], getElementInterior(client))
	setElementDimension(vehicles[client], getElementDimension(client))
	warpPedIntoVehicle(client, vehicles[client])
	local name = getPlayerName(client)
	while name:find("#%x%x%x%x%x%x") do
		name = name:gsub("#%x%x%x%x%x%x","")
	end
	setVehiclePlateText(vehicles[client],name)
end
addEventHandler("givePlayerVehicle",resourceRoot,givePlayerVehicle)

function onVehicleExplode()
    setTimer(function(vehicle)
		if isElement(vehicle) then
			destroyElement(vehicle)
		end
	end, 5000, 1, source)
end
addEventHandler("onVehicleExplode", resourceRoot, onVehicleExplode)

function onPlayerQuit()
	local vehicle = vehicles[source]
	if (vehicle and isElement(vehicle)) then
		destroyElement(vehicle)
	end
	vehicles[source] = nil
end
addEventHandler("onPlayerQuit", root, onPlayerQuit)

function onVehicleEnter(player, seat)
    if (getElementData(player,"Modo Passivo") and (seat == 0)) then
	    setVehicleDamageProof(source,true)
	end
end
addEventHandler("onVehicleEnter", root,onVehicleEnter)

function onVehicleExit(player, seat)
    if (getElementData(player,"Modo Passivo") or isVehicleDamageProof(source) and (seat == 0)) then
		setVehicleDamageProof(source,false)
	end
end
addEventHandler("onVehicleExit", root,onVehicleExit)

function onPlayerWeaponFire()
    if (getElementData(source,"Modo Passivo")) then
	   cancelEvent()
	end
end
addEventHandler("onPlayerWeaponFire", root,onPlayerWeaponFire)

function onPlayerTarget()
	if (getElementData(source,"Modo Passivo")) then
	   cancelEvent()
	end
end
addEventHandler("onPlayerTarget", root, onPlayerTarget) 