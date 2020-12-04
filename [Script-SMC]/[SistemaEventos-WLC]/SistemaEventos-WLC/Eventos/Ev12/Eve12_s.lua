events[12] = { 
	name 						= 'PARKOUR #2',
	maxSlots 					= 50,
	minSlots 					= 1,
	warpPoses = {
		-- { x, y, z, rot },
		{-2894.49780,2901.84766,5335.16406,259.94982910156},
		{-2893.89648,2905.84692,5335.16406,354.3366394043},
		{-2893.51563,2909.68481,5335.16406,354.3366394043},
		{-2892.80859,2914.60449,5335.16406,351.82992553711},
		{-2891.90820,2919.17578,5335.16406,348.69653320313},
		{-2890.55396,2914.73413,5335.16406,191.64251708984},
		{-2890.17871,2912.68994,5335.16406,190.38917541504},
		{-2889.85693,2910.75073,5335.16406,189.44915771484},
		{-2891.00415,2906.76050,5335.16406,163.75555419922},
		{-2895.23267,2907.79102,5335.16406,73.828063964844},
		{-2890.24829,2904.53931,5335.16406,241.46299743652},
		{-2885.96533,2910.98169,5335.16992,325.75045776367},
		{-2884.28052,2904.30859,5335.16992,192.26922607422},
		{-2886.52637,2900.49902,5335.16406,149.02880859375},
		{ -2892.76904,2909.46533,5335.16406,34.347778320313},
		{-2889.33643,2911.09985,5335.16406,288.75341796875},

 

		
	},
	
	disableWeapons 				= true,
	useGodmode 					= true,
	allowedVehicleExit 			= false,
	allowPositionOffset 		= true,
	allowLeaveCommand			= true,
	onlyOnePersonPerWarp		= false,
	minHeight                   = 5325,
}

function StartParkour2 ( ) 
	local m = createMarker (-3015.53784,3337.36670,5215.82910, "checkpoint", 5, 255, 0, 0, 120 )
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
	
	minHeight(12)

	return true
end

eventStartFunctions[12] = _G['StartParkour2']
StartParkour2 = nil