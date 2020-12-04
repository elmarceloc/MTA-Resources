sosound = {}
node = true
index = 0

function count (xml, subnode) 
    while node ~= false do  
        node = xmlFindChild (xml, subnode, index) 
        index = index + 1 
    end 
    return index-2
end

local xml = xmlLoadFile("vehicles_music.xml") 

function play_sound_client(vehicle, playerName)

	setRadioChannel(0) 
	addEventHandler('onClientPlayerRadioSwitch', getRootElement(), function() cancelEvent() end ) 

	local x,y,z = getElementPosition(vehicle)

 	local vehicleid = getElementModel(vehicle)

	 
 	local vehicles = xmlFindChild(xml, "vehicles",0) 
	
 	local vehiculeslenght = count(vehicles, 'vehicle')

	node = true
 	index = 0

 	for i = 0, vehiculeslenght do 	
		local vehicle_xml = xmlFindChild(vehicles, "vehicle",i) 
		local vehicleparams =  xmlNodeGetAttributes(vehicle_xml)
		
		if tonumber(vehicleid) == tonumber(vehicleparams.id) then

			sound[playerName] = playSound3D('music/'.. vehicleparams.file ..'.ogg', x, y, z, true)
			setSoundVolume(sound[playerName],0.3)
			if (isElement(vehicle)) then attachElements(sound[playerName], vehicle) end

		end
 	end

end
addEvent("play_sound", true)
addEventHandler("play_sound", root, play_sound_client)
 
function stop_sound_client(playerName)
    destroyElement(sound[playerName])
	sound[playerName] = nil
end
addEvent("stop_sound", true)
addEventHandler("stop_sound", root, stop_sound_client)
--addEventHandler('onClientWasted', root, stop_sound_client)