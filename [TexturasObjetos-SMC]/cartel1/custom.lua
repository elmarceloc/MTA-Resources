addEventHandler('onClientResourceStart', resourceRoot, 
function() 

outputChatBox ( "Test")
local txd = engineLoadTXD('files/cartel.txd',true)
        engineImportTXD(txd, 2804)

	
	local dff = engineLoadDFF('files/cartel.dff', 0) 
	engineReplaceModel(dff, 2804)


	local col = engineLoadCOL('files/cartel.col') 
	engineReplaceCOL(col, 2804)

		
	engineSetModelLODDistance(2804, 500)
end 
)