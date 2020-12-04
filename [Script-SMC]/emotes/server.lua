addEvent("emojiSystem:sendEmojiToServer",true)
addEventHandler("emojiSystem:sendEmojiToServer",root,function(filePath)
    --local veh = getPedOccupiedVehicle(source)
    --if veh and isElement(veh) then
    --end
end)



-- hace una animacion que le pidamos desde el cliente
addEvent('animation',true)
addEventHandler ("animation", root,function (thePlayer, group, anim, duration)
    triggerClientEvent(root,'playanimation',root,thePlayer, group, anim, duration * 1000)
end
)

addEvent('newanimation',true)
addEventHandler ("newanimation", root,function (thePlayer, anim, duration)
    exports.customanimations:setPedCustomAnimation(thePlayer,anim,tonumber(duration)*1000,true,true,true,false)
end
)

addEvent("emojiSystem:checkvip",true)
addEventHandler("emojiSystem:checkvip",root,function(btn)
    local accName = getAccountName(getPlayerAccount(source))
    if isObjectInACLGroup ("user."..accName, aclGetGroup("Vip")) then
        triggerClientEvent(source,"emojiSystem:dovip",source,btn)
    end
end)


function sound(file,theplayer)
    triggerClientEvent("emojiSystem:playsound",root,file,theplayer)
end
addEvent('emojiSystem:sound',true)
addEventHandler('emojiSystem:sound',root,sound)

function stop_sound(theplayer)
        triggerClientEvent('playanimation',root,theplayer, '', '', 1)
    triggerClientEvent(root,"emojiSystem:stop_sound", root,theplayer)
end
addEvent('emojiSystem:stopsound',true)
addEventHandler('emojiSystem:stopsound',root,stop_sound)