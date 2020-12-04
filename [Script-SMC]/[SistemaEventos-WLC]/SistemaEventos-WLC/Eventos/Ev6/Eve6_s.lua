events[6] = { 
	name 						= 'RACHA #1',	-- The event name
	maxSlots 					= 33,				-- The max players for the event
	minSlots 					= 1,				-- The required amount of players
	warpPoses = {									-- Positions players will warp to on start
		-- { x, y, z, rot },
		{1812.14075,2259.33911,5.28810,179.99639892578},			
		{1810.92981,2259.29736,5.31372,181.65951538086},			
		{1809.57813,2259.29663,5.29275,186.38487243652},			
		{1808.81873,2259.27295,5.31238,177.88134765625},			
		{1807.93762,2259.18701,5.29543,177.84271240234},			
		{1807.28015,2259.28442,5.31499,182.19134521484},			
		{1806.55591,2259.26831,5.29322,177.13696289063},			
		{1805.32910,2259.30078,5.32110,177.51330566406},			
		{1804.22168,2259.07764,5.30100,178.28210449219},			
		{1803.30078,2259.29590,5.32717,177.62518310547},			
		{1802.58716,2259.25146,5.29915,182.63739013672},			
		{1801.81873,2259.31396,5.32471,178.92333984375},			
		{1793.62292,2259.16650,5.29166,178.02709960938},			
		{1792.11487,2259.04004,5.31828,183.13664245605},			
		{1790.64502,2259.02271,5.29084,179.99719238281},			
		{1789.42188,2259.09448,5.32195,176.86212158203},			
		{1788.45227,2258.72729,5.28980,179.83441162109},			
		{1787.17700,2258.81348,5.30655,174.80505371094},			
		{1786.03833,2258.63257,5.27924,181.16809082031},			
		{1784.84192,2258.80688,5.30856,179.22924804688},			
		{1783.26624,2258.84570,5.28475,178.56103515625},			
		{1781.63647,2259.02417,5.34236,179.98321533203},			
		{1797.80017,2256.71851,5.23451,179.64892578125},			
		{1797.77014,2253.54785,5.18013,179.658203125},			
		{1797.75867,2250.42285,5.13095,179.66564941406},			
		{1797.73962,2247.02856,5.07160,179.6728515625},			
		{1797.70410,2243.70044,5.01926,179.68225097656},			
		{1797.69629,2239.91113,4.94212,179.68981933594},			
		{1797.65967,2236.57715,4.89494,179.69787597656},			
		{1797.58350,2232.40649,4.82287,179.70477294922},			
		{1797.54895,2226.24512,4.71471,179.71441650391},			
		{1804.87207,2219.78223,4.62089,175.68005371094},			
		{1785.83142,2216.64014,4.56058,176.74420166016},			

	},
	checkpoints = {

		{400, 1815.14075,2259.33911,5.28810},			
		{404, 1817.14075,2259.33911,5.28810},			
		{401, 1827.14075,2259.33911,5.28810},			
		{518, 1812.14065,2259.33911,5.28810},			


	},
	
	disableWeapons 				= true,				-- Force no weapons
	useGodmode 					= true,				-- Set players in godmode for the whole event
	warpVehicle 				= 522,				-- Model ID for players to be warped to, use false for none
	allowedVehicleExit 			= false,			-- Allow players to exit the vehicle
	allowPositionOffset 		= true,				-- Position offset for warps, used so players don't warp into each other
	allowLeaveCommand			= true,				-- Enable the player to use /leaveevent
	onlyOnePersonPerWarp		= true,				-- When set to true, only person can spawn at each warp

    huds                        = 'race',

}


function StartRace1 ( ) 
	local m = createMarker ( 2937.67920,-2051.45581,0.60987, "checkpoint", 8, 0, 255, 255, 120 )
	local m2 = createBlip (2937.67920,-2051.45581,3.60987, 0, 5, 0, 255, 0,255, 0, 55000,p)
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

	sendCheckpoints(6)
	
	return true
end

eventStartFunctions[6] = _G['StartRace1']
StartRace1 = nil