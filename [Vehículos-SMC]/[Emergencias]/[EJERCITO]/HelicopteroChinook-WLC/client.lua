txd = engineLoadTXD('cargobob.txd' ,548 )
engineImportTXD(txd, 548 )
dff = engineLoadDFF('cargobob.dff', 548 )
engineReplaceModel(dff, 548 )

