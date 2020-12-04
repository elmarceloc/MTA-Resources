addEvent('rotatedoor',true)
addEventHandler('rotatedoor',root,function(time,puerta)
	triggerClientEvent('move',root,time,puerta)
end)