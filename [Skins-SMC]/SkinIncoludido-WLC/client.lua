txd = engineLoadTXD('incoludido.txd', 144 )
engineImportTXD(txd, 144 )
dff = engineLoadDFF('incoludido.dff', 144 )
engineReplaceModel(dff, 144 )
