local function loopVehicles(p)
	local acc = getPlayerAccount (p)
	if not isGuestAccount (acc) and isObjectInACLGroup ("user."..getAccountName (acc), aclGetGroup ( "Admin" ) ) then
		local count = 0
		for i, v in ipairs (getElementsByType ("vehicle")) do
			if v then
				local occupants = countOccupants(v)
				if not occupants or occupants == 0 then
					if getVehicleType(v) == "Trailer" then
						if not getVehicleTowingVehicle(v) then
							destroyElement (v)
							count = count+1
						end
					else
						destroyElement (v)
						count = count+1
					end
				end
			end
		end
	end
end
addCommandHandler ("deletevehicles", loopVehicles)

local loopRadius = 200
local function localLoopVehicles(p)
	local acc = getPlayerAccount (p)
	if not isGuestAccount (acc) and isObjectInACLGroup ("user."..getAccountName (acc), aclGetGroup ( "Moderator" ) ) then
		local x, y, z = getElementPosition (p)
		local localCol = createColCircle (x, y, loopRadius)
		local count = 0
		for i, v in ipairs (getElementsWithinColShape (localCol, "vehicle")) do
			if v then
				local occupants = countOccupants(v)
				if not occupants or occupants == 0 then
					if getVehicleType(v) == "Trailer" then
						if not getVehicleTowingVehicle(v) then
							destroyElement (v)
							count = count+1
						end
					else
						destroyElement (v)
						count = count+1
					end
				end
			end
		end
		destroyElement(localCol)
	end
end
addCommandHandler ("deletenear", localLoopVehicles)

function countOccupants(vehicle)
	if vehicle and getElementType(vehicle) == "vehicle" then
		local ppl = getVehicleOccupants(vehicle)
		if not ppl then
			return false
		else
			local counter = 0
			for seat, player in pairs(ppl) do
				counter = counter + 1
			end
			return counter
		end
	end
end