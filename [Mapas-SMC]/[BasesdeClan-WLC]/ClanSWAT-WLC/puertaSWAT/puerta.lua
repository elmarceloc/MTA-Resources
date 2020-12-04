--almacen I
objeto = createObject ( 8957, -1477.0999755859, 2563.3999023438, 56.700000762939, 0, 0, 270.24169921875 )
x,y,z = getElementPosition (objeto)
Zona = createColCircle ( x,y, 10, 10 )

function Funcion (source)
    playerTeam = getPlayerTeam ( source )
	Clan = getTeamFromName ( "SWAT" )
    r,g,b = getTeamColor(Clan)
	if ( playerTeam ) == Clan then
        moveObject ( objeto, 3000, -1482, 2563.3999023438, 56.700000762939, 0, 0, 0 )
	triggerClientEvent(source,'notificationClan',source,'SWAT',"¡Bienvenido a almacén!",{r,g,b})

else
   triggerClientEvent(source,'notificationClan',source,'SWAT',"Solo se permite el ingreso a miembros\ndel clan!",{255,0,0})
end
end
addEventHandler ( "onColShapeHit", Zona, Funcion )

function Funcion2 ()
    moveObject ( objeto, 3000, -1477.0999755859, 2563.3999023438, 56.700000762939, 0, 0, 0 )
	triggerClientEvent(source,'notificationClan',source,'SWAT',"¡Bienvenido a almacén!",{r,g,b})

end
addEventHandler ( "onColShapeLeave", Zona, Funcion2 )

--almacen D

objeto2 = createObject ( 8957, -1469.900390625, 2563.400390625, 56.700000762939, 0, 0, 269.74182128906 )
x,y,z = getElementPosition (objeto2)
Zona2 = createColCircle ( x,y, 10, 10 )

function Funcion (source)
    playerTeam = getPlayerTeam ( source )
	Clan2 = getTeamFromName ( "SWAT" )
    r,g,b = getTeamColor(Clan2)
	if ( playerTeam ) == Clan2 then
        moveObject ( objeto2, 3000, -1464.5999755859, 2563.3999023438, 56.700000762939, 0, 0, 0 )
	triggerClientEvent(source,'notificationClan',source,'SWAT',"¡Bienvenido a la base!",{r,g,b})

else
   triggerClientEvent(source,'notificationClan',source,'SWAT',"Solo se permite el ingreso a miembros\ndel clan!",{255,0,0})
end
end
addEventHandler ( "onColShapeHit", Zona2, Funcion )

function Funcion2 ()
    moveObject ( objeto2, 3000, -1469.900390625, 2563.400390625, 56.700000762939, 0, 0, 0 )
	triggerClientEvent(source,'notificationClan',source,'SWAT',"¡Bienvenido a la base!",{r,g,b})

end
addEventHandler ( "onColShapeLeave", Zona2, Funcion2 )

--reja 1

objeto3 = createObject ( 980, -1384.6999511719, 2599.8000488281, 56.700000762939, 0, 0, 238.5 )
x,y,z = getElementPosition (objeto3)
Zona3 = createColCircle ( x,y, 7, 7 )

function Funcion (source)
    playerTeam = getPlayerTeam ( source )
	Clan3 = getTeamFromName ( "SWAT" )
    r,g,b = getTeamColor(Clan3)
	if ( playerTeam ) == Clan3 then
        moveObject ( objeto3, 3000, -1384.6999511719, 2599.8000488281, 51.099998474121, 0, 0, 0 )
	triggerClientEvent(source,'notificationClan',source,'SWAT',"¡Bienvenido a la base!",{r,g,b})

else
   triggerClientEvent(source,'notificationClan',source,'SWAT',"Solo se permite el ingreso a miembros\ndel clan!",{255,0,0})
end
end
addEventHandler ( "onColShapeHit", Zona3, Funcion )

function Funcion2 ()
    moveObject ( objeto3, 3000, -1384.6999511719, 2599.8000488281, 56.700000762939, 0, 0, 0 )
	triggerClientEvent(source,'notificationClan',source,'SWAT',"¡Bienvenido a la base!",{r,g,b})

end
addEventHandler ( "onColShapeLeave", Zona3, Funcion2 )

-- almacen persona 1

objeto4 = createObject ( 8957, -1435.9000244141, 2587.1000976563, 56.700000762939, 0, 0, 0 )
x,y,z = getElementPosition (objeto4)
Zona4 = createColCircle ( x,y, 3, 3 )

function Funcion (source)
    playerTeam = getPlayerTeam ( source )
	Clan4 = getTeamFromName ( "SWAT" )
    r,g,b = getTeamColor(Clan4)
	if ( playerTeam ) == Clan4 then
        moveObject ( objeto4, 2000, -1435.9000244141, 2587.1000976563, 52.700000762939, 0, 0, 0 )
	triggerClientEvent(source,'notificationClan',source,'SWAT',"¡Bienvenido a almacén!",{r,g,b})

else
   triggerClientEvent(source,'notificationClan',source,'SWAT',"Solo se permite el ingreso a miembros\ndel clan!",{255,0,0})
end
end
addEventHandler ( "onColShapeHit", Zona4, Funcion )

function Funcion2 ()
    moveObject ( objeto4, 2000, -1435.9000244141, 2587.1000976563, 56.700000762939, 0, 0, 0 )
	triggerClientEvent(source,'notificationClan',source,'SWAT',"¡Bienvenido a la base!",{r,g,b})

end
addEventHandler ( "onColShapeLeave", Zona4, Funcion2 )

--almacen persona 2

objeto5 = createObject ( 980, -1619.5999755859, 2669.8000488281, 56.200000762939, 0, 0, 114.25003051758 )
x,y,z = getElementPosition (objeto5)
Zona5 = createColCircle ( x,y, 7, 7 )

function Funcion (source)
    playerTeam = getPlayerTeam ( source )
	Clan5 = getTeamFromName ( "SWAT" )
    r,g,b = getTeamColor(Clan5)
	if ( playerTeam ) == Clan5 then
        moveObject ( objeto5, 3000, -1619.5999755859, 2669.8000488281, 50.700000762939, 0, 0, 0 )
	triggerClientEvent(source,'notificationClan',source,'SWAT',"¡Bienvenido a almacén!",{r,g,b})

else
   triggerClientEvent(source,'notificationClan',source,'SWAT',"Solo se permite el ingreso a miembros\ndel clan!",{255,0,0})
end
end
addEventHandler ( "onColShapeHit", Zona5, Funcion )

function Funcion2 ()
    moveObject ( objeto5, 3000, -1619.5999755859, 2669.8000488281, 56.200000762939, 0, 0, 0 )
	triggerClientEvent(source,'notificationClan',source,'SWAT',"¡Bienvenido a la base!",{r,g,b})

end
addEventHandler ( "onColShapeLeave", Zona5, Funcion2 )

--puertas disco

objeto6 = createObject ( 3095, -1521, 2659.8999023438, 59, 90, 179.99450683594, 179.99450683594 )
x,y,z = getElementPosition (objeto6)
Zona6 = createColCircle ( x,y, 5, 5 )

objeto7 = createObject ( 3095, -1521, 2659.3000488281, 59, 90, 179.99450683594, 359.99450683594 )
x,y,z = getElementPosition (objeto7)

function Funcion (source)
    playerTeam = getPlayerTeam ( source )
	Clan6 = getTeamFromName ( "SWAT" )
    r,g,b = getTeamColor(Clan6)
	if ( playerTeam ) == Clan6 then
        moveObject ( objeto6, 3000, -1521, 2659.8999023438, 65.400001525879, 0, 0, 0 )
        moveObject ( objeto7, 3000, -1521, 2659.3000488281, 65.400001525879, 0, 0, 0 )
	triggerClientEvent(source,'notificationClan',source,'SWAT',"¡Bienvenido a la disco!",{r,g,b})

else
   triggerClientEvent(source,'notificationClan',source,'SWAT',"Solo se permite el ingreso a miembros\ndel clan!",{255,0,0})
end
end
addEventHandler ( "onColShapeHit", Zona6, Funcion )

function Funcion2 ()
    moveObject ( objeto6, 3000, -1521, 2659.8999023438, 59, 0, 0, 0 )
    moveObject ( objeto7, 3000, -1521, 2659.3000488281, 59, 0, 0, 0 )
	triggerClientEvent(source,'notificationClan',source,'SWAT',"¡Bienvenido a la base!",{r,g,b})

end
addEventHandler ( "onColShapeLeave", Zona6, Funcion2 )

