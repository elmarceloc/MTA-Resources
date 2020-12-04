stime = false

function useweapons(toggle)
	toggleControl("fire", toggle)
	toggleControl("action", toggle)
	toggleControl("aim_weapon", toggle)
	toggleControl("vehicle_fire", toggle)
	toggleControl("vehicle_secondary_fire", toggle)
end

function setT(source)
	stime = true

	useweapons(false)

    setTimer(unblockl,10000,1,source)
end
addEventHandler ( "onClientPlayerSpawn", getLocalPlayer(), setT )

function unblockl(source)

	useweapons(true)

    stime = false
end


function stopSK (attacker)
	if stime == true  then
		cancelEvent() 
	end
end
addEventHandler ( "onClientPlayerDamage", getLocalPlayer(), stopSK )