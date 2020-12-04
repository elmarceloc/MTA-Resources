addEventHandler('onClientResourceStart', resourceRoot, 
function() 

local txd = engineLoadTXD('files/fenix2.txd',true)
        engineImportTXD(txd, 1882)

	
	local dff = engineLoadDFF('files/fenix2.dff', 0) 
	engineReplaceModel(dff, 1882)


	local col = engineLoadCOL('files/fenix2.col') 
	engineReplaceCOL(col, 1882)

		
	engineSetModelLODDistance(1882, 500)
end 
)