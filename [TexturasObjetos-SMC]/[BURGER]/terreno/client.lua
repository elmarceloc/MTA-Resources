col = engineLoadCOL( "terreno.col" )
engineReplaceCOL( col, 5741 )

dff = engineLoadDFF( "terreno.dff", 5741 )
--engineReplaceModel( dff, 5741 )
engineReplaceModel( dff, 5741, true )