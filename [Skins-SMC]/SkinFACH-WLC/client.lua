
txd = engineLoadTXD ( "img/fach.txd" )
engineImportTXD ( txd, 179 )
dff = engineLoadDFF ( "img/fach.dff" )
engineReplaceModel ( dff, 179 )

