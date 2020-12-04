txd = engineLoadTXD("camionnavidad.txd")
engineImportTXD(txd, 573)
dff = engineLoadDFF("camionnavidad.dff", 573)
engineReplaceModel(dff, 573)

