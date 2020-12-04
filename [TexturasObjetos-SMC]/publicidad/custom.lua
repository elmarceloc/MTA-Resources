addEventHandler('onClientResourceStart', resourceRoot, 
function() 
		
local txd = engineLoadTXD('files/ground5_las.txd',true)
        engineImportTXD(txd, 4858)
		
local txd = engineLoadTXD('files/billbrd01_lan.txd',true)
        engineImportTXD(txd, 4238)
		
local txd = engineLoadTXD('files/billbrd01_lan2.txd',true)
        engineImportTXD(txd, 4731)
		
local txd = engineLoadTXD('files/hospital_lae.txd',true)
        engineImportTXD(txd, 5402)
		
local txd = engineLoadTXD('files/publicidad1.txd',true)
        engineImportTXD(txd, 5818)
		
local txd = engineLoadTXD('files/publicidad2.txd',true)
        engineImportTXD(txd, 5857)
		
local txd = engineLoadTXD('files/publicidad3.txd',true)
        engineImportTXD(txd, 13890)
		
local txd = engineLoadTXD('files/publicidad4.txd',true)
        engineImportTXD(txd, 5854)

		
	engineSetModelLODDistance(4858, 500)
	engineSetModelLODDistance(4238, 500)
    engineSetModelLODDistance(4731, 500)
    engineSetModelLODDistance(5402, 500)
    engineSetModelLODDistance(5818, 500)
    engineSetModelLODDistance(5857, 500)
    engineSetModelLODDistance(13890, 500)
    engineSetModelLODDistance(5854, 500)
end 
)