function Client ()
txd_madera = engineLoadTXD ( "texturaIGLESIA/img/factory_door.txd" )
engineImportTXD ( txd_madera, 2885 )
dff_madera = engineLoadDFF ( "texturaIGLESIA/img/xref_garagedoor.dff" )
engineReplaceModel ( dff_madera, 2885 )
engineSetModelLODDistance(2885, 200)

txd_alfombra = engineLoadTXD ( "texturaIGLESIA/img/dockcargof_las.txd" )
engineImportTXD ( txd_alfombra, 3565 )
engineSetModelLODDistance(3565, 100)

txd_piso = engineLoadTXD ( "texturaIGLESIA/img/xenon_sfse.txd" )
engineImportTXD ( txd_piso, 11292 )
engineSetModelLODDistance(11292, 100)

txd_letrero = engineLoadTXD ( "texturaIGLESIA/img/vgsschurch.txd" )
engineImportTXD ( txd_letrero, 8132 )
engineSetModelLODDistance(8132, 100)
end
addEventHandler( "onClientResourceStart", resourceRoot, Client )