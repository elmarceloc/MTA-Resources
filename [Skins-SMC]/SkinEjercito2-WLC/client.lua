
txd = engineLoadTXD ( "img/ejercito2.txd" )
engineImportTXD ( txd, 241 )
dff = engineLoadDFF ( "img/ejercito2.dff" )
engineReplaceModel ( dff, 241 )

