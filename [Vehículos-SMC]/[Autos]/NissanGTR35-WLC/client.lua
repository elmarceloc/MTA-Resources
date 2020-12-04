txd = engineLoadTXD('alpha.txd', 602 )
engineImportTXD(txd, 602 )
dff = engineLoadDFF('alpha.dff', 602 )
engineReplaceModel(dff, 602 )
