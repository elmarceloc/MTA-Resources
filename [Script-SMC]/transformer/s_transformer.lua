

function getPositionInfrontOfElement(element, meters)
    if (not element or not isElement(element)) then return false end
    local meters = (type(meters) == "number" and meters) or 3
    local posX, posY, posZ = getElementPosition(element)
    local _, _, rotation = getElementRotation(element)
    posX = posX - math.sin(math.rad(rotation)) * meters
    posY = posY + math.cos(math.rad(rotation)) * meters
    rot = rotation + math.cos(math.rad(rotation))
    return posX, posY, posZ , rot
end

local canplay = true

function isPedTerminated(player)
	local x, y, z = getElementPosition(player)
	return (math.floor(x) == 132 and math.floor(y) == -68) or (math.abs(x) < 2 and math.abs(y) < 2 and z < 1)
end

function spawnMe(x, y, z)
	if not x then
		x, y, z = getElementPosition(source)
	end
	if isPedTerminated(source) then
		repeat until spawnPlayer(source, x, y, z, 0, math.random(9, 288))
	else
		spawnPlayer(source, x, y, z, 0, getPedSkin(source))
	end

	--setCameraTarget(source, source)
	setCameraInterior(source, getElementInterior(source))

end

function removevehicle ( theplayer, seat, jacked )
    if getElementModel(source) ~= 401 then return end

    triggerClientEvent(root,'distransformation',source)
    triggerClientEvent(theplayer,'notification',root)

    
    destroyElement(source)
    setElementAlpha(theplayer,255)
    setTimer(function()
    
        exports.customanimations:setPedCustomAnimation(theplayer,'getup_front',1350,false,true,true,false)
    
    end,100,1)

end
addEventHandler ( "onVehicleStartExit", getRootElement(), removevehicle )



local playerVehicle = {} 
  
function enterVehicle(player) 
    playerVehicle[player] = source 
end 
function exitVehicle(player) 
    playerVehicle[player] = nil 
end 
  
function playerDied() 
    local vehicle = playerVehicle[source] 
    setTimer(destroyElement,2000,1,vehicle)

    playerVehicle[source] = nil 
  
    setElementAlpha(source,255)
end 
  
addEventHandler("onPlayerWasted", root, playerDied) 
addEventHandler("onVehicleEnter", root, enterVehicle) 
addEventHandler("onVehicleExit", root, exitVehicle) 
addEventHandler("onPlayerQuit", root, exitVehicle) 



function bumblebee (player)

    local accName = getAccountName(getPlayerAccount(player))
    if isObjectInACLGroup ("user."..accName, aclGetGroup("Previp")) then     




        bindKey(player, 'b','down', function(player)
            
            if getElementModel(player) ~= 165 then return end
            if isPlayerInVehicle(player) then return end
            if isPedDead(player) then return end

            if not canplay then return end

            triggerClientEvent(player,'transformation0',player)
            
            
            exports.customanimations:setPedCustomAnimation(player,'EV_dive',1300,false,true,true,false)
        
            
            setTimer(function()
                local x,y,z = getElementPosition(player)
                local rx,ry,rz = getElementRotation(player)

                setPedAnimation(player)
                setElementAlpha(player,0)

                local vx,vy,vz,r = getPositionInfrontOfElement(player,6)
                local vehicle = createVehicle(401,vx,vy,vz,rx,ry,r)

                setVehicleColor(vehicle,244,218,15)
                
                local interior = getElementInterior(vehicle)
                local numseats = getVehicleMaxPassengers(vehicle)
                local driver = getVehicleController(vehicle)
                for i=0,numseats do
                    if not getVehicleOccupant(vehicle, i) then
                        if isPedDead(player) then
                            local x, y, z = getElementPosition(vehicle)
                            spawnMe(x + 4, y, z + 1)
                        end
                        setElementInterior(player, interior)
                        setCameraInterior(player, interior)
                        warpPedIntoVehicle(player, vehicle, i)
                        triggerClientEvent(player,'notification2',player)
                        canplay = true 

                        return
                    end
                end

    end,1200,1)

    canplay = false
   
   
end)



        -- setea el skin del transformer y le avisa al usuario
        setPedSkin(player, 165)
        triggerClientEvent(player,'notification',player)

    end
end
addCommandHandler( "bumblebee", bumblebee )

addEventHandler('onPlayerQuit',root,function()
    if not isPlayerInVehicle(source) then return end

    local vehicle = playerVehicle[source] 
    
    destroyElement(vehicle)

    playerVehicle[source] = nil 
  
end)


function canceltransformer ( theplayer, seat, jacked )
    if getElementModel(theplayer) == 165 and getElementModel(source) ~= source then
        outputChatBox('No puedes subirte a un vehiculo siendo bumblebee',theplayer,255,0,0)
         cancelEvent()
         end
end
addEventHandler ( "onVehicleStartEnter", getRootElement(), canceltransformer )
