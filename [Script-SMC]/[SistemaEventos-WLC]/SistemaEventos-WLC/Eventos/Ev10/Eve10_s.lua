events[10] = { 
	name 						= 'CARRERA #5',	-- The event name
	maxSlots 					= 30,				-- The max players for the event
	minSlots 					= 1,				-- The required amount of players
	warpPoses = {									-- Positions players will warp to on start
		-- { x, y, z, rot },
		{526.83966,906.19684,-41.90359,259.54223632813},			
		{535.50507,904.52612,-41.98382,258.76208496094},			
		{549.75354,901.64148,-42.00179,258.69314575195},			
		{556.52185,900.27393,-42.02018,258.63317871094},			
		{568.24756,900.47028,-42.13824,270.95941162109},			
		{574.39526,900.59625,-42.35245,271.18548583984},			
		{586.28986,901.55939,-43.19078,274.72015380859},			
		{611.48926,903.68591,-43.79426,281.39453125},			
		{632.37579,904.58069,-42.67553,261.65252685547},			
		{652.01617,903.07300,-40.51741,260.21185302734},			
		{654.53735,891.25140,-40.48092,151.04754638672},			
		{641.24200,873.93939,-41.90968,142.7165222168},			
		{633.93982,864.90704,-41.98640,140.05612182617},			
		{625.16058,854.78943,-41.98543,138.84329223633},			
		{610.99304,848.56818,-42.13439,89.101043701172},			
		{601.88379,837.34155,-42.41595,248.04220581055},			
		{619.88483,829.48413,-41.98227,225.34034729004},			
		{644.56476,817.00964,-41.98705,275.42022705078},			
		{658.76251,827.62329,-41.98440,319.77557373047},			
		{674.05170,848.75891,-41.98581,327.38885498047},			
		{683.77496,870.70856,-39.99067,347.45370483398},			
		{682.23541,889.27655,-38.76943,5.6485595703125},			
		{643.15479,928.14587,-38.44705,73.913635253906},			
		{575.92810,930.38654,-41.98557,130.89288330078},			
		{552.96356,887.70679,-42.06051,181.32597351074},			
		{557.31213,858.14044,-42.01622,198.45765686035},			
		{544.89148,844.31250,-40.54195,75.503051757813},			
		{518.34882,850.27979,-41.86391,80.411407470703},			
		{604.95239,840.28674,-42.33833,73.805267333984},			
		{636.85388,827.65894,-39.59058,94.732513427734},			
		
		

	},
	
	disableWeapons 				= true,				-- Force no weapons
	useGodmode 					= true,				-- Set players in godmode for the whole event
	warpVehicle 				= 444,				-- Model ID for players to be warped to, use false for none
	allowedVehicleExit 			= false,			-- Allow players to exit the vehicle
	allowPositionOffset 		= true,				-- Position offset for warps, used so players don't warp into each other
	allowLeaveCommand			= true,				-- Enable the player to use /leaveevent
	onlyOnePersonPerWarp		= true				-- When set to true, only person can spawn at each warp
}


function StartRace5 ( ) 
	local m = createMarker (-300.92688,1523.69922,50.33591, "checkpoint", 5, 0, 255, 255, 120 )
	local m2 = createBlip (-300.92688,1523.69922,76.33591, 0, 5, 0, 255, 0,255, 0, 55000,p)
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

eventStartFunctions[10] = _G['StartRace5']
StartRace5 = nil