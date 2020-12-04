function replaceModel() 
  txd = engineLoadTXD("car/sanchez.txd", 468 )
  engineImportTXD(txd, 468)
  dff = engineLoadDFF("car/sanchez.dff", 468 )
  engineReplaceModel(dff, 468)
end
addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()), replaceModel)

addCommandHandler ( "reloadcar", replaceModel )