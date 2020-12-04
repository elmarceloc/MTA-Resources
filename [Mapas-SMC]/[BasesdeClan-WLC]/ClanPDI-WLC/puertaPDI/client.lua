addEvent('notificationClan',true)
addEventHandler('notificationClan',root,function(title,text,color)


    exports.notifications.createNotification(1,'',title,text,10000,color)

end)

function objectBreakClient (object) 
    setObjectBreakable(object, false) 
end 
addEvent( "setObjectBreak", true ) 
addEventHandler( "setObjectBreak", getRootElement(), objectBreakClient, object ) 