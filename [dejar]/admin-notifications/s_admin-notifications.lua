function isPlayerAdmin(player) 
    local accountName = getAccountName(getPlayerAccount(player)) 
    if isObjectInACLGroup("user."..accountName , aclGetGroup("Admin")) or isObjectInACLGroup("user."..accountName , aclGetGroup("Moderator")) then
        return true 
    end 
    return false 
end 

function isPlayerModerator(player) 
    local accountName = getAccountName(getPlayerAccount(player)) 
    if isObjectInACLGroup("user."..accountName , aclGetGroup("Moderator")) then
        return true 
    end 
    return false 
end 



addCommandHandler('mensaje', function(player,commandName, ...  )
    
    if not isPlayerAdmin(player) then return end
         
    
    local ismoderator = isPlayerModerator(player)

    local name = getPlayerName(player)
    local arg = {...}
	local parameterCount = #arg
    
    local msj = ''
    local count = 0
    for i=1,parameterCount do
        if count > 30 then 
            count = 0
            msj = msj .. '\n'
        end
        if string.len(arg[i]) > 30 then 
            for j = 0,1  do --math.floor(string.len(arg[i])/30)-1
                msj = msj .. ' ' .. string.sub(arg[i],30*j+1,30*(j+1)) .. '\n'
            end
            local subs = string.sub(arg[i],30*math.floor(string.len(arg[i])/30),string.len(arg[i]))
            msj = msj.. ' ' .. subs .. '\n'
            count = count + 1 + string.len(subs)
        else
            msj = msj..' '..arg[i]
            count = count + 1 + string.len(arg[i])
        end
    end
    triggerClientEvent(root,'mensaje',player,msj,ismoderator)


end)
