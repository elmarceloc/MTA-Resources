function noStaffDamage(attacker) 
	if source:getData("adminTools.isStaff") then
		cancelEvent()
		if attacker and attacker ~= source and attacker:getType() == "player" then
			triggerServerEvent("onStaffDamaged", attacker) --for DONT ANNOY STAFF MESSAGE
		end
    end
end
addEventHandler ("onClientPlayerDamage", localPlayer, noStaffDamage)

function noStaffStealthKill(target)
	local team = target:getTeam()
	if team and team == staffTeam then
		cancelEvent()
    end
end
addEventHandler("onClientPlayerStealthKill", localPlayer , noStaffStealthKill)