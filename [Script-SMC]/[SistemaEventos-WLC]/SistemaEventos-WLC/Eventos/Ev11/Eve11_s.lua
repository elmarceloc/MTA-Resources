events[11] = { 
	name 						= 'PARKOUR #1',
	maxSlots 					= 20,
	minSlots 					= 3,
	warpPoses = {
		-- { x, y, z, rot },
		{ 2214.26758,-2145.39966,757.13440,355.17138671875},
		{ 2211.11328,-2145.25464,757.13440,91.438171386719 },
		{ 2208.32446,-2145.31250,757.13440,91.124847412109 },
		{ 2205.18188,-2145.21802,757.13440,1.4381408691406 },
		{ 2202.35425,-2145.08057,757.13440,91.124847412109 },
		{ 2199.65601,-2145.08081,757.13440,89.798950195313 },
		{ 2196.54932,-2145.04321,757.13440,97.632385253906 },
		{ 2189.46997,-2145.43188,757.13440,306.60427856445 },
		{ 2193.26929,-2145.37549,757.13440,276.52398681641 },
		{ 2217.25732,-2144.18530,757.13440,243.02035522461 },
		{ 2216.06812,-2141.41309,757.13440,71.962127685547 },
		{ 2211.79297,-2140.02100,757.13440,71.962127685547 },
		{ 2208.09204,-2139.78760,757.13440,84.808929443359 },
		{ 2203.86426,-2139.38916,757.13440,84.495574951172 },
		{2198.37085,-2139.50195,757.13440,93.268981933594},
		{ 2195.52393,-2136.36816,757.13440,306.62759399414 },
		{ 2204.43726,-2136.84253,757.13440,267.46057128906 },
		{ 2210.75366,-2135.72485,757.13440,280.30737304688 },
		{ 2216.06934,-2138.70728,757.14203,226.72688293457 },
		{ 2208.55908,-2138.27075,757.13440,83.845520019531 },

		
	},
	
	disableWeapons 				= true,
	useGodmode 					= true,
	allowedVehicleExit 			= false,
	allowPositionOffset 		= true,
	allowLeaveCommand			= true,
	onlyOnePersonPerWarp		= true,
	minHeight                   = 755,
}

function StartParkour1 ( ) 
	local m = createMarker ( 2186.3581542969,-2343.6420898438,780.69232177734, "checkpoint", 5, 255, 0, 0, 120 )
	setElementDimension ( m, eventInfo.dim )
	addEventHandler ( "onMarkerHit", m, function ( p )
	if ( not isElement ( p ) ) then
			return
		end
		
		if ( getElementType ( p ) == "player" and getElementDimension ( p ) == getElementDimension ( source ) and getElementInterior ( p ) == 0 ) then
			if ( getElementData ( p, "events:IsPlayerInEvent" ) ) then
				EventCore.WinPlayerEvent( p )
				destroyElement ( source )
			end
		end
	end )

	minHeight(11)

	return true
end

eventStartFunctions[11] = _G['StartParkour1']
StartParkour1 = nil