addEventHandler('onClientResourceStart', resourceRoot, 
function() 

local txd = engineLoadTXD('files/mcdonalds.txd',true)
        engineImportTXD(txd, 1878)

	
	local dff = engineLoadDFF('files/mcdonalds.dff', 0) 
	engineReplaceModel(dff, 1878)


	local col = engineLoadCOL('files/mcdonalds.col') 
	engineReplaceCOL(col, 1878)

		
	engineSetModelLODDistance(1878, 200)
end 
)