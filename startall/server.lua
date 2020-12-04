function startAll( player )
	for index, resource in ipairs ( getResources ( ) ) do
		if getResourceState ( resource ) == "loaded" then
			if not startResource ( resource ) then
				outputServerLog( "startall: Ha fallado el inicio de la resource '" .. getResourceName ( resource ) .. "' ." )
			end
		end
	end
	--outputServerLog( "startall: Todas las resources han sido iniciadas. " .. " (Solicitado por " .. ( not player and "Consola" or getAccountName( getPlayerAccount( player ) ) or getPlayerName(player) ) .. ")" )
	if player then
		outputChatBox ( "Todos los recursos han sido iniciados.", player, 0, 255, 153 )
	end
end
--addCommandHandler("startall", startAll)
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), startAll)