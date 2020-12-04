
function customskin(player,username,id)
    local account = getPlayerAccount(player)
    if getAccountName(account) == username then
        setElementModel(player, id)
    end
end


addCommandHandler('chtvnega',function(player, command)
    customskin(player, 'chtvnega',18)
end)

addCommandHandler('chileandankmemes',function(player, command)
    customskin(player, 'chileandankmemes',45)
end)

addCommandHandler('dylantero',function(player, command)
    customskin(player, 'dylantero',72)
end)