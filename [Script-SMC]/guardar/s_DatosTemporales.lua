function onWasted()
	local skin = getElementModel (source)
	setElementData(source, "SKIN", skin)
	for i=0, 12 do
		local arma 		= tonumber(getPedWeapon ( source, i ))
		local municion 	= tonumber(getPedTotalAmmo ( source, i ))
		if arma then
			setElementData (source, "ARMA"..tostring(i), arma )
		end
		if municion then
			setElementData (source, "MUNICION"..tostring(i), municion)
		end
	end
end
addEventHandler ("onPlayerWasted", getRootElement(), onWasted)

function onSpawn(  )
	for i=0, 12 do
		local arma 		= tonumber(getElementData(source, "ARMA"..tostring(i)))
		local municion 	= tonumber(getElementData(source, "MUNICION"..tostring(i)))
		if arma and municion then
			giveWeapon(source, arma, municion)
		elseif arma and not municion then
			giveWeapon(source, arma, 1)
		end
	end
	local skin = tonumber(getElementData(source, "SKIN"))
	if skin then
		setTimer(setElementModel, 500, 1, source, skin)
	end
end
addEventHandler ("onPlayerSpawn", getRootElement(), onSpawn)