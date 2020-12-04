events[9] = { 
	name 						= 'CARRERA #4',	-- The event name
	maxSlots 					= 40,				-- The max players for the event
	minSlots 					= 3,				-- The required amount of players
	warpPoses = {									-- Positions players will warp to on start
		-- { x, y, z, rot },
		{-2271.88770,2285.89380,4.33852,270.55435180664},			
		{-2271.28198,2289.07617,4.33852,269.52117919922},			
		{-2271.34180,2292.07227,4.33853,270.49792480469},			
		{-2271.46265,2295.08569,4.33852,270.35922241211},			
		{-2270.62256,2297.89160,4.33852,270.10202026367},			
		{-2271.70020,2301.14600,4.33852,269.83361816406},			
		{-2272.18286,2306.77222,4.33853,270.54446411133},			
		{-2271.38867,2309.81421,4.33861,269.2236328125},			
		{-2271.97363,2312.84814,4.33852,271.03713989258},			
		{-2271.98560,2315.77588,4.33858,270.59887695313},			
		{-2271.94653,2318.88794,4.33851,269.22839355469},			
		{-2271.06104,2321.77832,4.33852,270.63214111328},			
		{-2271.60327,2324.79492,4.33850,269.93502807617},			
		{-2271.51245,2327.63818,4.33381,268.78927612305},			
		{-2271.69165,2330.77222,4.33454,269.00637817383},			
		{-2271.14600,2333.70728,4.33082,270.65798950195},			
		{-2271.95630,2336.57275,4.33083,269.72341918945},			
		{-2253.28394,2284.57593,4.33851,90.655975341797},			
		{-2253.41602,2287.48828,4.33852,90.004638671875},			
		{-2252.98022,2290.45142,4.33479,88.85595703125},			
		{-2252.26660,2293.36377,4.33353,89.726684570313},			
		{-2251.95581,2296.55664,4.33083,89.998229980469},			
		{-2253.05933,2299.60107,4.33082,90.227020263672},			
		{-2251.67896,2302.52441,4.33083,89.810028076172},			
		{-2252.08691,2305.55371,4.33082,90.189819335938},			
		{-2252.40259,2308.63892,4.33089,90.778900146484},			
		{-2251.84546,2311.45752,4.33083,91.482238769531},			
		{-2253.17041,2314.52368,4.33082,90.580322265625},			
		{-2252.86597,2317.34961,4.33083,89.206756591797},			
		{-2252.13184,2320.31592,4.33083,89.150787353516},			
		{-2252.31909,2323.48584,4.33082,92.18115234375},			
		{-2252.74683,2326.38232,4.33083,89.080963134766},			
		{-2252.83765,2329.60693,4.33082,89.614013671875},			
		{-2252.34912,2332.18555,4.33082,90.167297363281},			
		{-2251.61621,2335.38770,4.33081,89.292755126953},			
		{-2262.90820,2285.41602,4.33852,1.2246398925781},			
		{-2263.08252,2293.53394,4.33852,1.2245788574219},			
		{-2263.12524,2307.26025,4.33852,0.12335205078125},			
		{-2261.94067,2323.61890,4.33085,359.04190063477},			
		{-2262.48633,2338.95166,4.33074,13.458709716797},
		

	},
	
	disableWeapons 				= true,				-- Force no weapons
	useGodmode 					= true,				-- Set players in godmode for the whole event
	warpVehicle 				= 411,				-- Model ID for players to be warped to, use false for none
	allowedVehicleExit 			= false,			-- Allow players to exit the vehicle
	allowPositionOffset 		= true,				-- Position offset for warps, used so players don't warp into each other
	allowLeaveCommand			= true,				-- Enable the player to use /leaveevent
	onlyOnePersonPerWarp		= true				-- When set to true, only person can spawn at each warp
}


function StartRace4 ( ) 
	local m = createMarker (2787.19995,2562.27905,0.55887, "checkpoint", 5, 0, 255, 255, 120 )
	local m2 = createBlip (2787.19995,2562.27905,9.55887, 0, 5, 0, 255, 0,255, 0, 55000,p)
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

eventStartFunctions[9] = _G['StartRace4']
StartRace4 = nil