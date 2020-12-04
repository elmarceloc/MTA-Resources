function check(player) 
  local admin = isObjectInACLGroup ( "user." .. getAccountName ( getPlayerAccount ( player ) ), aclGetGroup ( "Admin" ) )
  local moderator = isObjectInACLGroup ( "user." .. getAccountName ( getPlayerAccount ( player ) ), aclGetGroup ( "Moderator" ) )
  local colaborador = isObjectInACLGroup ( "user." .. getAccountName ( getPlayerAccount ( player ) ), aclGetGroup ( "COLABORADOR" ) )
    if admin or moderator or colaborador then 
        return true 
    end 
    return false 
end 




addCommandHandler('img',function(player, commandname,secuence)
if check(player) then
    triggerClientEvent(root,'secuence',root,secuence)
end
end)

addCommandHandler('video',function(player, commandname,video)
if check(player) then
    triggerClientEvent(root,'video',root,video)
end
end)

addCommandHandler('karaoke',function(commandname, algo,video)
if check(player) then
    triggerClientEvent(root,'karaoke',root,video)
end
end)