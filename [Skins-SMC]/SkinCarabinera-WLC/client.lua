
txd = engineLoadTXD ( "img/carabinera.txd" )
engineImportTXD ( txd, 190 )
dff = engineLoadDFF ( "img/carabinera.dff" )
engineReplaceModel ( dff, 190 )

