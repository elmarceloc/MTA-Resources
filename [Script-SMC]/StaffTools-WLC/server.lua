------SETTINGS--------
local staffTeamName = "Staff" --(string) name of the team which will be created
local teamR = 123 --(int) red value of the team color
local teamG = 0 --(int) green value of the team color
local teamB = 123 --(int) blue value of the team color
local staffSkin = 217 --(int) the skin id of the staff team member's skin

-----DONT TOUCH THESE--
local staffTeam

--------------------CREATE A STAFF TEAM WHEN THE RESOURCE STARTS---------------------
function createStaffTeam()
    staffTeam = createTeam(staffTeamName, teamR, teamG, teamB)
	for i, thePlayer in ipairs (getElementsByType("player")) do
		if thePlayer:getData("adminTools.isStaff") then
			movePlayerToStaff(thePlayer)
		end
	end
end
addEventHandler("onResourceStart", resourceRoot, createStaffTeam)

--------------------MOVE PLAYER TO THE STAFF TEAM AND VICE VERSA-----------------------------------
function movePlayerToStaff(thePlayer)
	thePlayer:setData("adminTools.oldSkin", thePlayer:getModel())
	thePlayer:setData("adminTools.isStaff", true)
	thePlayer:setTeam(staffTeam)
	thePlayer:setModel(staffSkin)
	thePlayer:setNametagColor(teamR, teamG, teamB)
	onStaffTeamEnter(thePlayer)
end

function staffCommandHandler(thePlayer)
	local account = thePlayer:getAccount() 
	--if account and ACLGroup.get("Admin"):doesContainObject("user."..account:getName()) then
	--proper oop is above, but doesn't work
	if account and isObjectInACLGroup("user."..thePlayer:getAccount():getName(), ACLGroup.get("Admin")) then
		if playerTeam then
			if playerTeam:getName() == staffTeamName then
				thePlayer:outputChat("You are already in the group!", 150,0,0, false)
			else
				movePlayerToStaff(thePlayer)
			end
		else
			movePlayerToStaff(thePlayer)
		end
	else
		thePlayer:outputChat("Access Denied!", 150, 0, 0, false)
	end
end
addCommandHandler("staff", staffCommandHandler)

function normalCommandHandler(thePlayer)
	local playerTeam = thePlayer:getTeam()
	if playerTeam == staffTeam then
		thePlayer:setTeam(nil)
		thePlayer:setData("adminTools.isStaff", false)
		local skin = tonumber(thePlayer:getData("adminTools.oldSkin"))
		thePlayer:setModel(skin)
		onStaffTeamExit(thePlayer)
	end
end
addCommandHandler("normal", normalCommandHandler)

----------------------------------NO STAFF CAR DAMAGE------------------------------------------
function setDamageProofOnEnter(thePlayer, seat)
	if thePlayer:getTeam() == staffTeam and seat == 0 and not source:isDamageProof() then
		source:setDamageProof(true)
		source:setData("adminTools.changedDamageProof", true)
	end
end
addEventHandler("onVehicleEnter", root, setDamageProofOnEnter)

function onStaffTeamEnter(thePlayer)
	local vehicle = thePlayer:getOccupiedVehicle()
	if vehicle and thePlayer:getOccupiedVehicleSeat() == 0 and not vehicle:isDamageProof() then
		vehicle:setDamageProof(true)
		vehicle:setData("adminTools.changedDamageProof", true)
	end
end

function setDamageProofOnExit(thePlayer, seat)
	if thePlayer:getTeam() == staffTeam and seat == 0 and source:getData("adminTools.changedDamageProof") then
		source:setDamageProof(false)
		source:setData("adminTools.changedDamageProof", false)
	end
end
addEventHandler("onVehicleExit", root, setDamageProofOnExit)

function onStaffTeamExit(thePlayer)
	local vehicle = thePlayer:getOccupiedVehicle()
	if vehicle and thePlayer:getOccupiedVehicleSeat() == 0 and vehicle:getData("adminTools.changedDamageProof") then
		vehicle:setDamageProof(false)
		vehicle:setData("adminTools.changedDamageProof", false)
	end
end

------------------------------CLEAR THE CHAT---------------------------------------
--function clearChat( thePlayer )
	--for i=0, 100, 1 do
		--outputChatBox(" ")
	--end
--end
--addCommandHandler("clear", clearChat)

-----------------------------DONT ANNOY MESSAGE------------------------------
addEvent("onStaffDamaged", true)
function showAnnoyMessage()
	source:outputChat("NO ATAQUE AL EQUIPO DE STAFF", 255, 0, 0, false)
end
addEventHandler("onStaffDamaged", root, showAnnoyMessage)