addEventHandler("onClientResourceStart", resourceRoot,
	function()
		setDevelopmentMode(true)
	end
)

function music()
	local sound = playSound("missionDone.mp3")
end
addEvent("onTakeTurf", true)
addEventHandler("onTakeTurf", resourceRoot, music)


addEvent("turfnotification", true)
addEventHandler("turfnotification", resourceRoot, function(text,color)
	exports.notifications.createNotification(1,'','Territorio', text,10000,color)
end)