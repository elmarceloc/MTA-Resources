-- For sync reasons (walking style visibility), set this serverside
function applyStyle(theStyle)
	setPedWalkingStyle(client, theStyle)
end
addEvent ("onApplyStyle", true)
addEventHandler ("onApplyStyle", getRootElement(), applyStyle)

--[[function applyStyleCmd(style)
	setPedWalkingStyle(client, style)
end
addEvent ("onApplyStyleCmd", true)
addEventHandler ("onApplyStyleCmd", getRootElement(), applyStyleCmd)]]--