--#Dar_Khane_Mimanim

local screenW, screenH = guiGetScreenSize()

	statsBG = guiCreateStaticImage((screenW - 512) / 2, (screenH - 256) / 2, 512, 256, "Data/Background.png", false)
	guiSetProperty(statsBG, "Visible", "False")
	Exit = guiCreateStaticImage(471, 14, 27, 27, "Data/Click.png", false, statsBG)
	Mobtala = guiCreateLabel(150, 72, 81, 24, "", false, statsBG)
	local font0_font = guiCreateFont("Data/Font.ttf", 13)
	guiSetFont(Mobtala, font0_font)
	guiLabelSetColor(Mobtala, 255, 255, 255)
	Mobtala24 = guiCreateLabel(108, 106, 81, 24, "", false, statsBG)
	guiSetFont(Mobtala24, font0_font)
	guiLabelSetColor(Mobtala24, 255, 255, 255)
	Death = guiCreateLabel(140, 144, 81, 24, "", false, statsBG)
	guiSetFont(Death, font0_font)
	guiLabelSetColor(Death, 255, 255, 255)
	Behbood = guiCreateLabel(134, 178, 81, 24, "", false, statsBG)
	guiSetFont(Behbood, font0_font)
	guiLabelSetColor(Behbood, 255, 255, 255)

addCommandHandler("coronavirus",
function ()
	triggerServerEvent("openCoronaStats", getLocalPlayer(), getLocalPlayer())
end)

addEventHandler("onClientGUIClick", getRootElement(),
function()
	if source == Exit then
		guiSetProperty(statsBG, "Visible", "False")
		showCursor(false)
	end
end)

addEvent("writeCoronaStatus", true)
addEventHandler("writeCoronaStatus", getLocalPlayer(),
function (tedad, tedad24, marg, behbood)
	guiSetProperty(statsBG, "Visible", "True")
	showCursor(true)
	guiSetText(Mobtala, tedad)
	guiSetText(Mobtala24, tedad24)
	guiSetText(Death, marg)
	guiSetText(Behbood, behbood)
end)