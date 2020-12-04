iv = 0

function toggleAdminCam ( player, commandName )
	if not isPedInVehicle( player ) then
		if isPlayerFreecamEnabled( player ) then
			setPlayerFreecamDisabled( player )
		elseif isElementAttached( player ) then
			outputChatBox( "You can't use this function.", player, 255, 0, 0 )
		else
			setPlayerFreecamEnabled( player )
		end
	else
		outputChatBox( "You can't use this in a vehicle.", player, 255, 0, 0 )
	end
end
addCommandHandler( "admincam",toggleAdminCam,true)

function stopAdminCam ( )
	if isPlayerFreecamEnabled( source ) then
		setPlayerFreecamDisabled( source )
	end
end
addEventHandler( "onPlayerLogout", root, stopAdminCam)
addEventHandler( "onResourceStop", resourceRoot, stopAdminCam)
