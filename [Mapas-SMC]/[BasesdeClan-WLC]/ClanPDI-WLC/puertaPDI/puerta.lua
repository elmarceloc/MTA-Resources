--PUERTA 1--
objeto1 = createObject ( 971, 328, -1535.400390625, 35.299999237061, 0, 0, 53.992309570313 )
x,y,z = getElementPosition (objeto1)
Zona1 = createColCircle ( x,y, 5, 5 )


function Funcion (source)
    playerTeam = getPlayerTeam ( source )
	Clan = getTeamFromName ( "PDI" )
    r,g,b = getTeamColor(Clan)
	if ( playerTeam ) == Clan then
        moveObject ( objeto1, 3500, 328, -1535.400390625, 27.5, 0, 0, 0 )
--	outputChatBox ( "BASE PDI", source, 0, 255, 0, true )
	triggerClientEvent(source,'notificationClan',source,'PDI',"¡Bienvenido a la base!",{r,g,b})

else
   triggerClientEvent(source,'notificationClan',source,'PDI',"Solo se permite el ingreso a miembros\ndel clan!",{255,0,0})
	--outputChatBox ( "Solo se permite el ingreso a miembros del clan!", source, 255, 0, 0, true )
end
end
addEventHandler ( "onColShapeHit", Zona1, Funcion )

function Funcion2 ()
    moveObject ( objeto1, 3500, 328, -1535.400390625, 35.299999237061, 0, 0, 0 )
--	outputChatBox ( "BASE PDI", source, 0, 255, 0, true )
	triggerClientEvent(source,'notificationClan',source,'PDI',"¡Bienvenido a la base!",{r,g,b})

end
addEventHandler ( "onColShapeLeave", Zona1, Funcion2 )

--PUERTA 2--
objeto2 = createObject ( 971, 346.099609375, -1511, 35.299999237061, 0, 0, 45.994262695313 )
x,y,z = getElementPosition (objeto2)
Zona2 = createColCircle ( x,y, 5, 5 )

function Funcion (source)
    playerTeam = getPlayerTeam ( source )
	Clan = getTeamFromName ( "PDI" )
    r,g,b = getTeamColor(Clan)
	if ( playerTeam ) == Clan then
        moveObject ( objeto2, 3500, 346.099609375, -1511, 27.5, 0, 0, 0 )
--	outputChatBox ( "BASE PDI", source, 0, 255, 0, true )
	triggerClientEvent(source,'notificationClan',source,'PDI',"¡Bienvenido a la base!",{r,g,b})

else
   triggerClientEvent(source,'notificationClan',source,'PDI',"Solo se permite el ingreso a miembros\ndel clan!",{255,0,0})
	--outputChatBox ( "Solo se permite el ingreso a miembros del clan!", source, 255, 0, 0, true )
end
end
addEventHandler ( "onColShapeHit", Zona2, Funcion )

function Funcion2 ()
    moveObject ( objeto2, 3500, 346.099609375, -1511, 35.299999237061, 0, 0, 0 )
--	outputChatBox ( "BASE PDI", source, 0, 255, 0, true )
	triggerClientEvent(source,'notificationClan',source,'PDI',"¡Bienvenido a la base!",{r,g,b})

end
addEventHandler ( "onColShapeLeave", Zona2, Funcion2 )

--PUERTA3 --
objeto3 = createObject ( 971, 283.099609375, -1542.599609375, 26.700000762939, 0, 0, 323.7451171875 )
x,y,z = getElementPosition (objeto3)
Zona3 = createColCircle ( x,y, 5, 5 )

function Funcion (source)
    playerTeam = getPlayerTeam ( source )
	Clan = getTeamFromName ( "PDI" )
    r,g,b = getTeamColor(Clan)
	if ( playerTeam ) == Clan then
        moveObject ( objeto3, 3500, 283.099609375, -1542.599609375, 18.5, 0, 0, 0 )
--	outputChatBox ( "BASE PDI", source, 0, 255, 0, true )
	--triggerClientEvent(source,'notificationClan',source,'PDI',"¡Bienvenido a la base!",{r,g,b})

else
   --triggerClientEvent(source,'notificationClan',source,'PDI',"Solo se permite el ingreso a miembros\ndel clan!",{255,0,0})
	--outputChatBox ( "Solo se permite el ingreso a miembros del clan!", source, 255, 0, 0, true )
end
end
addEventHandler ( "onColShapeHit", Zona3, Funcion )

function Funcion2 ()
    moveObject ( objeto3, 3500, 283.099609375, -1542.599609375, 26.700000762939, 0, 0, 0 )
--	outputChatBox ( "BASE PDI", source, 0, 255, 0, true )
	--triggerClientEvent(source,'notificationClan',source,'PDI',"¡Bienvenido a la base!",{r,g,b})

end
addEventHandler ( "onColShapeLeave", Zona3, Funcion2 )

--PUERTA4 --
objeto4 = createObject ( 1592, 312, -1516.9000244141, 25.89999961853, 0, 0, 325.75 )
x,y,z = getElementPosition (objeto4)
Zona4 = createColCircle ( x,y, 5, 5 )

function Funcion (source)
    playerTeam = getPlayerTeam ( source )
	Clan = getTeamFromName ( "PDI" )
    r,g,b = getTeamColor(Clan)
	if ( playerTeam ) == Clan then
        moveObject ( objeto4, 2500, 311.10000610352, -1518.3000488281, 25.89999961853, 0, 0, 0 )
--	outputChatBox ( "BASE PDI", source, 0, 255, 0, true )
	--triggerClientEvent(source,'notificationClan',source,'PDI',"¡Bienvenido a la base!",{r,g,b})

else
   --triggerClientEvent(source,'notificationClan',source,'PDI',"Solo se permite el ingreso a miembros\ndel clan!",{255,0,0})
	--outputChatBox ( "Solo se permite el ingreso a miembros del clan!", source, 255, 0, 0, true )
end
end
addEventHandler ( "onColShapeHit", Zona4, Funcion )

function Funcion2 ()
    moveObject ( objeto4, 2500, 312, -1516.9000244141, 25.89999961853, 0, 0, 0 )
--	outputChatBox ( "BASE PDI", source, 0, 255, 0, true )
	--triggerClientEvent(source,'notificationClan',source,'PDI',"¡Bienvenido a la base!",{r,g,b})

end
addEventHandler ( "onColShapeLeave", Zona4, Funcion2 )

--PUERTA5 --
objeto5 = createObject ( 1592, 308.79998779297, -1514.8359375, 25.881000518799, 0, 0, 145.99462890625 )
x,y,z = getElementPosition (objeto5)
Zona5 = createColCircle ( x,y, 5, 5 )

function Funcion (source)
    playerTeam = getPlayerTeam ( source )
	Clan = getTeamFromName ( "PDI" )
    r,g,b = getTeamColor(Clan)
	if ( playerTeam ) == Clan then
        moveObject ( objeto5, 2500, 309.70001220703, -1513.5, 25.881000518799, 0, 0, 0 )
--	outputChatBox ( "BASE PDI", source, 0, 255, 0, true )
	--triggerClientEvent(source,'notificationClan',source,'PDI',"¡Bienvenido a la base!",{r,g,b})

else
   --triggerClientEvent(source,'notificationClan',source,'PDI',"Solo se permite el ingreso a miembros\ndel clan!",{255,0,0})
	--outputChatBox ( "Solo se permite el ingreso a miembros del clan!", source, 255, 0, 0, true )
end
end
addEventHandler ( "onColShapeHit", Zona5, Funcion )

function Funcion2 ()
    moveObject ( objeto5, 2500, 308.79998779297, -1514.8359375, 25.881000518799, 0, 0, 0 )
--	outputChatBox ( "BASE PDI", source, 0, 255, 0, true )
	--triggerClientEvent(source,'notificationClan',source,'PDI',"¡Bienvenido a la base!",{r,g,b})

end
addEventHandler ( "onColShapeLeave", Zona5, Funcion2 )

--PUERTA6 --
objeto6 = createObject ( 1592, 291.79998779297, -1551.8800048828, 77.5, 0, 0, 252.49853515625 )
x,y,z = getElementPosition (objeto6)
Zona6 = createColCircle ( x,y, 5, 5 )

function Funcion (source)
    playerTeam = getPlayerTeam ( source )
	Clan = getTeamFromName ( "PDI" )
    r,g,b = getTeamColor(Clan)
	if ( playerTeam ) == Clan then
        moveObject ( objeto6, 2500, 290.20001220703, -1551.3000488281, 77.5, 0, 0, 0 )
--	outputChatBox ( "BASE PDI", source, 0, 255, 0, true )
	--triggerClientEvent(source,'notificationClan',source,'PDI',"¡Bienvenido a la base!",{r,g,b})

else
   --triggerClientEvent(source,'notificationClan',source,'PDI',"Solo se permite el ingreso a miembros\ndel clan!",{255,0,0})
	--outputChatBox ( "Solo se permite el ingreso a miembros del clan!", source, 255, 0, 0, true )
end
end
addEventHandler ( "onColShapeHit", Zona6, Funcion )

function Funcion2 ()
    moveObject ( objeto6, 2500, 291.79998779297, -1551.8800048828, 77.5, 0, 0, 0 )
--	outputChatBox ( "BASE PDI", source, 0, 255, 0, true )
	--triggerClientEvent(source,'notificationClan',source,'PDI',"¡Bienvenido a la base!",{r,g,b})

end
addEventHandler ( "onColShapeLeave", Zona6, Funcion2 )

--PUERTA7 --
objeto7 = createObject ( 1592, 292.79998779297, -1548.1999511719, 77.5, 0, 0, 72.75 )
x,y,z = getElementPosition (objeto7)
Zona7 = createColCircle ( x,y, 5, 5 )

function Funcion (source)
    playerTeam = getPlayerTeam ( source )
	Clan = getTeamFromName ( "PDI" )
    r,g,b = getTeamColor(Clan)
	if ( playerTeam ) == Clan then
        moveObject ( objeto7, 2500, 294.39999389648, -1548.6999511719, 77.5, 0, 0, 0 )
--	outputChatBox ( "BASE PDI", source, 0, 255, 0, true )
	--triggerClientEvent(source,'notificationClan',source,'PDI',"¡Bienvenido a la base!",{r,g,b})

else
   --triggerClientEvent(source,'notificationClan',source,'PDI',"Solo se permite el ingreso a miembros\ndel clan!",{255,0,0})
	--outputChatBox ( "Solo se permite el ingreso a miembros del clan!", source, 255, 0, 0, true )
end
end
addEventHandler ( "onColShapeHit", Zona7, Funcion )

function Funcion2 ()
    moveObject ( objeto7, 2500, 292.79998779297, -1548.1999511719, 77.5, 0, 0, 0 )
--	outputChatBox ( "BASE PDI", source, 0, 255, 0, true )
	--triggerClientEvent(source,'notificationClan',source,'PDI',"¡Bienvenido a la base!",{r,g,b})

end
addEventHandler ( "onColShapeLeave", Zona7, Funcion2 )

function objectBreakServer () 
    triggerClientEvent (source, "setObjectBreak", getRootElement(),objeto4 ) 
    triggerClientEvent (source, "setObjectBreak", getRootElement(),objeto5 ) 
    triggerClientEvent (source, "setObjectBreak", getRootElement(),objeto6 ) 
    triggerClientEvent (source, "setObjectBreak", getRootElement(),objeto7 ) 
end 
addEventHandler("onPlayerJoin", root, objectBreakServer) 
