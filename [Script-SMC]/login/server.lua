function loginPlayer(username, password,remember)

	local account = getAccount(username, password)
	if (account ~= false) then
		logIn(client, account, password)

		triggerClientEvent(client, "onClientPlayerLogin", client)
		if remember == "1" then
			saveusername(username)
		end
	else
		triggerClientEvent(client, "onClientPlayerNotLogin", client)
	end
end
addEvent("login", true)
addEventHandler("login", root, loginPlayer)

function registerPlayer(username, password, password2)
	local accountAdded = addAccount(username, password)

	if password ~= password2 then
		triggerClientEvent(client, "onClientPlayerNotRegister", client,'notmath')
		return
	end

	if (accountAdded) then
		triggerClientEvent(client, "onClientPlayerRegister", client)

		logIn(client, accountAdded, password)
		triggerClientEvent(client, "onClientPlayerLogin", client)
	else
		triggerClientEvent(client, "onClientPlayerNotRegister", client,'already')
	end
end
addEvent("register", true)
addEventHandler("register", root, registerPlayer)


function sendvid( )
		
		triggerClientEvent(source, "showvid", source)
		
end
addEvent("video", true)
addEventHandler("video", root, sendvid)