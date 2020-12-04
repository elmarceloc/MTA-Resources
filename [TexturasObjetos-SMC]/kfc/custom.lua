addEventHandler('onClientResourceStart', resourceRoot, 
function() 

local txd = engineLoadTXD('files/kfc.txd',true)
        engineImportTXD(txd, 5168)

	
	local dff = engineLoadDFF('files/kfc.dff', 0) 
	engineReplaceModel(dff, 5168)


	local col = engineLoadCOL('files/kfc.col') 
	engineReplaceCOL(col, 5168)

		
	engineSetModelLODDistance(5168, 500)
end 
)