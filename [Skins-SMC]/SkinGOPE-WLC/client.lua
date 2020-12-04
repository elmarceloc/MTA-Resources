
txd = engineLoadTXD ( "img/gope.txd" )
engineImportTXD ( txd, 285 )
dff = engineLoadDFF ( "img/gope.dff" )
engineReplaceModel ( dff, 285 )

