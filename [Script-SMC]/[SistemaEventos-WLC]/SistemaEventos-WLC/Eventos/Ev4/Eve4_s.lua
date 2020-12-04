events[4] = { 
	name 						= 'DERBY DEATHMATCH #4',	-- The event name
	maxSlots 					= 17,				-- The max players for the event
	minSlots 					= 3,				-- The required amount of players
	warpPoses = {									-- Positions players will warp to on start
		-- { x, y, z, rot },
		
		{6194.00391,-2391.37305,1.97038,271.58508300781},		
		{6301.30469,-2391.13062,1.97037,359.38732910156},		
		{6301.86084,-2339.04614,1.97325,359.38662719727},		
		{6301.78613,-2289.29199,1.97256,359.49871826172},		
		{6295.88672,-2273.72803,1.97305,89.235809326172},		
		{6268.95850,-2273.36816,1.97220,89.232269287109},		
		{6262.20850,-2293.29272,1.97226,180.13645935059},		
		{6277.48291,-2330.61255,1.96999,87.758239746094},		
		{6243.10107,-2330.89087,1.97318,91.634307861328},		
		{6210.47998,-2297.87695,1.97114,357.37316894531},		
		{6209.33008,-2357.65234,1.97206,359.54956054688},		
		{6229.00293,-2372.95142,11.86607,315.60772705078},		
		{6249.63574,-2351.87939,11.87199,315.60641479492},		
		{6249.57471,-2311.31982,11.87175,43.448547363281},		
		{6273.39014,-2335.73535,11.86992,44.369201660156},		
		{6282.68213,-2345.18945,11.87008,1.4672546386719},		
		{6283.59082,-2316.48804,11.86988,178.99450683594},		
		
		

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
function StartBateBate4 ( ) 
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



eventStartFunctions[4] = _G['StartBateBate4']
StartBateBate4 = nil



