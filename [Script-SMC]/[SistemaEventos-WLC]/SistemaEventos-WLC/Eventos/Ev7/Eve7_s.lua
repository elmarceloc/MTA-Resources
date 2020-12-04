events[7] = { 
	name 						= 'RACHA #2',	-- The event name
	maxSlots 					= 36,				-- The max players for the event
	minSlots 					= 3,				-- The required amount of players
	warpPoses = {									-- Positions players will warp to on start
		-- { x, y, z, rot },
		{2499.72168,-1655.28870,13.46900,96.572021484375},			
		{2499.78687,-1657.17786,13.44608,84.821350097656},			
		{2499.62622,-1658.93420,13.42143,84.337890625},			
		{2499.49756,-1660.37329,13.41331,88.906555175781},			
		{2499.46362,-1661.28711,13.41226,89.831268310547},			
		{2499.77222,-1662.31738,13.41477,97.255065917969},			
		{2498.94019,-1663.57617,13.40736,90.579742431641},			
		{2498.40039,-1664.64026,13.39999,88.430877685547},			
		{2498.36206,-1665.83118,13.40000,89.549560546875},			
		{2498.41260,-1667.02063,13.40039,87.011169433594},			
		{2498.49805,-1668.20605,13.40028,87.588043212891},			
		{2498.58325,-1669.33105,13.39447,86.828002929688},			
		{2498.69653,-1670.29382,13.39814,92.711578369141},			
		{2498.72656,-1671.39832,13.39689,92.278564453125},			
		{2498.63867,-1672.46069,13.39661,91.487182617188},			
		{2498.61426,-1673.46448,13.39804,90.955657958984},			
		{2498.63159,-1674.25134,13.39071,92.909057617188},			
		{2498.69434,-1675.23157,13.39771,89.673858642578},			
		{2498.74390,-1676.02576,13.40092,88.228607177734},			
		{2498.87451,-1676.95081,13.40772,88.876647949219},			
		{2498.95117,-1677.82703,13.41264,91.041198730469},			
		{2499.09814,-1678.76514,13.41202,92.824401855469},			
		{2499.10083,-1680.04944,13.41358,89.813598632813},			
		{2499.35352,-1681.31042,13.41726,91.479187011719},			
		{2499.42700,-1682.78345,13.42116,90.360534667969},			
		{2492.42627,-1682.82556,13.39178,90.342498779297},			
		{2492.49902,-1680.86194,13.39178,85.702484130859},			
		{2492.69067,-1678.32190,13.39044,88.930969238281},			
		{2492.77124,-1676.25549,13.39249,90.441436767578},			
		{2492.77026,-1674.78528,13.38921,94.006103515625},			
		{2492.73682,-1673.07153,13.40156,93.955993652344},			
		{2492.71265,-1670.90588,13.39053,90.473571777344},			
		{2492.30664,-1668.58630,13.39807,90.222290039063},			
		{2492.54224,-1666.29358,13.39787,89.623077392578},			
		{2492.48120,-1664.14868,13.39860,86.731506347656},			
		{2477.96094,-1660.78027,13.40650,91.099365234375},			
			
		
		


	},
	
	disableWeapons 				= true,				-- Force no weapons
	useGodmode 					= true,				-- Set players in godmode for the whole event
	warpVehicle 				= 468,				-- Model ID for players to be warped to, use false for none
	allowedVehicleExit 			= false,			-- Allow players to exit the vehicle
	allowPositionOffset 		= true,				-- Position offset for warps, used so players don't warp into each other
	allowLeaveCommand			= true,				-- Enable the player to use /leaveevent
	onlyOnePersonPerWarp		= true				-- When set to true, only person can spawn at each warp
}


function StartRace2 ( ) 
	local m = createMarker ( 835.01123,-2064.00659,5.92110, "checkpoint", 10, 0, 255, 255, 120 )
	local m2 = createBlip (835.01123,-2064.00659,12.92110, 0, 5, 0, 255, 0,255, 0, 55000,p)
	setElementDimension ( m, eventInfo.dim )
	setElementDimension ( m2, eventInfo.dim )
	addEventHandler ( "onMarkerHit", m, function ( p )
		if ( not isElement ( p ) ) then
			return
		end
		
		if ( getElementType ( p ) == "player" and getElementDimension ( p ) == getElementDimension ( source ) and getElementInterior ( p ) == 0 ) then
			if ( getElementData ( p, "events:IsPlayerInEvent" ) and isPedInVehicle ( p ) ) then
				EventCore.WinPlayerEvent( p )
				destroyElement ( source )
				destroyElement ( m2 )
			end
		end
	end )
	
	return true
end

eventStartFunctions[7] = _G['StartRace2']
StartRace2 = nil