addEventHandler('onClientResourceStart', resourceRoot, 
function() 
	txd = engineLoadTXD ( "9.txd" )
	engineImportTXD ( txd, 151 )
        
	dff = engineLoadDFF ( "9.dff", 151 )
        engineReplaceModel ( dff, 151 ) 
  
     txd = engineLoadTXD ( "16.txd" )
	engineImportTXD ( txd, 240 )
	
	dff = engineLoadDFF ( "16.dff", 240 )
        engineReplaceModel ( dff, 240 ) 

        txd = engineLoadTXD ( "17.txd" )
	engineImportTXD ( txd, 214 )
        
	dff = engineLoadDFF ( "17.dff", 214 )
        engineReplaceModel ( dff, 214 ) 
   
        txd = engineLoadTXD ( "18.txd" )
	engineImportTXD ( txd, 242 )
        
	dff = engineLoadDFF ( "18.dff", 242 )
        engineReplaceModel ( dff, 242 )
end 
) 