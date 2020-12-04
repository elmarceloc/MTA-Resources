local myShader = dxCreateShader("texture.fx")

addEventHandler("onClientElementDataChange", root,
function (dataName)
    if (getElementType(source) == "vehicle") and (dataName == "Cleaned") then
        engineApplyShaderToWorldTexture(myShader, "vehiclegrunge256", source)
        engineApplyShaderToWorldTexture(myShader, "?emap*", source)
    end
end)

addEventHandler("onClientElementDataChange", root,
function (dataName)
    for _, vehicle in ipairs(getElementsByType("vehicle")) do
        if (getElementData(vehicle, "Cleaned") then
            engineApplyShaderToWorldTexture(myShader, "vehiclegrunge256", vehicle)
            engineApplyShaderToWorldTexture(myShader, "?emap*", vehicle)
        end
    end
end)