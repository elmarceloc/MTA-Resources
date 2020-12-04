local canplay = true

addEventHandler("onPlayerJoin",root,function()
    -- cuando cambia de skin o join
    bindKey(source, 'b','down', function(source)
        if getElementModel(source) ~= 84 then return end
        if not canplay then return end
        --local x,y,z = getElementPosition(source)
        triggerClientEvent(root,'transformation',source)
        
        
        
        setPedAnimation(source,'GANGS','prtial_gngtlkD',8000,true,true,false,false)
        setTimer(function()
            setPedAnimation(source)
            setElementModel(source, 96)
            canplay = true 
        end,10000,1)
        
        canplay = false
    end)

end)