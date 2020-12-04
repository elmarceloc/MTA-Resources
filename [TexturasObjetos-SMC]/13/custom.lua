addEventHandler('onClientResourceStart', resourceRoot, 
function() 

local txd = engineLoadTXD('files/13.txd',true)
        engineImportTXD(txd, 2703)

	
	local dff = engineLoadDFF('files/13.dff', 0) 
	engineReplaceModel(dff, 2703)


	local col = engineLoadCOL('files/13.col') 
	engineReplaceCOL(col, 2703)

		
	engineSetModelLODDistance(2703, 500)
end 
)