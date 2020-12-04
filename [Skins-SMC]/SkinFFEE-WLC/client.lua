
txd_ffee = engineLoadTXD ( "img/ffee.txd" )
engineImportTXD ( txd_ffee, 38 )
dff_ffee = engineLoadDFF ( "img/ffee.dff" )
engineReplaceModel ( dff_ffee, 38 )

