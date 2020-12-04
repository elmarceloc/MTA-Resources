txd = engineLoadTXD('dodo.txd' ,512 )
engineImportTXD(txd, 512 )
dff = engineLoadDFF('dodo.dff', 512 )
engineReplaceModel(dff, 512 )

