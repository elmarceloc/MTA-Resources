addEventHandler('onClientResourceStart', resourceRoot, 
function() 

local txd = engineLoadTXD('files/costanera.txd',true)
        engineImportTXD(txd, 1866)

	
	local dff = engineLoadDFF('files/costanera.dff', 0) 
	engineReplaceModel(dff, 1866)


	local col = engineLoadCOL('files/costanera.col') 
	engineReplaceCOL(col, 1866)

		
	engineSetModelLODDistance(1866, 500)
end 
)