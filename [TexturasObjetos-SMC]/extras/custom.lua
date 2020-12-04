addEventHandler('onClientResourceStart', resourceRoot, 
function() 

local txd = engineLoadTXD('files/extra1.txd',true)
        engineImportTXD(txd, 1281)
		
local txd = engineLoadTXD('files/extra2.txd',true)
        engineImportTXD(txd, 5758)
		
local txd = engineLoadTXD('files/extra3.txd',true)
        engineImportTXD(txd, 5789)
		
local txd = engineLoadTXD('files/extra4.txd',true)
        engineImportTXD(txd, 5785)
		
local txd = engineLoadTXD('files/extra5.txd',true)
        engineImportTXD(txd, 5855)
		
local txd = engineLoadTXD('files/extra6.txd',true)
        engineImportTXD(txd, 1388)
		
local txd = engineLoadTXD('files/extra7.txd',true)
        engineImportTXD(txd, 5742)
		
local txd = engineLoadTXD('files/extra8.txd',true)
        engineImportTXD(txd, 5990)
		
local txd = engineLoadTXD('files/extra10.txd',true)
        engineImportTXD(txd, 5715)
		
local txd = engineLoadTXD('files/extra11.txd',true)
        engineImportTXD(txd, 5712)
		

		
	engineSetModelLODDistance(1281, 500)
	engineSetModelLODDistance(5758, 500)
	engineSetModelLODDistance(5789, 500)
	engineSetModelLODDistance(5785, 500)
	engineSetModelLODDistance(5855, 500)
	engineSetModelLODDistance(1388, 500)
	engineSetModelLODDistance(5742, 500)
	engineSetModelLODDistance(5990, 500)
	engineSetModelLODDistance(5715, 500)
	engineSetModelLODDistance(5712, 500)
end 
)