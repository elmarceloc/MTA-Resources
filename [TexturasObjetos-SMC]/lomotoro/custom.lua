addEventHandler('onClientResourceStart', resourceRoot, 
function() 

local txd = engineLoadTXD('files/lomas.txd',true)
        engineImportTXD(txd, 2926)

	
	local dff = engineLoadDFF('files/lomas.dff', 0) 
	engineReplaceModel(dff, 2926)


	local col = engineLoadCOL('files/lomas.col') 
	engineReplaceCOL(col, 2926)

		
	engineSetModelLODDistance(2926, 200)
end 
)