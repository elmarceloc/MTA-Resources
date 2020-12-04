addEventHandler('onClientResourceStart', resourceRoot, 
function() 

local txd = engineLoadTXD('files/ripley.txd',true)
        engineImportTXD(txd, 1879)

	
	local dff = engineLoadDFF('files/ripley.dff', 0) 
	engineReplaceModel(dff, 1879)


	local col = engineLoadCOL('files/ripley.col') 
	engineReplaceCOL(col, 1879)

		
	engineSetModelLODDistance(1879, 250)
end 
)