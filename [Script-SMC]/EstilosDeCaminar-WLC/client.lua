local window

local styles = {
	{"Default", 0},
	{"Mujer 1", 129},
	{"Mujer 2", 133},
	{"Mujer 3", 135},
	{"Mujer 4", 132},
	{"Mujer 5", 133},
	{"Hombre 1", 118},
	{"Hombre 2", 124},
	{"Anciana", 134},
	{"Anciano", 120},
	{"Anciano 2", 123},
	{"Pandillero 1", 121},
	{"Pandillero 2", 122},
	{"Carabinero", 128},
	{"Curao", 126},
	{"Ciego", 127},
	{"Sigiloso", 69},
	{"Trotador", 125}
}

function createStylePanel()
	if isElement(window) and guiGetVisible(window) == true then
		return hideStylePanel()
	end
	local sw, sh = guiGetScreenSize()
	window = guiCreateWindow(sw / 1.4, sh / 4, sw / 4.5, sh / 2, "Estilos de Caminar", false)
	grid = guiCreateGridList(0, 0.06, 1, 0.75, true, window)
	col1 = guiGridListAddColumn(grid, "Estilos de Caminar", 0.9)
	button1 = guiCreateButton(0, 0.82, 1, 0.07, "Aceptar", true, window)
	addEventHandler("onClientGUIClick", button1, selectStyle, false)
	addEventHandler("onClientGUIDoubleClick", grid, selectStyle, false)
	button2 = guiCreateButton(0, 0.9, 1, 0.07, "Cancelar", true, window)
	addEventHandler("onClientGUIClick", button2, hideStylePanel, false)
	showCursor(true)
	for i, v in ipairs(styles) do
		local row = guiGridListAddRow(grid)
		guiGridListSetItemText(grid, row, col1, v[1], false, false)
		guiGridListSetItemData(grid, row, col1, v[2], false, false)
	end
end
bindKey("F7", "down", createStylePanel)

function hideStylePanel()
	removeEventHandler("onClientGUIClick", button1, selectStyle, false)
	removeEventHandler("onClientGUIDoubleClick", grid, selectStyle, false)
	removeEventHandler("onClientGUIClick", button2, hideStylePanel, false)
	destroyElement(window)
	showCursor(false)
end

function selectStyle()
	local item = guiGridListGetSelectedItem(grid)
	if item == -1 then
		return
	end
	local theStyle = guiGridListGetItemData(grid, item, 1)
	local theStyle_text = guiGridListGetItemText(grid, item, 1)
	outputChatBox("#FFFFFFCambiaste tu estilo de caminar a:#055e00 " .. theStyle_text, 255, 255, 255, true)
	triggerServerEvent("onApplyStyle", resourceRoot, theStyle)
	hideStylePanel()
end

--[[function setStyleCmd(localPlayer, commandName, theStyleNo)
		local style = tonumber(theStyleNo)
		outputChatBox("#FFFFFFCambiaste tu estilo de caminar a:#055e00 "..theStyleNo, 255, 255, 255, true)
		triggerServerEvent("onApplyStyleCmd", resourceRoot, style)
end
addCommandHandler("setestilo",setStyleCmd)]] --