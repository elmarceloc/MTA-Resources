function replaceModel() 
  txd = engineLoadTXD("car/copcarsf.txd", 597 )
  engineImportTXD(txd, 597)
  dff = engineLoadDFF("car/copcarsf", 597 )
  engineReplaceModel(dff, 597)
end
addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()), replaceModel)

addCommandHandler ( "reloadcar", replaceModel )