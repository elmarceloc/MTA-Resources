
txd = engineLoadTXD ( "img/ejercito.txd" )
engineImportTXD ( txd, 287 )
dff = engineLoadDFF ( "img/ejercito.dff" )
engineReplaceModel ( dff, 287 )

