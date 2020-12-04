local function cancelKnifeEvent(target)

		cancelEvent()

end

addEventHandler("onClientPlayerStealthKill",localPlayer,cancelKnifeEvent)