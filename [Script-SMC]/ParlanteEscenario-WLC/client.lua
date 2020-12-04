------------------------------------------
-- Author: xXMADEXx						--
-- Editado Por: Kevin                   --
-- Name: 3D Sound       				--
-- Copyright 2016 ( C )             	--
------------------------------
-- Variables				--
------------------------------

maxdistance = 200

local subTrackOnSoundDown = 0.1	-- The volume that goes down, when the player clicks "Volume -"
local subTrackOnSoundUp = 0.1	-- The volume that goes up, when the player clicks "Volume +"


function print ( message, r, g, b )
	outputChatBox ( message, r, g, b )
end

------------------------------
-- The GUI					--
------------------------------
local rx, ry = guiGetScreenSize ( )
button = { }
window = guiCreateWindow(rx/2 - (370/2), ry/4, 373, 194, "Mesa del DJ", false)
guiWindowSetSizable(window, false)

CurrentSpeaker = guiCreateLabel(20, 20, 150, 15, "Parlante: ", false, window)
guiSetFont(CurrentSpeaker, "default-bold-small")
guiSetVisible ( window, false )
volume = guiCreateLabel(278, 20, 91, 15, "Volumen:", false, window)
guiSetFont(volume, "default-bold-small")
pos = guiCreateLabel(40, 45, 280, 17,"Usa Freedsound.net y copia el link de descarga", false, window)
guiLabelSetColor(pos,255,255,0)
guiSetFont(pos, "default-bold-small")
url = guiCreateEdit(68, 68, 253, 22, "", false, window)
guiCreateLabel = guiCreateLabel(37, 72, 26, 18, "URL:", false, window)
guiSetFont(guiCreateLabel, "default-bold-small")
--url = guiCreateEdit(11, 96, 272, 23, "", false, window)  


button["play"] = guiCreateButton(20, 110, 75, 35, "PLAY", false, window)
guiSetFont(button["play"], "default-bold-small")

button["remove"] = guiCreateButton(190, 110, 160, 35, "Quitar Parlante", false, window)
guiSetFont(button["remove"], "default-bold-small")
button["v+"] = guiCreateButton(104, 150, 40, 40, "+", false, window)
local font0_EmblemaOne = guiCreateFont("fonts/EmblemaOne.ttf", 10)
guiSetFont(button["v+"], font0_EmblemaOne)
button["v-"] = guiCreateButton(220, 150, 40, 40, "-", false, window)
guiSetFont(button["v-"], font0_EmblemaOne)
button["close"] = guiCreateButton(320, 155, 30, 30, "X", false, window)
guiSetFont(button["close"], "default-bold-small")
guiSetProperty(button["close"], "NormalTextColour", "FFFC0000")

--------------------------
-- My sweet codes		--
--------------------------
local isSound = false
addEvent ( "onPlayerViewSpeakerManagmentEscenario2", true )
addEventHandler ( "onPlayerViewSpeakerManagmentEscenario2", root, function ( current )
	local toState = not guiGetVisible ( window ) 
	guiSetVisible ( window, toState )
	showCursor ( toState ) 
	if ( toState == true ) then
		guiSetInputMode ( "no_binds_when_editing" )
		local x, y, z = getElementPosition ( localPlayer )
		if ( current ) then guiSetText ( CurrentSpeaker, "Parlante: Activo" ) isSound = true
		else guiSetText ( CurrentSpeaker, "Parlante: Desactivado" ) end
	end
end )

addEventHandler ( "onClientGUIClick", root, function ( )
	if ( source == button["close"] ) then
		guiSetVisible ( window, false ) 
		showCursor ( false )
	elseif ( source == button["play"] ) then
		if ( isURL ( ) ) then
			triggerServerEvent ( "onPlayerPlaceSpeakerBoxEscenario2", localPlayer, guiGetText ( url ), isPedInVehicle ( localPlayer ),1 )
			guiSetText ( CurrentSpeaker, "Parlante: Desactivado" )
			isSound = true
			guiSetText ( volume, "Volumen: 100%" )
		else
			print ( "Ingresa una URL", 255, 0, 0 )
		end
	elseif ( source == button["remove"] ) then
		triggerServerEvent ( "onPlayerDestroySpeakerBoxEscenario2", localPlayer )
		guiSetText ( CurrentSpeaker, "Parlante: Activo" )
		isSound = false
		guiSetText ( volume, "Volumen: 100%" )
	elseif ( source == button["v-"] ) then
		if ( isSound ) then
			local toVol = math.round ( getSoundVolume ( speakerSound [ localPlayer ] ) - subTrackOnSoundDown, 2 )
			if ( toVol > 0.0 ) then
				print ( "Volumen Sesteado a "..math.floor ( toVol * 100 ).."%!", 0, 255, 0 )
				triggerServerEvent ( "onPlayerChangeSpeakerBoxVolumeEscenario2", localPlayer, toVol )
				guiSetText ( volume, "Volumen: "..math.floor ( toVol * 100 ).."%" )
			else
				print ( "Este es el volumen mínimo", 255, 0, 0 )
			end
		end
	elseif ( source == button["v+"] ) then
		if ( isSound ) then
			local toVol = math.round ( getSoundVolume ( speakerSound [ localPlayer ] ) + subTrackOnSoundUp, 2 )
			if ( toVol < 1.1 ) then
				print ( "Volumen Seteado a "..math.floor ( toVol * 100 ).."%!", 0, 255, 0 )
				triggerServerEvent ( "onPlayerChangeSpeakerBoxVolumeEscenario2", localPlayer, toVol )
				guiSetText ( volume, "Volumen: "..math.floor ( toVol * 100 ).."%" )
			else
				print ( "Este es el volumen máximo", 255, 0, 0 )
			end
		end
	end
end )

speakerSound = { }
addEvent ( "onPlayerStartSpeakerBoxSoundEscenario2", true )
addEventHandler ( "onPlayerStartSpeakerBoxSoundEscenario2", root, function ( who,x,y,z, url, isCar )
	if ( isElement ( speakerSound [ who ] ) ) then destroyElement ( speakerSound [ who ] ) end
	speakerSound [ who ] = playSound3D ( url, x, y, z, true )
	setSoundVolume ( speakerSound [ who ], 20 )
	setSoundMinDistance ( speakerSound [ who ], 15 )
	setSoundMaxDistance ( speakerSound [ who ], maxdistance )
	if ( isCar ) then
		local car = getPedOccupiedVehicle ( who )
		attachElements ( speakerSound [ who ], car, 0, 5, 1 )
	end

	--triggerServerEvent('getmp3url',root)
end )


--function createsSeaker(who,url,x,y,z,isCar)
	
--end


addEvent ( "onPlayerDestroySpeakerBoxEscenario2", true )
addEventHandler ( "onPlayerDestroySpeakerBoxEscenario2", root, function ( who ) 
	if ( isElement ( speakerSound [ who ] ) ) then 
		destroyElement ( speakerSound [ who ] ) 
	end
end )

--------------------------
-- Volume				--
--------------------------
addEvent ( "onPlayerChangeSpeakerBoxVolumeCEscenario2", true )
addEventHandler ( "onPlayerChangeSpeakerBoxVolumeCEscenario2", root, function ( who, vol ) 
	if ( isElement ( speakerSound [ who ] ) ) then
		setSoundVolume ( speakerSound [ who ], tonumber ( vol ) )
	end
end )

function isURL ( )
	if ( guiGetText ( url ) ~= "" ) then
		return true
	else
		return false
	end
end

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end