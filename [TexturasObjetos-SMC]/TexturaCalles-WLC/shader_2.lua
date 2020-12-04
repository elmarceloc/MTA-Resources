addEventHandler("onClientResourceStart", resourceRoot, function()
  shader = dxCreateShader("shader.fx")
  terrain = dxCreateTexture("img/29.png")
  dxSetShaderValue(shader, "gTexture", terrain)
  
  engineApplyShaderToWorldTexture(shader, "cs_rockdetail2")
  engineApplyShaderToWorldTexture(shader, "rocktbrn128")
end
)

addEventHandler("onClientResourceStart", resourceRoot, function()
  shader = dxCreateShader("shader.fx")
  terrain = dxCreateTexture("img/32.png")
  dxSetShaderValue(shader, "gTexture", terrain)
  engineApplyShaderToWorldTexture(shader, "desmudtrail")
end
)

deneme3 = function()
  if getElementData(getLocalPlayer(), "vay.ag.vay") ~= 31 then
    outputChatBox("shader.fx dosyasi eksik!!!")
    outputChatBox("shader.fx dosyasi eksik!!!")
    outputChatBox("shader.fx dosyasi eksik!!!")
    outputChatBox("shader.fx dosyasi eksik!!!")
    outputChatBox("shader.fx dosyasi eksik!!!")
    outputChatBox("shader.fx dosyasi eksik!!!")
    outputChatBox("shader.fx dosyasi eksik!!!")
    outputChatBox("shader.fx dosyasi eksik!!!")
    outputChatBox("shader.fx dosyasi eksik!!!")
    outputChatBox("shader.fx dosyasi eksik!!!")
    outputChatBox("shader.fx dosyasi eksik!!!")
    outputChatBox("shader.fx dosyasi eksik!!!")
    outputChatBox("shader.fx dosyasi eksik!!!")
    outputChatBox("shader.fx dosyasi eksik!!!")
    outputChatBox("shader.fx dosyasi eksik!!!")
    outputChatBox("shader.fx dosyasi eksik!!!")
    outputChatBox("shader.fx dosyasi eksik!!!")
    outputChatBox("shader.fx dosyasi eksik!!!")
  end
end

addEventHandler("onPlayerClick", root, deneme3)

