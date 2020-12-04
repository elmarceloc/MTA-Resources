local skinsunlock =  
{ 
    --{id = 1,name = 'arturo vidal', x = 0, y =0 ,z = 8}
} 
function createmarkers(thePlayer)
    for _, t in pairs( skinsunlock ) do 
        local marker = createMarker ( t.x, t.y, t.z ,'cylinder',4) 
        
        addEventHandler( "onMarkerHit", marker, function (hitElement)
            if getElementType(hitElement) ~= 'player' then return end
            local account = getPlayerAccount(hitElement)
            local isUnlock = tonumber(getAccountData(account,tostring(t.id)))
            destroyElement(marker)
            if isUnlock ~= 1 then
                exports.notifications:createNotification(1,'Desbloqueaste una skin',t.name,1000)
                setAccountData(account,tostring(t.id),1) 
            end
            
        end )
    end
end 
addEventHandler('onResourceStart',root,createmarkers)

function checkifunlock(source,skinid)
    local account = getPlayerAccount(source)
    for _, t in pairs( skinsunlock ) do 
        local skin = tonumber(getAccountData(account, t.id))

        if skin ~= 1 and skinid == t.id then
            outputChatBox('Skin no disponible.',source,255,0,0)
            return false
        end
                    
    end 

    return true
    
end