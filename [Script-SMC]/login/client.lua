--[[
Usefull functions:
executeBrowserJavascript(theBrowser, 'document.getElementById("demo").innerHTML = "' .. msg ..'"')
]]

local screenWidth, screenHeight = guiGetScreenSize()

-- local page = "http://mta/html-login-panel/html/login.html"
local vid = "http://mta/login/html/video.html"
local page = "http://mta/login/index.html"
local browser = guiCreateBrowser(0, 0, screenWidth, screenHeight, true, true, false)
local theBrowser = guiGetBrowser(browser)

resourceRoot = getResourceRootElement(getThisResource()) 


addEventHandler("onClientBrowserCreated", theBrowser, 
	function()

		loadBrowserURL(theBrowser, vid)
		showCursor(true)


	--	local file = fileOpen('username.txt') -- attempt to open the file
	--	local count = fileGetSize(file) -- get file's total size
	--	local data = fileRead(file, count) -- read whole file

		 
		--executeBrowserJavascript(theBrowser, 'document.getElementById("login").value = "' .. tostring(data) ..'"')

	end
)


addEvent("showvid", true)
addEventHandler("showvid", root, 
	function()
		loadBrowserURL(theBrowser, vid)
		showCursor(true)
		--addEventHandler('onClientRender', root, paneo)
	end
)


addEvent("showlogin", true)
addEventHandler("showlogin", root, 
	function()
		loadBrowserURL(theBrowser, page)
		showCursor(true)
	--	triggerServerEvent("getusername", resourceRoot, localPlayer)

	--	setDevelopmentMode(true, true) -- Enable client dev mode
	--	toggleBrowserDevTools(theBrowser, true) -- Toggle the CEF dev console

		--addEventHandler('onClientRender', root, paneo)
	end
)



addEvent("onClientPlayerLogin", true)
addEventHandler("onClientPlayerLogin", root,
	function()
		destroyElement(browser)
		showCursor(false)

--		removeEventHandler('onClientRender',root,paneo)
		setCameraTarget(localPlayer)

	end
)

addEvent("onClientPlayerRegister", true)
addEventHandler("onClientPlayerRegister", root,
	function()
		local msg = 'Te has Registrado satisfactoriamente.'
		outputChatBox(msg,0,255,0)
		executeBrowserJavascript(theBrowser, 'document.getElementById("alert").innerHTML = "' .. msg ..'"')
		executeBrowserJavascript(theBrowser, 'document.getElementById("alert").className = " ok visible"')
	end
)


addEvent("onClientPlayerNotLogin", true)
addEventHandler("onClientPlayerNotLogin", root,
	function()
		local msg = 'Usuario o contraseña incorrecta.'

		outputChatBox(msg,255,0,0)
		executeBrowserJavascript(theBrowser, 'document.getElementById("alert").innerHTML = "' .. msg ..'"')
		executeBrowserJavascript(theBrowser, 'document.getElementById("alert").className = " err visible"')
		--executeBrowserJavascript(browser, "document.write('aa')")

	end
)


addEvent("onClientPlayerNotRegister", true)
addEventHandler("onClientPlayerNotRegister", root,
	function(type)
		local msg = ''
		if type == 'notmath' then
			msg = 'Las contraseñas no coinciden.'
		elseif type == 'already' then
			msg = 'Esta cuenta ya existe.'
		end
		outputChatBox(msg,255,0,0)
		executeBrowserJavascript(theBrowser, 'document.getElementById("alert").innerHTML = "' .. msg ..'"')
		executeBrowserJavascript(theBrowser, 'document.getElementById("alert").className = " err visible"')
		--executeBrowserJavascript(browser, "document.write('aa')")

	end
)



function dologin(login, password,remember)
	triggerServerEvent("login", resourceRoot, login, password,remember)
end
addEvent("dologin", true)
addEventHandler("dologin", root, dologin)

function doregister(login, password,password2)
	triggerServerEvent("register", resourceRoot, login, password,password2)
end
addEvent("doregister", true)
addEventHandler("doregister", root, doregister)