txd = engineLoadTXD('supergt.txd', 506 )
engineImportTXD(txd, 506 )
dff = engineLoadDFF('supergt.dff', 506 )
engineReplaceModel(dff, 506 )
