-- Scripted by G&T Mapping & Loki

-------------------
--   API STUFF   --
-------------------
playlist = {}

local apiKey = "AIzaSyDmiR8d1EidCbUk_SD7HwA515v-5IRqgMM" -- In case of problems, create your own YouTube API key (https://console.developers.google.com/apis)

function getData(id,url,source)
	if hasObjectPermissionTo(getThisResource(),"function.fetchRemote",false) then
		local fetch = fetchRemote('https://www.googleapis.com/youtube/v3/videos?id='..id..'&key='..apiKey..'&fields=items(snippet(title),contentDetails(duration))&part=snippet,contentDetails',2,
		function(data,err,url,source)
			triggerClientEvent(source,"showLoadIcon",resourceRoot,false)
			if err == 0 then
				if url then
					local info = fromJSON(data)
					if info then
						for _,v in pairs(info.items) do
							title = v.snippet.title
							length = v.contentDetails.duration
						end
						if title and length then
							local hr = length:match('PT(.-)H') or 0
							local min = length:match('H(.-)M') or length:match('PT(.-)M') or 0
							local sec = length:match('M(.-)S') or length:match('H(.-)S') or length:match('PT(.-)S') or 0

							if sec then length = sec end
							if min and sec then length = (min*60) +tonumber(sec) end
							if hr and min and sec then length = hr*60*60+min*60+sec end
							
							local nick = getPlayerName(source) or "unknown"
							
							table.insert(playlist,{[1] = {url = url, title = title, length = length, nick = nick}})
							--triggerClientEvent("onDxPopupMessage",resourceRoot,nick.." added "..title)
							triggerClientEvent("notification",resourceRoot,"Nuevo video",nick.." agrego "..title,3000)

							
							if #playlist == 1 then
								startPlaying()
							end
							
							triggerClientEvent("syncRequest",resourceRoot,playlist)
							
							title,length = nil,nil
						else
						--	triggerClientEvent(source,"onDxPopupMessage",resourceRoot,"Can't add video: no length or title found.")
							triggerClientEvent(source,"notification",resourceRoot,"Video caído",'F',3000)

						end
					else
					--	triggerClientEvent(source,"onDxPopupMessage",resourceRoot,"There's an issue with the API.")
					triggerClientEvent(source,"notification",resourceRoot,"Se fue f el cine",'Hablale a @marcelo en discord\n pa que lo arregle',3000)
					end
				end
			else
				--triggerClientEvent(source,"onDxPopupMessage",resourceRoot,"Connection timed out. Couldn't reach API.",7500)
				triggerClientEvent(source,"notification",resourceRoot,"Se fue f el cine",'Hablale a @marcelo en discord\n pa que lo arregle',3000)
			end
		end,'',true,url,source)
		triggerClientEvent(source,"showLoadIcon",resourceRoot,true)
	else
		--triggerClientEvent(source,"onDxPopupMessage",resourceRoot,"This resource doesn't have access to fetchRemote!",5000)
		triggerEvent(source,"notification",resourceRoot,"Se fue f el cine",'Hablale a @marcelo en discord\n pa que lo arregle',3000)

	end
end