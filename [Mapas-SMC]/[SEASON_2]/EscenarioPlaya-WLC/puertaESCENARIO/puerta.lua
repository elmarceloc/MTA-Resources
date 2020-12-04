--PUERTA1--
objeto1 = createObject ( 3117, 185, -1815.0999755859, 5.8000001907349, 0, 90, 90 )
objeto2 = createObject ( 3117, 185, -1815.0999755859, 2.2999999523163, 0, 90, 90 )
  
addCommandHandler ("abrir1", 
function (thePlayer) 
     local accName = getAccountName ( getPlayerAccount ( thePlayer ) ) 
     if isObjectInACLGroup ("user."..accName, aclGetGroup ( "Admin" ) ) then  
    moveObject ( objeto1, 2000, 185, -1815.0999755859, 8.1, 0, 0, 0)
	moveObject ( objeto2, 2000, 185, -1815.0999755859, 1, 0, 0, 0)
else 
   outputChatBox("No tienes permiso para usar este comando!", thePlayer, 0, 255, 0, 255) 
end 
end 
) 
  
addCommandHandler ("cerrar1", 
function (thePlayer) 
     local accName = getAccountName ( getPlayerAccount ( thePlayer ) ) 
     if isObjectInACLGroup ("user."..accName, aclGetGroup ( "Admin" ) ) then  
     moveObject ( objeto1, 2000, 185, -1815.0999755859, 5.8000001907349, 0, 0, 0)
	 moveObject ( objeto2, 2000, 185, -1815.0999755859, 2.2999999523163, 0, 0, 0)	 
else 
   outputChatBox("No tienes permiso para usar este comando!", thePlayer, 0, 255, 0, 255) 
end 
end 
) 

--PUERTA1--
objeto3 = createObject ( 3117, 188.19999694824, -1809.8000488281, 5.8000001907349, 0, 90, 0 ) 
objeto4 = createObject ( 3117, 188.19999694824, -1809.8000488281, 2.2999999523163, 0, 90, 0 ) 
  
addCommandHandler ("abrir2", 
function (thePlayer) 
     local accName = getAccountName ( getPlayerAccount ( thePlayer ) ) 
     if isObjectInACLGroup ("user."..accName, aclGetGroup ( "Admin" ) ) then  
    moveObject ( objeto3, 2000, 188.19999694824, -1809.8000488281, 8.1, 0, 0, 0)
	moveObject ( objeto4, 2000, 188.19999694824, -1809.8000488281, 1, 0, 0, 0)
else 
   outputChatBox("No tienes permiso para usar este comando!", thePlayer, 0, 255, 0, 255) 
end 
end 
) 
  
addCommandHandler ("cerrar2", 
function (thePlayer) 
     local accName = getAccountName ( getPlayerAccount ( thePlayer ) ) 
     if isObjectInACLGroup ("user."..accName, aclGetGroup ( "Admin" ) ) then  
     moveObject ( objeto3, 2000, 188.19999694824, -1809.8000488281, 5.8000001907349, 0, 0, 0)
	 moveObject ( objeto4, 2000, 188.19999694824, -1809.8000488281, 2.2999999523163, 0, 0, 0)	 
else 
   outputChatBox("No tienes permiso para usar este comando!", thePlayer, 0, 255, 0, 255) 
end 
end 
) 