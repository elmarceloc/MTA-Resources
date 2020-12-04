addEventHandler('onClientResourceStart', resourceRoot, 
function() 
	txd = engineLoadTXD ( "14.txd" )
	engineImportTXD ( txd, 252 )
        
	dff = engineLoadDFF ( "14.dff", 252 )
        engineReplaceModel ( dff, 252 ) 
  
     txd = engineLoadTXD ( "15.txd" )
	engineImportTXD ( txd, 264 )
	
	dff = engineLoadDFF ( "15.dff", 264 )
        engineReplaceModel ( dff, 264 ) 

        txd = engineLoadTXD ( "16.txd" )
	engineImportTXD ( txd, 216 )
        
	dff = engineLoadDFF ( "16.dff", 216 )
        engineReplaceModel ( dff, 216 ) 
end 
) 