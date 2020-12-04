
txd_fach = engineLoadTXD ( "img/maverick.txd" )
engineImportTXD ( txd_fach, 487 )
dff_fach = engineLoadDFF ( "img/maverick.dff" )
engineReplaceModel ( dff_fach, 487 )
