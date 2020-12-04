addEventHandler('onClientResourceStart', resourceRoot, 
function() 

local txd = engineLoadTXD('files/telepizza.txd',true)
        engineImportTXD(txd, 5418)

	
	local dff = engineLoadDFF('files/telepizza.dff', 0) 
	engineReplaceModel(dff, 5418)


	local col = engineLoadCOL('files/telepizza.col') 
	engineReplaceCOL(col, 5418)

		
	engineSetModelLODDistance(5418, 500)
end 
)