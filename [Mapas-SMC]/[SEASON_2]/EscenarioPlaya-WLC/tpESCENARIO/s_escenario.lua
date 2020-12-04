function check(player) 
    if isObjectInACLGroup ( "user." .. getAccountName ( getPlayerAccount ( player ) ), aclGetGroup ( "Admin" ) ) then 
        return true 
    end 
    return false 
end 

function escenario ( playerSource, commandName, name )
    if check(playerSource) then
        
        if not name then 
            setElementPosition(playerSource, 189.46988, -1817.72461, 4.55537)
            return
        end

        local target = getPlayerFromName(name)

        if target then
            setElementPosition(target, 189.46988, -1817.72461, 4.55537)
        else
            outputChatBox('Jugador no encontrado',playerSource,255,0,0)
        end
    end
end
-- Attach the 'consoleCreateMarker' function to the "createmarker" command
addCommandHandler ( "escenario", escenario )