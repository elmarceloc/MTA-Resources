local txd = engineLoadTXD("dust2.txd")
engineImportTXD(txd, 13603)
local col = engineLoadCOL("dust2.col")
local dff = engineLoadDFF("dust2.dff")
engineReplaceCOL(col, 13603)
engineReplaceModel(dff, 13603)
engineSetModelLODDistance(13603, 2000)


de_dust2 = createObject( 13603, 703.94617, -2726.09570, 200 )
setElementDimension( de_dust2, 12 )