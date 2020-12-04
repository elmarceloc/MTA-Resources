events[3] = { 
	name 						= 'DERBY DEATHMATCH #3',	-- The event name
	maxSlots 					= 20,				-- The max players for the event
	minSlots 					= 3,				-- The required amount of players
	warpPoses = {									-- Positions players will warp to on start
		-- { x, y, z, rot },
		
		{3140.75342,-1765.52185,22.78956,269.80648803711},		
		{3184.88574,-1765.72424,22.80604,269.55004882813},		
		{3234.91113,-1766.17932,22.80571,269.25961303711},		
		{3266.16772,-1774.10718,22.80367,178.88745117188},		
		{3265.63599,-1800.38379,22.80207,178.77484130859},		
		{3265.44897,-1826.21619,22.80532,179.82696533203},		
		{3252.46729,-1853.21265,22.80952,86.843139648438},		
		{3204.93750,-1852.89148,22.80484,91.116729736328},		
		{3154.87134,-1853.75867,22.81008,90.617095947266},		
		{3137.68628,-1838.34973,22.80811,1.3195495605469},		
		{3147.78711,-1806.67163,22.79880,270.12615966797},		
		{3193.38867,-1806.29553,22.80592,270.09429931641},		
		{3240.63403,-1806.26465,22.80629,269.89352416992},		
		{3236.98706,-1812.28503,22.80760,89.250671386719},		
		{3209.18628,-1812.39368,22.80508,90.27490234375},		
		{3160.86035,-1812.92993,22.80620,89.973937988281},		
		{3126.79395,-1806.68616,2.80152,269.21472167969},		
		{3255.74121,-1812.13574,2.79511,269.81585693359},		
		{3300.42212,-1790.91577,2.80775,358.43408203125},		
		{3268.25928,-1768.11804,2.80149,90.867248535156},		
		{3173.18896,-1766.98254,2.54653,92.818023681641},		
		

	},
	
	disableWeapons 				= true,				-- Force no weapons
	useGodmode 					= false,				-- Set players in godmode for the whole event
	warpVehicle 				= 411,				-- Model ID for players to be warped to, use false for none
	allowedVehicleExit 			= false,			-- Allow players to exit the vehicle
	allowPositionOffset 		= true,				-- Position offset for warps, used so players don't warp into each other
	allowLeaveCommand			= true,				-- Enable the player to use /leaveevent
	onlyOnePersonPerWarp		= true				-- When set to true, only person can spawn at each warp
}

local thisEventFunctions = { }
function StartBateBate3 ( ) 
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



eventStartFunctions[3] = _G['StartBateBate3']
StartBateBate3 = nil



