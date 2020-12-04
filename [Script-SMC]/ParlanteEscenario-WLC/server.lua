------------------------------------------
-- Author: xXMADEXx                     --
-- Editado Por: Kevin                   --
-- Name: 3D Sound                       --
-- Copyright 2016 ( C )                 --
------------------------------------------

local isSpeaker = false

function print ( player, message, r, g, b )
    outputChatBox ( message, player, r, g, b )
end

speakerBox = { }

local radiocnn = createMarker ( 213.3, -1824.59997, 5, "cylinder", 1.5, 255, 0, 0, 170 )
local radiowlc = createMarker (213.3, -1832.69995, 5, "cylinder", 1.5, 0, 255, 0, 170 )

function onMarker(markerHit,matchingDimension)
    local accountName = getAccountName(getPlayerAccount(source)) 
    if isObjectInACLGroup("user."..accountName , aclGetGroup("Admin"))  or isObjectInACLGroup("user."..accountName , aclGetGroup("Moderator")) or isObjectInACLGroup("user."..accountName , aclGetGroup("COLABORADOR")) then
        if markerHit == radiocnn then
            if ( isElement ( speakerBox [ source] ) ) then isSpeaker = true end
            triggerClientEvent ( source, "onPlayerViewSpeakerManagmentEscenario2", source, isSpeaker, 1 )
        end
        if markerHit == radiowlc then
            if ( isElement ( speakerBox [ source] ) ) then isSpeaker = true end
            triggerClientEvent ( source, "onPlayerViewSpeakerManagmentEscenario2", source, isSpeaker, 2 )
        end
    end
end
addEventHandler("onPlayerMarkerHit",getRootElement(),onMarker)

addEvent ( "onPlayerPlaceSpeakerBoxEscenario2", true )
addEventHandler ( "onPlayerPlaceSpeakerBoxEscenario2", root, function ( url, isCar,radio ) 
    if ( url ) then

        if radio == 1 then
            x = 213.3
            y = -1824.59997
            z = 5
        end
        if radio == 2 then
            x = 213.3
            y = -1832.69995
            z = 5
        end

        if ( isElement ( speakerBox [ source ] ) ) then
            local x, y, z = getElementPosition ( speakerBox [ source ] ) 
            print ( source, "Parlante Quitado.", 255, 0, 0 )
            destroyElement ( speakerBox [ source ] )
            removeEventHandler ( "onPlayerQuit", source, destroySpeakersOnPlayerQuit )
        end
        --local x, y, z = getElementPosition ( source )
        local rx, ry, rz = getElementRotation ( source )
        speakerBox [ source ] = createObject ( 1000, 0, 0, -50, 0, 0, rx )
        print ( source, "Parlante Creado.", 0, 255, 0 )
        addEventHandler ( "onPlayerQuit", source, destroySpeakersOnPlayerQuit )
        triggerClientEvent ( root, "onPlayerStartSpeakerBoxSoundEscenario2", root,source, x, y, z, url, isCar )
        if ( isCar ) then
            local car = getPedOccupiedVehicle ( source )
            attachElements ( speakerBox [ source ], car, -0.7, -1.5, -0.5, 0, 90, 0 )
        end
    end
end )

addEvent ( "onPlayerDestroySpeakerBoxEscenario2", true )
addEventHandler ( "onPlayerDestroySpeakerBoxEscenario2", root, function ( )
    if ( isElement ( speakerBox [ source ] ) ) then
        destroyElement ( speakerBox [ source ] )
        triggerClientEvent ( root, "onPlayerDestroySpeakerBox2", root, source )
        removeEventHandler ( "onPlayerQuit", source, destroySpeakersOnPlayerQuit )
        print ( source, "Parlante quitado.", 255, 0, 0 )
    else
        print ( source, "El Parlante ya a sido quitado.", 255, 255, 0 )
    end
end )

addEvent ( "onPlayerChangeSpeakerBoxVolumeEscenario2", true ) 
addEventHandler ( "onPlayerChangeSpeakerBoxVolumeEscenario2", root, function ( to )
    triggerClientEvent ( root, "onPlayerChangeSpeakerBoxVolumeCEscenario2", root, source, to )
end )

function destroySpeakersOnPlayerQuit ( )
    if ( isElement ( speakerBox [ source ] ) ) then
        destroyElement ( speakerBox [ source ] )
        triggerClientEvent ( root, "onPlayerDestroySpeakerBoxEscenario2", root, source )
    end
end