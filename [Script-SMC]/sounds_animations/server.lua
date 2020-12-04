function psound(sound,block,anim,duration,theplayer)
	setPedAnimation(theplayer,block,anim,duration,true,false,true,false)
	local playerName = getPlayerName(theplayer)

	triggerClientEvent(root,"playskinsound",root,sound, theplayer, playerName)
end

addEvent('sound',true)
addEventHandler('sound',root,psound)


function pstop(theplayer)
	local playerName = getPlayerName(theplayer)
	setPedAnimation(theplayer)

	triggerClientEvent(root,"stopskinsound",root,playerName )
end

addEvent('stop',true)
addEventHandler('stop',root,pstop)