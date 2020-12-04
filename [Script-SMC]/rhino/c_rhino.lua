function handleVehicleDamage(attacker, weapon, loss, x, y, z, tire)
    if (weapon and getElementModel(source) == 432) then
        if weapon == 37 then
            cancelEvent()
        elseif weapon == 38 then
            setElementHealth(source,getElementHealth(source) - (loss/16)/8) 
         else
            setElementHealth(source,getElementHealth(source) - loss/16) 
        end
    end
end
addEventHandler("onClientVehicleDamage", root, handleVehicleDamage)