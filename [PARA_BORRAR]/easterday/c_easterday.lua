addEvent('notification',true)

addEventHandler('notification',root,function(msj)

    exports.notifications.createNotification(1,'','¡Feliz pascua!',msj,10000,{255,18,132})
end)

local sw,sh = guiGetScreenSize()
local easter = dxCreateFont('easter.ttf',80)


function dxDrawBorderedText(border,text, left, top, right, bottom, color, scale, font, alignX, alignY, clip, wordBreak,postGUI) 
    for oX = -border, border do -- Border size
		for oY = -border, border do -- Border size
            dxDrawText(text, left + oX, top + oY, right + oX, bottom + oY, tocolor(255, 255, 255, 255), scale, font, alignX, alignY, clip, wordBreak,postGUI) 
        end
    end 
    dxDrawText(text, left, top, right, bottom, color, scale, font, alignX, alignY, clip, wordBreak, postGUI) 
end 


addEventHandler('onClientRender',root,function()
    local eggs = getElementData(localPlayer,'eggs')

    offsetX = 0

    if isPlayerInVehicle(localPlayer) then offsetX = 300 end
        dxDrawImage(sw-256-160-offsetX,sh-256-16,256,256,'eggs.png')
        dxDrawBorderedText(3,eggs,sw-160-offsetX,sh-200+16,200,200,tocolor(243,103,90,255),1,easter)
end)




addCommandHandler('huevos',function()
    local myTable = {}
    local players = getElementsByType("player")
	for index, value in ipairs(players) do
		local rc,gc,bc = getPlayerNametagColor(value)
		local name = getPlayerName(value)
		local eggs = getElementData(value,'eggs')
		table.insert(
			myTable,{
				r = rc,
				g = gc,
				b = bc,
				name = name,
				value = eggs
			}
		)
	end
	table.sort(myTable, function(a, b) return a.value < b.value end )
	
    for i,v in ipairs(myTable) do
		outputChatBox(v.name..'#F3675A:'..v.value,v.r,v.g,v.b,true)
	end
end)
