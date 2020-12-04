function guardarArmas( source )
	if not (source) then return false end
	local cuenta = getPlayerAccount ( source )
	if (cuenta) then
		for i=0, 12 do
			arma 		= getPedWeapon ( source, i )
			municion 	= getPedTotalAmmo ( source, i )
			if arma then
				setAccountData (cuenta, "ARMA"..tostring(i), arma )
			end
			if municion then
				setAccountData (cuenta, "MUNICION"..tostring(i), municion)
			end
		end
	end
end

function guardarOtrosDatos( source )
	if not (source) then return false end
	local cuenta = getPlayerAccount ( source )
	if (cuenta) then
		local x,y,z = getElementPosition (source)
		setAccountData (cuenta, "DINERO", getPlayerMoney ( source ) )
		setAccountData (cuenta, "SKIN", getElementModel(source))
		setAccountData (cuenta, "X", x)
		setAccountData (cuenta, "Y", y)
		setAccountData (cuenta, "Z", z)
		setAccountData (cuenta, "INTERIOR", 	getElementInterior (source))
		--setAccountData (cuenta, "DIM", 			getElementDimension (source))
		setAccountData (cuenta, "ROTACION", 	getPedRotation (source))
		setAccountData (cuenta, "TEAM", 	getTeamName(getPlayerTeam (source)))

	end
end
function onQuit()
	guardarArmas(source)
	guardarOtrosDatos(source)
end
addEventHandler ( "onPlayerQuit", getRootElement ( ), onQuit )