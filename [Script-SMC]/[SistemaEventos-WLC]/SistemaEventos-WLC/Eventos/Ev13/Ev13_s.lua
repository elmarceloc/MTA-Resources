events[13] = { 
	name 						= 'Battleroyale',
	maxSlots 					= 50,
	minSlots 					= 1,
	warpPoses = {
		-- { x, y, z, rot },
		{-2264.9719238281,715.65435791016,549.296875,259.94982910156},


		
	},
    
    weapons = {
        {46,1},
        {22,500}, -- ID  AMMO(balas)
        {31,50},
        {30,20}
    },
    
	disableWeapons 				= false,
	useGodmode 					= false,
	allowedVehicleExit 			= true,
	allowPositionOffset 		= true,
	allowLeaveCommand			= true,
    onlyOnePersonPerWarp		= false,
    huds                        = 'br',
    dim                         = 3,
    --dimention
}

local thisEventFunctions = { }

function StartBattleroyale ( ) 

    toggleBRS(13)

    giveWeapons(13)

    addEventHandler ( "onPlayerWasted", root, thisEventFunctions.OnPlayerWasted )

	return true
end


function thisEventFunctions.OnPlayerWasted ()
    local plrs = EventCore.GetPlayersInEvent ( )
    local winner = nil
    if ( table.len ( plrs ) == 0 ) then
        winner = source
    elseif ( table.len ( plrs ) == 1 ) then
        for i, v in pairs ( plrs ) do
            winner = v
            triggerClientEvent(v,'toggleBR',root,false)
            removeEventHandler ( "onPlayerWasted", root, thisEventFunctions.OnPlayerWasted )
        end
    end
    if winner then
        EventCore.WinPlayerEvent ( winner )
        triggerClientEvent(winner,'toggleBR',root,false)
        removeEventHandler ( "onPlayerWasted", root, thisEventFunctions.OnPlayerWasted )
    end
end



eventStartFunctions[13] = _G['StartBattleroyale']
StartBattleroyale = nil