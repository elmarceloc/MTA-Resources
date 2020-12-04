
--PUERTA 1--
objeto = createObject ( 971, 2335.2001953125, 2444.2001953125, 7.3000001907349, 0, 0, 59.996337890625 )
x,y,z = getElementPosition (objeto)
Zona = createColCircle ( x,y, 5, 5 )

function Funcion (source)
    playerTeam = getPlayerTeam ( source )
	Clan = getTeamFromName ( "CARABINEROS" )
	if ( playerTeam ) == Clan then
        moveObject ( objeto, 5000, 2335.2001953125, 2444.2001953125, -1.3000001907349, 0, 0, 0 )
	outputChatBox ( "BASE CARABINEROS", source, 0, 255, 0, true )
	else
	outputChatBox ( "Solo se permite el ingreso a miembros del clan!", source, 255, 0, 0, true )
end
end
addEventHandler ( "onColShapeHit", Zona, Funcion )

function Funcion2 ()
        moveObject ( objeto, 5000, 2335.2001953125, 2444.2001953125, 7.3000001907349, 0, 0, 0 )
		outputChatBox ( "BASE CARABINEROS", source, 0, 255, 0, true )
end
addEventHandler ( "onColShapeLeave", Zona, Funcion2 )


--PUERTA 2--
objeto2 = createObject ( 971, 2294.1999511719, 2498.8999023438, 4.8000001907349, 0, 0, 270 )
x,y,z = getElementPosition (objeto2)
Zona2 = createColCircle ( x,y, 5, 5 )

function Funcion3 (source)
    playerTeam = getPlayerTeam ( source )
	Clan2 = getTeamFromName ( "CARABINEROS" )
	if ( playerTeam ) == Clan2 then
        moveObject ( objeto2, 5000, 2294.1999511719, 2507.8999023438, 4.8000001907349, 0, 0, 0 )
	outputChatBox ( "BASE CARABINEROS", source, 0, 255, 0, true )
	else
	outputChatBox ( "Solo se permite el ingreso a miembros del clan!", source, 255, 0, 0, true )
end
end
addEventHandler ( "onColShapeHit", Zona2, Funcion3 )

function Funcion4 ()
        moveObject ( objeto2, 5000, 2294.1999511719, 2498.8999023438, 4.8000001907349, 0, 0, 0 )
		outputChatBox ( "BASE CARABINEROS", source, 0, 255, 0, true )
end
addEventHandler ( "onColShapeLeave", Zona2, Funcion4 )

--PUERTA 3--
objeto3 = createObject ( 980, 2237.5, 2452.8999023438, 12.5, 0, 0, 270 )
x,y,z = getElementPosition (objeto3)
Zona3 = createColCircle ( x,y, 5, 5 )

function Funcion5 (source)
    playerTeam = getPlayerTeam ( source )
	Clan3 = getTeamFromName ( "CARABINEROS" )
	if ( playerTeam ) == Clan3 then
        moveObject ( objeto3, 5000, 2237.5, 2442.8999023438, 12.5, 0, 0, 0 )
	outputChatBox ( "BASE CARABINEROS", source, 0, 255, 0, true )
	else
	outputChatBox ( "Solo se permite el ingreso a miembros del clan!", source, 255, 0, 0, true )
end
end
addEventHandler ( "onColShapeHit", Zona3, Funcion5 )

function Funcion6 ()
        moveObject ( objeto3, 5000, 2237.5, 2452.8999023438, 12.5, 0, 0, 0 )
		outputChatBox ( "BASE CARABINEROS", source, 0, 255, 0, true )
end
addEventHandler ( "onColShapeLeave", Zona3, Funcion6 )

--Activar Oclusion--

setOcclusionsEnabled( false )
