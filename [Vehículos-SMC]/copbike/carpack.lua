function replaceModel() 
  txd = engineLoadTXD("car/copbike.txd", 523 )
  engineImportTXD(txd, 523)
  dff = engineLoadDFF("car/copbike.dff", 523 )
  engineReplaceModel(dff, 523)
end
addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()), replaceModel)

addCommandHandler ( "reloadcar", replaceModel )