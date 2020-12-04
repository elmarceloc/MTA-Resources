addEventHandler("onClientResourceStart", resourceRoot, function()
  shader = dxCreateShader("shader.fx")
  textura = dxCreateTexture("img/1.png") -- IMAGEN A REEMPLAZAR
  dxSetShaderValue(shader, "gTexture", textura)
  
  engineApplyShaderToWorldTexture(shader, "cs_rockdetail2") -- NOMBRE DE LA TEXTURA EN EL TXD
  engineApplyShaderToWorldTexture(shader, "rocktbrn128") -- NOMBRE DE LA TEXTURA EN EL TXD
end
)