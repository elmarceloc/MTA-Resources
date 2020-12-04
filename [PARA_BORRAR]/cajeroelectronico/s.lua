cajeros = {
    {x = 393.76941, y = -2051.43726, z = 7.83594}, -- Playa
    {x = 1015.01062, y = -1304.73901, z = 13.54688}, -- AFP
    {x = 2137.23877, y = -1908.13428, z = 13.37671}, -- Mecanico
    {x = 1834.30432, y = -1833.10510, z = 13.57813}, -- 24/7 Lider
    {x = 1553.01489, y = -1651.13684, z = 13.55784}, -- Paco ls
    {x = 1185.08081, y = -900.66602, z = 43.17532}, -- BK
    {x = 826.84845, y = -1347.14380, z = 13.53798}, -- metro 2
    {x = 2505.95679, y = -1756.45313, z = 13.45354}, -- grove
    {x = 1807.15222, y = -2333.99219, z = -2.65068} -- aeropuerto
}

markers = {}
cajeros_objs = {}
bombas = {}
dineros = {}
blips = {}

texts = {}

addEventHandler ("onResourceStart",root, function() -- cuando el player entra al marker

    for i,cajero in ipairs(cajeros) do -- por cada cajero

        local x = cajero['x']
        local y = cajero['y']
        local z = cajero['z']

        local blipplaya = createBlip(393.76941, -2051.43726, 7.83594, 52)
        local blipafp = createBlip(1015.01062, -1304.73901, 13.54688, 52)
        local blipmeca = createBlip(2137.23877, -1908.13428, 13.37671, 52)
        local bliplider = createBlip(1834.30432, -1833.10510, 13.57813, 52)
        local blippaco = createBlip(1553.01489, -1651.13684, 13.55784, 52)
        local blipbk = createBlip(1185.08081, -900.66602, 43.17532, 52)
        local blipmetro = createBlip(826.84845, -1347.14380, 13.55784, 52)
        local blipgrove = createBlip(2505.95679, -1756.45313, 13.45354, 52)
        local blipaero = createBlip(1807.15222, -2333.99219, -2.65068, 52)



        texts[i] = true

        table.insert(blips, blip)
        table.insert(cajeros_objs, createObject( 2942, x, y, z-0.35, 0, 0, -90 ))
        table.insert(markers, createMarker( x-1, y, z-1, "cylinder", 1.5, 255, 127, 0, 100 )) -- crear un marker para cada cajero
        table.insert(dineros, createPickup ( x, y, z-10.3, 3, 1212, 40000))
        
        setBlipVisibleDistance(blipplaya,60)
        setBlipVisibleDistance(blipafp,60)
        setBlipVisibleDistance(blipmeca,60)
        setBlipVisibleDistance(bliplider,60)
        setBlipVisibleDistance(blippaco,60)
        setBlipVisibleDistance(blipbk,60)
        setBlipVisibleDistance(blipmetro,60)
        setBlipVisibleDistance(blipgrove,60)
        setBlipVisibleDistance(blipaero,60)

    end

    for k, player in ipairs(getElementsByType("player")) do
        robar(player) -- bindea al iniciar el resource
    end

end)


addEventHandler ("onPlayerJoin",root, function()

    robar(source) -- bindea al entrar

end)

function robar(thePlayer)

    for i,cajero in ipairs(cajeros) do

        triggerClientEvent(root, "update", root, texts[i])
        
        bindKey(thePlayer, 'k', 'down', function(player, key, keyState)
            if not isElementWithinMarker(player, markers[i]) then return end
            if isPedInVehicle(player) then outputChatBox('No puedes robar en vehiculo, sale pao', source,255,0,0) return end 

            local x = cajeros[i]['x']
            local y = cajeros[i]['y']
            local z = cajeros[i]['z']

            local inicial = 10000

            --Inicial
            setElementPosition( markers[i], x-1, y, z-11 )
            setElementPosition( player, x-1, y-0.01, z )
            setElementFrozen( player, true )            
            setPedAnimation( player, "bomber", "bom_plant_loop", 10000, true, false, true, false)
            setElementRotation( thePlayer, 0, 0, -90 )
            

            --Timer
            setTimer( function ()
                setElementFrozen( player, false )
                bombas[i] = createObject( 1654, x-0.3, y, z-0.78, 0, 0, -90)
                triggerClientEvent(root,'onSound',root, x, y, z)
                triggerClientEvent(player, 'notificacioncajero',root, 'Cajero Automático', 'Tienes 10 segundos para virar' )
            
            end, inicial, 1 )

            -- Humo
            setTimer( function ()
                triggerClientEvent(root,'onSmoke',root, x, y, z)
            end, inicial + 4000, 1 )

            --Exploción
            setTimer( function ()
                destroyElement( bombas[i] )
                createExplosion( x, y, z, 0 )
                triggerClientEvent( root, "offSmoke", root )
                triggerClientEvent(root, "offtext", root, i)
                setBlipVisibleDistance(blips[i],0)
                setElementPosition(dineros[i], x, y, z-0.3 )
                texts[i] = false
            
            end, inicial + 10000, 1 )


            -- Borar cajero
            setTimer( function ()
                destroyElement ( cajeros_objs[i] )
            end, inicial + 12000, 1)


            
            --Move Money
            setTimer( function ()
                setElementPosition( dineros[i], x, y, z-10.3)
            end, inicial + 30000, 1 )
            

            --Reaparecer
            setTimer( function ()
                cajeros_objs[i] = createObject( 2942, x, y, z-0.35, 0, 0, -90 )

                setBlipVisibleDistance(blips[i],60)
                setElementPosition( markers[i], x-1, y, z-1 )
                triggerClientEvent(root, "ontext", root, i)
                texts[i] = true
            end, 108000000, 1)


        end)

    end

end

addEventHandler('onPlayerPickupHit',root,function(pickup)


    for i,dinero in ipairs(dineros) do -- por cada dinero

        if pickup == dinero then

            -- dinero que se gana al tocar el pickup

    
            local loot = math.floor(math.random(1,4))
            local money = 0

            local mensaje = ''

            --  1 <- buen loot,  2-8  decente < -- 9 - 10  muy malo 

            if loot == 1 then
                money = math.floor(math.random(50000, 80000)) 
                mensaje = 'Ganaste $' ..tostring(money).. ', vira gil ctm, ql con cuea'
            end
            if loot == 2 or loot == 3 then
                money = math.floor(math.random(18000, 32000)) 
                mensaje = 'Ganaste $' ..tostring(money).. ', vira gil ctm'
            end
            if loot == 4 then 
                money = math.floor(math.random(8000, 15000)) 
                mensaje = 'Ganaste $' ..tostring(money).. ', pucha que tiene mala cuea hrmnito'
            end
        

            givePlayerMoney(source, money)

            triggerClientEvent(source, 'notificacioncajero',root, 'Cajero Automático', mensaje )
                
        end
    end
end)
