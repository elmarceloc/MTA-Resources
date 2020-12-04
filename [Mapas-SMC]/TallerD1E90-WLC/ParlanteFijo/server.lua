
local isSpeaker = false

function print ( player, message, r, g, b )
    outputChatBox ( message, player, r, g, b )
end

speakerBox = { }

local radiotaller = createMarker ( 2123.15259, -1939.86609, 12.37671, "cylinder", 1.5, 255, 255, 255, 170 )

function onMarker(markerHit,matchingDimension)
    if markerHit == radiotaller then
        if ( isElement ( speakerBox [ source] ) ) then isSpeaker = true end
        triggerClientEvent ( source, "onPlayerViewSpeakerManagmentEscenario", source, isSpeaker, 1 )
    end
end
addEventHandler("onPlayerMarkerHit",getRootElement(),onMarker)

addEvent ( "onPlayerPlaceSpeakerBoxEscenario", true )
addEventHandler ( "onPlayerPlaceSpeakerBoxEscenario", root, function ( url, isCar,radio ) 
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
            print ( source, "Parlante Eliminado", 255, 0, 0 )
            destroyElement ( speakerBox [ source ] )
            removeEventHandler ( "onPlayerQuit", source, destroySpeakersOnPlayerQuit )
        end
        --local x, y, z = getElementPosition ( source )
        local rx, ry, rz = getElementRotation ( source )
        speakerBox [ source ] = createObject ( 1000, 0, 0, -50, 0, 0, rx )
        print ( source, "Parlante Creado", 0, 255, 0 )
        addEventHandler ( "onPlayerQuit", source, destroySpeakersOnPlayerQuit )
        triggerClientEvent ( root, "onPlayerStartSpeakerBoxSound", root,source, x, y, z, url, isCar )
        if ( isCar ) then
            local car = getPedOccupiedVehicle ( source )
            attachElements ( speakerBox [ source ], car, -0.7, -1.5, -0.5, 0, 90, 0 )
        end
    end
end )

addEvent ( "onPlayerDestroySpeakerBoxEscenario", true )
addEventHandler ( "onPlayerDestroySpeakerBoxEscenario", root, function ( )
    if ( isElement ( speakerBox [ source ] ) ) then
        destroyElement ( speakerBox [ source ] )
        triggerClientEvent ( root, "onPlayerDestroySpeakerBox", root, source )
        removeEventHandler ( "onPlayerQuit", source, destroySpeakersOnPlayerQuit )
        print ( source, "Parlante Eliminado", 255, 0, 0 )
    else
        print ( source, "El Parlante ya ha sido Eliminado", 255, 255, 0 )
    end
end )

addEvent ( "onPlayerChangeSpeakerBoxVolumeEscenario", true ) 
addEventHandler ( "onPlayerChangeSpeakerBoxVolumeEscenario", root, function ( to )
    triggerClientEvent ( root, "onPlayerChangeSpeakerBoxVolumeCEscenario", root, source, to )
end )

function destroySpeakersOnPlayerQuit ( )
    if ( isElement ( speakerBox [ source ] ) ) then
        destroyElement ( speakerBox [ source ] )
        triggerClientEvent ( root, "onPlayerDestroySpeakerBoxEscenario", root, source )
    end
end