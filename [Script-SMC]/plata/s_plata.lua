function check(player) 
    if isObjectInACLGroup ( "user." .. getAccountName ( getPlayerAccount ( player ) ), aclGetGroup ( "Admin" ) ) or isObjectInACLGroup ( "user." .. getAccountName ( getPlayerAccount ( player ) ), aclGetGroup ( "Moderator" ) ) then 
        return true 
    end 
    return false 
end 

robos = {}
cancelados = {}

addCommandHandler('dar',function(player,name,plata,player2)
    local miplata = getPlayerMoney(player)
    local adar = tonumber(plata)

    local x, y, z = getElementPosition(player) 

    -- si no te alcansa la plata, te manda un mensaje
    

    if adar == 0 then 
        outputChatBox('No puedes dar $0 de plata',player,255,0,0)

        return 
    end

    if adar < 0 then 
        outputChatBox('No puedes dar plata negativa',player,255,0,0)

        return 
    end
    
    if miplata - adar <= 0 then
        outputChatBox('No te alcanza para realizar la transacción',player,255,0,0)
        return
    end

    -- si no se especifica el jugador, se le transfiere al mas cercano
    if not player2 then 
        local min = 99999
        local near;

        local colshape = createColSphere(tonumber(x), tonumber(y), tonumber(z), tonumber(30)) 

        -- ve el jugador mas cercano
        for index, target in ipairs(getElementsWithinColShape(colshape, 'player')) do 
            local x2,y2,z2 = getElementPosition(target)
            local distance = getDistanceBetweenPoints3D(x,y,z,x2,y2,z2)

            if getPlayerName(player) ~= getPlayerName(target) then
                if distance < min then
                    near = target
                    min = distance;
                end
            end

        end 
        destroyElement(colshape) 

        transfer(miplata,adar,player,near,plata)

        return
    end

    -- transferencia especificando el player
    transfer(miplata,adar,player,getPlayerFromName(player2),plata)


end)

addCommandHandler('robar',function(player)

    --if isTimer(robos[player]) then return end
    if isPedInVehicle(player) then return end

    local x, y, z = getElementPosition(player) 

    local min = 99999
    local victim = false;

    local colshape = createColSphere(tonumber(x), tonumber(y), tonumber(z), tonumber(30)) 

    -- ve el jugador mas cercano
    for index, target in ipairs(getElementsWithinColShape(colshape, 'player')) do 
        local x2,y2,z2 = getElementPosition(target)
        local distance = getDistanceBetweenPoints3D(x,y,z,x2,y2,z2)

        if getPlayerName(player) ~= getPlayerName(target) then
            if distance < min then
                victim = target
                min = distance;
            end
        end

    end 

    if victim == false then return end

    local x2,y2,z2 = getElementPosition(victim)
    local distance = getDistanceBetweenPoints3D(x,y,z,x2,y2,z2)


    local platavictima = getPlayerMoney(victim)
    local arobar = math.floor(math.random(300,30000))

    if distance < 1.5 then


        if platavictima == 0 then
            triggerClientEvent(player,'notificacionplata',root,'No pudiste robar',getPlayerName(victim)..'no tiene dinero suficiente para robarte',{255,0,0})
            return
        end
    
        if platavictima < arobar then
            arobar = platavictima
        end
        
        triggerClientEvent(root,'animrobar',root,player)
        
        robos[player] = setTimer(function()
            triggerClientEvent(root,'animstop',root,player)

            if platavictima == 0 then
                triggerClientEvent(from,'notificacionplata',root,'No pudiste robar',getPlayerName(to)..'no tiene dinero suficiente para robarte',{255,0,0})
                return
            end

            if platavictima < arobar then
                arobar = platavictima
            end


            steal(player,victim,arobar)

        end,3000,1)

        cancelados[player] = setTimer(function()

            local x, y, z = getElementPosition(player) 
            local x2,y2,z2 = getElementPosition(victim)
            local distance = getDistanceBetweenPoints3D(x,y,z,x2,y2,z2)
    
            if distance > 3 then
                killTimer(robos[player])
                killTimer(cancelados[player])

                triggerClientEvent(root,'animstop',root,player)

                return
            end
    
        end,300,10)

    end


end
)

function steal(from,to,plata)
    
    setElementHealth(from,getElementHealth(from)- 20)
    takePlayerMoney(to,plata)
    givePlayerMoney(from,plata)
    triggerClientEvent(to,'notificacionplata',root,'Te robaron ',getPlayerName(from)..' te ha robado '..plata,{0,0,170})
    triggerClientEvent(from,'notificacionplata',root,'Le robaste a ','le robaste $'..plata..' a '..getPlayerName(to),{0,0,170})

    triggerClientEvent(root,'moneysound',root,from)

    if getPlayerMoney(to) < 0 then
        setPlayerMoney(to,0)
    

    end

   -- exports.api.money('','**'..getPlayerName(from)..' le robo $'..plata..'a **'..  getPlayerName(to) .. '**')


end


function transfer(miplata,adar,from,to,plata)

    if tonumber(plata) > 80000 then
        exports.api.money('','**'..getPlayerName(from)..' le pago $'..plata..'a **'..  getPlayerName(to) .. '**')
    end

    givePlayerMoney(to,adar)
    takePlayerMoney(from,adar)

    triggerClientEvent(to,'notificacionplata',root,'Te pagaron',getPlayerName(from).." te pago $"..plata,{0,0,170})
    triggerClientEvent(from,'notificacionplata',root,'Transferencia exitosa','le pagaste $'..plata..' a '..getPlayerName(to),{0,0,170})

    triggerClientEvent(root,'moneysound',root,from)
end

function isElementWithinAColShape(element)
    if element or isElement(element)then
       for _,colshape in ipairs(getElementsByType("colshape"))do
      if isElementWithinColShape(element,colshape) then
         return colshape
      end
       end
    end
    return false
 end


addCommandHandler('platamods',function(player)
    if check(player) then -- si es admin o mod
        givePlayerMoney(player,999999999)
    end
end)