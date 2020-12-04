-- Format is: {x = 0, y = 0, z = 0, width = 0, depth = 0, height = 0},
local greenzones = {
	{x = 2448, y = -1705, z = 13, width = 100, depth = 100, height = 30, dim = 0}, -- 1
	{x = 1125, y = -2077, z = 69, width = 100, depth = 100, height = 30, dim = 0}, -- 2
	{x = 589, y = -1405, z = 13, width = 100, depth = 100, height = 30, dim = 0}, -- 3
	{x = 1992, y = -1453, z = 13, width = 100, depth = 100, height = 30, dim = 0}, -- 4
	{x = -2100.48, y = 237.17, z = -60, width = 300, depth = 300, height = 80, dim = 0}, -- 4

	{x = 1845, y = 1786 , z = -50, width = 233, depth = 271, height = 100, dim = 6}, -- 1

}

local z = {}
function initGreenzones()
	if greenzones and #greenzones ~= 0 then
		for _, v in ipairs(greenzones) do
			if v then
				if v.x and v.y and v.z and v.width and v.depth and v.height then
					local c = createColCuboid(v.x, v.y, v.z, v.width, v.depth, v.height)
					setElementDimension(c,v.dim)
					--local rarea = createRadarArea(v.x, v.y, v.width, v.depth, 0, 255, 0, 150)
					--setElementParent(rarea, c)
					if c then
						z[c] = true

						for _, p in ipairs(getElementsWithinColShape(c, "player")) do
							outputChatBox('in')
							if getElementDimension(p) == v.dim then
								setElementData(p, "greenzone", true)
							end
						end

						for _, veh in ipairs(getElementsWithinColShape(c, "vehicle")) do
							if getElementDimension(veh) == v.dim then
								setElementData(veh, "greenzoneveh", true)
							end

						end

						addEventHandler("onElementDestroy", c,
							function()
								if z[source] then
									z[source] = nil
								end
							end
						)

						addEventHandler("onColShapeHit", c,
							function(h,d)
								if h and isElement(h) and getElementType(h) == "player" and d then
									if getElementData(h, "colShapeFix_OUT") then
										setElementData(h, "colShapeFix_OUT", false)
										return
									end

									-- Hack to prevent shooting bug: if player teleports from one greenzone directly to another and fails to clean up (on time)
									if getElementData(h, "greenzone") then
										setElementData(h, "colShapeFix_IN", true)
										triggerClientEvent(h, "onEnterGreenzone", h)
									else
										setElementData(h, "greenzone", true)
										toggleControl(h, "fire", false)
										toggleControl(h, "aim_weapon", false)
										toggleControl(h, "vehicle_fire", false)
										toggleControl(h, "vehicle_secondary_fire", false)
									--	outputChatBox("* Greenzone * You have entered the greenzone", h, 0, 220, 0)
										triggerClientEvent(h, "onEnterGreenzone", h)
									end
								end
							end
						)

						addEventHandler("onColShapeHit", c,
							function(h,d)
								if h and isElement(h) and getElementType(h) == "vehicle" and d then --and d == getElementDimension('dim') 
									setElementData(h, "greenzoneveh", true)
								end
							end
						)

						addEventHandler("onColShapeLeave", c,
							function(h,d)
								if h and isElement(h) and getElementType(h) == "player" and d then
									if getElementData(h, "colShapeFix_IN") then
										setElementData(h, "colShapeFix_IN", false)
										return
									end

									if getElementData(h, "greenzone") then
										setElementData(h, "greenzone", false)
										toggleControl(h, "fire", true)
										toggleControl(h, "aim_weapon", true)
										toggleControl(h, "vehicle_fire", true)
										toggleControl(h, "vehicle_secondary_fire", true)
										--outputChatBox("* Greenzone * You have left the greenzone", h, 220, 220, 0)
										triggerClientEvent(h, "onLeaveGreenzone", h)
									else
										setElementData(h, "colShapeFix_OUT", true)
									end
								end
							end
						)

						addEventHandler("onColShapeLeave", c,
							function(h,d)
								if h and isElement(h) and getElementType(h) == "vehicle" and d then
									setTimer(setElementData, 350, 1, h, "greenzoneveh", false)
								end
							end
						)

					end
				end
			end
		end
	end
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), initGreenzones)

function resetGreenzoneData()
	for _, p in ipairs(getElementsByType("player")) do
		if isElement(p) then
			removeElementData(p, "greenzone")
		end
	end
end
addEventHandler("onResourceStop", getResourceRootElement(getThisResource()), resetGreenzoneData)