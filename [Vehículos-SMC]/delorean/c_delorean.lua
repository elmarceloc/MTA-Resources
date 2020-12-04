function getElementSpeed(theElement, unit)
    -- Check arguments for errors
    assert(isElement(theElement), "Bad argument 1 @ getElementSpeed (element expected, got " .. type(theElement) .. ")")
    local elementType = getElementType(theElement)
    assert(elementType == "player" or elementType == "ped" or elementType == "object" or elementType == "vehicle" or elementType == "projectile", "Invalid element type @ getElementSpeed (player/ped/object/vehicle/projectile expected, got " .. elementType .. ")")
    assert((unit == nil or type(unit) == "string" or type(unit) == "number") and (unit == nil or (tonumber(unit) and (tonumber(unit) == 0 or tonumber(unit) == 1 or tonumber(unit) == 2)) or unit == "m/s" or unit == "km/h" or unit == "mph"), "Bad argument 2 @ getElementSpeed (invalid speed unit)")
    -- Default to m/s if no unit specified and 'ignore' argument type if the string contains a number
    unit = unit == nil and 0 or ((not tonumber(unit)) and unit or tonumber(unit))
    -- Setup our multiplier to convert the velocity to the specified unit
    local mult = (unit == 0 or unit == "m/s") and 50 or ((unit == 1 or unit == "km/h") and 180 or 111.84681456)
    -- Return the speed by calculating the length of the velocity vector, after converting the velocity to the specified unit
    return (Vector3(getElementVelocity(theElement)) * mult).length
end

addEventHandler("onClientVehicleEnter", getRootElement(),
    function(thePlayer, seat)
        if thePlayer == getLocalPlayer() then
            if getElementModel(source) == 541 then
                exports.notifications.createNotification(1,'','Viaje en el tiempo','Anda a la chucha pa viejar en el tiempo',10000)
                vehicle = source
                --setWorldSpecialPropertyEnabled('hovercars',true) 
                addEventHandler('onClientRender', root, check88km)
            end
        end
    end
)


function check88km()
    
    if getElementSpeed(vehicle, 1) > 160 then
        local x,y,z = getElementPosition(vehicle)
        local hour, minute = getTime ()
        setTime((hour+12)%24,minute)
        fxAddSparks(x,y,z,0,0,3,10,10)
        local vx,vy,vz = getElementVelocity(vehicle)
        setElementVelocity(vehicle, vx*20,vy*20,vz*20)
        setTimer(function() 
            setElementVelocity(vehicle, vx,vy,vz)
        end,100,1)
        removeEventHandler('onClientRender', root, check88km)
    end
end