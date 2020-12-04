function isPlayerAdmin(player) 
    if isObjectInACLGroup ( "user." .. getAccountName ( getPlayerAccount ( player ) ), aclGetGroup ( "Admin" ) ) then 
        return true 
    end 
    return false 
end 


addCommandHandler('musica', function(player,commandName, ...  )
    
    --if not isPlayerAdmin(player) then return end
		 
    local arg = {...}
	local parameterCount = #arg
       
    triggerClientEvent(root,'musica',player,arg[1])


end)
