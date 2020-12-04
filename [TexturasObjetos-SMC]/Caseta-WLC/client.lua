addEventHandler('onClientResourceStart', resourceRoot,
function()
local txd_caseta = engineLoadTXD('img/contachou1_lae2.txd',true)
engineImportTXD(txd_caseta, 17950)
engineSetModelLODDistance(17950, 50)

engineSetModelLODDistance(5269, 200)
engineSetModelLODDistance(3095, 150)
end)