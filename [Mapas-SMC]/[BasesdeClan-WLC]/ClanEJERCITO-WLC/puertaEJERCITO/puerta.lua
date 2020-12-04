--PUERTA1--

objeto = createObject ( 980, -1049.1999511719, -1317, 130.5, 0, 0, 180 )
x,y,z = getElementPosition (objeto)
Zona = createColCircle ( x,y, 5, 5 )

function Funcion (source)
    playerTeam = getPlayerTeam ( source )
	Clan = getTeamFromName ( "EJERCITO" )
	if ( playerTeam ) == Clan then
        moveObject ( objeto, 4000, -1049.1999511719, -1317, 123, 0, 0, 0 )
	outputChatBox ( "BASE EJERCITO", source, 0, 255, 0, true )
	else
	outputChatBox ( "Solo se permite el ingreso a miembros del clan!", source, 255, 0, 0, true )
end
end
addEventHandler ( "onColShapeHit", Zona, Funcion )

function Funcion2 ()
        moveObject ( objeto, 4000, -1049.1999511719, -1317, 130.5, 0, 0, 0 )
end
addEventHandler ( "onColShapeLeave", Zona, Funcion2 )

--PUERTA2--

objeto2 = createObject ( 980, -1048.8000488281, -1154.6999511719, 129.5, 0, 0, 181.24450683594 )
x,y,z = getElementPosition (objeto2)
Zona2 = createColCircle ( x,y, 5, 5 )

function Funcion3 (source)
    playerTeam = getPlayerTeam ( source )
	Clan2 = getTeamFromName ( "EJERCITO" )
	if ( playerTeam ) == Clan2 then
        moveObject ( objeto2, 4000, -1048.8000488281, -1154.6999511719, 122, 0, 0, 0 )
	else
	outputChatBox ( "Solo se permite el ingreso a miembros del clan!", source, 255, 0, 0, true )
end
end
addEventHandler ( "onColShapeHit", Zona2, Funcion3 )

function Funcion4 ()
        moveObject ( objeto2, 4000, -1048.8000488281, -1154.6999511719, 129.5, 0, 0, 0 )
end
addEventHandler ( "onColShapeLeave", Zona2, Funcion4 )

--PUERTA3--

objeto3 = createObject ( 980, -1211.8000488281, -1077.1999511719, 130, 0, 0, 0 )
x,y,z = getElementPosition (objeto3)
Zona3 = createColCircle ( x,y, 5, 5 )

function Funcion (source)
    playerTeam = getPlayerTeam ( source )
	Clan3 = getTeamFromName ( "EJERCITO" )
	if ( playerTeam ) == Clan3 then
        moveObject ( objeto3, 4000, -1211.8000488281, -1077.1999511719, 123, 0, 0, 0 )
	else
	outputChatBox ( "Solo se permite el ingreso a miembros del clan!", source, 255, 0, 0, true )
end
end
addEventHandler ( "onColShapeHit", Zona3, Funcion )

function Funcion2 ()
        moveObject ( objeto3, 4000, -1211.8000488281, -1077.1999511719, 130, 0, 0, 0 )
end
addEventHandler ( "onColShapeLeave", Zona3, Funcion2 )

--PUERTA4--

objeto4 = createObject ( 980, -1200.5, -1029.6999511719, 130.39999389648, 0, 0, 90 )
x,y,z = getElementPosition (objeto4)
Zona4 = createColCircle ( x,y, 5, 5 )

function Funcion (source)
    playerTeam = getPlayerTeam ( source )
	Clan4 = getTeamFromName ( "EJERCITO" )
	if ( playerTeam ) == Clan4 then
        moveObject ( objeto4, 4000, -1200.5, -1029.6999511719, 123, 0, 0, 0 )
	else
	outputChatBox ( "Solo se permite el ingreso a miembros del clan!", source, 255, 0, 0, true )
end
end
addEventHandler ( "onColShapeHit", Zona4, Funcion )

function Funcion2 ()
        moveObject ( objeto4, 4000, -1200.5, -1029.6999511719, 130.39999389648, 0, 0, 0 )
end
addEventHandler ( "onColShapeLeave", Zona4, Funcion2 )

--PUERTA5--

objeto5 = createObject ( 2948, -1063.099609375, -1097, 128.19999694824, 0, 0, 90 )
x,y,z = getElementPosition (objeto5)
Zona5 = createColCircle ( x,y, 2, 2 )
setObjectScale ( objeto5, 1.07)

function Funcion (source)
    playerTeam = getPlayerTeam ( source )
	Clan5 = getTeamFromName ( "EJERCITO" )
	if ( playerTeam ) == Clan5 then
        moveObject ( objeto5, 2000, -1064.1, -1097, 128.19999694824, 0, 0, 0 )
	else
	outputChatBox ( "Solo se permite el ingreso a miembros del clan!", source, 255, 0, 0, true )
end
end
addEventHandler ( "onColShapeHit", Zona5, Funcion )

function Funcion2 ()
        moveObject ( objeto5, 2000, -1063.099609375, -1097, 128.19999694824, 0, 0, 0 )
end
addEventHandler ( "onColShapeLeave", Zona5, Funcion2 )

--PUERTA6--

objeto6 = createObject ( 2948, -1061.099609375, -1097, 128.19999694824, 0, 0, 269.49462890625 )
x,y,z = getElementPosition (objeto6)
Zona6 = createColCircle ( x,y, 2, 2 )
setObjectScale ( objeto6, 1.07)

function Funcion (source)
    playerTeam = getPlayerTeam ( source )
	Clan6 = getTeamFromName ( "EJERCITO" )
	if ( playerTeam ) == Clan6 then
        moveObject ( objeto6, 2000, -1060, -1097, 128.19999694824, 0, 0, 0 )
	else
	outputChatBox ( "Solo se permite el ingreso a miembros del clan!", source, 255, 0, 0, true )
end
end
addEventHandler ( "onColShapeHit", Zona6, Funcion )

function Funcion2 ()
        moveObject ( objeto6, 2000, -1061.099609375, -1097, 128.19999694824, 0, 0, 0 )
end
addEventHandler ( "onColShapeLeave", Zona6, Funcion2 )

