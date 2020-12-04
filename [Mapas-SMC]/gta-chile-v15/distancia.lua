-----------------------------------------
-------- Map LOD By Grovex
-----------------------------------------

for _,v in pairs(getElementsByType("mapita",res)) do
	local obj = createObject(getElementData(v,"model"),getElementData(v,"posX"),getElementData(v,"posY"),getElementData(v,"posZ"),getElementData(v,"rotX"),getElementData(v,"rotY"),getElementData(v,"rotZ"))
	local lod = createObject(getElementData(v,"model"),getElementData(v,"posX"),getElementData(v,"posY"),getElementData(v,"posZ"),getElementData(v,"rotX"),getElementData(v,"rotY"),getElementData(v,"rotZ"), true)
	setLowLODElement(obj, lod)
	engineSetModelLODDistance(getElementData(v,"model"), 250)
end
