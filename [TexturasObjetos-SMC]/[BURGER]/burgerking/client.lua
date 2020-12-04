col = engineLoadCOL( "bk.col" )
engineReplaceCOL( col, 1852 )

txd = engineLoadTXD( "bk.txd" )
engineImportTXD( txd, 1852 )

dff = engineLoadDFF( "bk.dff", 1852 )
--engineReplaceModel( dff, 1852 )
engineReplaceModel( dff, 1852, true )