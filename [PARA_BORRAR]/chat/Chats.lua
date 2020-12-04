local chatTime = {}
local lastChatMessage = {}

local localmaxdistance = tonumber(get("*local"))
local roleomaxdistance = tonumber(get("*roleo"))

local spammsg = get("*spammsg")
local repeatmsg = get("*repeatmsg")
local censoredwords = get("*censor") 

local subsitute = get("*subsitute") 

local delay = get("*delay")


function RGBToHex(red, green, blue, alpha)
	
	-- Make sure RGB values passed to this function are correct
	if( ( red < 0 or red > 255 or green < 0 or green > 255 or blue < 0 or blue > 255 ) or ( alpha and ( alpha < 0 or alpha > 255 ) ) ) then
		return nil
	end

	-- Alpha check
	if alpha then
		return string.format("#%.2X%.2X%.2X%.2X", red, green, blue, alpha)
	else
		return string.format("#%.2X%.2X%.2X", red, green, blue)
	end

end

function censor(msg)
	local words = {}
	local censored = split(censoredwords, ",")

	local random = split(subsitute, ",")

	for i,tocensor in ipairs(censored) do 
		msg = msg:gsub( tocensor, random[ math.random( #random ) ])
	end

	return msg
end



--================
--==  GENERAL	==
--================

function chatGeneral(source, cmd, ...) 

	if isPlayerMuted(source) then return end

	if chatTime[source] and chatTime[source] + tonumber(delay) > getTickCount() then
		outputChatBox(spammsg, source, 255, 0, 0)
		return
	else
		chatTime[source] = getTickCount()
	end
	if lastChatMessage[source] and lastChatMessage[source] == msg then
		outputChatBox(repeatmsg, source, 255, 0, 0)
		return
	else
		lastChatMessage[source] = msg
	end


	local msg = table.concat ( { ... }, " " )
	local name = getPlayerName(source)
	local r, g, b = getPlayerNametagColor(source)


	for _,player in ipairs(getElementsByType("player")) do 	
		msg = censor(msg)
		msg = msg:gsub('#%x%x%x%x%x%x', '')

		triggerClientEvent("onChatIncome", source, censor(msg), {0, 90, 90	})

		outputChatBox("#00aae4[ GENERAL] "..RGBToHex(r,g,b) .." "..name.. ':' .. " #ffffff" .. msg,player, 255, 255, 255, true) --efeito no chat
		outputServerLog( "CHAT General: " .. getPlayerName(source) .. ": " .. msg )
	end 
end 
addCommandHandler("general",  chatGeneral)

--================
--==    CLAN	==
--================

function chatClan(source, cmd, ...) 

	if not getPlayerTeam(source) then return end
	if isPlayerMuted(source) then return end


	local msg = table.concat ( { ... }, " " )
	local name = getPlayerName(source)
	local r, g, b = getPlayerNametagColor(source)

	local cr, cg, cb = getTeamColor(getPlayerTeam(source))

	local myteam = getTeamName(getPlayerTeam(source))


	for _,player in ipairs(getElementsByType("player")) do 

		local team = getTeamName(getPlayerTeam(player))

		if myteam == team then

			msg = msg:gsub('#%x%x%x%x%x%x', '')

			triggerClientEvent("onChatIncome", source, msg,{cr, cg, cb})

			outputChatBox(RGBToHex(cr,cg,cb ).." [ CLAN ] "..RGBToHex(r,g,b)..name.. ':' .. " #ff8e1f"..msg,player, 255, 255, 255, true) --efeito no chat
			outputServerLog( "CHAT Clan: " .. getPlayerName(source) .. ": " .. msg )
		
		end
	
	end 


end 
addCommandHandler("clan",  chatClan)

--================
--==   ROLEO	==
--================

addEventHandler ( "onPlayerChat", root, function ( msg, tp, ... )  
	if ( tp == 1 ) then 
		cancelEvent ( ) 

		if isPlayerMuted(source) then return end


		if chatTime[source] and chatTime[source] + tonumber(delay) > getTickCount() then
			outputChatBox(spammsg, source, 255, 0, 0)
			return
		else
			chatTime[source] = getTickCount()
		end
		if lastChatMessage[source] and lastChatMessage[source] == msg then
			outputChatBox(repeatmsg, source, 255, 0, 0)
			return
		else
			lastChatMessage[source] = msg
		end



		local name = getPlayerName(source)
		local r, g, b = getPlayerNametagColor(source)
	

		for _,player in ipairs(getElementsByType("player")) do 
			local x,y,z    = getElementPosition(source)
			local x2,y2,z2 = getElementPosition(player)

			local distance = getDistanceBetweenPoints3D(x,y,z,x2,y2,z2)



			if distance < roleomaxdistance then
				
				triggerClientEvent("onChatIncome", source, '*'..msg..'*',{136, 120, 0})
		
				outputChatBox("#fc0fc0 "..name .. ' ' .. msg  ,player, 255, 255, 255, true)
				outputServerLog( "CHAT Roleo: " .. getPlayerName(source) .. ": " .. msg )
			end
			
		end


	end 
end ) 

--================
--==   LOCAL	==
--================

addEventHandler('onPlayerChat', root,
	function(msg, type)
		if type == 0 then
			cancelEvent()
			
			if isPlayerMuted(source) then return end
			
			if chatTime[source] and chatTime[source] + tonumber(delay) > getTickCount() then
				outputChatBox(spammsg, source, 255, 0, 0)
				return
			else
				chatTime[source] = getTickCount()
			end
			if lastChatMessage[source] and lastChatMessage[source] == msg then
				outputChatBox(repeatmsg, source, 255, 0, 0)
				return
			else
				lastChatMessage[source] = msg
			end

			local r, g, b = getPlayerNametagColor(source)
			
			for _,player in ipairs(getElementsByType("player")) do 
				local x,y,z    = getElementPosition(source)
				local x2,y2,z2 = getElementPosition(player)

				local distance = getDistanceBetweenPoints3D(x,y,z,x2,y2,z2)


				if distance < localmaxdistance then
					triggerClientEvent("onChatIncome", source, msg,{0, 0, 0})
					msg = censor(msg)
					msg = msg:gsub('#%x%x%x%x%x%x', '')

					outputChatBox(getPlayerName(source) .. ': #FFFFFF' .. msg, player, r, g, b, true)
					outputServerLog( "CHAT Local: " .. getPlayerName(source) .. ": " .. msg )
				end

			end
			
		end
	end
)
	
	
addEventHandler("onPlayerJoin", getRootElement(),  
function() 
	bindKey(source, "u", "down", "chatbox", "general") --bind
	bindKey(source, "y", "down", "chatbox", "clan") --bind
	bindKey(source, "i", "down", "chatbox", "me") --bind
end 
) 

addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), function() 
	for index,player in pairs(getElementsByType("player")) do 
		bindKey(player,"u", "down", "chatbox", "general") --bind
		bindKey(player,"y", "down", "chatbox", "clan") --bind
		bindKey(player,"i", "down", "chatbox", "me") --bind
	end 
end 
) 


function quitHandler(player)
	chatTime[source] = nil
	lastChatMessage[source] = nil
end
addEventHandler('onPlayerQuit', root, quitHandler)