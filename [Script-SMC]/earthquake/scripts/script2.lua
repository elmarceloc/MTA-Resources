--=========================================================================--
--       _________   ___________   _       ______  __    ___________       --
--      / ____/   | / ___/_  __/  | |     / / __ \/ /   / ____/ ___/       --
--     / /_  / /| | \__ \ / /     | | /| / / / / / /   / /_   \__ \        --
--    / __/ / ___ |___/ // /      | |/ |/ / /_/ / /___/ __/  ___/ /        --
--   /_/   /_/  |_/____//_/       |__/|__/\____/_____/_/    /____/         --
--=========================================================================--


--Include resoures download please
--DON'T EDIT/COPY/SEND/SELL PLEASE  (but commands and text yes)
--onResourceStart 
--02
--Server

--Earthquake move camera:
      -- luego introducir el SFX de earthquake Y Luego el output chat
      -- se puede introducir el texto como de robot como el de game de comdotgame y que diga alert, system

function terremoto()
		 outputChatBox(" ")     
	   outputChatBox("#FF0000¡UN TERREMOTO  #0000FFCTM!", getRootElement(), 255, 255, 255, true )   
		 outputChatBox(" ")
     outputChatBox(" ")
end
addEventHandler("onResourceStart", resourceRoot, terremoto)

function news()
    outputChatBox(" ")
    outputChatBox("#00FF00[PELIGRO] #FF0000AFIRMATE CTM", getRootElement(), 255, 255, 255, true )   
	  outputChatBox(" ")
	 	setTimer ( function()
	             triggerClientEvent ( "terremotob", getRootElement() )
	end, 1000, 42 )
      setTimer ( function()
      setGravity ( tonumber(0.008) )
	end, 42000, 1 )
end
addEventHandler("onResourceStart", resourceRoot, news)


function finished ()
	  setTimer ( function()
      outputChatBox(" ")
            outputChatBox(" ")
                  outputChatBox(" ")
                        outputChatBox(" ")
                              outputChatBox(" ")
      outputChatBox("Ya paro, #0000FFpero de que estuvo bueno, #FF0000estuvo bueno", getRootElement(), 255, 255, 255, true )   
      outputChatBox(" ")
      triggerClientEvent ( "tb", getRootElement() )
	  	end, 42500, 1 )
end
addEventHandler("onResourceStart", resourceRoot, finished)

function finished ()
setTimer ( function()
triggerClientEvent ( "gravstoppe", getRootElement() )
end, 1100, 38 )
setTimer ( function()
triggerClientEvent ( "grae", getRootElement() )
end, 1300, 39 )
setTimer ( function()
triggerClientEvent ( "gravstopp", getRootElement() )
triggerClientEvent ( "stp", getRootElement() )
end, 43500, 1 )
end
addEventHandler("onResourceStart", resourceRoot, finished)

function SFXX ( source, key )
--SFX
end
addEventHandler("onResourceStart", resourceRoot, SFXX)

function stoped ()
setGravity ( tonumber(0.008) )
setGravity ( tonumber(0.009) )
setGravity ( tonumber(0.008) )
stopResource(getResourceFromName("earthquake")) --Thanks MrTasty.
end
addEvent ( "stope", true)
addEventHandler ( "stope", getRootElement(), stoped )

--===--
--FAST WOLFS ® All rights reserved, © Erik Ivan Aranda.
--Facebook: https://www.facebook.com/fastwolfs.fw/?fref=ts
--Page Official: http://fast-wolfs.xyz
--===--