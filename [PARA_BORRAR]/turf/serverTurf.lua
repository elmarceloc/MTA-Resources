------------------------------------------------------
--            Scripting By Sasu
--		Copyright © 2013-2015 - All rights reserved.
------------------------------------------------------

local turfPos = {
--	{ 250, 1980, 0, 160, 220, 90 , 120},
	{4695 , 116 , 0 , 203 , 161 , 90, 196 }, 
	{4113 , 139 , 0 , 257 , 138 , 90, 212 }, 
	{5236 , 175 , 0 , 163 , 102 , 90, 99 }, 
	{2679 , 202 , 0 , 179 , 156 , 90, 167 }, 
	{2197 , 223 , 0 , 80 , 41 , 90, 30 }, 
	{4916 , 265 , 0 , 162 , 82 , 90, 79 }, 
	{4258 , 294 , 0 , 279 , 70 , 90, 117 }, 
	{1440 , 320 , 0 , 146 , 141 , 90, 123 }, 
	{2395 , 358 , 0 , 102 , 98 , 90, 59 }, 
	{5296 , 596 , 0 , 122 , 163 , 90, 119 }, 
	{4397 , 615 , 0 , 160 , 65 , 90, 62 }, 
	{4016 , 713 , 0 , 162 , 225 , 90, 218 }, 
	{2540 , 730 , 0 , 116 , 73 , 90, 50 }, 
	{4576 , 735 , 0 , 141 , 84 , 90, 71 }, 
	{4274 , 781 , 0 , 143 , 157 , 90, 134 }, 
	{5159 , 875 , 0 , 174 , 96 , 90, 100 }, 
	{4935 , 896 , 0 , 174 , 72 , 90, 75 }, 
	{4016 , 952 , 0 , 82 , 86 , 90, 42 }, 
	{5426 , 952 , 0 , 73 , 66 , 90, 30 }, 
	{4397 , 956 , 0 , 160 , 62 , 90, 59 }, 
	{5164 , 987 , 0 , 169 , 116 , 90, 117 }, 
	{3676 , 996 , 0 , 56 , 53 , 90, 30 }, 
	{4016 , 1052 , 0 , 112 , 126 , 90, 84 }, 
	{5516 , 1056 , 0 , 162 , 223 , 90, 216 }, 
	{5164 , 1116 , 0 , 209 , 103 , 90, 129 }, 
	{4576 , 1136 , 0 , 64 , 143 , 90, 54 }, 
	{5336 , 1295 , 0 , 202 , 84 , 90, 101 }, 
	{4016 , 1314 , 0 , 162 , 304 , 90, 295 }, 
	{4258 , 1336 , 0 , 112 , 199 , 90, 133 }, 
	{5436 , 1395 , 0 , 164 , 123 , 90, 121 }, 
	{2158 , 1416 , 0 , 92 , 121 , 90, 66 }, 
	{5254 , 1475 , 0 , 105 , 143 , 90, 90 }, 
	{3107 , 1515 , 0 , 183 , 151 , 90, 165 }, 
	{4836 , 1554 , 0 , 197 , 164 , 90, 193 }, 
	{4264 , 1585 , 0 , 106 , 213 , 90, 135 }, 
	{5756 , 1615 , 0 , 106 , 162 , 90, 103 }, 
	{5236 , 1635 , 0 , 182 , 163 , 90, 177 }, 
	{592 , 1646 , 0 , 82 , 139 , 90, 68 }, 
	{2728 , 1805 , 0 , 197 , 92 , 90, 108 }, 
	{5084 , 1815 , 0 , 255 , 203 , 90, 310 }, 
	{5436 , 1815 , 0 , 83 , 102 , 90, 50 }, 
	{5535 , 1815 , 0 , 65 , 102 , 90, 39 }, 
	{868 , 1834 , 0 , 155 , 75 , 90, 69 }, 
	{3970 , 1838 , 0 , 195 , 203 , 90, 237 }, 
	{4376 , 1876 , 0 , 123 , 220 , 90, 162 }, 
	{4576 , 1876 , 0 , 183 , 241 , 90, 264 }, 
	{754 , 1914 , 0 , 91 , 64 , 90, 34 }, 
	{4874 , 1914 , 0 , 153 , 150 , 90, 137 }, 
	{482 , 1924 , 0 , 120 , 162 , 90, 116 }, 
	{5778 , 1975 , 0 , 118 , 193 , 90, 136 }, 
	{754 , 1986 , 0 , 91 , 89 , 90, 48 }, 
	{252 , 2000 , 0 , 137 , 184 , 90, 151 }, 
	{398 , 2000 , 0 , 68 , 86 , 90, 35 }, 
	{868 , 2038 , 0 , 120 , 58 , 90, 41 }, 
	{1005 , 2093 , 0 , 84 , 45 , 90, 30 }, 
	{398 , 2098 , 0 , 68 , 86 , 90, 35 }, 
	{868 , 2098 , 0 , 118 , 86 , 90, 60 }, 
	{1347 , 2172 , 0 , 83 , 86 , 90, 42 }, 
	{252 , 2193 , 0 , 137 , 91 , 90, 74 }, 
	{4397 , 2200 , 0 , 160 , 138 , 90, 132 }, 
	{4998 , 2205 , 0 , 138 , 162 , 90, 134 }, 
	{4576 , 2215 , 0 , 183 , 123 , 90, 135 }, 
	{5516 , 2235 , 0 , 162 , 63 , 90, 61 }, 
	{754 , 2277 , 0 , 91 , 145 , 90, 79 }, 
	{5302 , 2295 , 0 , 110 , 63 , 90, 41 }, 
	{257 , 2300 , 0 , 209 , 122 , 90, 152 }, 
	{482 , 2300 , 0 , 120 , 122 , 90, 87 }, 
	{0 , 2489 , 0 , 139 , 96 , 90, 80 }, 
	{257 , 2592 , 0 , 72 , 65 , 90, 30 }, 
	{4397 , 2596 , 0 , 102 , 92 , 90, 56 }, 
	{3734 , 2605 , 0 , 82 , 58 , 90, 30 }, 
	{3692 , 2685 , 0 , 84 , 57 , 90, 30 }, 
	{195 , 2716 , 0 , 94 , 120 , 90, 67 }, 
	{302 , 2720 , 0 , 42 , 53 , 90, 30 }, 
	{4895 , 2750 , 0 , 116 , 122 , 90, 84 }, 
	{627 , 2770 , 0 , 113 , 171 , 90, 115 }, 
	{239 , 2850 , 0 , 50 , 65 , 90, 30 }, 
	{5472 , 2896 , 0 , 53 , 53 , 90, 30 }, 
	{634 , 2957 , 0 , 98 , 104 , 90, 61 }, 
	{3239 , 2957 , 0 , 44 , 51 , 90, 30 }, 
	{199 , 2969 , 0 , 85 , 92 , 90, 46 }, 
	{302 , 2969 , 0 , 87 , 92 , 90, 48 }, 
	{5401 , 2969 , 0 , 53 , 49 , 90, 30 }, 
	{3303 , 3015 , 0 , 35 , 46 , 90, 30 }, 
	{2395 , 3027 , 0 , 189 , 173 , 90, 196 }, 
	{5229 , 3035 , 0 , 61 , 55 , 90, 30 }, 
	{5302 , 3035 , 0 , 33 , 55 , 90, 30 }, 
	{1131 , 3039 , 0 , 61 , 69 , 90, 30 }, 
	{3339 , 3058 , 0 , 42 , 74 , 90, 30 }, 
	{199 , 3078 , 0 , 85 , 122 , 90, 62 }, 
	{302 , 3078 , 0 , 87 , 122 , 90, 63 }, 
	{505 , 3078 , 0 , 70 , 122 , 90, 51 }, 
	{637 , 3078 , 0 , 93 , 105 , 90, 58 }, 
	{3141 , 3080 , 0 , 83 , 59 , 90, 30 }, 
	{2182 , 3096 , 0 , 116 , 60 , 90, 41 }, 
	{901 , 3101 , 0 , 89 , 181 , 90, 96 }, 
	{1168 , 3123 , 0 , 27 , 108 , 90, 30 }, 
	{3016 , 3219 , 0 , 158 , 129 , 90, 122 }, 
	{1427 , 3292 , 0 , 166 , 164 , 90, 163 }, 
	{3650 , 3436 , 0 , 78 , 41 , 90, 30 }, 
	{2028 , 3483 , 0 , 69 , 66 , 90, 30 }, 
	{3601 , 3539 , 0 , 36 , 77 , 90, 30 }, 
	{3646 , 3539 , 0 , 33 , 54 , 90, 30 }, 
	{1872 , 3586 , 0 , 156 , 175 , 90, 163 }, 
	{3778 , 3597 , 0 , 55 , 48 , 90, 30 }, 
	{1525 , 3909 , 0 , 110 , 98 , 90, 64 }, 
	{4858 , 4144 , 0 , 201 , 107 , 90, 129 }, 
	{3378 , 4519 , 0 , 57 , 54 , 90, 30 }, 
	{1872 , 4606 , 0 , 145 , 102 , 90, 88 }, 
	{5651 , 4663 , 0 , 166 , 219 , 90, 218 }, 
	{2950 , 5467 , 0 , 64 , 69 , 90, 30 }, 
	{3011 , 5627 , 0 , 30 , 39 , 90, 30 }, 
}

	local turfElement = {}
	local turfTimer = {}
	local checkComplete = false
		
	addEventHandler("onResourceStart", resourceRoot,
	function()
		-- fix the photoshop cords to mta cords system
		for key, value in pairs(turfPos) do
			x,y,z,x2,y2,z2,t = unpack(value)
			turfPos[key] = {x-3000,(3000-y)-150,z,x2,y2,z2,t}
		--	outputChatBox(dump(turfPos[key]))
		end


		executeSQLQuery("CREATE TABLE IF NOT EXISTS Turf_System ( Turfs TEXT, GangOwner TEXT, r INT, g INT, b INT)")
		--
		local check = executeSQLQuery("SELECT * FROM Turf_System" )
		if #check == 0 then
			for i=1,#turfPos do
				executeSQLQuery("INSERT INTO Turf_System(Turfs,GangOwner,r,g,b) VALUES(?,?,?,?,?)", "Turf["..tostring(i).."]", "Nadie", 0, 255, 0)
			end
		elseif #check > 1 then
			for i = #check, #turfPos do

				executeSQLQuery("INSERT INTO Turf_System(Turfs,GangOwner,r,g,b) VALUES(?,?,?,?,?)", "Turf["..tostring(i).."]", "Nadie", 0, 255, 0)
			end
		end
		
		for i,v in ipairs(turfPos) do
			local sqlData = executeSQLQuery("SELECT * FROM Turf_System WHERE Turfs=?", "Turf["..tostring(i).."]")
			local turfCol = createColCuboid(v[1],v[2],v[3],v[4],v[5],v[6])
			setElementData(turfCol, "getTurfGang", sqlData[1].GangOwner)
			local turfArea = createRadarArea(v[1], v[2], v[4], v[5], sqlData[1].r, sqlData[1].g, sqlData[1].b, 100)
			turfElement[turfCol] = {turfCol, turfArea, i, v[7], sqlData[1].r, sqlData[1].g, sqlData[1].b}
			turfTimer[turfCol] = {}
		end
	end )
	



function turfarea(source, player)

	local turf,area,id,time = unpack( turfElement[source] )
	local team = getPlayerTeam(player)
	local playerGang = getTeamName(team)
	local r,g,b = getTeamColor(team)

	local turfGang = executeSQLQuery("SELECT GangOwner FROM Turf_System WHERE Turfs=?", "Turf["..tostring(id).."]" )
	if ( turfGang[1].GangOwner == playerGang ) then
		triggerClientEvent(player,'turfnotification',root,'Este territorio ya es de '..turfGang[1].GangOwner,{r,g,b})
	else

		if isPlayerInVehicle(player) then 
			--triggerClientEvent(player,'turfnotification',root,'No puedes conquistar el territorio en vehiculo',{r,g,b})
			return 
		end
		if doesPedHaveJetPack(player) then 
			if team then
				triggerClientEvent(player,'turfnotification',root,'No puedes conquistar el territorio en jetpack',{255,0,0})
				setPedWearingJetpack(player,false)
				bindKey(player,'j','down',notjp,player)
			end
			return 
			end
		
		bindKey(player,'j','down',notjp,player)

		local team = getPlayerTeam(player)
		local playerGang = getTeamName(team)
		setElementData( source, "warTurf", playerGang )
		if ( isTimer ( turfTimer[source][1] ) ) then
			if isTimer( turfTimer[source][2] ) then killTimer( turfTimer[source][2] ) end 
			return 
		end
		if ( playerGang ) then
			local r,g,b = getTeamColor(team)
			setRadarAreaColor(area,255,0,0,100)
			setRadarAreaFlashing ( area, true )

			--local ownerteam = getTeamFromName(turfGang[1].GangOwner)
			
			if turfGang[1].GangOwner ~= "Nadie" then
				triggerClientEvent(player,'turfnotification',root,'Entraste al territorio de "'..  (turfGang[1].GangOwner:lower()):gsub("^%l", string.upper) ..'". quedate '.. time ..' segundos para capturar el territorio',{r,g,b})
			else
				triggerClientEvent(player,'turfnotification',root,"Este territorio no tiene dueño. Quedate ".. time .." segundos para ganarlo",{r,g,b})
			end
			
			turfTimer[source][1] = setTimer (
				function ( )
					local players = getGangPlayersInTurf ( turf, playerGang )
					setRadarAreaColor ( area, tonumber(r), tonumber(g), tonumber(b), 100 )
					for _, player in ipairs ( players ) do
						triggerClientEvent(player,'turfnotification',root,"¡Wena, Capturaste el Territorio!",{r,g,b})
						triggerClientEvent(player, "onTakeTurf", root)
						executeSQLQuery("UPDATE Turf_System SET GangOwner=?,r=?,g=?,b=? WHERE Turfs=?", playerGang, tonumber(r), tonumber(g), tonumber(b), "Turf["..tostring(id).."]" )
					end
					setRadarAreaFlashing ( area, false )
				end
			,time*1000, 1) --time*
		end
	end

end



function blinkradar(player)

	if getElementType ( player ) == "player" then

		if turfElement[source] and source == turfElement[source][1] then
		
			turfarea(source,player)
		
		end
	end

end

function notjp(player)
	setPedWearingJetpack(player,false)
	triggerClientEvent(player,'turfnotification',root,"No podi usar el jetpack ahora",{255,0,0})
end

addEventHandler('onPlayerWasted',root,function()
	unbindKey(source,'j','down',notjp,source)
end)



addEventHandler ( "onColShapeHit", root, blinkradar)
addEventHandler ( "onVehicleExit", root, function(player) 

	for key, turf in pairs(turfElement) do
		local isinarea = isElementWithinColShape(player,turf[1])

		if isinarea then
		
			turfarea(turf[1],player)
			if vehicleleave then
				killTimer(vehicleleave)
			end
		end

	end

end)


addEventHandler ( "onVehicleEnter", root, function(player) 

	for key, turf in pairs(turfElement) do
		local isinarea = isElementWithinColShape(player,turf[1])

		if isinarea then
		
			triggerClientEvent(player,'turfnotification',root,"Si no salí bajai dentro de 10 segundos, te mueres",{255,0,0})


			vehicleleave = setTimer(
				function()
					killPlayer(player)
				end
			,10000,1)
		end

	end

end)

	
addEventHandler ( "onColShapeLeave", root, 
	function( player )
		if turfElement[source] and source == turfElement[source][1] then

			unbindKey(player,'j','down',notjp,player)

			if isTimer( turfTimer[source][1] ) then
				local turf,area,id,time,ownr,owng,ownb = unpack( turfElement[source] )
				local aGang = getElementData( source, "warTurf" )
				local ps =  getGangPlayersInTurf( source, aGang )
				-- si hay 0 jugadores dentro del turf
				if #ps == 0 then
					triggerClientEvent(player,'turfnotification',root,"Si no volví dentro de 20 segundos, no vay a ganar el Territorio",{255,0,0})
					
					turfTimer[source][2] = setTimer(
						function(source, aGang)
							if isTimer(turfTimer[source][1]) then killTimer(turfTimer[source][1]) end
							setRadarAreaFlashing(turfElement[source][2], false)
							for _, v in ipairs( getElementsByType("player") ) do
								if getTeamName(getPlayerTeam(v)) == aGang then
									setRadarAreaColor(area,ownr,owng,ownb,100 )
									triggerClientEvent(player,'turfnotification',root,"Cagaste. teniai que estar más tiempo para capturar el territorio",{255,0,0})
								end
							end
						end
					, 20000, 1, source, aGang)
				end
			end
		end
	end
)

function getGangPlayersInTurf( turf, gang ) -- element, string
	if turf and gang then
		local players = getElementsWithinColShape ( turf, "player" )
		local gPla = {}
		for _, v in ipairs(	players ) do	
			if getTeamName(getPlayerTeam(v)) == gang then
				table.insert(gPla, v)
			end
		end
		return gPla
	end
end

function getGangColor(gangName)
	return exports[ "gang_system" ]:getGangData ( gangName, "color" )
end
