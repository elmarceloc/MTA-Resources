addEvent('transformation0',true)
addEventHandler('transformation0',root,function()

	sound = playSound3D('sound.ogg',x,y,z)	

	attachElements(sound, source)
end)

addEvent('distransformation',true)
addEventHandler('distransformation',root,function()

    local x,y,z = getElementPosition(source)

	sound = playSound3D('sound2.ogg',x,y,z)	

	attachElements(sound, source)
end)


function notification()
    if source ­­­~= localPlayer then return end
    exports.notifications:createNotification(1,'Transformación','Presiona b para transformarte en auto',1000)
end
addEvent( "notification", true )
addEventHandler( "notification", getRootElement(), notification)


function notification2()
    if source ­­­~= localPlayer then return end

    exports.notifications:createNotification(1,'Transformación','Presiona f para volver a ser transformer',1000)
end
addEvent( "notification2", true )
addEventHandler( "notification2", getRootElement(), notification2)
