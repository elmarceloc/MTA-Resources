function sound(leaf,theplayer)
	if leaf.block then
		setPedAnimation(theplayer,leaf.block,leaf.anim,tonumber(leaf.duration),true,true,true,false)
    else
        exports.customanimations:setPedCustomAnimation(theplayer,leaf.anim,tonumber(leaf.duration),true,true,true,false)
    end

	triggerClientEvent("playsound",root,leaf,theplayer)
end
addEvent('sound',true)
addEventHandler('sound',root,sound)