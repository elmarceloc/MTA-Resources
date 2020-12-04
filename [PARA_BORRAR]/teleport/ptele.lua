----------------------- Creado por Azno10 -----------------------

function teleport()
Teleport1 = createMarker ( 2244.3325195313, -1665.2591552734, 16.0765625, "arrow", 1, 255, 216, 0, 255, getRootElement() )
createBlipAttachedTo (Teleport1, 45)

function MarkerHit( hitElement, matchingDimension, interior )
    setElementPosition ( hitElement, 207.05432128906, -138.80432128906, 1003.5078125)
	setElementDimension ( hitElement, 0 )  
	setElementInterior ( hitElement, 3 )
	setElementRotation(hitElement, -0, 0, 0.002745735924691) 
	
end
addEventHandler( "onMarkerHit", Teleport1, MarkerHit )

end
addEventHandler ( "onResourceStart", getRootElement (), teleport )


function teleport()
Teleport2 = createMarker ( 206.93525695801, -139.93185424805, 1004.2078125, "arrow", 1, 255, 216, 0, 255, getRootElement() )
setElementDimension ( Teleport2, 0 )  
setElementInterior ( Teleport2, 3 )

function MarkerHit( hitElement, matchingDimension )
    setElementPosition ( hitElement, 2244.7919921875, -1663.1739501953, 15.4765625)
	setElementDimension ( hitElement, 0 )  
	setElementInterior ( hitElement, 0 )
	setElementRotation(hitElement, -0, 0, 345.64251708984) 
end
addEventHandler( "onMarkerHit", Teleport2, MarkerHit )

end
addEventHandler ( "onResourceStart", getRootElement (), teleport )
