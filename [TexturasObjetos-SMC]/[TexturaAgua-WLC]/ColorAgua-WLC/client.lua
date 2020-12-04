addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()),
	function()     
		setWaterColor(4, 111, 120, 230) --R, G, B, Claridad--
	end
)
addEventHandler("onClientResourceStop", getResourceRootElement(getThisResource()),
	function()
		resetWaterColor()
	end
)