function check(player)  
    local celebridad = isObjectInACLGroup ( "user." .. getAccountName ( getPlayerAccount ( player ) ), aclGetGroup ( "Celebridad" ) )
    if celebridad then 
        return true 
    end 
    return false 
end

iv = 0

function toggleInvis( source )
	if check(source) then
		if iv == 0 then
		iv = 1
		setPlayerNametagShowing(source, false)
		setElementAlpha(source, 0)
		else
		iv = 0
		setPlayerNametagShowing(source, true)
		setElementAlpha(source, 255)
		end
	end
end

addCommandHandler ( "invisible", toggleInvis )
