events[2] = { 
	name 						= 'BATE-BATE #2',	-- The event name
	maxSlots 					= 20,				-- The max players for the event
	minSlots 					= 3,				-- The required amount of players
	warpPoses = {									-- Positions players will warp to on start
		-- { x, y, z, rot },
		{5242.86963,-380.75906,1.97267,266.88537597656},		
		{5252.52686,-381.28461,1.97286,266.88510131836},	
		{5263.72314,-381.82526,1.97295,268.03332519531},	
		{5282.07129,-382.45566,1.97320,268.03308105469},	
		{5297.60498,-382.98932,1.97329,268.0322265625},		
		{5320.15039,-383.49741,1.97239,268.67108154297},		
		{5345.57373,-367.24741,1.97265,353.09222412109},		
		{5347.31348,-341.03024,1.97225,356.82315063477},		
		{5346.96338,-294.58124,1.97091,1.6079711914063},		
		{5346.62451,-256.94153,1.97272,359.5153503418},		
		{5327.28125,-247.44516,1.97320,89.40283203125},		
		{5293.13867,-247.93768,1.97315,89.713104248047},		
		{5266.35449,-247.80307,1.97322,89.712005615234},		
		{5277.39941,-266.34988,1.96989,177.88464355469},		
		{5275.38623,-312.81506,1.97283,178.02905273438},		
		{5274.22266,-346.56500,1.97322,178.02575683594},		
		{5323.93701,-367.73776,1.97100,359.53701782227},		
		{5324.51563,-334.97787,1.97319,358.25845336914},		
		{5325.80127,-292.70590,1.97236,358.16217041016},		
		{5326.75195,-263.09515,1.97315,358.15991210938},		
		
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
function StartBateBate2 ( ) 
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



eventStartFunctions[2] = _G['StartBateBate2']
StartBateBate2 = nil



