-- almacen persona 1

objeto4 = createObject ( 980, -1618.5999, 2670.8, 56.2, 0, 0, 114.9999 )
x,y,z = getElementPosition (objeto4)
Zona4 = createColCircle ( x,y, 5, 5 )

function Funcion (source)
    playerTeam = getPlayerTeam ( source )
	Clan = getTeamFromName ( "EJERCITO" )
    r,g,b = getTeamColor(Clan)
	if ( playerTeam ) == Clan then
        moveObject ( objeto4, 3000, -1618.5999, 2670.8, 49.2, 0, 0, 0 )
	triggerClientEvent(source,'notificationClan',source,'EJERCITO',"¡Bienvenido a la base!",{r,g,b})

else
   triggerClientEvent(source,'notificationClan',source,'EJERCITO',"Solo se permite el ingreso a miembros\ndel clan!",{255,0,0})
end
end
addEventHandler ( "onColShapeHit", Zona4, Funcion )

function Funcion2 ()
    moveObject ( objeto4, 3000, -1618.5999, 2670.8, 56.2, 0, 0, 0 )
	triggerClientEvent(source,'notificationClan',source,'EJERCITO',"¡Bienvenido a la base!",{r,g,b})

end
addEventHandler ( "onColShapeLeave", Zona4, Funcion2 )

--almacen persona 2

objeto5 = createObject ( 980, -1385, 2599.8, 56.5, 0, 0, 237.5 )
x,y,z = getElementPosition (objeto5)
Zona5 = createColCircle ( x,y, 5, 5 )

function Funcion (source)
    playerTeam = getPlayerTeam ( source )
	Clan = getTeamFromName ( "EJERCITO" )
    r,g,b = getTeamColor(Clan)
	if ( playerTeam ) == Clan then
        moveObject ( objeto5, 3000, -1385, 2599.8, 49.5, 0, 0, 0 )
	triggerClientEvent(source,'notificationClan',source,'EJERCITO',"¡Bienvenido a la base!",{r,g,b})

else
   triggerClientEvent(source,'notificationClan',source,'EJERCITO',"Solo se permite el ingreso a miembros\ndel clan!",{255,0,0})
end
end
addEventHandler ( "onColShapeHit", Zona5, Funcion )

function Funcion2 ()
    moveObject ( objeto5, 3000, -1385, 2599.8, 56.5, 0, 0, 0 )
	triggerClientEvent(source,'notificationClan',source,'EJERCITO',"¡Bienvenido a la base!",{r,g,b})

end
addEventHandler ( "onColShapeLeave", Zona5, Funcion2 )

--almacen persona 3

objeto8 = createObject ( 980, -1458.5, 2589.8999, 59.5, 0, 0, 0 )
x,y,z = getElementPosition (objeto8)
Zona8 = createColCircle ( x,y, 5, 5 )

function Funcion (source)
    playerTeam = getPlayerTeam ( source )
	Clan = getTeamFromName ( "EJERCITO" )
    r,g,b = getTeamColor(Clan)
	if ( playerTeam ) == Clan then
        moveObject ( objeto8, 3000, -1458.5, 2589.8999, 53.5, 0, 0, 0 )
	triggerClientEvent(source,'notificationClan',source,'EJERCITO',"¡Bienvenido a la base!",{r,g,b})

else
   triggerClientEvent(source,'notificationClan',source,'EJERCITO',"Solo se permite el ingreso a miembros\ndel clan!",{255,0,0})
end
end
addEventHandler ( "onColShapeHit", Zona8, Funcion )

function Funcion2 ()
    moveObject ( objeto8, 3000, -1458.5, 2589.8999, 59.5, 0, 0, 0 )
	triggerClientEvent(source,'notificationClan',source,'EJERCITO',"¡Bienvenido a la base!",{r,g,b})

end
addEventHandler ( "onColShapeLeave", Zona8, Funcion2 )

--puertas disco

objeto6 = createObject ( 3095, -1521, 2659.8999023438, 59, 90, 179.99450683594, 179.99450683594 )
x,y,z = getElementPosition (objeto6)
Zona6 = createColCircle ( x,y, 5, 5 )

objeto7 = createObject ( 3095, -1521, 2659.3000488281, 59, 90, 179.99450683594, 359.99450683594 )
x,y,z = getElementPosition (objeto7)

function Funcion (source)
    playerTeam = getPlayerTeam ( source )
	Clan = getTeamFromName ( "EJERCITO" )
    r,g,b = getTeamColor(Clan)
	if ( playerTeam ) == Clan then
        moveObject ( objeto6, 3000, -1521, 2659.8999023438, 65.400001525879, 0, 0, 0 )
        moveObject ( objeto7, 3000, -1521, 2659.3000488281, 65.400001525879, 0, 0, 0 )
	triggerClientEvent(source,'notificationClan',source,'EJERCITO',"¡Bienvenido a la disco!",{r,g,b})

else
   triggerClientEvent(source,'notificationClan',source,'EJERCITO',"Solo se permite el ingreso a miembros\ndel clan!",{255,0,0})
end
end
addEventHandler ( "onColShapeHit", Zona6, Funcion )

function Funcion2 ()
    moveObject ( objeto6, 3000, -1521, 2659.8999023438, 59, 0, 0, 0 )
    moveObject ( objeto7, 3000, -1521, 2659.3000488281, 59, 0, 0, 0 )
	triggerClientEvent(source,'notificationClan',source,'EJERCITO',"¡Bienvenido a la base!",{r,g,b})

end
addEventHandler ( "onColShapeLeave", Zona6, Funcion2 )

