function isEventHandlerAdded( sEventName, pElementAttachedTo, func ) -- From wiki
     if type( sEventName ) == 'string' and isElement( pElementAttachedTo ) and type( func ) == 'function' then
          local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
          if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
               for i, v in ipairs( aAttachedFunctions ) do
                    if v == func then
        	         return true
        	    end
	       end
	  end
     end
     return false
end

function _setElementHealth(element, vida) -- Sync
	triggerServerEvent("onLavaSetElementHealth", localPlayer, element, vida)
end

function _setPedOnFire(element, bool) -- Sync
	triggerServerEvent("onLavaSetPedOnFire", localPlayer, element, bool)
end

function onClientReady() -- Sync
	triggerServerEvent("onLavaClientReady", localPlayer)
end
addEventHandler("onClientResourceStart", resourceRoot, onClientReady)