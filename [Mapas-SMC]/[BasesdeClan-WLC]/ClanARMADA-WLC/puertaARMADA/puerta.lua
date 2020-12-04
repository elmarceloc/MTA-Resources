objeto = createObject ( 980, -2316, 2382.1999511719, 7.4000000953674, 0, 0, 237.00006103516 )
x,y,z = getElementPosition (objeto)
Zona = createColCircle ( x,y, 5, 5 )

function Funcion (source)
    playerTeam = getPlayerTeam ( source )
	Clann = getTeamFromName ( "ARMADA" )
	if ( playerTeam ) == Clann then
        moveObject ( objeto, 5000, -2316, 2382.1999511719, 0.4000000953674, 0, 0, 0 )
	outputChatBox ( "BASE ARMADA", source, 0, 255, 0, true )
	else
	outputChatBox ( "Solo se permite el ingreso a miembros del clan!", source, 255, 0, 0, true )
end
end
addEventHandler ( "onColShapeHit", Zona, Funcion )

function Funcion2 ()
        moveObject ( objeto, 5000, -2316, 2382.1999511719, 7.4000000953674, 0, 0, 0 )
		outputChatBox ( "BASE ARMADA", source, 0, 255, 0, true )
end
addEventHandler ( "onColShapeLeave", Zona, Funcion2 )
