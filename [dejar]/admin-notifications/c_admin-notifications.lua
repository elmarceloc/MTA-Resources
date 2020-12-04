function mensaje(mensaje,ismoderator)
    local name = getPlayerName(source)

    if ismoderator then
        exports.notifications.createNotification(1,'','[MOD]'..name,mensaje,10000,{239,127,26})
    else
        exports.notifications.createNotification(1,'',name,mensaje,10000)
    end
end
addEvent('mensaje',true)
addEventHandler('mensaje',root,mensaje)