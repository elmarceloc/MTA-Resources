addEventHandler('onClientResourceStart', resourceRoot,
function()
local txd1 = engineLoadTXD('img/dynphn.txd',true)
engineImportTXD(txd1, 1216)
local txd2 = engineLoadTXD('img/roadside.txd',true)
engineImportTXD(txd2, 1363)
end)