--PUERTA 1--
objeto1 = createObject ( 980, 134.900390625, 1940.5, 21.10000038147, 0, 0, 0 )
x,y,z = getElementPosition (objeto1)
Zona1 = createColCircle ( x,y, 5, 5 )

function Funcion (source)
    playerTeam = getPlayerTeam ( source )
	Clan = getTeamFromName ( "FACH" )
	Clan2 = getTeamFromName ( "FFEE" )
    r,g,b = getTeamColor(Clan)
	if ( playerTeam ) == Clan or ( playerTeam ) == Clan2 then
        moveObject ( objeto1, 3500, 134.900390625, 1940.5, 14.5, 0, 0, 0 )
--	outputChatBox ( "BASE FACH", source, 0, 255, 0, true )
	triggerClientEvent(source,'notificationClan',source,'FACH',"¡Bienvenido a la base!",{r,g,b})

else
   triggerClientEvent(source,'notificationClan',source,'FACH',"Solo se permite el ingreso a miembros\ndel clan!",{255,0,0})
	--outputChatBox ( "Solo se permite el ingreso a miembros del clan!", source, 255, 0, 0, true )
end
end
addEventHandler ( "onColShapeHit", Zona1, Funcion )

function Funcion2 ()
    moveObject ( objeto1, 3500, 134.900390625, 1940.5, 21.10000038147, 0, 0, 0 )
--	outputChatBox ( "BASE FACH", source, 0, 255, 0, true )
	triggerClientEvent(source,'notificationClan',source,'FACH',"¡Bienvenido a la base!",{r,g,b})

end
addEventHandler ( "onColShapeLeave", Zona1, Funcion2 )

--PUERTA 2--
objeto2 = createObject ( 980, 214, 1875.7998046875, 13, 0, 0, 0 )
x,y,z = getElementPosition (objeto2)
Zona2 = createColCircle ( x,y, 5, 5 )

function Funcion (source)
    playerTeam = getPlayerTeam ( source )
	Clan = getTeamFromName ( "FACH" )
	Clan2 = getTeamFromName ( "FFEE" )
    r,g,b = getTeamColor(Clan)
	if ( playerTeam ) == Clan or ( playerTeam ) == Clan2 then
        moveObject ( objeto2, 3500, 214, 1875.7998046875, 8.5, 0, 0, 0 )
--	outputChatBox ( "BASE FACH", source, 0, 255, 0, true )
	triggerClientEvent(source,'notificationClan',source,'FACH',"¡Bienvenido a la base!",{r,g,b})

else
   triggerClientEvent(source,'notificationClan',source,'FACH',"Solo se permite el ingreso a miembros\ndel clan!",{255,0,0})
	--outputChatBox ( "Solo se permite el ingreso a miembros del clan!", source, 255, 0, 0, true )
end
end
addEventHandler ( "onColShapeHit", Zona2, Funcion )

function Funcion2 ()
    moveObject ( objeto2, 3500, 214, 1875.7998046875, 13, 0, 0, 0 )
--	outputChatBox ( "BASE FACH", source, 0, 255, 0, true )
	triggerClientEvent(source,'notificationClan',source,'FACH',"¡Bienvenido a la base!",{r,g,b})

end
addEventHandler ( "onColShapeLeave", Zona2, Funcion2 )

--PUERTA 3--
objeto3 = createObject ( 980, 325.4, 1958.2, 19.799, 0, 0, 90 )
x,y,z = getElementPosition (objeto3)
Zona3 = createColCircle ( x,y, 5, 5 )

function Funcion (source)
    playerTeam = getPlayerTeam ( source )
	Clan = getTeamFromName ( "FACH" )
	Clan2 = getTeamFromName ( "FFEE" )
    r,g,b = getTeamColor(Clan)
	if ( playerTeam ) == Clan or ( playerTeam ) == Clan2 then
        moveObject ( objeto3, 3500, 325.4, 1958.2, 12.799, 0, 0, 0 )
--	outputChatBox ( "BASE FACH", source, 0, 255, 0, true )
	triggerClientEvent(source,'notificationClan',source,'FACH',"¡Bienvenido a la base!",{r,g,b})

else
   triggerClientEvent(source,'notificationClan',source,'FACH',"Solo se permite el ingreso a miembros\ndel clan!",{255,0,0})
	--outputChatBox ( "Solo se permite el ingreso a miembros del clan!", source, 255, 0, 0, true )
end
end
addEventHandler ( "onColShapeHit", Zona3, Funcion )

function Funcion2 ()
    moveObject ( objeto3, 3500, 325.4, 1958.2, 19.799, 0, 0, 0 )
--	outputChatBox ( "BASE FACH", source, 0, 255, 0, true )
	triggerClientEvent(source,'notificationClan',source,'FACH',"¡Bienvenido a la base!",{r,g,b})

end
addEventHandler ( "onColShapeLeave", Zona3, Funcion2 )

--PUERTA 4--
objeto4 = createObject ( 16501, 277.4, 1892.4, 18.899, 0, 0, 0 )
x,y,z = getElementPosition (objeto4)
Zona4 = createColCircle ( x,y, 5, 5 )

function Funcion (source)
    playerTeam = getPlayerTeam ( source )
	Clan = getTeamFromName ( "FACH" )
	Clan2 = getTeamFromName ( "FFEE" )
    r,g,b = getTeamColor(Clan)
	if ( playerTeam ) == Clan or ( playerTeam ) == Clan2 then
        moveObject ( objeto4, 3500, 277.4, 1892.4, 14.3, 0, 0, 0 )
--	outputChatBox ( "BASE FACH", source, 0, 255, 0, true )
	triggerClientEvent(source,'notificationClan',source,'FACH',"¡Bienvenido a la base!",{r,g,b})

else
   triggerClientEvent(source,'notificationClan',source,'FACH',"Solo se permite el ingreso a miembros\ndel clan!",{255,0,0})
	--outputChatBox ( "Solo se permite el ingreso a miembros del clan!", source, 255, 0, 0, true )
end
end
addEventHandler ( "onColShapeHit", Zona4, Funcion )

function Funcion2 ()
    moveObject ( objeto4, 3500, 277.4, 1892.4, 18.899, 0, 0, 0 )
--	outputChatBox ( "BASE FACH", source, 0, 255, 0, true )
	triggerClientEvent(source,'notificationClan',source,'FACH',"¡Bienvenido a la base!",{r,g,b})

end
addEventHandler ( "onColShapeLeave", Zona4, Funcion2 )

--PUERTA 5--
objeto5 = createObject ( 16501, 277.599, 1876.299, 18.899, 0, 0, 0 )
x,y,z = getElementPosition (objeto5)
Zona5 = createColCircle ( x,y, 5, 5 )

function Funcion (source)
    playerTeam = getPlayerTeam ( source )
	Clan = getTeamFromName ( "FACH" )
	Clan2 = getTeamFromName ( "FFEE" )
    r,g,b = getTeamColor(Clan)
	if ( playerTeam ) == Clan or ( playerTeam ) == Clan2 then
        moveObject ( objeto5, 3500, 277.599, 1876.299, 14.3, 0, 0, 0 )
--	outputChatBox ( "BASE FACH", source, 0, 255, 0, true )
	triggerClientEvent(source,'notificationClan',source,'FACH',"¡Bienvenido a la base!",{r,g,b})

else
   triggerClientEvent(source,'notificationClan',source,'FACH',"Solo se permite el ingreso a miembros\ndel clan!",{255,0,0})
	--outputChatBox ( "Solo se permite el ingreso a miembros del clan!", source, 255, 0, 0, true )
end
end
addEventHandler ( "onColShapeHit", Zona5, Funcion )

function Funcion2 ()
    moveObject ( objeto5, 3500, 277.599, 1876.299, 18.899, 0, 0, 0 )
--	outputChatBox ( "BASE FACH", source, 0, 255, 0, true )
	triggerClientEvent(source,'notificationClan',source,'FACH',"¡Bienvenido a la base!",{r,g,b})

end
addEventHandler ( "onColShapeLeave", Zona5, Funcion2 )
