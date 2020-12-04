function Client ()

col = engineLoadCOL ( "PortaAviones_objetos-WLC/img/portaaviones.col" )
engineReplaceCOL ( col, 1952 )
txd = engineLoadTXD ( "PortaAviones_objetos-WLC/img/portaaviones.txd" )
engineImportTXD ( txd, 1952 )
dff = engineLoadDFF ( "PortaAviones_objetos-WLC/img/portaaviones.dff" )
engineReplaceModel ( dff, 1952 )
engineSetModelLODDistance(1952, 250)

end
addEventHandler( "onClientResourceStart", resourceRoot, Client )