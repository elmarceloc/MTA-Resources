addEventHandler('onClientResourceStart', resourceRoot, 
function() 

local txd = engineLoadTXD('files/jumbo.txd',true)
        engineImportTXD(txd, 1880)

	
	local dff = engineLoadDFF('files/jumbo.dff', 0) 
	engineReplaceModel(dff, 1880)


	local col = engineLoadCOL('files/jumbo.col') 
	engineReplaceCOL(col, 1880)

		
	engineSetModelLODDistance(1880, 500)
end 
)