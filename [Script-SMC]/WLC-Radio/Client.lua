channelTable =
{
	["Radio WLC"] = "http://192.241.153.169/radio/8000/radio.mp3",
	[1] = "Radio WLC",
	
	["Radio CNN"] = "https://radio.zgaming.cl/radio/8020/radio.mp3",
	[2] = "Radio CNN",
	
	["Radio Futuro"] = "http://provisioning.streamtheworld.com/pls/FUTURO.pls",
	[3] = "Radio Futuro",
	
	["Radio Concierto"] = "http://19793.live.streamtheworld.com/CONCIERTOAAC.aac",
	[4] = "Radio Concierto",
	
	["Radio Agricultura"] = "http://unlimited3-cl.dps.live/agricultura/aac/icecast.audio",
	[5] = "Radio Agricultura",
	
	["Radio Activa"] = "http://18233.live.streamtheworld.com/ACTIVAAAC.aac",
	[6] = "Radio Activa",
	
	["Radio La Clave"] = "http://tunein.digitalproserver.com/laclavebb.aac",
	[7] = "Radio La Clave",
	
	["Radio Rock and Pop"] = "http://provisioning.streamtheworld.com/pls/ROCK_AND_POP.pls",
	[8] = "Radio Rock and Pop",
	
	["Radio Candela"] = "http://unlimited11-cl.dps.live/candela/aac/icecast.audio",
	[9] = "Radio Candela",
	
	["Radio Corazon"] = "http://14003.live.streamtheworld.com/CORAZONAAC.aac",
	[10] = "Radio Corazon",
	
	["Radio Oasis"] = "https://us-b4-p-e-az1-audio.cdn.mdstrm.com/live-audio/5c58a34e176c2c0813b22e4b/5c915497c6fd7c085b29169d/icecast.audio",
	[11] = "Radio Oasis", 
	
	["Radio Lampa"] = "http://192.99.18.164:9838/;",
	[12] = "Radio Lampa", 
	
	["Radio FM Tiempo"] = "http://unlimited4-us.dps.live/fmtiempo/aac/icecast.audio",
	[13] = "Radio FM Tiempo",

	["Radio Carolina"] = "http://unlimited3-cl.dps.live/carolinafm/aac/icecast.audio",
	[14] = "Radio Carolina", 
	
	["Radio Disney"] = "http://unlimited3-cl.dps.live/disney/aac/icecast.audio",
	[15] = "Radio Disney", 

	["Radio Los 40"] = "http://provisioning.streamtheworld.com/pls/LOS40_CHILE.pls",
	[16] = "Radio Los 40", 
	
	["Radio ADN"] = "http://19173.live.streamtheworld.com/ADNAAC.aac",
	[17] = "Radio ADN",
	
	["Radio Romantica"] = "http://unlimited11-cl.dps.live/romantica/aac/icecast.audio",
	[18] = "Radio Romantica", 
	
	["Radio Infinita"] = "http://unlimited11-cl.dps.live/infinita/aac/icecast.audio",
	[19] = "Radio Infinita", 
	
	["Radio Zero"] = "https://unlimited3-cl.dps.live/zero/aac/icecast.audio",
	[20] = "Radio Zero", 
	
	["Radio Digital Valparaiso"] = "http://mimix.mercurio.cl:8000/valparaiso1",
	[21] = "Radio Digital Valparaiso", 
	
	["Radio Imagina"] = "http://provisioning.streamtheworld.com/pls/IMAGINA.pls",
	[22] = "Radio Imagina", 

	["Radio FM DOS"] = "http://provisioning.streamtheworld.com/pls/FMDOS.pls",
	[23] = "Radio FM DOS", 
	
	["Radio Play FM"] = "http://us-b4-p-e-by2-audio.cdn.mdstrm.com/live-audio-aw/5c8d6406f98fbf269f57c82c",
	[24] = "Radio Play FM", 
	
	["Radio otaku"] = "http://play.kwii.xyz/listen.pls",
	[25] = "Radio otaku",
	
	["Radio Bio-Bio"] = "http://unlimited3-cl.dps.live/biobiosantiago/aac/icecast.audio",
	[26] = "Radio Bio-Bio",
	
	["Radio Pudahuel"] = "http://17953.live.streamtheworld.com/PUDAHUELAAC.aac",
	[27] = "Radio Pudahuel",
	
	["Radio Universo"] = "http://unlimited11-cl.dps.live/universo/aac/icecast.audio",
	[28] = "Radio Universo",
	
	["Radio Cooperativa"] = "http://redirector.dps.live/cooperativafm/aac/icecast.audio",
	[29] = "Radio Cooperativa",
	
	["Radio Sonar FM"] = "https://us-b4-p-e-ev5-audio.cdn.mdstrm.com/live-audio/5c58a34e176c2c0813b22e4b/5c915724519bce27671c4d15/icecast.audio",
	[30] = "Radio Sonar FM",
	
--	["Radio NOU"] = "https://node-33.zeno.fm/6nnym92s9qzuv?rj-ttl=5&rj-tok=AAABcMb11dUALN8QrRYW-8rqVg",
--	[31] = "Radio NOU",

	["mute"] = "",
	[31] = "",
	
}

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

local screenX, screenY = guiGetScreenSize()

radioMainWindow = guiCreateWindow(screenX/2-254, 450, 508, 269, "[Wena las Radio]", false)
	guiWindowSetSizable(radioMainWindow, false)
	guiSetVisible(radioMainWindow, false)

radioTabPanel = guiCreateTabPanel(9, 26, 490, 234, false, radioMainWindow)

radioMainTab = guiCreateTab("Menu", radioTabPanel)

radioVisualizerPlaceholder = guiCreateGridList(5, 5, 480, 150, false, radioMainTab)

radioMetaArtistLabel = guiCreateLabel(9, 7, 466, 15, "Artista: ", false, radioVisualizerPlaceholder)
	guiSetFont(radioMetaArtistLabel, "default-bold-small")
	guiSetVisible(radioMetaArtistLabel, false)
radioMetaTitleLabel = guiCreateLabel(9, 27, 466, 15, "Titulo: ", false, radioVisualizerPlaceholder)
	guiSetFont(radioMetaTitleLabel, "default-bold-small")
	guiSetVisible(radioMetaTitleLabel, false)

radioPlayerPlayButton = guiCreateStaticImage(79, 160, 42, 42, "Img/PlayButton.png", false, radioMainTab)
radioPlayerStopButton = guiCreateStaticImage(79, 160, 42, 42, "Img/StopButton.png", false, radioMainTab)
	guiSetVisible(radioPlayerStopButton, false)
radioPlayerPrevButton = guiCreateStaticImage(42, 162, 32, 32, "Img/PreviousButton.png", false, radioMainTab)
radioPlayerNextButton = guiCreateStaticImage(126, 162, 32, 32, "Img/NextButton.png", false, radioMainTab)
radioHelpIcon = guiCreateStaticImage(5, 162, 32, 32, "Img/Info.png", false, radioMainTab)
radioPlayerVolume = guiCreateScrollBar(202, 184, 268, 15, true, false, radioMainTab)
	guiScrollBarSetScrollPosition(radioPlayerVolume, 30.0)  


radioLibraryTab = guiCreateTab("Biblioteca", radioTabPanel)
radioLibraryGridlist = guiCreateGridList(5, 6, 208, 199, false, radioLibraryTab)
	guiGridListSetSortingEnabled(radioLibraryGridlist, false)
guiGridListAddColumn(radioLibraryGridlist, "Lista de Estaciones de Radio", 0.9)
	for key, value in ipairs(channelTable) do
		if (value) then
			guiGridListAddRow(radioLibraryGridlist)
		end
	end
		guiGridListSetItemText(radioLibraryGridlist, 0, 1, "Radios Chile", true, false)
		guiGridListSetItemColor(radioLibraryGridlist, 0, 1, 132, 31, 255)
		guiGridListSetItemText(radioLibraryGridlist, 1, 1, "Radio WLC", false, false)
		guiGridListSetItemText(radioLibraryGridlist, 2, 1, "Radio CNN", false, false)
		guiGridListSetItemText(radioLibraryGridlist, 3, 1, "Radio Futuro", false, false)
		guiGridListSetItemText(radioLibraryGridlist, 4, 1, "Radio Concierto", false, false)
		guiGridListSetItemText(radioLibraryGridlist, 5, 1, "Radio Agricultura", false, false)
		guiGridListSetItemText(radioLibraryGridlist, 6, 1, "Radio Activa", false, false)
		guiGridListSetItemText(radioLibraryGridlist, 7, 1, "Radio La Clave", false, false)
		guiGridListSetItemText(radioLibraryGridlist, 8, 1, "Radio Rock and Pop", false, false)
		guiGridListSetItemText(radioLibraryGridlist, 9, 1, "Radio Candela", false, false)
		guiGridListSetItemText(radioLibraryGridlist, 10, 1, "Radio Corazon", false, false)
		guiGridListSetItemText(radioLibraryGridlist, 11, 1, "Radio Oasis", false, false)
		guiGridListSetItemText(radioLibraryGridlist, 12, 1, "Radio Lampa", false, false)
		guiGridListSetItemText(radioLibraryGridlist, 13, 1, "Radio FM Tiempo", false, false)
		guiGridListSetItemText(radioLibraryGridlist, 14, 1, "Radio Carolina", false, false)
		guiGridListSetItemText(radioLibraryGridlist, 15, 1, "Radio Disney", false, false)
		guiGridListSetItemText(radioLibraryGridlist, 16, 1, "Radio Los 40", false, false)
		guiGridListSetItemText(radioLibraryGridlist, 17, 1, "Radio ADN", false, false)
		guiGridListSetItemText(radioLibraryGridlist, 18, 1, "Radio Romantica", false, false)
		guiGridListSetItemText(radioLibraryGridlist, 19, 1, "Radio San Cristobal", false, false)
		guiGridListSetItemText(radioLibraryGridlist, 20, 1, "Radio Zero", false, false)
		guiGridListSetItemText(radioLibraryGridlist, 21, 1, "Radio Digital Valparaiso", false, false)
		guiGridListSetItemText(radioLibraryGridlist, 22, 1, "Radio Imagina", false, false)
		guiGridListSetItemText(radioLibraryGridlist, 23, 1, "Radio FM DOS", false, false)
		guiGridListSetItemText(radioLibraryGridlist, 24, 1, "Radio Play FM", false, false)
		guiGridListSetItemText(radioLibraryGridlist, 25, 1, "Radio Otaku", false, false)
		guiGridListSetItemText(radioLibraryGridlist, 26, 1, "Radio Bio-Bio", false, false)
		guiGridListSetItemText(radioLibraryGridlist, 27, 1, "Radio Pudahuel", false, false)
		guiGridListSetItemText(radioLibraryGridlist, 28, 1, "Radio Universo", false, false)
		guiGridListSetItemText(radioLibraryGridlist, 29, 1, "Radio Cooperativa", false, false)
		guiGridListSetItemText(radioLibraryGridlist, 30, 1, "Radio Sonar FM", false, false)
	--	guiGridListSetItemText(radioLibraryGridlist, 31, 1, "Radio NOU", false, false)
		guiGridListSetItemText(radioLibraryGridlist, 31, 1, "mute", false, false)
	--	guiGridListSetItemText(radioLibraryGridlist, 31, 1, "Musica otaku", false, false)
	
radioLibrarySearchField = guiCreateEdit(221, 21, 259, 28, "Buscar estacion de radio...", false, radioLibraryTab)
radioLibraryPlayButton = guiCreateButton(221, 54, 109, 27, "Play", false, radioLibraryTab)

radioSettingsTab = guiCreateTab("Configuracion", radioTabPanel)
radioSettingsLabel1 = guiCreateLabel(11, 6, 262, 18, "Visualizacion", false, radioSettingsTab)
	guiSetFont(radioSettingsLabel1, "default-bold-small")
	guiLabelSetColor(radioSettingsLabel1, 132, 31, 255)
radioVisOption1 = guiCreateRadioButton(16, 29, 173, 15, "Transparente", false, radioSettingsTab)
radioVisOption2 = guiCreateRadioButton(16, 49, 173, 15, "Rectangulo achatado", false, radioSettingsTab)
radioVisOption3 = guiCreateRadioButton(16, 69, 173, 15, "Rectangulo redondeado", false, radioSettingsTab)
radioVisOption4 = guiCreateRadioButton(16, 89, 173, 15, "Rectangulos", false, radioSettingsTab)
radioVisOption5 = guiCreateRadioButton(16, 109, 173, 15, "Por defecto", false, radioSettingsTab)
	guiRadioButtonSetSelected(radioVisOption5, true)
radioStreamSettingsLabel = guiCreateLabel(212, 6, 97, 15, "Emision", false, radioSettingsTab)
	guiSetFont(radioStreamSettingsLabel, "default-bold-small")
	guiLabelSetColor(radioStreamSettingsLabel, 132, 31, 255)
radioMuteOtherStreams = guiCreateCheckBox(218, 32, 132, 15, "Silenciar otros sonidos", false, false, radioSettingsTab)
radioOutputMessage = guiCreateCheckBox(233, 54, 232, 15, "Mensaje de salida si se detiene un sonido", false, false, radioSettingsTab)
radioRenderMetaInfo = guiCreateCheckBox(218, 74, 132, 15, "Renderizar información de artista", false, false, radioSettingsTab)
radioVisMetaInfo = guiCreateCheckBox(218, 94, 175, 15, "Mostrar informacion de artista", false, false, radioSettingsTab)
radioSetVolume = guiCreateCheckBox(218, 114, 232, 15, "Establecer otros sonidos en el mismo volumen", false, false, radioSettingsTab)
	
radioHelpWindow = guiCreateWindow(486, 224, 390, 381, "[WLC] Información", false)
	guiWindowSetSizable(radioHelpWindow, false)
	guiSetVisible(radioHelpWindow, false)
radioHelpMemo = guiCreateMemo(9, 24, 372, 294, "Version: 1.0\n\n                                   Información:\n\nEste recurso fue editado por [WLC] Wena Los Cauro y basado en el recurso FAG-Radio de Dealman                                          Uso:\n\nTeclas:\n  Mayús izquierda + R = Activar o desactivar interfaz.\n  Mayús izquierda + Flecha izquierda = Canal anterior.\n  Mayús izquierda + Flecha derecha = Siguiente canal.\n  Mayús izquierda + Flecha arriba = Play/Stop radio.\n\nComandos:\n  /Radio = Activa y desactiva la Radio.\n  /RadioHelp = Ventana de ayuda.\n\n© WenaLosCauro 2019", false, radioHelpWindow)
	guiMemoSetReadOnly(radioHelpMemo, true)
radioHelpCloseButton = guiCreateButton(125, 331, 127, 37, "Cerrar", false, radioHelpWindow)

local PDZFont = dxCreateFont("Font/PDZ.ttf", 9)


local radioStream = nil
local isStreaming = false
local wasStopped = false
local muteOtherStreams = false

local releaseTime = 60

-- Radio Logic
local currentChannel = 1
local channelName = channelTable[1]
local radioVolume = (guiScrollBarGetScrollPosition(radioPlayerVolume)/100)
local roundedVolume = (math.round(radioVolume, 4)*100)
local themColours = {50,50,50}
local metaTable = "No aplicable (puede seguir descargándose, o la radio no lo admite)"
local streamArtist = "No aplicable (puede seguir descargándose, o la radio no lo admite)"
local streamTitle = "No aplicable (puede seguir descargándose, o la radio no lo admite)"

-- For Flashing Text
local flashRed, flashGreen, flashBlue = 172, 105, 255
local flashingPurple = tocolor(flashRed, flashGreen, flashBlue, 255)
local incrementQ = true

-- Settings, quite yes indeed
local imageOne = false
local imageTwo = false
local imageThree = false
local imageRect = true

-- For DX Positioning
local winX, winY = guiGetPosition(radioMainWindow, false)

function updateGUIPosition()
	if(source == radioMainWindow) then
		winX, winY = guiGetPosition(radioMainWindow, false)
	end
end
addEventHandler("onClientGUIMove", getRootElement(), updateGUIPosition)

function updateOnTabChange()
	if(source == radioLibraryTab) then
		removeEventHandler("onClientRender", getRootElement(), textToDraw)
	elseif(source == radioMainTab) then
		addEventHandler("onClientRender", getRootElement(), textToDraw)
	elseif(source == radioSettingsTab) then
		removeEventHandler("onClientRender", getRootElement(), textToDraw)
	end
end
addEventHandler("onClientGUITabSwitched", getRootElement(), updateOnTabChange)

function flashingPurpleColour()
	amount = (incrementQ and 1) or -1
	if(flashRed >= 200) and (flashGreen >= 133) then
		incrementQ = false
	elseif(flashRed <= 172) and (flashGreen <= 105) then
		incrementQ = true
	end
	flashRed = flashRed+amount
	flashGreen = flashGreen+amount
	flashingPurple = tocolor(flashRed, flashGreen, flashBlue, 255)
end
addEventHandler("onClientRender", getRootElement(), flashingPurpleColour)

function textToDraw()
	dxDrawText("Volumen: "..tostring(roundedVolume).."/100", winX+290, winY+215, 948, 469, tocolor(132, 31, 255, 255), 1.00, PDZFont, "left", "top", false, false, true, true, false)
	dxDrawText("Estacion actual:", winX+25, winY+180, 694, 438, tocolor(132, 31, 255, 255), 1.00, PDZFont, "left", "top", false, false, true, true, false)
	dxDrawText(channelTable[currentChannel], winX+200, winY+180, 973, 438, flashingPurple, 1.00, PDZFont, "left", "top", false, true, true, true, false)
	if(radioStream ~= nil) then
		--BPM = getSoundBPM(radioStream) or 200
		changeVariable = 2
		newRed = themColours[1]+(math.random(0,changeVariable)*((math.random(0,3)>1 and -1) or 1))
		newGreen = themColours[2]+(math.random(0,changeVariable)*((math.random(0,3)>1 and -1) or 1))
		newBlue = themColours[3]+(math.random(0,changeVariable)*((math.random(0,3)>1 and -1) or 1))
		themColours[1] = (newRed>100 and 100) or (newRed<0 and 0) or newRed
		themColours[2] = (newGreen>100 and 100) or (newGreen<0 and 0) or newGreen
		themColours[3] = (newBlue>100 and 100) or (newBlue<0 and 0) or newBlue
		colour = tocolor(themColours[1], themColours[2], themColours[3], 255)
		soundTable = getSoundFFTData(radioStream, 8192, 32)
		txWidth = 14
		if(not soundTable) then return false end
		for i,v in pairs(soundTable) do
			theHeight = math.round((v*320),0)>140 and 140 or math.round((v*320),0)
			if(guiRadioButtonGetSelected(radioVisOption1)) then
				dxDrawImage(winX+25+(i*txWidth), winY+170, txWidth-1, theHeight*-1, "Img/Test.png", 0, 0, 0, colour, true)
			elseif(guiRadioButtonGetSelected(radioVisOption2)) then
				dxDrawImage(winX+25+(i*txWidth), winY+170, txWidth-1, theHeight*-1, "Img/Test2.png", 0, 0, 0, colour, true)
			elseif(guiRadioButtonGetSelected(radioVisOption3)) then
				dxDrawImageSection(winX+25+(i*txWidth), winY+170, txWidth-1, theHeight*-1, 0, 0, 64, (320/100)*theHeight, "Img/Test3.png", 0, 0, 0, colour, true)
			elseif(guiRadioButtonGetSelected(radioVisOption4)) then
				dxDrawImageSection(winX+25+(i*txWidth), winY+170, txWidth-1, theHeight*-1, 0, 0, 64, (320/100)*theHeight, "Img/Test4.png", 0, 0, 0, colour, true)
			elseif(guiRadioButtonGetSelected(radioVisOption5)) then
				dxDrawRectangle(winX+25+(i*txWidth), winY+170, txWidth-1, theHeight*-1, colour, true)
			end
		end
	end
end

function checkAndUpdateStreamMeta()
	if(source == radioStream) and (radioStream ~= nil) then
		metaTable = getSoundMetaTags(radioStream)
		if(metaTable.artist ~= nil) and (metaTable.title ~= nil) then
			streamArtist = tostring(metaTable.stream_name)
			streamTitle = tostring(metaTable.stream_title)
			guiSetText(radioMetaArtistLabel, "Artista: "..streamArtist)
			guiSetText(radioMetaTitleLabel, "Titulo: "..streamTitle)
		elseif(metaTable.artist == nil) and (metaTable.title == nil) then
			streamArtist = tostring(metaTable.stream_name)
			streamTitle = tostring(metaTable.stream_title)
			guiSetText(radioMetaArtistLabel, "Artista: "..streamArtist)
			guiSetText(radioMetaTitleLabel, "Titulo: "..streamTitle)
		end
	end
end
addEventHandler("onClientSoundChangedMeta", getRootElement(), checkAndUpdateStreamMeta)

function directXStreamInformation()
	if(metaTable.artist ~= nil) and (metaTable.title ~= nil) then
		dxDrawText("Artist: "..streamArtist, screenX*0.6727941176470588, screenY*0.7799479166666667, screenX*0.9970588235294118, screenY*0.8515625, tocolor(0, 0, 0, 255), 1.00, PDZFont, "left", "top", false, true, true, false, false)
		dxDrawText("Artist: "..streamArtist, screenX*0.6727941176470588, screenY*0.77734375, screenX*0.9970588235294118, screenY*0.8489583333333333, tocolor(0, 0, 0, 255), 1.00, PDZFont, "left", "top", false, true, true, false, false)
		dxDrawText("Artist: "..streamArtist, screenX*0.6713235294117647, screenY*0.7799479166666667, screenX*0.9955882352941176, screenY*0.8515625, tocolor(0, 0, 0, 255), 1.00, PDZFont, "left", "top", false, true, true, false, false)
		dxDrawText("Artist: "..streamArtist, screenX*0.6713235294117647, screenY*0.77734375, screenX*0.9955882352941176, screenY*0.8489583333333333, tocolor(0, 0, 0, 255), 1.00, PDZFont, "left", "top", false, true, true, false, false)
		dxDrawText("Artist: "..streamArtist, screenX*0.6720588235294118, screenY*0.7786458333333333, screenX*0.9963235294117647, screenY*0.8502604166666667, flashingPurple, 1.00, PDZFont, "left", "top", false, true, true, false, false)
		dxDrawText("Title: "..streamTitle, screenX*0.6727941176470588, screenY*0.8671875, screenX*0.9970588235294118, screenY*0.9388020833333333, tocolor(0, 0, 0, 255), 1.00, PDZFont, "left", "top", false, true, true, false, false)
		dxDrawText("Title: "..streamTitle, screenX*0.6727941176470588, screenY*0.8645833333333333, screenX*0.9970588235294118, screenY*0.9361979166666667, tocolor(0, 0, 0, 255), 1.00, PDZFont, "left", "top", false, true, true, false, false)
		dxDrawText("Title: "..streamTitle, screenX*0.6713235294117647, screenY*0.8671875, screenX*0.9955882352941176, screenY*0.9388020833333333, tocolor(0, 0, 0, 255), 1.00, PDZFont, "left", "top", false, true, true, false, false)
		dxDrawText("Title: "..streamTitle, screenX*0.6713235294117647, screenY*0.8645833333333333, screenX*0.9955882352941176, screenY*0.9361979166666667, tocolor(0, 0, 0, 255), 1.00, PDZFont, "left", "top", false, true, true, false, false)
		dxDrawText("Title: "..streamTitle, screenX*0.6720588235294118, screenY*0.8658854166666667, screenX*0.9963235294117647, screenY*0.9375, flashingPurple, 1.00, PDZFont, "left", "top", false, true, true, false, false)
	elseif(metaTable.artist == nil) and (metaTable.title == nil) then
		dxDrawText("Artist: "..streamArtist, screenX*0.6727941176470588, screenY*0.7799479166666667, screenX*0.9970588235294118, screenY*0.8515625, tocolor(0, 0, 0, 255), 1.00, PDZFont, "left", "top", false, true, true, false, false)
		dxDrawText("Artist: "..streamArtist, screenX*0.6727941176470588, screenY*0.77734375, screenX*0.9970588235294118, screenY*0.8489583333333333, tocolor(0, 0, 0, 255), 1.00, PDZFont, "left", "top", false, true, true, false, false)
		dxDrawText("Artist: "..streamArtist, screenX*0.6713235294117647, screenY*0.7799479166666667, screenX*0.9955882352941176, screenY*0.8515625, tocolor(0, 0, 0, 255), 1.00, PDZFont, "left", "top", false, true, true, false, false)
		dxDrawText("Artist: "..streamArtist, screenX*0.6713235294117647, screenY*0.77734375, screenX*0.9955882352941176, screenY*0.8489583333333333, tocolor(0, 0, 0, 255), 1.00, PDZFont, "left", "top", false, true, true, false, false)
		dxDrawText("Artist: "..streamArtist, screenX*0.6720588235294118, screenY*0.7786458333333333, screenX*0.9963235294117647, screenY*0.8502604166666667, flashingPurple, 1.00, PDZFont, "left", "top", false, true, true, false, false)
		dxDrawText("Title: "..streamTitle, screenX*0.6727941176470588, screenY*0.8671875, screenX*0.9970588235294118, screenY*0.9388020833333333, tocolor(0, 0, 0, 255), 1.00, PDZFont, "left", "top", false, true, true, false, false)
		dxDrawText("Title: "..streamTitle, screenX*0.6727941176470588, screenY*0.8645833333333333, screenX*0.9970588235294118, screenY*0.9361979166666667, tocolor(0, 0, 0, 255), 1.00, PDZFont, "left", "top", false, true, true, false, false)
		dxDrawText("Title: "..streamTitle, screenX*0.6713235294117647, screenY*0.8671875, screenX*0.9955882352941176, screenY*0.9388020833333333, tocolor(0, 0, 0, 255), 1.00, PDZFont, "left", "top", false, true, true, false, false)
		dxDrawText("Title: "..streamTitle, screenX*0.6713235294117647, screenY*0.8645833333333333, screenX*0.9955882352941176, screenY*0.9361979166666667, tocolor(0, 0, 0, 255), 1.00, PDZFont, "left", "top", false, true, true, false, false)
		dxDrawText("Title: "..streamTitle, screenX*0.6720588235294118, screenY*0.8658854166666667, screenX*0.9963235294117647, screenY*0.9375, flashingPurple, 1.00, PDZFont, "left", "top", false, true, true, false, false)
	elseif(metaTable.stream_name == nil) and (metaTable.stream_title == nil) then
		dxDrawText("Artist: N/A"..streamArtist, screenX*0.6727941176470588, screenY*0.7799479166666667, screenX*0.9970588235294118, screenY*0.8515625, tocolor(0, 0, 0, 255), 1.00, PDZFont, "left", "top", false, true, true, false, false)
		dxDrawText("Artist: N/A"..streamArtist, screenX*0.6727941176470588, screenY*0.77734375, screenX*0.9970588235294118, screenY*0.8489583333333333, tocolor(0, 0, 0, 255), 1.00, PDZFont, "left", "top", false, true, true, false, false)
		dxDrawText("Artist: N/A"..streamArtist, screenX*0.6713235294117647, screenY*0.7799479166666667, screenX*0.9955882352941176, screenY*0.8515625, tocolor(0, 0, 0, 255), 1.00, PDZFont, "left", "top", false, true, true, false, false)
		dxDrawText("Artist: N/A"..streamArtist, screenX*0.6713235294117647, screenY*0.77734375, screenX*0.9955882352941176, screenY*0.8489583333333333, tocolor(0, 0, 0, 255), 1.00, PDZFont, "left", "top", false, true, true, false, false)
		dxDrawText("Artist: N/A"..streamArtist, screenX*0.6720588235294118, screenY*0.7786458333333333, screenX*0.9963235294117647, screenY*0.8502604166666667, flashingPurple, 1.00, PDZFont, "left", "top", false, true, true, false, false)
		dxDrawText("Title: N/A"..streamTitle, screenX*0.6727941176470588, screenY*0.8671875, screenX*0.9970588235294118, screenY*0.9388020833333333, tocolor(0, 0, 0, 255), 1.00, PDZFont, "left", "top", false, true, true, false, false)
		dxDrawText("Title: N/A"..streamTitle, screenX*0.6727941176470588, screenY*0.8645833333333333, screenX*0.9970588235294118, screenY*0.9361979166666667, tocolor(0, 0, 0, 255), 1.00, PDZFont, "left", "top", false, true, true, false, false)
		dxDrawText("Title: N/A"..streamTitle, screenX*0.6713235294117647, screenY*0.8671875, screenX*0.9955882352941176, screenY*0.9388020833333333, tocolor(0, 0, 0, 255), 1.00, PDZFont, "left", "top", false, true, true, false, false)
		dxDrawText("Title: N/A"..streamTitle, screenX*0.6713235294117647, screenY*0.8645833333333333, screenX*0.9955882352941176, screenY*0.9361979166666667, tocolor(0, 0, 0, 255), 1.00, PDZFont, "left", "top", false, true, true, false, false)
		dxDrawText("Title: N/A"..streamTitle, screenX*0.6720588235294118, screenY*0.8658854166666667, screenX*0.9963235294117647, screenY*0.9375, flashingPurple, 1.00, PDZFont, "left", "top", false, true, true, false, false)
	end
end

function handleDirectXStreamInfoRendering()
	if(source == radioRenderMetaInfo) then
		if(guiCheckBoxGetSelected(radioRenderMetaInfo) == true) then
			if(radioStream ~= nil) then
				addEventHandler("onClientRender", getRootElement(), directXStreamInformation)
			end
		elseif(guiCheckBoxGetSelected(radioRenderMetaInfo) == false) then
			removeEventHandler("onClientRender", getRootElement(), directXStreamInformation)
		end
	end
	
	if(source == radioVisMetaInfo) then
		if(guiCheckBoxGetSelected(radioVisMetaInfo) == true) then
			guiSetVisible(radioMetaArtistLabel, true)
			guiSetVisible(radioMetaTitleLabel, true)
		elseif(guiCheckBoxGetSelected(radioVisMetaInfo) == false) then
			guiSetVisible(radioMetaArtistLabel, false)
			guiSetVisible(radioMetaTitleLabel, false)
		end
	end
end
addEventHandler("onClientGUIClick", getRootElement(), handleDirectXStreamInfoRendering)

function onClientChangeStreamState_Handler()
	if(source == radioPlayerPlayButton) then
		if(radioStream == nil) then
			radioStream = playSound(channelTable[channelTable[currentChannel]])
			setSoundVolume(radioStream, radioVolume)
			guiSetVisible(radioPlayerPlayButton, false)
			guiSetVisible(radioPlayerStopButton, true)
			isMouseOverStop = true
		end
	end
	if(source == radioPlayerStopButton) then
		if(radioStream ~= nil) then
			stopSound(radioStream)
			radioStream = nil
			guiSetVisible(radioPlayerStopButton, false)
			guiSetVisible(radioPlayerPlayButton, true)
			guiSetText(radioMetaArtistLabel, "Artista: "..streamArtist)
			guiSetText(radioMetaTitleLabel, "Titulo: "..streamTitle)
		end
	end
end
addEventHandler("onClientGUIClick", getRootElement(), onClientChangeStreamState_Handler)

function onClientUseLibrary_Handler()
	if(source == radioLibraryPlayButton) then
	local selectedItem = guiGridListGetSelectedItem(radioLibraryGridlist)
		if(selectedItem ~= -1) then
		local itemText = guiGridListGetItemText(radioLibraryGridlist, selectedItem, 1)
			if(radioStream == nil) then
				for k,v in pairs(channelTable) do
					if(v == itemText) then
						currentChannel = k
						radioStream = playSound(channelTable[channelTable[currentChannel]])
						setSoundVolume(radioStream, radioVolume)
						guiSetVisible(radioPlayerPlayButton, false)
						guiSetVisible(radioPlayerStopButton, true)
					end
				end	
			elseif(radioStream ~= nil) then
				for k,v in pairs(channelTable) do
					if(v == itemText) then
						stopSound(radioStream)
						currentChannel = k
						radioStream = playSound(channelTable[channelTable[currentChannel]])
						setSoundVolume(radioStream, radioVolume)
						guiSetVisible(radioPlayerPlayButton, false)
						guiSetVisible(radioPlayerStopButton, true)
					end
				end
			end
		end
	end
end
addEventHandler("onClientGUIClick", getRootElement(), onClientUseLibrary_Handler)

function onClientUseSearch_Handler()
	guiGridListClear(radioLibraryGridlist)
	searchText = string.lower(guiGetText(radioLibrarySearchField))
	if(searchText == "") then
		for name, data in pairs(channelTable) do
		local newRow = guiGridListAddRow(radioLibraryGridlist)
			guiGridListSetItemText(radioLibraryGridlist, newRow, 1, name:gsub("123456789",""), false, false)
		end
	else
		for name, data in pairs(channelTable) do
			if(string.find(string.lower(name), searchText, 1, true)) then
			local newRow = guiGridListAddRow(radioLibraryGridlist)
				guiGridListSetItemText(radioLibraryGridlist, newRow, 1, name:gsub("123456789",""), false, false)
			end
		end
	end
end
addEventHandler("onClientGUIChanged", getRootElement(), onClientUseSearch_Handler)

function onClientChangeChannelNext_Handler()
	if((source == radioPlayerNextButton) and (radioStream == nil)) then
		currentChannel = ((currentChannel+1 <= #channelTable) == true and currentChannel+1) or 1
	elseif((source == radioPlayerNextButton) and (radioStream ~= nil)) then
		currentChannel = ((currentChannel+1 <= #channelTable) == true and currentChannel+1) or 1
		setTimer(function()
			stopSound(radioStream)
			radioStream = playSound(channelTable[channelTable[currentChannel]])
			streamArtist = "No aplicable (puede seguir descargándose, o la radio no lo admite)"
			streamTitle = "No aplicable (puede seguir descargándose, o la radio no lo admite)"
			guiSetText(radioMetaArtistLabel, "Artista: "..streamArtist)
			guiSetText(radioMetaTitleLabel, "Titulo: "..streamTitle)
			setSoundVolume(radioStream, radioVolume)
		end, 250, 1)
	end
end
addEventHandler("onClientGUIClick", getRootElement(), onClientChangeChannelNext_Handler)

function onClientChangeChannelPrev_Handler()
	if((source == radioPlayerPrevButton) and (radioStream == nil)) then
		currentChannel = ((currentChannel-1 >= 1) == true and currentChannel-1) or #channelTable
	elseif((source == radioPlayerPrevButton) and (radioStream ~= nil)) then
		currentChannel = ((currentChannel-1 >= 1) == true and currentChannel-1) or #channelTable
		setTimer(function()
			stopSound(radioStream)
			radioStream = playSound(channelTable[channelTable[currentChannel]])
			streamArtist = "No aplicable (puede seguir descargándose, o la radio no lo admite)"
			streamTitle = "No aplicable (puede seguir descargándose, o la radio no lo admite)"
			guiSetText(radioMetaArtistLabel, "Artista: "..streamArtist)
			guiSetText(radioMetaTitleLabel, "Titulo: "..streamTitle)
			setSoundVolume(radioStream, radioVolume)
		end, 250, 1)
	end
end
addEventHandler("onClientGUIClick", getRootElement(), onClientChangeChannelPrev_Handler)

function onClientChangeVolume_Handler()
	radioVolume = (guiScrollBarGetScrollPosition(radioPlayerVolume)/100)
	roundedVolume = (math.round(radioVolume, 4)*100)
	if(source == radioPlayerVolume) then
		if(radioStream ~= nil) then
			setSoundVolume(radioStream, radioVolume)
		end
	end
end
addEventHandler("onClientGUIScroll", getRootElement(), onClientChangeVolume_Handler)


function stop_Sound(thePlayer)
	if thePlayer ~= localPlayer and source ~= localPlayer  then return end
	stopSound(radioStream)
	radioStream = nil
	guiSetVisible(radioPlayerPlayButton, true)
	guiSetVisible(radioPlayerStopButton, false)
end
addEventHandler('onClientVehicleExit',root,stop_Sound)
addEventHandler('onClientPlayerWasted',root,stop_Sound)


--function enter_vehicle(thePlayer)
--	if thePlayer == getLocalPlayer() then
--		play_radio()
--	end
--end
--addEventHandler('onClientVehicleEnter',root,enter_vehicle)


local xml = xmlLoadFile("vehicles_music.xml") 


function canplaymusic()
	local vehicleid = getElementModel(getPedOccupiedVehicle(localPlayer))
	local vehicles = xmlFindChild(xml, "vehicles",0) 
   
	local vehiculeslenght = count(vehicles, 'vehicle')
    node = true
	index = 0

	for i = 0, vehiculeslenght do 	
		local vehicle_xml = xmlFindChild(vehicles, "vehicle",i) 
		local vehicleparams =  xmlNodeGetAttributes(vehicle_xml)
		
		if tonumber(vehicleid) == tonumber(vehicleparams.id) then
			return false
		end
	end
	return true
end

function play_radio()
	if(radioStream == nil) then
		radioStream = playSound(channelTable[channelTable[currentChannel]])
		setSoundVolume(radioStream, radioVolume)
		guiSetVisible(radioPlayerPlayButton, false)
		guiSetVisible(radioPlayerStopButton, true)
	elseif(radioStream ~= nil) and (wasStopped == false) then
		stop_Sound()
	end
end

function checkForKeybind(button)
	if not isPedInVehicle(localPlayer) or (canplaymusic() == false) then return end

	-- Show or Hide the Radio Player
	if((getKeyState("lshift") == true) and (getKeyState("r") == true)) and (isChatBoxInputActive() == false) and (isConsoleActive() == false) then
	--	setTimer(function()
	--		setRadioChannel(0)
	--	end, 50, 1)
	--	showGUI()	
	-- Next Channel
	elseif(button == "mouse_wheel_up" and (isChatBoxInputActive() == false) and (isConsoleActive() == false)) then

		addEventHandler('onClientRender',getRootElement(), showRadios )

		releaseTime = 60
		if(radioStream == nil) then
			currentChannel = ((currentChannel+1 <= #channelTable) == true and currentChannel+1) or 1
		elseif(radioStream ~= nil) then
			currentChannel = ((currentChannel+1 <= #channelTable) == true and currentChannel+1) or 1
			setTimer(function()
				stopSound(radioStream)
				radioStream = playSound(channelTable[channelTable[currentChannel]])
				streamArtist = "No aplicable (puede seguir descargándose, o la radio no lo admite)"
				streamTitle = "No aplicable (puede seguir descargándose, o la radio no lo admite)"
				guiSetText(radioMetaArtistLabel, "Artista: "..streamArtist)
				guiSetText(radioMetaTitleLabel, "Titulo: "..streamTitle)
				setSoundVolume(radioStream, radioVolume)
			end, 250, 1)
		end
	-- Previous Channel
	elseif(button == "mouse_wheel_down" == true and (isChatBoxInputActive() == false) and (isConsoleActive() == false)) then
		addEventHandler('onClientRender',getRootElement(), showRadios )

		releaseTime = 60
		if(radioStream == nil) then
			currentChannel = ((currentChannel-1 >= 1) == true and currentChannel-1) or #channelTable
		elseif(radioStream ~= nil) then
			currentChannel = ((currentChannel-1 >= 1) == true and currentChannel-1) or #channelTable
			setTimer(function()
				stopSound(radioStream)
				radioStream = playSound(channelTable[channelTable[currentChannel]])
				streamArtist = "No aplicable (puede seguir descargándose, o la radio no lo admite)"
				streamTitle = "No aplicable (puede seguir descargándose, o la radio no lo admite)"
				guiSetText(radioMetaArtistLabel, "Artista: "..streamArtist)
				guiSetText(radioMetaTitleLabel, "Titulo: "..streamTitle)
				setSoundVolume(radioStream, radioVolume)
			end, 250, 1)
		end	
	-- Play or Stop the stream
	elseif((getKeyState("m") == true) and (isChatBoxInputActive() == false) and (isConsoleActive() == false)) then
		if(radioStream == nil) then
			radioStream = playSound(channelTable[channelTable[currentChannel]])
			setSoundVolume(radioStream, radioVolume)
			guiSetVisible(radioPlayerPlayButton, false)
			guiSetVisible(radioPlayerStopButton, true)
		elseif(radioStream ~= nil) and (wasStopped == false) then
			stop_Sound()
		end
	-- Increase the volume
	elseif((getKeyState("arrow_r") == true) and (getKeyState("lshift") == true) and (isChatBoxInputActive() == false) and (isConsoleActive() == false)) then
		if(radioStream == nil) then
			return
		elseif(radioStream ~= nil) then
			setTimer(function()
				setRadioChannel(0)
			end, 50, 1)
			radioVolume = radioVolume+0.1
			radioVolume = (tonumber(radioVolume) <= 0 and 0) or (tonumber(radioVolume) >= 1 and 1) or tonumber(radioVolume)
			setSoundVolume(radioStream, radioVolume)
			guiScrollBarSetScrollPosition(radioPlayerVolume, radioVolume*100)
			if(radioVolume >= 1) then
				radioVolume = 1
			end
		end
		-- Decrease the volume
	elseif((getKeyState("arrow_l") == true) and (getKeyState("lshift") == true) and (isChatBoxInputActive() == false) and (isConsoleActive() == false)) then
		if(radioStream == nil) then
			return
		elseif(radioStream ~= nil) then
			setTimer(function()
				setRadioChannel(0)
			end, 50, 1)
			radioVolume = radioVolume-0.1
			radioVolume = (tonumber(radioVolume) <= 0 and 0) or (tonumber(radioVolume) >= 1 and 1) or tonumber(radioVolume)
			setSoundVolume(radioStream, radioVolume)
			guiScrollBarSetScrollPosition(radioPlayerVolume, radioVolume*100)
			if(radioVolume <= 0) then
				radioVolume = 0
			end
		end
	end
end
addEventHandler("onClientKey", getRootElement(), checkForKeybind)

function muteOtherStreams(success, length, streamName)
	if(guiCheckBoxGetSelected(radioMuteOtherStreams) == true) then
		if(source ~= nil) and (source ~= radioStream) then
			stopSound(source)
			if(guiCheckBoxGetSelected(radioOutputMessage) == true) then
				outputChatBox("#696969[WLC-Radio]: #841FFFAnother Stream was stopped!", 255, 255, 255, true)
			end
		end
	else
		if(source ~= nil) and (source ~= radioStream) then
			if(guiCheckBoxGetSelected(radioSetVolume) == true) then
				setSoundVolume(source, radioVolume)
			end
		end
	end
end
addEventHandler("onClientSoundStream", getRootElement(), muteOtherStreams)

function muteOtherStreamsOnSelected()
local soundList = getElementsByType("sound")
	if(source == radioMuteOtherStreams) then
		if(guiCheckBoxGetSelected(radioMuteOtherStreams) == true) then
			for key, value in pairs(soundList) do
				if(value ~= nil) and (value ~= radioStream) then
					outputChatBox("#696969[WLC-Radio]: #841FFFAnother Stream was stopped!", 255, 255, 255, true)
					stopSound(value)
				end
			end
		end
	end
end
addEventHandler("onClientGUIClick", getRootElement(), muteOtherStreamsOnSelected)

function showGUI()
	if(guiGetVisible(radioMainWindow) == false) then
		guiSetVisible(radioMainWindow, true)
		--showCursor(true)
		if(guiGetSelectedTab(radioTabPanel) == radioMainTab) then
			addEventHandler("onClientRender", getRootElement(), textToDraw)
		end
	else
		guiSetVisible(radioMainWindow, false)
		removeEventHandler("onClientRender", getRootElement(), textToDraw)
		--showCursor(false)
	end
end
addCommandHandler("radio", showGUI, false)


function show()
	guiSetVisible(radioMainWindow, true)
	if(guiGetSelectedTab(radioTabPanel) == radioMainTab) then
		addEventHandler("onClientRender", getRootElement(), textToDraw)
	end
end

function hide()
	guiSetVisible(radioMainWindow, false)
		removeEventHandler("onClientRender", getRootElement(), textToDraw)
end

function helpGUILogic()
	if(source == radioHelpCloseButton) then
		guiSetVisible(radioHelpWindow, false)
	end
	if(source == radioHelpIcon) then
		guiSetVisible(radioHelpWindow, true)
		guiBringToFront(radioHelpWindow)
	end
end
addEventHandler("onClientGUIClick", getRootElement(), helpGUILogic)

function showHelpGUI()
	if(guiGetVisible(radioHelpWindow) == false) then
		guiSetVisible(radioHelpWindow, true)
		showCursor(true)
	else
		guiSetVisible(radioHelpWindow, false)
	end
end
addCommandHandler("radiohelp", showHelpGUI, false)

function resourceStartedNotification()

end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), resourceStartedNotification)

addEventHandler("onClientResourceStart",getResourceRootElement(getThisResource()),function()
	guiSetInputMode("no_binds_when_editing")
end)


function showRadios()
	local beforeIndex = 1
	local afterIndex = 1
	
	beforeIndex = currentChannel -1
	afterIndex = currentChannel + 1
	
	if 31 == currentChannel then
		afterIndex = 1
	end
	
	if 1 == currentChannel then
		beforeIndex = 31
	end

	dxDrawImage(screenX/2-160*0.4-320*0.4-20,50,320*0.3,320*0.3,"logos/".. beforeIndex .. ".png",0.0,0.0,0.0,tocolor(255,255,255,100),false) -- Weapon icons image. Check the icons file if you want to take and replace weapon icons.
	
	dxDrawImage(screenX/2-160*0.4+320*0.4+20,50,320*0.3,320*0.3,"logos/".. afterIndex .. ".png",0.0,0.0,0.0,tocolor(255,255,255,100),false) -- Weapon icons image. Check the icons file if you want to take and replace weapon icons.
	

	dxDrawImage(screenX/2-160*0.4,20,320*0.4,320*0.4,'logos/'.. currentChannel .. '.png',0.0,0.0,0.0,tocolor(255,255,255,255),false) -- Weapon icons image. Check the icons file if you want to take and replace weapon icons.
	
	releaseTime = releaseTime-1


	if releaseTime <= 0 then
		removeEventHandler('onClientRender',getRootElement(), showRadios)
	end
	
end

addEventHandler('onClientVehicleEnter',root,function(player)
   if player == localPlayer then
		if(radioStream == nil) then
			radioStream = playSound(channelTable[channelTable[currentChannel]])
			setSoundVolume(radioStream, radioVolume)
			guiSetVisible(radioPlayerPlayButton, false)
			guiSetVisible(radioPlayerStopButton, true)
		elseif(radioStream ~= nil) and (wasStopped == false) then
			stop_Sound()
		end

   end

end)