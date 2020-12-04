
txd = engineLoadTXD ( "img/firela.txd" )
engineImportTXD ( txd, 544 )
dff = engineLoadDFF ( "img/firela.dff" )
engineReplaceModel ( dff, 544 )
