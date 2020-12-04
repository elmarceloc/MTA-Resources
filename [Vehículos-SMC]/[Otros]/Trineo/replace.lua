txd = engineLoadTXD("trineo.txd")
engineImportTXD(txd, 460)
dff = engineLoadDFF("trineo.dff", 460)
engineReplaceModel(dff, 460)


-- www.youtube.com/c/MrPointGamer