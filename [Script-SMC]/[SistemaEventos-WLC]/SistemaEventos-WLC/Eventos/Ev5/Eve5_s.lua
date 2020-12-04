events[5] = { 
	name 						= 'DERBY DEATHMATCH #5',	-- The event name
	maxSlots 					= 17,				-- The max players for the event
	minSlots 					= 3,				-- The required amount of players
	warpPoses = {									-- Positions players will warp to on start
		-- { x, y, z, rot },
		
		{3588.91943,-1604.70361,1.97174,179.66467285156},		
		{3588.87305,-1612.67249,1.97231,179.66455078125},		
		{3593.83374,-1613.79211,1.97261,178.85583496094},		
		{3593.98730,-1606.11658,1.97051,178.85498046875},		
		{3598.00317,-1604.83423,1.97195,180.37033081055},		
		{3598.06665,-1614.63293,1.97330,180.36965942383},		
		{3603.20923,-1605.22327,1.97106,181.09106445313},		
		{3603.53149,-1614.61536,1.97225,180.22239685059},		
		{3611.60376,-1605.89453,1.97065,183.11820983887},		
		{3611.84717,-1614.64111,1.97264,180.56086730957},		
		{3615.65063,-1604.87952,1.97112,177.33410644531},		
		{3615.35522,-1614.62231,1.97331,179.72509765625},		
		{3623.10547,-1605.13000,1.97127,172.56652832031},		
		{3622.92456,-1614.47644,1.97335,179.01885986328},		
		{3622.89453,-1628.52136,1.97063,178.0888671875},		
		{3604.97949,-1627.95862,1.98078,181.69725036621},		
		{3598.12573,-1627.99512,1.97467,182.05850219727},		
		{3588.50464,-1627.99304,1.97236,180.03370666504},		
		
		

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
function StartBateBate5 ( ) 
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



eventStartFunctions[5] = _G['StartBateBate5']
StartBateBate5 = nil



