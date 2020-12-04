function replaceModel() 
  txd = engineLoadTXD("car/copcarla.txd", 596 )
  engineImportTXD(txd, 596)
  dff = engineLoadDFF("car/copcarla.dff", 596 )
  engineReplaceModel(dff, 596)
end
addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()), replaceModel)

addCommandHandler ( "reloadcar", replaceModel )