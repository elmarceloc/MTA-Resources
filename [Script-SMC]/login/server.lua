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
		saveusername(username)
	else
		triggerClientEvent(client, "onClientPlayerNotRegister", client,'already')
	end
end
addEvent("register", true)
addEventHandler("register", root, registerPlayer)

function saveusername(username)

	--local filetest = fileOpen("username.txt", true)       -- attempt to open the file (read only)

--	if filetest then
		fileDelete("username.txt")                            
--	end
	local file = fileCreate("username.txt")                -- attempt to create a new file

--	local file = fileOpen('username.txt') -- attempt to open the file
	fileWrite(file,username)     -- write a text line
	fileClose(file)

end


function sendvid( )
		
		triggerClientEvent(source, "showvid", source)
		
end
addEvent("video", true)
addEventHandler("video", root, sendvid)





function getusername(player)
	local file = fileOpen('username.txt') -- attempt to open the file
	local count = fileGetSize(file) -- get file's total size
	local data = fileRead(file, count) -- read whole file
 	triggerClientEvent(player, "putusername", player, data)

end
addEvent("getusername", true)
addEventHandler("getusername", root, getusername)