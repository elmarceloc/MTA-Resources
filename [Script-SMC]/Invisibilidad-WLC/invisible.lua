-- Invisibilidad

iv = 0

function toggleInvis( source )
  
	if isObjectInACLGroup ("user."..getAccountName(getPlayerAccount(source)), aclGetGroup ( "Moderator" ) ) or isObjectInACLGroup ("user."..getAccountName(getPlayerAccount(source)), aclGetGroup ( "Administrator" ) ) then 
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
