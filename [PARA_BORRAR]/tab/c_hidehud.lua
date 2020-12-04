--[[

	Author: danibayez
	MTA Forum: https://goo.gl/QX0mcT

]]

local components = { "area_name", "money" }

function showHudComponents( state )
	for i = 1, #components do
		setPlayerHudComponentVisible( components[ i ], state )
	end
end

addEventHandler( "onClientResourceStart", resourceRoot, function( ) showHudComponents( true ) end )
addEventHandler( "onClientResourceStop", resourceRoot, function( ) showHudComponents( true ) end )