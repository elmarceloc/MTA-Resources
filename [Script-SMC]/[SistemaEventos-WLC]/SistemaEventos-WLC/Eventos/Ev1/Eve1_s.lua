events[1] = { 
	name 						= 'BATE-BATE #1',	-- The event name
	maxSlots 					= 20,				-- The max players for the event
	minSlots 					= 3,				-- The required amount of players
	warpPoses = {									-- Positions players will warp to on start
		-- { x, y, z, rot },
		{3723.49097,-2167.08472,8.72656,357.85916137695},		
		{3717.62988,-2166.80566,8.72858,359.37326049805},	
		{3710.64771,-2167.04980,8.72754,0.18948364257813},	
		{3702.54590,-2166.64111,8.72867,359.8154296875},	
		{3693.15039,-2163.89551,8.72661,182.58885192871},	
		{3671.15308,-2094.24854,8.09898,175.72937011719},	
		{3668.55127,-2024.38916,8.10052,133.19976806641},	
		{3634.67944,-2062.05151,8.10186,182.42915344238},	
		{3636.65869,-2137.11255,8.10156,318.31707763672},	
		{3808.76392,-2137.99512,8.72572,88.806579589844},	
		{3795.67090,-2137.72192,8.72888,88.804901123047},	
		{3838.69507,-2106.01245,26.64207,177.32385253906},	
		{3792.86792,-2154.30835,26.63959,89.750732421875},	
		{3723.82446,-2153.73071,0.88989,94.87158203125},	
		{3694.83911,-2101.82202,0.88836,0.11795043945313},	
		{3687.93921,-2079.09717,8.09937,179.37316894531},	
		{3687.20044,-2136.06714,8.10095,92.091552734375},	
		{3635.88184,-2105.83960,8.10157,2.3904113769531},	
		{3632.43286,-2042.46216,8.10152,1.0641784667969},	
		{3672.16040,-2119.00024,8.10076,181.91044616699},	
		
	},
	
	disableWeapons 				= true,				-- Force no weapons
	useGodmode 					= false,				-- Set players in godmode for the whole event
	warpVehicle 				= 415,				-- Model ID for players to be warped to, use false for none
	allowedVehicleExit 			= false,			-- Allow players to exit the vehicle
	allowPositionOffset 		= true,				-- Position offset for warps, used so players don't warp into each other
	allowLeaveCommand			= true,				-- Enable the player to use /leaveevent
	onlyOnePersonPerWarp		= true				-- When set to true, only person can spawn at each warp
}

local thisEventFunctions = { }
function StartBateBate1 ( ) 
addEventHandler ( "onPlayerWasted", root, thisEventFunctions.OnPlayerWasted )
end

function thisEventFunctions.OnPlayerWasted ()
	local plrs = EventCore.GetPlayersInEvent ( )
	local winner = nil
	if ( table.len ( plrs ) == 0 ) then
		winner = source
	elseif ( table.len ( plrs ) == 1 ) then
		for i, v in pairs ( plrs ) do
			winner = v
			removeEventHandler ( "onPlayerWasted", root, thisEventFunctions.OnPlayerWasted )
		end
	end
	if winner then
		EventCore.WinPlayerEvent ( winner )
		removeEventHandler ( "onPlayerWasted", root, thisEventFunctions.OnPlayerWasted )
	end
end



eventStartFunctions[1] = _G['StartBateBate1']
StartBateBate1 = nil



