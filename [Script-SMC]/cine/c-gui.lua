-- Scripted by G&T Mapping & Loki

-------------------
-- GUI / VISUALS --
-------------------
setDevelopmentMode(false, false)

fontType = dxCreateFont("fonts/primetime.ttf",30,false,"antialiased")
thumb = "img/bg.png"

function Browser_Tab()
	Image(36, 177, 258, 49, thumb, 0, 0, 0, tocolor(255, 255, 255, 60), true)
end

plTabColor = {23, 225, 167, 255, 255}
ulTabColor = {217, 217, 217, 255}
function Panel()
	Rectangle(16, 76, 1247, 870, tocolor(23, 225, 167, 255), false)
	Rectangle(842, 167, 411, 769, tocolor(16, 16, 16, 255), false)
	Rectangle(26, 167, 806, 769, tocolor(16, 16, 16, 255), false)
	Text("Youtube", 36, 177, 293, 225, tocolor(255, 255, 255, 255), 2.00, "default", "center", "center", false, false, false, false, false)
	Text("Configuración", 301, 177, 558, 225, tocolor(255, 255, 255, 255), 2.00, "default", "center", "center", false, false, false, false, false)
	Text("Ayuda", 565, 177, 822, 225, tocolor(255, 255, 255, 255), 2.00, "default", "center", "center", false, false, false, false, false)
	Rectangle(36, 260, 786, 413, tocolor(38, 40, 40, 255), false)
	Rectangle(36, 683, 786, 243, tocolor(38, 40, 40, 255), false)
	Text("Wena Los Cine", 76, 76, 772, 157, tocolor(255, 255, 255, 255), 1.1, fontType, "center", "center", false, false, false, false, false)
	Image(620, 741, 128, 128, "img/add.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	Text("REPRODUCIR", 307, 693, 552, 916, tocolor(255, 255, 255, 255), 3.00, "default", "center", "center", false, true, false, false, false)
	Text("BORRAR", 46, 693, 291, 916, tocolor(255, 255, 255, 255), 3.00, "default", "center", "center", false, true, false, false, false)
	
	Rectangle(852, 260, 87, 38, tocolor(unpack(plTabColor)), false)
    Text("Playlist", 852, 260, 939, 298, tocolor(42, 42, 42, 255), 1.40, "default", "center", "center", false, false, false, false, false)
    Rectangle(949, 260, 87, 38, tocolor(unpack(ulTabColor)), false)
    Text("Visitantes", 949, 260, 1036, 298, tocolor(42, 42, 42, 255), 1.40, "default", "center", "center", false, false, false, false, false)
	
    Text("Estado:", 873-20, 86, 872, 157, tocolor(255, 255, 255, 255), 0.5, fontType, "left", "center", false, false, false, false, false)
    if theater then
        Text("ABIERTO", 968-20, 86, 872, 157, tocolor(0, 255, 0, 255), 0.5, fontType, "left", "center", false, false, false, false, false)
    else
        Text("CERRADO", 968-20, 86, 872, 157, tocolor(0, 0, 0, 255), 0.5, fontType, "left", "center", false, false, false, false, false)
    end
	
	Text("Visitantes: ", 1065, 86, 872, 157, tocolor(255, 255, 255, 255), 0.5, fontType, "left", "center", false, false, false, false, false)
	Text(#getElementsWithinColShape(cinemaCol,"player"), 1185, 93, 872, 157, tocolor(255, 255, 255, 255), 1.6, "sans", "left", "center", false, false, false, false, false)
end

function Settings_Tab()
    if not settingsTabOpen then return end
	Image(301, 177, 258, 49, thumb, 0, 0, 0, tocolor(255, 255, 255, 60), false)
	
    Text("VIP", 46, 270, 293, 308, tocolor(255, 255, 255, 255), 1.50, "default", "left", "center", false, false, false, false, true)
    Text("Mi configuración", 46, 509, 293, 547, tocolor(255, 255, 255, 255), 1.50, "default", "left", "center", false, false, false, false, true)
 
    Text("Abrir/Cerrar Cine", 94, 325, 345, 354, tocolor(255, 255, 255, 255), 1.50, "default", "left", "center", false, false, false, false, true)
    if theater then
        Image(40, 325, 50, 29, "img/checked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    else
        Image(40, 325, 50, 29, "img/unchecked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    end
 
    Text("Activar/Desactivar Playback", 94, 371, 345, 400, tocolor(230, 0, 0, 255), 1.50, "default", "left", "center", false, false, false, false, true)
    if playback then
        Image(40, 371, 50, 29, "img/checked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    else
        Image(40, 371, 50, 29, "img/unchecked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    end
 
    Text("Activar/Desactivar reproduccion", 94, 417, 345, 446, tocolor(230, 0, 0, 255), 1.50, "default", "left", "center", false, false, false, false, true)
    if audio then
        Image(40, 417, 50, 29, "img/checked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    else
        Image(40, 417, 50, 29, "img/unchecked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    end
 
    Text("Activar/Desactivar Playlist", 94, 463, 345, 492, tocolor(230, 0, 0, 255), 1.50, "default", "left", "center", false, false, false, false, true)
    if queue then
        Image(40, 463, 50, 29, "img/checked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    else
        Image(40, 463, 50, 29, "img/unchecked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    end
 
    Text("Activar/Desactivar Ambilight", 408, 325, 659, 354, tocolor(255, 255, 255, 255), 1.50, "default", "left", "center", false, false, false, false, true)
    if ambilight then
        Image(354, 325, 50, 29, "img/checked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    else
        Image(354, 325, 50, 29, "img/unchecked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    end
 
    Text("Activar/Desactivar Audiencia", 408, 371, 659, 400, tocolor(255, 255, 255, 255), 1.50, "default", "left", "center", false, false, false, false, true)
    if audience then
        Image(354, 371, 50, 29, "img/checked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    else
        Image(354, 371, 50, 29, "img/unchecked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    end
 
    Text("Activar/Desactivar Luz nocturna", 408, 417, 659, 446, tocolor(255, 255, 255, 255), 1.50, "default", "left", "center", false, false, false, false, true)
    if time then
        Image(354, 417, 50, 29, "img/checked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    else
        Image(354, 417, 50, 29, "img/unchecked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    end
 
    Text("Activar/Desactivar Armas", 408, 463, 659, 492, tocolor(255, 255, 255, 255), 1.50, "default", "left", "center", false, false, false, false, true)
    if weapons then
        Image(354, 463, 50, 29, "img/checked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    else
        Image(354, 463, 50, 29, "img/unchecked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    end
 
    Text("Cambiar vista", 94, 610, 345, 639, tocolor(230, 0, 0, 255), 1.50, "default", "left", "center", false, false, false, false, true)
    Image(40, 610, 50, 29, "img/checked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
 
    Text("Activar/Desactivar audio", 94, 564, 345, 593, tocolor(230, 0, 0, 255), 1.50, "default", "left", "center", false, false, false, false, true)
    Image(40, 564, 50, 29, "img/checked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
 
    Text("Activar/Desactivar Navegador", 408, 564, 659, 593, tocolor(230, 0, 0, 255), 1.50, "default", "left", "center", false, false, false, false, true)
    Image(354, 564, 50, 29, "img/checked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
 
    Text("", 408, 610, 659, 639, tocolor(255, 255, 255, 255), 1.50, "default", "left", "center", false, false, false, false, true)
    Image(354, 610, 50, 29, "img/checked.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
   
end

function Dialog()
	local text = "Estas seguro?"
	local yes = "Si"
	local no = "No"
	Rectangle(463, 355, 339, 214, tocolor(252, 40, 45, 255), true)
	Image(491, 486, 137, 47, "img/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
	Text(yes, 490 + 1, 486 + 1, 627 + 1, 533 + 1, tocolor(0, 0, 0, 255), 1.50, "default", "center", "center", false, false, true, false, false)
	Text(yes, 490, 486, 627, 533, tocolor(255, 255, 255, 255), 1.50, "default", "center", "center", false, false, true, false, false)
	Image(637, 486, 137, 47, "img/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
	Text(no, 637 + 1, 486 + 1, 774 + 1, 533 + 1, tocolor(0, 0, 0, 255), 1.50, "default", "center", "center", false, false, true, false, false)
	Text(no, 637, 486, 774, 533, tocolor(255, 255, 255, 255), 1.50, "default", "center", "center", false, false, true, false, false)
	Text(text, 463 + 1, 355 + 1, 802 + 1, 493 + 1, tocolor(0, 0, 0, 255), 2.00, "default", "center", "center", false, true, true, false, false)
	Text(text, 463, 355, 802, 493, tocolor(255, 255, 255, 255), 2.00, "default", "center", "center", false, true, true, false, false)
end

browserSwitch = "Saltar anuncios"
myBrowserURL = "https://youtube.com"
switchedBrowser = false
function switchMyBrowser()
	if not isPanelVisible then return end
	Rectangle(755-100, 260, 67+104, 38+20, tocolor(34, 34, 34, 210), true)
	Text(browserSwitch, 651, 260, 828, 298, tocolor(255, 255, 255, 255), 1.25, "default", "center", "center", false, true, true, false, false)
end


function createBrowserGui()
	Browser_Bg = guiCreateStaticImage(36, 260, 786, 413, "img/bg.png", false)
	Browser = guiCreateBrowser(0, 0, 786, 413, false, false, false, Browser_Bg)
	addEventHandler("onClientBrowserCreated",root,function()
		if isElement(Browser) then
			loadBrowserURL(guiGetBrowser(Browser),myBrowserURL)
		end
	end)
end

function Help_Tab_CEGUI()
	GUIEditor.scrollpane[1] = guiCreateScrollPane(36, 261, 786, 411, false)
	GUIEditor.label[7] = guiCreateLabel(10, 10, 766, 752, "a", false, GUIEditor.scrollpane[1])
	guiLabelSetColor(GUIEditor.label[7], 77, 252, 135)
	guiLabelSetHorizontalAlign(GUIEditor.label[7], "left", true)    
end

function Help_Tab()
	Image(565, 177, 258, 49, thumb, 0, 0, 0, tocolor(255, 255, 255, 60), false)
end

sansBig = guiCreateFont( "fonts/sans.ttf", 11 )

HelpInfo = ScrollPane(41, 263, 774, 401, false)

HelpLabel = Label(2, 5, 746, 1100, [[Wena los cine - Version: Marselo anda acostarte

Basado en: Follow G&T on Facebook: https://fb.com/gtmapping

Binds:

F6 - Abrir/Cerrar el buscador
M o /muteit - Mutiar la wea
(-/+) - Cambiar el volumen

Comandos:

/play [url] -Reproducir un link directo de youtube
/playlist - Mostrar la lista de reproducción
/link - Obtener el link del video
/proper - Ajustar el tamaño de la pantalla

Mouse

/cine - Usar el mouse, clickear y weas
/nocine - Desactivar el /cine

]], false, HelpInfo)

guiLabelSetColor(HelpLabel,255,255,255)
guiLabelSetHorizontalAlign(HelpLabel,"left",true)
guiSetFont(HelpLabel,sansBig)

guiSetVisible(HelpInfo,false)
