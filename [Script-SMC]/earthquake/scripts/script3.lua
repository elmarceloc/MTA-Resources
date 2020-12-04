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
--Client
   
function loboinfinito (theplayer,attacker,weapon,bodypart)
cancelEvent()
end
addEventHandler("onClientPlayerDamage",getLocalPlayer(),loboinfinito)

function terremotobcd ()
	setTimer ( function()
      setElementDimension (inf, 5)
	end, 1100, 8 )
end
addEventHandler("onResourceStart", resourceRoot, terremotobcd)

function terraniaas ()
soundr = playSound("sounds/terrain.mp3", true)
setSoundVolume(soundr, 0.5) 
end
addEventHandler("onClientResourceStart",getResourceRootElement(getThisResource()),terraniaas)

function terraniaab ()
		 setSoundVolume(soundr,0)
         stopSound( soundr )
end
addEvent( "tb", true )
addEventHandler( "tb", localPlayer, terraniaab )

--===--
--FAST WOLFS ® All rights reserved, © Erik Ivan Aranda.
--Facebook: https://www.facebook.com/fastwolfs.fw/?fref=ts
--Page Official: http://fast-wolfs.xyz
--===--