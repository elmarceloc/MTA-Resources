txd = engineLoadTXD('yoshi.txd', 206 )
engineImportTXD(txd, 206 )
dff = engineLoadDFF('yoshi.dff', 206 )
engineReplaceModel(dff, 206 )
