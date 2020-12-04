addEvent('notificacionplata',true)
addEventHandler('notificacionplata',root,function(title,text,color)

    exports.notifications.createNotification(1,'',title,text,4000,color)

end)

addEvent('moneysound',true)
addEventHandler('moneysound',root,function(player)

    local x,y,z = getElementPosition(player)

    sound = playSound3D('cash.wav',x,y,z)
    setSoundVolume(sound,0.5)
end)



addEvent('animrobar',true)
addEventHandler('animrobar',root,function(player)
    setTimer(function()
        setPedAnimation(player,'bomber','bom_plant_loop',3000,false)
    end,100,1)

end)

addEvent('animstop',true)
addEventHandler('animrobar',root,function(player)
    setTimer(function()
        setPedAnimation(player)
    end,100,1)

end)