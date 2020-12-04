local shader
local frames = {}
local frameLastTick = getTickCount()
local frameIds = 1
local speed = 100

local textures = {}

local screenShader = dxCreateShader("screen.fx")
local shader =       dxCreateShader("shader.fx")

--time = 180+90

local function render()

	if mode == 'video' then
	--	outputChatBox('video')
		dxSetShaderValue(screenShader,"gTexture",Screen)
	end

	if mode == 'secuence' then

		if getTickCount() - frameLastTick < speed then return end
		frameIds = frameIds + 1
		if frameIds > totalframes then
			frameIds = 1
		end
		dxSetShaderValue ( shader, "gTexture", frames[frameIds] )
		frameLastTick = getTickCount()
	
		--outputChatBox('frame: '..frameIds)

	end


--	dxDrawCircle(500,500,100,0,360,tocolor(0,0,0,255))
--	dxDrawCircle(500,500,100,270,time,white)

end


local function init()

	--local obj = createObject(2102,231.16306, -1840.54529,20, 0, 0, 90)

	for i,folder in ipairs(secuences) do 

		-- usa la primera como default
		if i == 1 then

			speed = folder['speed']
			totalframes =  folder['frames']

			for i=1,folder['frames'] do
		--		outputChatBox('imagen cargada numero'.. i)
				texture = dxCreateTexture(folder['name'].."/"..tostring(i).."."..folder['format'])
				table.insert(frames,i,texture)
			end
		end

		-- guarda todas las secuancias en una tabla llamada secuences

		for i=1,folder['frames'] do
			texture = dxCreateTexture(folder['name'].."/"..tostring(i).."."..folder['format'])
			table.insert(textures,i,texture)
		end

	end

	frameLastTick = getTickCount()
	frameIds = 1
	mode = 'secuence'
	engineApplyShaderToWorldTexture ( shader, texturename )
	addEventHandler( "onClientHUDRender",root,render)

end

addEventHandler("onClientResourceStart",resourceRoot,init)



function secuence(name)
	--if Screen then
	--	destroyElement(Screen)
	--else
	engineRemoveShaderFromWorldTexture(screenShader,texturename)
	engineApplyShaderToWorldTexture ( shader, texturename )
	mode = 'secuence'

	for i,folder in ipairs(secuences) do 
		if  folder['name'] == name then
		--	outputChatBox('carpeta encontrada: '..folder['name'])

			
			for i=1,200 do 
			--	outputChatBox('frame '..i..' borrado')
				table.remove(frames,i)
			
			end

			for i=1,folder['frames'] do
				texture = dxCreateTexture(folder['name'].."/"..tostring(i).."."..folder['format'])
				table.insert(frames,i,texture)
			end

			speed = folder['speed']
			totalframes = folder['frames']
			frameIds = 1

		end
	
	end



end
addEvent('secuence',true)
addEventHandler("secuence",root,secuence)


function video(name)
	local resourcename = getResourceName(getThisResource())

	engineRemoveShaderFromWorldTexture(shader,texturename)
	engineApplyShaderToWorldTexture(screenShader,texturename)
	mode = 'video'

	local url = 'http://mta/'..resourcename..'/videos/'..name..'.html'

	if Screen then
		loadBrowserURL(Screen,url)
	else

		Screen = createBrowser(1280,718,true,false) --orig: 599,321  -- standard-tv 640,360  -- standard-cin 683,360

		addEventHandler("onClientBrowserCreated",Screen,function()
			outputChatBox('loaded')
			loadBrowserURL(Screen,url)

			setDevelopmentMode(true, true)
			toggleBrowserDevTools(Screen, true)
		end)



		addEventHandler("onClientBrowserLoadingFailed",Screen,function(url,err,errorDescription)
			outputChatBox(errorDescription)
		end)
	end
	
	dxSetShaderValue(screenShader,"gTexture",Screen)
	


end
addEvent('video',true)
addEventHandler("video",root,video)


function karaoke(name)
	local resourcename = getResourceName(getThisResource())

	engineRemoveShaderFromWorldTexture(shader,texturename)
	engineApplyShaderToWorldTexture(screenShader,texturename)
	mode = 'video'


	for i,karaoke in ipairs(karaokes) do 
		if karaoke['name'] == name then
		--	outputChatBox('carpeta encontrada: '..folder['name'])
		local url = 'http://mta/'..resourcename..'/videos/'.. karaoke['name']..'.html'

		if Screen then
			loadBrowserURL(Screen,url)
		else
	
			Screen = createBrowser(900,500,true,false) --orig: 599,321  -- standard-tv 640,360  -- standard-cin 683,360
	
			addEventHandler("onClientBrowserCreated",Screen,function()
				loadBrowserURL(Screen,url)
	
				--setDevelopmentMode(true, true)
				--toggleBrowserDevTools(Screen, true)
				setTimer(function()
					injectBrowserMouseDown(Screen, 'left') -- su click piolacomo
				
				end,10000,10)
		
			end)
	
	
	
			addEventHandler("onClientBrowserLoadingFailed",Screen,function(url,err,errorDescription)
				outputChatBox(errorDescription)
			end)

		end
	
	end


	
	
	end
	
	dxSetShaderValue(screenShader,"gTexture",Screen)
	


end
addEvent('karaoke',true)
addEventHandler("karaoke",root,karaoke)

local screenWidth, screenHeight = guiGetScreenSize()

function webBrowserRender()
	--Render the browser on the full size of the screen.
	dxDrawImage(0, 0, screenWidth, screenHeight, Screen, 0, 0, 0, tocolor(255,255,255,255), true)
end
