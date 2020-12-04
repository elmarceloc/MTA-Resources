function toggleGodMode ( thePlayer )
    local account = getPlayerAccount ( thePlayer )
    if ( not account or isGuestAccount ( account ) ) then
        return
    end
 
    local accountName = getAccountName ( account )
    if ( isObjectInACLGroup ( "user.".. accountName, aclGetGroup ( "Moderator" ) ) ) then
        local state = ( not getElementData ( thePlayer, "invincible" ) )
        setElementData ( thePlayer, "invincible", state )
        outputChatBox ( "God Mode is now ".. ( state and "Enabled" or "Disabled" ) ..".", thePlayer, 0, 255, 0 )
    end
end
addCommandHandler ( "godmode", toggleGodMode )