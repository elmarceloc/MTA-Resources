gRoot    = getRootElement()
gResRoot = getResourceRootElement( getThisResource() )

addEventHandler("onClientResourceStart", gResRoot,
	function ()
		serverlogo = guiCreateStaticImage ( 0.007, 0.9, 0.100, 0.100, "logowlc.png", true )
	end
)

