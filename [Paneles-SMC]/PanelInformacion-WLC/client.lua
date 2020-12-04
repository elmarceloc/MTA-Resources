
outputChatBox( "Presiona F10 para más información.",0,255,0,true )
localPlayer = getLocalPlayer()

wnd_window = {}

addEventHandler( "onClientResourceStart", getResourceRootElement( getThisResource() ),  
	function ( theResource )
		--outputConsole( "wnd_showServerInfo called" )
		--outputConsole( " source: ".. tostring( source ) )
		--outputConsole( " resourceStarted: ".. tostring( theResource ) )
		if source == getResourceRootElement( theResource ) then
			--outputConsole( " passed if: source == resource" )
			local cmd = xmlLoadFile( "Comandos.xml" )
			local cmd1 = xmlNodeGetValue( cmd )
			local member = xmlLoadFile( "Actualizaciones.xml" )
			local member1 = xmlNodeGetValue( member )
			local other = xmlLoadFile( "Reglas.xml" )
			local other1 = xmlNodeGetValue( other )
			local server = xmlLoadFile( "Informacion.xml" )
			local server1 = xmlNodeGetValue( server )

		    wnd_create( cmd1, member1, other1, server1 )
		end
	end
)
function wnd_create( cmd, member, other, server )

GUIEditor_TabPanel = {}
GUIEditor_Tab = {}
GUIEditor_Memo = {}
GUIEditor_Image = {}

window = guiCreateWindow(336,330,744,546,"PANEL DE INFORMACIÓN",false)
guiSetAlpha(window,1)
guiWindowSetSizable(window,false)
background = guiCreateStaticImage(0.0165,0.0549,0.9669,0.9191,"fondo/background.png",true,window)
guiSetAlpha(background,1)
guiSetProperty(background,"Disabled","true")
GUIEditor_TabPanel[1] = guiCreateTabPanel(0.0404,0.2457,0.921,0.6936,true,window)
guiSetAlpha(GUIEditor_TabPanel[1],1)
tabcmd = guiCreateTab("Comandos",GUIEditor_TabPanel[1])
guiSetAlpha(tabcmd,1)
GUIEditor_Memo[1] = guiCreateMemo(0.008,0.0231,0.984,0.9583,cmd,true,tabcmd)
guiSetAlpha(GUIEditor_Memo[1],1)
GUIEditor_Tab[1] = guiCreateTab("Actualizaciones",GUIEditor_TabPanel[1])
guiSetAlpha(GUIEditor_Tab[1],1)
GUIEditor_Memo[2] = guiCreateMemo(0.01,0.0324,0.98,0.9444,member,true,GUIEditor_Tab[1])
guiSetAlpha(GUIEditor_Memo[2],1)
GUIEditor_Tab[2] = guiCreateTab("Reglas",GUIEditor_TabPanel[1])
guiSetAlpha(GUIEditor_Tab[2],1)
GUIEditor_Memo[3] = guiCreateMemo(0.008,0.0185,0.982,0.963,other,true,GUIEditor_Tab[2])
guiSetAlpha(GUIEditor_Memo[2],1)
GUIEditor_Tab[2] = guiCreateTab("Informacion",GUIEditor_TabPanel[1])
guiSetAlpha(GUIEditor_Tab[2],1)
GUIEditor_Memo[4] = guiCreateMemo(0.008,0.0185,0.982,0.963,server,true,GUIEditor_Tab[2])
guiSetAlpha(GUIEditor_Memo[4],1)
guiMemoSetReadOnly(GUIEditor_Memo[1],true)
guiMemoSetReadOnly(GUIEditor_Memo[2],true)
guiMemoSetReadOnly(GUIEditor_Memo[3],true)
guiMemoSetReadOnly(GUIEditor_Memo[4],true)
end


function onresourceStart ()
  bindKey ("F10", "down", showUserPanel)
  guiSetVisible (window, false)
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), onresourceStart)

function showUserPanel ()
getVisible = guiGetVisible (window)
playerName = getPlayerName ( getLocalPlayer() )
if (getVisible == true) then
	guiSetVisible (window, false)
	showCursor (false)
	playSound("open.wav")

end
if (getVisible == false) then
	guiSetVisible (window, true)
	showCursor (true)
	playSound("open.wav")
  	end
end