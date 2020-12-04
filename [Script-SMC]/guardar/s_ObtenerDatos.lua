addEventHandler('onResourceStart',getResourceRootElement(getThisResource()) ,function()
    createTeam('ARMADA',153, 230, 0)
    createTeam('COBRA',100,50,223)
    createTeam('HUASOS',0, 225, 153)
    createTeam('CARABINEROS',0,255,0)
    createTeam('MR',255,0,0)
	createTeam('MI',0, 51, 204)
	createTeam('MF',255, 51, 104)
    createTeam('GROOFY',255,170,0)
    createTeam('FACH',100,170,255)
    createTeam('UMBRELLA',153, 0, 153)
    createTeam('CARTELLS',255, 51, 0)
    createTeam('CHAOSGANG',57,100,255)
    createTeam('BT',100,255,199)
    createTeam('CAPUXAXUPAPOTO',255,100,200)
    createTeam('FPR',170,0,50)
    createTeam('FFEE',51, 102, 0)
    createTeam('MIGUELITOS',102, 0, 255)
    createTeam('MEDALLIN',0, 255, 153)
    createTeam('SAMU',255, 255, 77)
    createTeam('REPORTEROS',66, 63, 230)
    createTeam('BN',255, 0, 255)
	createTeam('CARTEL_B',162, 33, 117)
	createTeam('TRAFICANTES',10,100,255)	
	createTeam('COP.ELITES',10,200,100)

end)


local datos = {
	"DINERO", 
	"SKIN", 
	"X", 
	"Y", 
	"Z", 
	"ROTACION", 
	"INTERIOR", 
	"TEAM"
}

function obtenerArmas(source)
	if not (source) then 
		return false 
	end
	local cuenta = getPlayerAccount ( source )
	if (cuenta) then
		for i=0, 12 do
			local arma 		= getAccountData(cuenta, "ARMA"..tostring(i))
			local municion 	= getAccountData(cuenta, "MUNICION"..tostring(i))
			if (arma) then
				setElementData (source, "ARMA"..tostring(i), arma )
				if municion then
					giveWeapon ( source, arma, municion )
					setElementData (source, "MUNICION"..tostring(i), municion)
				else
					giveWeapon ( source, arma, 1 )
				end
			end
		end
	end
end

function obtenerOtrosDatos( source )
	if not (source) then return false end
	local cuenta = getPlayerAccount ( source )
	if (cuenta) then
		local x, y, z, rot, int, skin,team, dinero
		for i, v in pairs(datos) do
			local dato = getAccountData (cuenta, v)
			if (dato) then
				if v == "DINERO" then
					dinero = dato
				elseif v == "SKIN" then 
					skin = dato
				elseif v == "X" then
					x= dato
				elseif v == "Y" then
					y = dato
				elseif v == "Z" then 
					z = dato
				elseif v == "ROTACION" then
					rot = dato
				elseif v == "INTERIOR" then
					int = dato
				elseif v == "TEAM" then
					team = dato
				end
			end
		end
		setElementData(source, "SKIN", skin)
		if not int then
			int = 0
		end
		if not rot then 
			rot = 0 
		end
		if x and y and z then
			spawnPlayer(source, x, y, z, rot, skin, int, 0)
		end
		if team then
			setPlayerTeam(source, getTeamFromName(team))
		end
	end
end

function onLogIn(  )
	obtenerArmas( source )
	obtenerOtrosDatos( source )
	
end
addEventHandler("onPlayerLogin", getRootElement(), onLogIn)