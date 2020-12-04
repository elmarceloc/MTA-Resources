addEventHandler('onClientResourceStart', resourceRoot, 
function() 

outputChatBox ( "Test")
local txd = engineLoadTXD('files/casa1.txd',true)
        engineImportTXD(txd, 1910)

	
	local dff = engineLoadDFF('files/casa1.dff', 0) 
	engineReplaceModel(dff, 1910)


	local col = engineLoadCOL('files/casa1.col') 
	engineReplaceCOL(col, 1910)

		
	engineSetModelLODDistance(1910, 500)
end 
)