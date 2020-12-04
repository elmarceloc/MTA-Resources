
txd = engineLoadTXD ( "img/mtbike.txd" )
engineImportTXD ( txd, 510 )
dff = engineLoadDFF ( "img/mtbike.dff" )
engineReplaceModel ( dff, 510 )

