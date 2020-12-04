events[8] = { 
	name 						= 'RACHA #3',	-- The event name
	maxSlots 					= 25,				-- The max players for the event
	minSlots 					= 3,				-- The required amount of players
	warpPoses = {									-- Positions players will warp to on start
		-- { x, y, z, rot },
		{-2354.74585,-1626.01477,483.34430,219.27981567383},			
		{-2351.12891,-1622.18738,483.33469,220.31379699707},			
		{-2348.26782,-1619.55591,483.32611,224.85803222656},			
		{-2345.93945,-1616.69885,483.32864,228.83946228027},			
		{-2343.00415,-1613.68909,483.35275,229.18251037598},			
		{-2340.74951,-1610.84998,483.37054,232.20129394531},			
		{-2338.38086,-1608.00635,483.38748,231.90187072754},			
		{-2336.71875,-1605.13062,483.39658,235.02777099609},			
		{-2334.55444,-1602.06506,483.40680,237.24493408203},			
		{-2332.31445,-1598.68250,483.41675,234.56303405762},			
		{-2330.55396,-1596.11047,483.41055,236.84941101074},			
		{-2316.98804,-1598.09155,483.54544,220.08013916016},			
		{-2319.83911,-1600.58179,483.53815,217.97840881348},			
		{-2320.42090,-1604.25916,483.51123,238.01263427734},			
		{-2322.46289,-1608.14160,483.46075,237.72525024414},			
		{-2324.91333,-1612.05713,483.40707,250.93299865723},			
		{-2325.72583,-1615.98047,483.38980,256.00299072266},			
		{-2326.53589,-1619.29431,483.38239,250.9548034668},			
		{-2328.16406,-1622.31775,483.38300,242.45391845703},			
		{-2329.79102,-1625.63086,483.37924,237.87370300293},			
		{-2331.52051,-1629.07166,483.37607,238.70062255859},			
		{-2333.27783,-1633.20349,483.37540,241.20199584961},			
		{-2335.67163,-1636.95520,483.37466,234.83197021484},			
		{-2338.42676,-1643.73083,483.37521,236.4228515625},			
		{-2305.00586,-1662.05798,483.33405,200.78877258301},			
		
	},
	
	disableWeapons 				= true,				-- Force no weapons
	useGodmode 					= true,				-- Set players in godmode for the whole event
	warpVehicle 				= 568,				-- Model ID for players to be warped to, use false for none
	allowedVehicleExit 			= false,			-- Allow players to exit the vehicle
	allowPositionOffset 		= true,				-- Position offset for warps, used so players don't warp into each other
	allowLeaveCommand			= true,				-- Enable the player to use /leaveevent
	onlyOnePersonPerWarp		= true				-- When set to true, only person can spawn at each warp
}


function StartRace3 ( ) 
	local m = createMarker ( -91.62937,-1170.83984,0.05643, "checkpoint", 10, 0, 255, 255, 120 )
	local m2 = createBlip (-91.62937,-1170.83984,2.05643, 0, 5, 0, 255, 0,255, 0, 55000,p)
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

eventStartFunctions[8] = _G['StartRace3']
StartRace3 = nil