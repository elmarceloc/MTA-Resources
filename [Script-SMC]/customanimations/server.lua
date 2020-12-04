 ifps = 9

 
 
 function setPedCustomAnimation (ped,animation,tiempo,repetir,mover,interrumpible)
    if (type(animation) ~= "string" or type(tiempo) ~= "number" or type(repetir) ~= "boolean" or type(mover) ~= "boolean" or type(interrumpible) ~= "boolean") then return false end
    if isElement(ped) then
        for i = 1,ifps do
            triggerClientEvent ( root, "setPedCustomAnimation", root, ped,animation,tiempo,repetir,mover,interrumpible )
            if tiempo > 1 then
                setTimer(setPedAnimation,tiempo,1,ped,false)
                setTimer(setPedAnimation,tiempo+100,1,ped,false)
            end
        end
    end
    
end



--addEventHandler("onPlayerChangeNick",root,function()
   -- setPedCustomAnimation(source,"Baile 1",7000,true,false,false,false)

--end)cccc