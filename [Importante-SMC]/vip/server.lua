-----------------
-----Preestablecido-----
-----------------
command = "vip"
----------------------
-----funciones-----
----------------------
function PanelAc(source, commandName)
    local accName = getAccountName(getPlayerAccount(source))
    if isObjectInACLGroup ("user."..accName, aclGetGroup("Vip")) then
        triggerClientEvent(source, "togglepanel", source)
    else
        outputChatBox("Debe ser Vip para usar este comando.", source, 255, 0, 0, true)
        triggerClientEvent(source,'onVipNotification',source,'bad','Debe ser Vip para usar este comando.')
    end
end
addCommandHandler( command, PanelAc)

veh= {}


local vehicles = {{'Formula 1',494},{'Hydra',520},{'Tanque',432},{'Lamborghini Monster Truck',556},{'Baño',583}}

addEvent ("give_vehicle", true)
addEventHandler ("give_vehicle", getRootElement(), 
function(id)
    local acc = getPlayerAccount(source)
    
    if getAccountData(acc,'hydra') == '0' and id == 520 then 
        triggerClientEvent(source,'onVipNotification',source,'bad','Tienes que esperar hasta hasta el proximo\ndía para volver usar el hydra.')

        return 
    end

    if getAccountData(acc,'tank') == '0' and id == 432 then 
        triggerClientEvent(source,'onVipNotification',source,'bad','Tienes que esperar hasta hasta el proximo\ndía para volver usar el tanque.')

        return 
    end

    if veh[source] and
         isElement(veh[source]) then
         destroyElement(veh[source])
         veh[source] = nil
    end
    local x,y,z = getElementPosition(source)
    local zx,zy,zz = getElementRotation(source)

    veh[source] = createVehicle(tonumber(id), x, y, z, zx, zy, zz)
    addVehicleUpgrade(veh[source], 1010)
    warpPedIntoVehicle(source, veh[source])
    
    if id == 520 then
        setAccountData ( acc, "hydra", '0' ) -- save it in his account
    end

    if id == 432 then
        setAccountData ( acc, "tank", '0' ) -- save it in his account
    end
    

   --  setVehicleColor(veh[source], 0, 200, 255)
end)



function vehicle_error(thePlayer, seat, jacked)
    for i,v in ipairs (vehicles) do
        if getElementModel(source) == v[2] then
            local accName = getAccountName(getPlayerAccount(thePlayer))
            if isObjectInACLGroup("user."..accName, aclGetGroup("Vip"))then
            else
                cancelEvent()
                triggerClientEvent(thePlayer,'onVipNotification',thePlayer,'bad','Debes ser VIP para subirte a este vehiculo.')

            end
        end
    end
end
addEventHandler("onVehicleStartEnter", getRootElement(), vehicle_error)

function setskin(id)
    if id then
        setPedSkin(source, id)
    end
end
addEvent( "setskin", true )
addEventHandler( "setskin", getRootElement(), setskin,id )

function setweapons()

    local acc = getPlayerAccount(source)
    local accName = getAccountName(acc)
    if isObjectInACLGroup("user."..accName, aclGetGroup("Vip"))then

        if getAccountData(acc,'weapons') == '0' then 
            triggerClientEvent(source,'onVipNotification',source,'bad','Tienes que esperar hasta el proximo\ndía para volver a sacar armas')
            return 
        end    
        
        takeAllWeapons(source)

        giveWeapon(source,35,10)
        giveWeapon(source,16,20)
        giveWeapon(source,38,1700)

        setWeaponAmmo(source,35,10)
        setWeaponAmmo(source,16,20)
        setWeaponAmmo(source,38,3000)

        triggerClientEvent(source,'onVipNotification',source,'good','Se te han recargado las armas.')


        setAccountData ( acc, "weapons",'0' )
    end
end
addEvent( "setweapons", true )
addEventHandler( "setweapons", getRootElement(), setweapons )

function setRoket()

    local acc = getPlayerAccount(source)
    local accName = getAccountName(acc)
    if isObjectInACLGroup("user."..accName, aclGetGroup("Vip"))then

--rociugh

    --    rociugh

        if getAccountData(acc,'rocket') == '0' then 
            triggerClientEvent(source,'onVipNotification',source,'bad','Tienes que esperar hasta el proximo\ndía para volver a sacar el lanza cohetes.')

            return 
        end    
        
      --  takeAllWeapons(source)

        giveWeapon(source,35,5)

        setWeaponAmmo(source,35,5)

        triggerClientEvent(source,'onVipNotification',source,'good','Se te ha recargado el lanzacohetes.')


        setAccountData ( acc, "rocket",'0' )
    end
end
addEvent( "rocket", true )
addEventHandler( "rocket", getRootElement(), setRoket )



function JetPack(toggle)
    local accName = getAccountName(getPlayerAccount(source))
    if isObjectInACLGroup ("user."..accName, aclGetGroup("Vip")) then
        local JetPackVar = doesPedHaveJetPack(source)
        if (JetPackVar) then  
            removePedJetPack(source)
        else
            givePedJetPack(source)
        end
    end
end
addEvent( "JetPack_event", true )
addEventHandler( "JetPack_event", getRootElement(), JetPack)