-- Scripted by G&T Mapping & Loki

function isPlayerAdmin(player) 
	local accountName = getAccountName(getPlayerAccount(player)) 
    if isObjectInACLGroup("user."..accountName , aclGetGroup("Admin")) or isObjectInACLGroup("user."..accountName , aclGetGroup("Moderator"))  or isObjectInACLGroup("user."..accountName , aclGetGroup("Vip")) then
        return true 
    end 
    return false 
end 




aclGroup = "Admin" -- This group can add and remove vips/staff.

function isPlayerInside(plr)
	if isElementWithinColShape(plr,cinemaCol) then
		return true
	end
end

function requestPlay(source,cmd,url)
    if not isPlayerAdmin(source) then return end
    if url and isPlayerInside(source) then
        local url = url:gsub('&list=(.+)','') or url
        local id = url:match('v=(.+)&') or url:match('v=(.+)#') or url:match('v=(.+)') or url:match('tu.be/(.+)#') or url:match('tu.be/(.+)?') or url:match('tu.be/(.+)')
        if url and id then
			local url = "https://www.youtube.com/watch?v="..id
			if not isDuplicate(url) then
				getData(id,url,source)
			else
                --triggerClientEvent(source,"onDxPopupMessage",resourceRoot,"El video ya estaba",3000)
                triggerClientEvent(source,"notification",resourceRoot,"El video ya esta","Eso po', ya esta en la playlist",3000)

			end
        else
            triggerClientEvent(source,"notification",resourceRoot,"URL Invalida",'es posible que estes usando YOUTU.BE\n en lugar de YOUTUBE.COM, avispate',10000)
			--triggerClientEvent(source,"onDxPopupMessage",resourceRoot,"URL invalida. recuerda que es youtube.com en lugar de youtu.be",10000)
		end
    end
end
addEvent("requestPlay",true)
addEventHandler("requestPlay",resourceRoot,requestPlay)


function requestPlayUrl(source,cmd,url)
    if not isPlayerAdmin(source) then return end
    if url and isPlayerInside(source) then
        triggerClientEvent("playRequestUrl",resourceRoot,url)

    end
end
addEvent("requestPlayUrl",true)
addEventHandler("requestPlayUrl",resourceRoot,requestPlayUrl)


function isDuplicate(url)
	for _,v in pairs(playlist) do
		if v[1].url == url then
			return true
		end
	end
end

function requestStop(source)
    if not isPlayerAdmin(source) then return end


    if isTimer(playTimer) then
        playlist = {nil}
        killTimer(playTimer)
        triggerClientEvent("stopRequest",resourceRoot)
        triggerClientEvent("syncRequest",resourceRoot,playlist)
    end
    if isTimer(restimer) then
        killTimer( restimer )
    end

end
addEvent("globalStop",true)
addEventHandler("globalStop",resourceRoot,requestStop)

function getURL(source)
    if isTimer(playTimer) and isPlayerInside(source) then
        outputChatBox(playlist[1][1]["url"],source,245,180,140,true)
    else
        triggerClientEvent(source,"notification",resourceRoot,"No hay video","Eso po', no hay un video puesto",3000)
        --outputChatBox("There's nothing playing",source,245,180,140,true)
    end
end
addCommandHandler("link",getURL)

function removeFromDxPlaylist(source,number)
    if not isPlayerAdmin(source) then return end

    if isPlayerInside(source) then
        if number == 1 then
            executeCommandHandler("skipvideo",source)
            return false
        end
        table.remove(playlist,tonumber(number))
        triggerClientEvent("syncRequest",resourceRoot,playlist)
        triggerClientEvent(source,"notification",resourceRoot,"Video borrado","Video #"..number.." Ha sido borrado de la playlist.",3000)
        --triggerClientEvent(source,"onDxPopupMessage",resourceRoot,"Number "..number.." Ha sido borrado de la playlist.",3500)
    else
        triggerClientEvent(source,"notification",resourceRoot,"No tienes permisos","No tienes permisos para hacer eso",3000)
       -- triggerClientEvent(source,"onDxPopupMessage",resourceRoot,"No tienes permisos para hacer eso.",3500,255,255,255,255,0,0)
    end
end
addEvent("requestRemove",true)
addEventHandler("requestRemove",resourceRoot,removeFromDxPlaylist)

function removeFromPlaylist(source,cmd,item)
    if not isPlayerAdmin(source) then return end

    if isPlayerInside(source) then
        if tonumber(item) then
            if tonumber(item) > 1 and tonumber(item) <= #playlist then
                table.remove(playlist,item)
            else
                outputChatBox("This track doesn't exist.",source,245,180,140,true)
            end
        else
            outputChatBox("ERROR: Syntax is /remove [number] e.g.: /remove 3",source,225,100,100,true)
        end
    else
        triggerClientEvent(source,"notification",resourceRoot,"No tienes permisos","No tienes permisos para hacer eso",3000)
    end
end

playersVoted = {}
maxVotes = 0
function voteToSkip(plr)
	if isTimer(playTimer) and isPlayerInside(plr) then
		local serial = getPlayerSerial(plr)
		for _,v in pairs(playersVoted) do
			if v:match(serial) then
              --  triggerClientEvent(plr,"onDxPopupMessage",resourceRoot,"You've already voted.")
                triggerClientEvent(source,"notification",resourceRoot,"Ya votaste","No seai tramposo ql",3000)

				return
			end
		end
		table.insert(playersVoted,serial)
		triggerClientEvent("syncVotes",resourceRoot,#playersVoted,maxVotes)
		if maxVotes > 0 and #playersVoted == maxVotes then
			executeCommandHandler("skipvideo",plr)
		end
	end
end
addEvent("voteToSkip",true)
addEventHandler("voteToSkip",resourceRoot,voteToSkip)

local elemType = "player"

function enterCinema(player)
    player = player or client

    maxVotes = math.round(#getElementsWithinColShape(cinemaCol,elemType)*.65,0,"ceil")
    triggerClientEvent("syncVotes",resourceRoot,#playersVoted,maxVotes)
    
    if maxVotes > 0 and #playersVoted == maxVotes then
        executeCommandHandler("skipvideo",player)
    end
    
    -- resume playback for entered player
    triggerClientEvent(player,"syncRequest",resourceRoot,playlist)
   
    setTimer(triggerClientEvent,500,1,player,"playRequest",resourceRoot,playlist[1][1].url,playlist[1][1].title,playlist[1][1].length,playlist[1][1].nick,currentVideoTime)
end
addEvent('enterCinema', true)
addEventHandler("enterCinema",resourceRoot,enterCinema)

function onEnterCinema(hitElem,matchDim)

    if hitElem and matchDim then
        if getElementType(hitElem) == "player" then
            exports.freeroam_mtachile:togglecine(hitElem,true)
            exports.huds:hidehuds(hitElem)

            if isTimer(playTimer) then
                enterCinema(hitElem)
            end
        end
	end
end
addEventHandler("onColShapeHit",cinemaCol,onEnterCinema)

function onLeaveCinema(leftElem,matchDim)

    if leftElem and matchDim then
        if getElementType(leftElem) == "player" then

            exports.freeroam_mtachile:togglecine(leftElem, false)
            exports.huds:showhuds(leftElem)

            if isTimer(playTimer) then
                for i,v in pairs(playersVoted) do
                    if v:match(getPlayerSerial(leftElem)) then
                        -- remove vote when player leaves the cinema
                        table.remove(playersVoted,i)
                        maxVotes = math.round(#getElementsWithinColShape(cinemaCol,elemType)*.65,0,"ceil")
                        triggerClientEvent("syncVotes",resourceRoot,#playersVoted,maxVotes)
                    end
                end
            end
        end
	end
end
addEventHandler("onColShapeLeave",cinemaCol,onLeaveCinema)

function onLeaveServer()
	if isTimer(playTimer) then
		for plr,serial in pairs(playersVoted) do
			if serial:match(getPlayerSerial(source)) then
				-- remove vote when player leaves the server while in the cinema
				maxVotes = math.round(#getElementsWithinColShape(cinemaCol,elemType)*.65,0,"ceil")
				table.remove(playersVoted,plr)
				triggerClientEvent("syncVotes",resourceRoot,#playersVoted,maxVotes)
			end
		end
	end
end
addEventHandler("onPlayerQuit",root,onLeaveServer)

function listPlaylist(source)
	if isPlayerInside(source) then
		for i,v in pairs(playlist) do
			setTimer(function()
				if i == 1 then outputChatBox("#F5B48C||| #F5B48CNow Reproduciendo #F5B48C|||",source,245,180,140,true) end
				if i == 2 then outputChatBox("#F5B48C||| Siguiente |||",source,245,180,140,true) end
				local length = string.format("%.2d:%.2d:%.2d",v[1].length/(60*60),v[1].length/60%60,v[1].length%60)
				outputChatBox(i..". #FFFFFF"..v[1].title.."#F5B48C Largo: #FFFFFF"..length,source,245,180,140,true)
			end,50,1)
		end
	end
end
addEvent("showPlaylist",true)
addEventHandler("showPlaylist",resourceRoot,listPlaylist)

function sendPlaylist(plr)
    triggerClientEvent(plr,"syncRequest",resourceRoot,playlist)
end
addEvent("syncRequestFromClient",true)
addEventHandler("syncRequestFromClient",resourceRoot,sendPlaylist)

function startPlaying(source,cmd)
  --  if not isPlayerAdmin(source) then return end

    addCommandHandler("replay",startPlaying)
    addCommandHandler("skipvideo",startPlaying)
    
	-- set max votes
    if #getElementsWithinColShape(cinemaCol,elemType) == 2 then
        maxVotes = 2
    else
        maxVotes = math.round(#getElementsWithinColShape(cinemaCol,elemType)*.65,0,"ceil")
    end

    -- reset votes
    for i=1,#playersVoted do
		playersVoted[i] = nil
	end
    triggerClientEvent("syncVotes",resourceRoot,#playersVoted,maxVotes)
    
    -- handle playing
    if cmd == "replay" then
        if isTimer(playTimer) then
            killTimer(playTimer)
            --triggerClientEvent("onDxPopupMessage",resourceRoot,"Replaying current song")
            triggerClientEvent("notification",resourceRoot,"Cine","Repetitiendo video",3000)

        end
	elseif cmd == "skipvideo" then
        if isTimer(playTimer) then
            killTimer(playTimer)
            table.remove(playlist,1)
            --triggerClientEvent("onDxPopupMessage",resourceRoot,"Este video fue saltado po "..getPlayerName(source))
            triggerClientEvent("notification",resourceRoot,"Video saltado","Video ql fome",3000)

            if  #playlist == 0 then
                triggerClientEvent("stopRequest",resourceRoot)
                return false
            end
        end
    end
    if not isTimer(playTimer) then
        if playlist[1][1]["url"] then
            triggerClientEvent("playRequest",resourceRoot,playlist[1][1]["url"],playlist[1][1]["title"],playlist[1][1]["length"],playlist[1][1]["nick"],0)
            resumeTime()
            playTimer = setTimer(function()
                table.remove(playlist,1)
                if #playlist > 0 then
                    if isTimer(playTimer) then
                        killTimer(playTimer)
                    end
                    startPlaying()
                else
                    if isTimer(playTimer) then
                        killTimer(playTimer)
                    end
                    triggerClientEvent("stopRequest",resourceRoot)
                    triggerClientEvent("syncRequest",resourceRoot,playlist)
                end
            end,(playlist[1][1]["length"]*1000)+3000,1) -- added 3 secs to compensate for load times
        else
            outputChatBox("List is empty",source,245,180,140,true)
        end
    else
        outputChatBox("Playlist reproduciendo",source,245,180,140,true)
    end
    
    triggerClientEvent("syncRequest",resourceRoot,playlist)
end

function togglePanel(source)
    if cinemaCol then
        if isPlayerInside(source) then
            triggerClientEvent(source,"togglePanel",resourceRoot)
        end
    end
end
-- toggle key is in s-binds.lua

function adminCmds(cmd)
    --if not isPlayerAdmin(source) then return end
            

    if cmd == "replay" or cmd == "stopplay" or cmd == "stopsong" or cmd == "playall" or cmd == "skipvideo" or cmd == "remove" or cmd == "delete" then
        if isPlayerAdmin(source) then
             return
        else
           -- triggerClientEvent(source,"onDxPopupMessage",resourceRoot,"You don't have permission to do this.",3500,255,255,255,255,0,0)
            triggerClientEvent(source,"notification",resourceRoot,"Denegado","Debes ser admin/moderador",3500)
            cancelEvent()
        end
    end
	if cmd == "play" then
		
	end
end
addEventHandler("onPlayerCommand",root,adminCmds)

addCommandHandler("play",requestPlay)
addCommandHandler("playurl",requestPlayUrl)
addCommandHandler("stopplay",requestStop)
addCommandHandler("stopsong",requestStop)
addCommandHandler("playall",startPlaying)
addCommandHandler("remove",removeFromPlaylist)
addCommandHandler("delete",removeFromPlaylist)

outputDebugString("Wena los cine funcionando de pana")

-------------------
-- COLSHAPE STUF --
-------------------

function getPlayersInCol()
    local userlistTable = {}
    local playerTable = getElementsWithinColShape(cinemaCol,"player")
    if playerTable then
        for _,v in pairs(playerTable) do
            local name = getPlayerName(v)
            if isPlayerManager(v) then
                table.insert(userlistTable, {name = name, vip = true})
            else
                table.insert(userlistTable, {name = name, vip = false})
            end
        end
        triggerClientEvent("onAddToUserlist",resourceRoot,userlistTable)
    end
end
addEvent("onGetPlayersInCol",true)
addEventHandler("onGetPlayersInCol",resourceRoot,getPlayersInCol)

function resumeTime()
    if isTimer(restimer) then
        killTimer( restimer )
    end
    currentVideoTime = 3
    restimer = setTimer(
        function()
            currentVideoTime = currentVideoTime + 1
    end,1000,playlist[1][1]["length"]+3.5)
end