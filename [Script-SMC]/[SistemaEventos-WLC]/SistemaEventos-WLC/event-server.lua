eventStartFunctions = {}
playersInEvent = nil
eventInfo = nil
eventoi = false
eventObjects = nil
events = {}
EventCore = {}

function guardarArmas( source )
	if not (source) then return false end
	local cuenta = getPlayerAccount ( source )
	if (cuenta) then
		for i=0, 12 do
			arma 		= getPedWeapon ( source, i )
			municion 	= getPedTotalAmmo ( source, i )
			if arma then
				setAccountData (cuenta, "ARMA"..tostring(i), arma )
			end
			if municion then
				setAccountData (cuenta, "MUNICION"..tostring(i), municion)
			end
		end
	end
end


function obtenerArmas(source)
	if not (source) then 
		return false 
	end
	local cuenta = getPlayerAccount ( source )
	if (cuenta) then
		for i=0, 12 do
			local arma 		= getAccountData(cuenta, "ARMA"..tostring(i))
			local municion 	= getAccountData(cuenta, "MUNICION"..tostring(i))
			if (arma) then
				setElementData (source, "ARMA"..tostring(i), arma )
				if municion then
					giveWeapon ( source, arma, municion )
					setElementData (source, "MUNICION"..tostring(i), municion)
				else
					giveWeapon ( source, arma, 1 )
				end
			end
		end
	end
end

function EventCore.StartEvent(id)
    if (not events[id] or eventInfo) then return false end

    local text_ = textCreateDisplay()
    local text = textCreateTextItem("El minijuego comenzará en: 60 segundos", 0.6,
                                    0.65, "hight", 255, 255, 0, 255, 2, "right",
                                    "bottom", 2)
    textDisplayAddText(text_, text)
    local timer = setTimer(EventCore.BeginTheEvent, 5000, 1)

    local dim = 2

    eventInfo = {
        id = id,
        name = events[id].name,
        maxSlots = events[id].maxSlots,
        minSlots = events[id].minSlots,
        warps = events[id].warpPoses,
        text = text_,
        timer = timer,
        dispText = text,
        disableWeapons = events[id].disableWeapons,
        godmode = events[id].useGodmode,
        dim = dim,
        vehicleID = events[id].warpVehicle,
        allowedVehicleExit = events[id].allowedVehicleExit,
        allowLeaveCommand = events[id].allowLeaveCommand,
        onlyOnePersonPerWarp = events[id].onlyOnePersonPerWarp,
        originalPlayerCount = 0,
        huds = events[id].huds,
    }

    if (eventInfo.onlyOnePersonPerWarp) then
        if (eventInfo.maxSlots > #eventInfo.warps) then
            eventInfo.maxSlots = #eventInfo.warps
        end
        eventInfo.usedWarps = {}
    end

    DummyTimer1 = setTimer(function()
        if (not isTimer(eventInfo.timer)) then
            killTimer(DummyTimer1)
            return
        end
        -- textDisplayRemoveText ( eventInfo.text, eventInfo.dispText )
        -- eventInfo.dispText = textCreateTextItem ( "Event starting in "..math.floor(getTimerDetails(eventInfo.timer)/1000).." seconds...", 0.98, 0.98, "hight", 0, 255, 255, 255, 2, "right", "bottom", 2 ) 
        -- textDisplayAddText ( eventInfo.text, eventInfo.dispText )
        textItemSetText(eventInfo.dispText, "El minijuego comenzará en: " ..
                            math.floor(getTimerDetails(eventInfo.timer) / 1000))
    end, 1000, 0)

	local name = tostring(events[id].name)

    playersInEvent = {}
    eventObjects = {playerItems = {}}
    -- outputChatBox ( "Evento  "..tostring(events[id].name).." minijuego creado! será iniciado en 60 segundos, use /ir para entrar!", root, 255, 255, 255,true);
    exports.Scripts_Dxmessages:outputDx(getRootElement(),
                                        "El minijuego " ..
										name ..
                                            "\n fue iniciado, use /ir para entrar",
                                        0, 255, 0)
    setTimer(infoev, 35000, 1)
    addCommandHandler("ir", EventCore.PlayerJoinEventCommand)
	triggerEvent("NGEvents:onEventCreated", resourceRoot, eventInfo)
	
	--exports.api.discord('Minijuego **'.. name .. '** comensará en 60 segundos')

end
function infoev()
    if (eventInfo) then
        exports.Scripts_Dxmessages:outputDx(getRootElement(),
                                            "Iniciando minijuego,para entrar use \n/ir",
                                            0, 255, 0)
    end
end

function EventCore.PlayerJoinEventCommand(p)
    if (playersInEvent[p]) then
        exports.Scripts_Dxmessages:outputDx(p,
                                            "Usted ya está en un evento",
                                            0, 255, 0)
        return
    end
    if (getElementData(p, "logado")) then
        exports.Scripts_Dxmessages:outputDx(p,
                                            "Usted no ha iniciado sesión en el servidor",
                                            0, 255, 0)
        return
    end
    if (getElementData(p, "preso")) then
        exports.Scripts_Dxmessages:outputDx(p,
                                            "Usted no puede participar en eventos,\npor malas prácticas",
                                            0, 255, 0)
        return
    end
    if (isPedInVehicle(p)) then
        exports.Scripts_Dxmessages:outputDx(p,
                                            "Debe salir del vehículo para entrar\na un evento",
                                            0, 255, 0)
        return
    end
    if getPlayerWantedLevel(p) > 0 then
        exports.Scripts_Dxmessages:outputDx(p,
                                            "No puede entrar a un minijuego con nivel\nde búsqueda",
                                            0, 255, 0)
        return
    end
    if getElementInterior(p) > 0 then
        exports.Scripts_Dxmessages:outputDx(p,
                                            "Debe estar en el interior 0 para poder\nentrar a un evento",
                                            0, 255, 0)
        return
    end
    if getElementDimension(p) > 0 then
        exports.Scripts_Dxmessages:outputDx(p,
                                            "Debe estar en la dimensión 0 para poder\nentrar a un evento",
                                            0, 255, 0)
        return
    end
    local rSlots = eventInfo.maxSlots - table.len(playersInEvent)
    if (rSlots <= 0) then
        exports.Scripts_Dxmessages:outputDx(p,
                                            "El minijuego está lleno",
                                            0, 255, 0)
        return
    end
    local px, py, pz = getElementPosition(p)
    playersInEvent[p] = {
        int = getElementInterior(p),
        dim = getElementDimension(p),
        x = px,
        y = py,
        z = pz,
        health = getElementHealth(p),
        weapons = {}
    }

    eventInfo.originalPlayerCount = table.len(playersInEvent)


	guardarArmas(p)

    takeAllWeapons(p)
    triggerClientEvent(p, "evententro", p)
    if (rSlots > 0) then
        exports.Scripts_Dxmessages:outputDx(getRootElement(),
                                            "" ..
                                                getPlayerName(p) ..
                                                " Entró al evento.\nQuedan [" ..
                                                rSlots .. "] cupos disponibles ",
                                            0, 255, 0)
    else
        exports.Scripts_Dxmessages:outputDx(getRootElement(),
                                            "" ..
                                                getPlayerName(p) ..
                                                " Entró al evento.\nEvento lleno [" ..
                                                rSlots .. "] cupos disponibles ",
                                            0, 255, 0)
    end
    local warps = eventInfo.warps
    local x, y, z, r = unpack(warps[math.random(table.len(warps))])
    if (eventInfo.onlyOnePersonPerWarp) then
        while (eventInfo.usedWarps[table.concat({x, y, z}, ",")]) do
            x, y, z, r = unpack(warps[math.random(table.len(warps))])
        end
    end

    setElementInterior(p, 0)	
    setElementDimension(p, eventInfo.dim)

    local x = x + (math.random(-0.7, 0.7))
    local y = y + (math.random(-0.7, 0.7))
    setElementPosition(p, x, y, z + 0.3)
    if (not isPedInVehicle(p)) then
        setPedRotation(p, r)
    else
        setPedRotation(getPedOccupiedVehicle(p), r)
    end
    setElementAlpha(p, 200)
    textDisplayAddObserver(eventInfo.text, p)
    setElementData(p, "isGodmodeEnabled", true)
    toggleControl(p, "fire", false)
    toggleControl(p, "next_weapon", false)
    toggleControl(p, "previous_weapon", false)
    toggleControl(p, "forwards", false)
    toggleControl(p, "backwards", false)
    toggleControl(p, "left", false)
    toggleControl(p, "right", false)
    toggleControl(p, "jump", false)
    setPedWeaponSlot(p, 0)
    setElementData(p, "events:IsPlayerInEvent", true)
    addEventHandler("onPlayerWasted", p, EventCore.RemovePlayerByWasted)
    triggerEvent("NGEvents:onPlayerJoinEvent", p)

    outputChatBox(tostring(eventInfo.huds))
    if (eventInfo.huds) then
        triggerClientEvent(p,'onHunds',root,eventInfo.huds)
    end

    if (eventInfo.vehicleID) then
        eventObjects.playerItems[p] = createVehicle(eventInfo.vehicleID, x, y,
                                                    z, 0, 0, r)
        setElementData(eventObjects.playerItems[p], "VOwner", p)
        setElementDimension(eventObjects.playerItems[p], eventInfo.dim)
        warpPedIntoVehicle(p, eventObjects.playerItems[p])
        setCameraTarget(p, p)
        toggleControl(p, "vehicle_fire", false)
        toggleControl(p, "vehicle_secondary_fire", false)
        toggleControl(p, "vehicle_left", false)
        toggleControl(p, "vehicle_right", false)
        toggleControl(p, "vehicle_right", false)
        toggleControl(p, "vehicle_forward", false)
        toggleControl(p, "vehicle_backward", false)
        toggleControl(p, "accelerate", false)
        toggleControl(p, "brake_reverse", false)
        setElementFrozen(eventObjects.playerItems[p], true)

        setElementHealth(eventObjects.playerItems[p],9999999)

        if (not eventInfo.allowedVehicleExit) then
            addEventHandler("onVehicleStartExit", eventObjects.playerItems[p],
                            function(p) cancelEvent() end)
        end
    end
end

function EventCore.BeginTheEvent()
    if (isTimer(DummyTimer1)) then killTimer(DummyTimer1) end
	
	removeCommandHandler("ir", _G['EventCore.PlayerJoinEventCommand'])

    if (not eventInfo) then return end

    textDestroyDisplay(eventInfo.text)
    eventInfo.text = nil

    if (#EventCore.GetPlayersInEvent() < eventInfo.minSlots) then
        for i, v in pairs(EventCore.GetPlayersInEvent()) do
            InfoEvento(v,
                       "Evento cancelado por falta de participantes",
                       0, 255, 0)
        end
        EventCore.EndEvent()
        return
    end
    for i, v in pairs(EventCore.GetPlayersInEvent()) do
        InfoEvento(v, "Evento iniciado", 255, 0, 0)
        InfoEvento(v, "Evento iniciado", 0, 255, 0)
        InfoEvento(v, "Evento iniciado", 0, 0, 255)
        InfoEvento(v, "Evento iniciado", 0, 255, 255)
        InfoEvento(v, "Evento iniciado", 255, 255, 255)
    end
    eventStartFunctions[eventInfo.id]()
    for i, p in pairs(EventCore.GetPlayersInEvent()) do

        local timer = getElementData(p,'minHeight')
        if isTimer(timer) then killTimer(timer) end

		setElementData(p, "isGodmodeEnabled", eventInfo.godmode)
		toggleControl(p, "jump", true)
        toggleControl(p, "fire", not eventInfo.disableWeapons)
        toggleControl(p, "next_weapon", not eventInfo.disableWeapons)
        toggleControl(p, "previous_weapon", not eventInfo.disableWeapons)
        toggleControl(p, "forwards", true)
        toggleControl(p, "backwards", true)
        toggleControl(p, "left", true)
        toggleControl(p, "right", true)
        toggleControl(p, "vehicle_fire", true)
        toggleControl(p, "vehicle_secondary_fire", true)
        toggleControl(p, "vehicle_left", true)
        toggleControl(p, "vehicle_right", true)
        toggleControl(p, "vehicle_right", true)
        toggleControl(p, "vehicle_forward", true)
        toggleControl(p, "vehicle_backward", true)
        toggleControl(p, "accelerate", true)
        toggleControl(p, "brake_reverse", true)
        setElementAlpha(p, 255)
        eventoi = true
        if (isElement(eventObjects.playerItems[p])) then
            setElementFrozen(eventObjects.playerItems[p], false)
		end

    end
    triggerEvent("NGEvents:onEventStarted", resourceRoot)
    eventoi = true
    setElementData(getRootElement(), "tempodeevento", 320)
    setTimer(function()
        for i, v in pairs(EventCore.GetPlayersInEvent()) do
            if (getElementAlpha(v) == 200) then
                InfoEvento(v,
                           "El minijuego tuvo un fallo",
                           0, 255, 0)
                EventCore.EndEvent()
                break
            end
        end
    end, 800, 1)

end

function table.len(tb)
    local c = 0
    for i, v in pairs(tb) do c = c + 1 end
    return c
end

addEventHandler("onResourceStop", resourceRoot, function()
    if (eventInfo) then
        for i, v in pairs(playersInEvent) do
            if (isElement(i)) then
                EventCore.RemovePlayerFromEvent(i, false)
                InfoEvento(i, "Evento no disponible",
                           0, 255, 0)
            end
        end
    end
end)

function EventCore.GetPlayersInEvent()
    local c = {}
    for i, v in pairs(playersInEvent) do
        if (isElement(i)) then
            table.insert(c, i)
        else
            playersInEvent[i] = nil
        end
    end
    return c
end

function EventCore.RemovePlayerByWasted()
    EventCore.RemovePlayerFromEvent(source, false)
    -- outputChatBox ( getPlayerName ( source ).." !", root, 255, 255, 0 )
end

function EventCore.EndEvent()
    for i, v in ipairs(EventCore.GetPlayersInEvent()) do
        EventCore.RemovePlayerFromEvent(v, true)
    end

    setTimer(function()
        if (isTimer(DummyTimer1)) then killTimer(DummyTimer1) end
        if (eventInfo and eventInfo.text) then
            textDestroyDisplay(eventInfo.text)
        end
        removeCommandHandler("ir", _G['EventCore.PlayerJoinEventCommand'])
        triggerEvent("NGEvents:onEventEnded", resourceRoot, eventInfo)
        playersInEvent = nil
        eventInfo = nil
    end, 700, 1)
end

function EventCore.RemovePlayerFromEvent(p, reset)
    if (not playersInEvent[p]) then return false end
    removeEventHandler("onPlayerWasted", p, EventCore.RemovePlayerByWasted)
	toggleControl(p, "jump", true)
	toggleControl(p, "fire", true)
    toggleControl(p, "next_weapon", true)
    toggleControl(p, "previous_weapon", true)
    setElementData(p, "isGodmodeEnabled", false)
    toggleControl(p, "forwards", true)
    toggleControl(p, "backwards", true)
    toggleControl(p, "left", true)
    toggleControl(p, "right", true)
    toggleControl(p, "vehicle_fire", true)
    toggleControl(p, "vehicle_secondary_fire", true)
    toggleControl(p, "vehicle_left", true)
    toggleControl(p, "vehicle_right", true)
    toggleControl(p, "vehicle_right", true)
    toggleControl(p, "vehicle_forward", true)
    toggleControl(p, "vehicle_backward", true)
    toggleControl(p, "accelerate", true)
    toggleControl(p, "brake_reverse", true)
    setElementAlpha(p, 255)
    setElementDimension(p, 0)
    setElementData(p, "events:IsPlayerInEvent", false)
    if (isElement(eventObjects.playerItems[p])) then
        destroyElement(eventObjects.playerItems[p])
        eventObjects.playerItems[p] = nil
    end
    
    triggerClientEvent(p,'toggleBR',root,false)

    if reset then
        setTimer(function(p, pData)
            local x, y, z = tonumber(pData.x), tonumber(pData.y),
                            tonumber(pData.z)
            takeAllWeapons(p)
            setElementInterior(p, pData.int)
            setElementDimension(p, pData.dim)
            setElementPosition(p, x, y, z + 0.5)
            setCameraTarget(p, p)
            setElementHealth(p, pData.health)
			obtenerArmas(p)

        end, 500, 1, p, playersInEvent[p])
    else
		killPed(p)
		obtenerArmas(p)
	end

	local timer = getElementData(p,'minHeight')
	if isTimer(timer) then killTimer(timer) end
	
    triggerEvent("NGEvents:onPlayerRemovedFromEvent", p)
    playersInEvent[p] = nil

    local c = EventCore.GetPlayersInEvent()
    if (#c == 0) then
        EventCore.EndEvent();
    elseif (#c == 1) then
        for i, v in pairs(c) do
            EventCore.WinPlayerEvent(i)
            break
        end
    end

end

function isPlayerInEvent(p)
    if playersInEvent[p] then
        return true
    else
        return false
    end
end

function getEventInfo() return eventInfo end

function tempoeve()
    if eventoi == true then
        if (eventInfo) then
            tempoevento = tonumber(getElementData(getRootElement(),
                                                  "tempodeevento")) or 0
            setElementData(getRootElement(), "tempodeevento", tempoevento - 1)
            for i, v in pairs(EventCore.GetPlayersInEvent()) do
                setElementData(v, "tempodeevento", tempoevento - 1)
            end
            -- outputChatBox(tempoevento)
            if tempoevento <= 1 then
                eventoi = false
                local va = EventCore.GetPlayersInEvent()
                vencedoraleatorio = getRandomPlayer(va)
                EventCore.WinPlayerEvent(vencedoraleatorio)
                for i, v in pairs(EventCore.GetPlayersInEvent()) do
                    InfoEvento(v,
                               "El tiempo del minijuego terminó y se eligió a un participante al azar como ganador",
                               0, 255, 0)
                    InfoEvento(v,
                               "Vencedor Aleatorio: " ..
                                   getPlayerName(vencedoraleatorio) .. "", 0,
                               255, 0)
                end
            end
        end
    end
end
setTimer(tempoeve, 1000, 0)

function EventCore.WinPlayerEvent(p)
    if (isElement(p)) then
        local a = math.random(500, 2500) * eventInfo.originalPlayerCount
        for i, v in pairs(EventCore.GetPlayersInEvent()) do
            -- outputChatBox ( "Recibiste  $"..a.." por ganar el minijuego "..eventInfo.name.."", 255, 255, 0 )
            InfoEvento(v,
                       "" .. getPlayerName(p) ..
                           "recibió  $" .. a .. " por ganar el minijuego " ..
                           eventInfo.name .. "", 0, 255, 0)
        end
		givePlayerMoney(p, a)
		
		local timer = getElementData(p,'minHeight')
		if isTimer(timer) then killTimer(timer) end

        EventCore.EndEvent()
        eventoi = false
        return true
    end
    return false
end

function IsPlayerStaff(thePlayer)
    local account = getPlayerAccount(thePlayer)
    local InStaff = false
    for _, group in ipairs({"Console", "Admin", "SuperModerator", "Moderator"}) do
        if isObjectInACLGroup("user." .. getAccountName(account),
                              aclGetGroup(group)) then
            InStaff = true
            break
        end
    end

    return InStaff
end

addCommandHandler("einiciar", function(p, cmd, id)
    if (IsPlayerStaff(p)) then
        if (not tonumber(id)) then
            return outputChatBox("Uso: /" .. cmd .. " [minijuego id(1-" ..
                                     table.len(events) .. ")]", p, 255, 255, 0)
        end
        local id = tonumber(id)
        if (not events[id]) then
            return outputChatBox(
                       "ID de minijuego no válido. Rangos válidos de 1 a " ..
                           table.len(events) .. ".", p, 255, 255, 0)
        end
        if (eventInfo) then
            return outputChatBox("Ya existe un minijuego en curso", p, 255, 255, 0)
        end
        outputServerLog(getPlayerName(p) .. " inició un evento:" ..
                            events[id].name .. " (id:" .. id .. ")")
        EventCore.StartEvent(id)
    end
end)

addCommandHandler("eparar", function(p)
    if (IsPlayerStaff(p)) then
        if (not eventInfo) then
            exports.Scripts_Dxmessages:outputDx(p,
                                                "No hay eventos en curso",
                                                0, 255, 0)
            return
        end
        outputServerLog(getPlayerName(p) .. " finalizó el minijuego (event: " ..
                            eventInfo.name .. ")")
        for i, v in pairs(EventCore.GetPlayersInEvent()) do
            InfoEvento(v, "Evento cancelado por :" ..
                           getPlayerName(p) .. "", 0, 255, 0)
        end
        EventCore.EndEvent()
    end
end)

addCommandHandler("esalir", function(p)
    if (eventInfo) then end
    if (isPlayerInEvent(p)) then
        if (not eventInfo.allowLeaveCommand) then
            exports.Scripts_Dxmessages:outputDx(p,
                                                "No puedes dejar el evento",
                                                0, 255, 0)
            return
        end
        EventCore.RemovePlayerFromEvent(p, true)
        for i, v in pairs(EventCore.GetPlayersInEvent()) do
            InfoEvento(v, "" .. getPlayerName(p) ..
                           "Salir del Evento", 0, 255, 0)
        end
    else
        -- InfoEvento(source,  "No estás en un evento",0,255,0)	
    end
end)

addCommandHandler("ehelp", function(p)
    outputChatBox("----- SOPORTE -----", p, 255, 255, 255)
    outputChatBox("/ir - Para entrar en un evento", p, 255, 255, 255)
    outputChatBox("/esalir - Para salir de un evento", p, 255, 255, 255)
    if (isPlayerInACL(p, 'Console')) or (isPlayerInACL(p, 'Admin')) or
        (isPlayerInACL(p, 'SuperModerator')) or (isPlayerInACL(p, 'Moderator')) then
        outputChatBox("----- SOPORTE -----", p, 255, 255, 255)
        outputChatBox("/einiciar [1-12] - Para crear un evento", p, 255, 255,
                      255)
        for i, v in pairs(events) do
            outputChatBox("        " .. tostring(i) .. " -> " ..
                              tostring(v.name), p, 255, 255, 255);
        end
        outputChatBox("/eparar - Para detener un evento", p, 255, 255, 255)
    end
end)

addEvent("NGEvents:onEventCreated", true)
addEvent("NGEvents:onPlayerJoinEvent", true)
addEvent("NGEvents:onEventStarted", true)
addEvent("NGEvents:onEventEnded", true)
addEvent("NGEvents:onPlayerRemovedFromEvent", true)

function removewater() killPed(source) end
addEvent("removeinwater", true)
addEventHandler("removeinwater", getRootElement(), removewater)

-- create event every 12 minutes 30 seconds
local lastRanEvent = nil
setTimer(function()
    local id = math.random(table.len(events))
    while (lastRanEvent == id or (not events[id])) do
        id = math.random(table.len(events))
    end

    -- exports.NGLogs:outputServerLog ( "Event: Server automatically started the "..events[id].name.." event (id:"..tostring(id)..")" )
    exports.Scripts_Dxmessages:outputDx(getRootElement(),
                                        "Evento automatico iniciado. [" ..
                                            events[id].name .. "]", 0, 255, 0)
    EventCore.StartEvent(id)
end, 1000 * 60 * 10, 0)

function InfoEvento(player, text, r, g, b)
    if (player and text and r and g and b) then
        triggerClientEvent(player, "notifctopo", player, text, r, g, b)
    end
end

function minHeight(id)

	for i, player in pairs(getElementsByType('player')) do
		if ( getElementData ( player, "events:IsPlayerInEvent" ) ) then
			local timer = setTimer(function(thePlayer,event)
				local x,y,z = getElementPosition(thePlayer)

				if z < event.minHeight then
					local warps = event.warpPoses
					
					local x, y, z, r = unpack(warps[math.random(table.len(warps))])

					setElementPosition(thePlayer, x, y, z + 0.3)

				end
					
			end,100,0,player,events[id])

			setElementData(player,'minHeight',timer)
		end
	end

end



function giveWeapons(id)

	for i, player in pairs(getElementsByType('player')) do
		if ( getElementData ( player, "events:IsPlayerInEvent" ) ) then
            
            for i,data in ipairs(events[id].weapons) do 
                giveWeapon(player,data[1],data[2])
            end


		end
	end

end

function toggleBRS(id)

	for i, player in pairs(getElementsByType('player')) do
		if ( getElementData ( player, "events:IsPlayerInEvent" ) ) then
            
            setElementData(player,'walls',10)

            triggerClientEvent(player,'toggleBR',root,true)


		end
	end

end



markers = {}

function sendCheckpoints(id)
    
    
    
	for i,checkpoint in ipairs(events[id].checkpoints) do 
    
        
        
		local marker = createMarker(checkpoint[2],checkpoint[3],checkpoint[4])
		--local blip = createBlipAttachedTo(marker)
        

        
		setElementData(marker,'id',i)
                
        setElementDimension(marker,2)
        
        table.insert(markers,marker)

		--setElementDimension(blip,2)
		
        addEventHandler("onMarkerHit", marker, function(vehicle, dim)
            if getElementType( vehicle ) ~= 'vehicle' then return end
        


            local checkpointid = getElementData(marker,'id')
            local player = getVehicleOccupant (vehicle)
    
            
            
            if isElementVisibleTo(marker,player) == false then return end
            
            if checkpointid == #events[id].checkpoints then
                EventCore.WinPlayerEvent( player )
                return
            end

            
            setElementData(player,'checkpoint',checkpointid+1)
            
            outputChatBox(getElementData(player, 'checkpoint'))
            
            setElementModel(vehicle,events[id].checkpoints[checkpointid][1])
            
            setElementVisibleTo(marker,player,false)
            setElementVisibleTo(marker,root,false)

            setElementVisibleTo(markers[checkpointid+1],player,true)

            setElementVisibleTo(markers[checkpointid+1],root,true)


        end)	
        
	end
    
    -- todo: cambiar root por player
    
    for i, player in pairs(getElementsByType('player')) do
        if ( getElementData ( player, "events:IsPlayerInEvent" ) ) then
            outputChatBox('player')
          --  triggerClientEvent(player,'onCheckpoints',root,player,events[id].checkpoints,events[id].vehicles,id)
            setElementData(player, 'checkpoint',0)

            for j,marker in ipairs(markers) do 
                setElementVisibleTo(marker,root,false)
                setElementVisibleTo(marker,player,false)

                outputChatBox('invisible')
                if j == 1 then
                    outputChatBox('visible')
                    setElementVisibleTo(marker,root,true)
                    setElementVisibleTo(marker,player,true)

                end
            end

        end
    end
end

