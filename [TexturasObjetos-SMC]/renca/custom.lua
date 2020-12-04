addEventHandler('onClientResourceStart', resourceRoot, 
function() 

local txd = engineLoadTXD('files/renca.txd',true)
        engineImportTXD(txd, 1947)

	
	local dff = engineLoadDFF('files/renca.dff', 0) 
	engineReplaceModel(dff, 1947)


	local col = engineLoadCOL('files/renca.col') 
	engineReplaceCOL(col, 1947)

		
	engineSetModelLODDistance(1947, 500)
end 
)