addEventHandler('onClientResourceStart', resourceRoot, 
function() 

local txd = engineLoadTXD('files/5.txd',true)
        engineImportTXD(txd, 2260)
		
local txd = engineLoadTXD('files/4.txd',true)
        engineImportTXD(txd, 2422)
		
local txd = engineLoadTXD('files/3.txd',true)
        engineImportTXD(txd, 2452)
		
local txd = engineLoadTXD('files/2.txd',true)
        engineImportTXD(txd, 2280)
		
local txd = engineLoadTXD('files/1.txd',true)
        engineImportTXD(txd, 2430)

	engineSetModelLODDistance(2260, 500)
	engineSetModelLODDistance(2422, 500)
	engineSetModelLODDistance(2452, 500)
	engineSetModelLODDistance(2280, 500)
	engineSetModelLODDistance(2430, 500)
end 
)