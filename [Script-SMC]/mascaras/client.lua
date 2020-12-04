maskTable = {}   
yelekTable = {} 

yelekTable["yelek1"] = {1922, 1, 90} 
yelekTable["yelek2"] = {1923, 1, 90} 
yelekTable["yelek3"] = {1924, 1, 90} 


maskTable["devil"] = {1512, 1, 90} 
maskTable["vendetta"] = {1455, 1, 90} 
maskTable["darth"] = {1484, 1, 90} 
maskTable["horse"] = {1485, 1, 90} 
maskTable["gasmask"] = {1487, 1, 90} 
maskTable["kovboy"] = {1543, 1, 90} 
maskTable["zombie"] = {1544, 1, 90} 
maskTable["vampire"] = {1666, 1, 90} 
maskTable["skull"] = {1667, 1, 90} 
maskTable["raccoon"] = {1668, 1, 180} 
maskTable["owl"] = {1950, 1, 180} 
maskTable["cat"] = {1951, 1, 180} 
maskTable["bag"] = {1551, 1, 90} 
maskTable["dog"] = {1546, 1, 90} 
maskTable["baby"] = {1669, 1, 90} 
maskTable["monster"] = {1853, 1, 90} 
maskTable["tilki"] = {1854, 1, 90} 
maskTable["admin"] = {1855, 1, 90} 
maske = {}
yelek = {}
obje = {}
mask = {}

function togglePanel()
	if not guiGetVisible(Panel) then
		aktivePanel(localPlayer)
		active = true
	else
		closePanel()
	end
end

function closePanel()
	showCursor(false)
	guiSetVisible(Panel, false)
end

function maskePanel()
	
local screenX, screenY = guiGetScreenSize()
Panel = guiCreateWindow ( 600 - 100, screenY/2 - 190, 700, 380, "Panel de Accesorios", false )
local Closeb = guiCreateButton( 645, 25, 50, 30, "X", false, Panel )
local tabPanel = guiCreateTabPanel ( 0, 0.1, 1, 1, true, Panel ) 
local tab1 = guiCreateTab( "Máscaras", tabPanel ) 
--local tab2 = guiCreateTab( "Chalecos", tabPanel ) 

--local yelek1 = guiCreateButton( 0.02, 0.06, 0.22, 0.15, "Chaleco 1", true, tab2 )
--local yelek2 = guiCreateButton( 0.02, 0.24, 0.22, 0.15, "Chaleco 2", true, tab2 )
--local yelek3 = guiCreateButton( 0.02, 0.42, 0.22, 0.15, "Chaleco 3", true, tab2 )

local mask1 = guiCreateButton( 0.02, 0.06, 0.22, 0.15, "Diablo", true, tab1 )
local mask2 = guiCreateButton( 0.02, 0.24, 0.22, 0.15, "Vendetta", true, tab1 )
local mask3 = guiCreateButton( 0.02, 0.42, 0.22, 0.15, "Darth Vader", true, tab1 )
local mask4 = guiCreateButton( 0.02, 0.60, 0.22, 0.15, "Mascara del steve", true, tab1 )
local mask5 = guiCreateButton( 0.02, 0.78, 0.22, 0.15, "Máscara de Gas", true, tab1 )

local mask6 = guiCreateButton( 0.26, 0.06, 0.22, 0.15, "Sombrero de vaquero", true, tab1 )
local mask7 = guiCreateButton( 0.26, 0.24, 0.22, 0.15, "Zombie", true, tab1 )
local mask8 = guiCreateButton( 0.26, 0.42, 0.22, 0.15, "Vampiro", true, tab1 )
local mask9 = guiCreateButton( 0.26, 0.60, 0.22, 0.15, "Calavera", true, tab1 )


local mask11 = guiCreateButton( 0.52, 0.06, 0.22, 0.15, "Mapache", true, tab1 )
local mask12 = guiCreateButton( 0.52, 0.24, 0.22, 0.15, "Búho", true, tab1 )
local mask13 = guiCreateButton( 0.52, 0.42, 0.22, 0.15, "Gato", true, tab1 )
local mask14 = guiCreateButton( 0.52, 0.60, 0.22, 0.15, "Bolsa de Papel", true, tab1 )


local mask16 = guiCreateButton( 0.76, 0.06, 0.22, 0.15, "Doge", true, tab1 )
local mask17 = guiCreateButton( 0.76, 0.24, 0.22, 0.15, "Bebé", true, tab1 )
local mask18 = guiCreateButton( 0.76, 0.42, 0.22, 0.15, "Monstruo", true, tab1 )
local mask19 = guiCreateButton( 0.76, 0.60, 0.22, 0.15, "Monstruo 2", true, tab1 )
local mask20 = guiCreateButton( 0.76, 0.78, 0.22, 0.15, "Admin", true, tab1 )

local maskekaldir = guiCreateButton( 0.28, 0.78, 0.44, 0.15, "Quitar Máscaras", true, tab1 )
--local yelekkaldir = guiCreateButton( 0.28, 0.78, 0.44, 0.15, "Quitar Chalecos", true, tab2 )

addEventHandler ( 'onClientGUIClick', root, 
	function ()		
		if ( source == Closeb ) then 
			showCursor(false)
			guiSetVisible(Panel, false)
		elseif ( source == maskekaldir) then
		
		triggerServerEvent("removemask", localPlayer)
		
		elseif ( source == yelekkaldir) then
		
		triggerServerEvent("removeyelek", localPlayer)
		elseif ( source == mask1) then
		if maske[localPlayer] == "Diablo" then outputChatBox("" .. maske[localPlayer] .. " ya está seleccionado/a", 0, 255, 255) return end
		local devil = "devil"
			triggerServerEvent( "setmask", localPlayer, "devil") 
			maske[localPlayer] = "Diablo"
			mask[localPlayer] = "devil"
		elseif ( source == mask2) then
		if maske[localPlayer] == "Vendetta" then outputChatBox("" .. maske[localPlayer] .. " ya está seleccionado/a", 0, 255, 255) return end
			triggerServerEvent( "setmask", localPlayer, "vendetta") 
			maske[localPlayer] = "Vendetta"
			mask[localPlayer] = "vendetta"
		elseif ( source == mask3) then
		if maske[localPlayer] == "Darth Vader" then outputChatBox("" .. maske[localPlayer] .. " ya está seleccionado/a", 0, 255, 255) return end
			triggerServerEvent( "setmask", localPlayer, "darth") 
			maske[localPlayer] = "Darth Vader"
			mask[localPlayer] = "darth"
		elseif ( source == mask4) then
		if maske[localPlayer] == "Boina militar" then outputChatBox("" .. maske[localPlayer] .. " ya está seleccionado/a", 0, 255, 255) return end
			triggerServerEvent( "setmask", localPlayer, "horse") 
			maske[localPlayer] = "Boina militar"
			mask[localPlayer] = "horse"
       		elseif ( source == mask5) then
		if maske[localPlayer] == "Máscara de gas" then outputChatBox("" .. maske[localPlayer] .. " ya está seleccionado/a", 0, 255, 255) return end
			triggerServerEvent( "setmask", localPlayer, "gasmask") 
			maske[localPlayer] = "Máscara de gas"
			mask[localPlayer] = "gasmask"
          		elseif ( source == mask6) then
		if maske[localPlayer] == "Sombrero de vaquero" then outputChatBox("" .. maske[localPlayer] .. " ya está seleccionado/a", 0, 255, 255) return end
			triggerServerEvent( "setmask", localPlayer, "kovboy") 
			maske[localPlayer] = "Sombrero de vaquero"
			mask[localPlayer] = "kovboy"
             		elseif ( source == mask7) then
		if maske[localPlayer] == "Zombie" then outputChatBox("" .. maske[localPlayer] .. " ya está seleccionado/a", 0, 255, 255) return end
			triggerServerEvent( "setmask", localPlayer, "zombie") 
			maske[localPlayer] = "Zombie"
			mask[localPlayer] = "zombie"
			             		elseif ( source == mask8) then
		if maske[localPlayer] == "Vampiro" then outputChatBox("" .. maske[localPlayer] .. " ya está seleccionado/a", 0, 255, 255) return end
			triggerServerEvent( "setmask", localPlayer, "vampire") 
			maske[localPlayer] = "Vampiro"
			mask[localPlayer] = "vampire"
						             		elseif ( source == mask9) then
		if maske[localPlayer] == "Calavera" then outputChatBox("" .. maske[localPlayer] .. " ya está seleccionado/a", 0, 255, 255) return end
			triggerServerEvent( "setmask", localPlayer, "skull") 
			maske[localPlayer] = "Calavera"
			mask[localPlayer] = "skull"
								             		elseif ( source == mask11) then
		if maske[localPlayer] == "Mapache" then outputChatBox("" .. maske[localPlayer] .. " ya está seleccionado/a", 0, 255, 255) return end
			triggerServerEvent( "setmask", localPlayer, "raccoon") 
			maske[localPlayer] = "Mapache"
			mask[localPlayer] = "raccoon"									             		
			elseif ( source == mask12) then
		if maske[localPlayer] == "Búho" then outputChatBox("" .. maske[localPlayer] .. " ya está seleccionado/a", 0, 255, 255) return end
			triggerServerEvent( "setmask", localPlayer, "owl") 
			maske[localPlayer] = "Búho"
			mask[localPlayer] = "owl"	
						elseif ( source == mask13) then
		if maske[localPlayer] == "Gato" then outputChatBox("" .. maske[localPlayer] .. " ya está seleccionado/a", 0, 255, 255) return end
			triggerServerEvent( "setmask", localPlayer, "cat") 
			maske[localPlayer] = "Gato"
			mask[localPlayer] = "cat"							
			elseif ( source == mask14) then
		if maske[localPlayer] == "Bolsa de Papel" then outputChatBox("" .. maske[localPlayer] .. " ya está seleccionado/a", 0, 255, 255) return end
			triggerServerEvent( "setmask", localPlayer, "bag") 
			maske[localPlayer] = "Bolsa de Papel"
			mask[localPlayer] = "bag"	
			elseif ( source == mask16) then
		if maske[localPlayer] == "Perro" then outputChatBox("" .. maske[localPlayer] .. " ya está seleccionado/a", 0, 255, 255) return end
			triggerServerEvent( "setmask", localPlayer, "dog") 
			maske[localPlayer] = "Perro"
			mask[localPlayer] = "dog"			
			elseif ( source == mask17) then
		if maske[localPlayer] == "Bebé" then outputChatBox("" .. maske[localPlayer] .. " ya está seleccionado/a", 0, 255, 255) return end
			triggerServerEvent( "setmask", localPlayer, "baby") 
			maske[localPlayer] = "Bebé"
			mask[localPlayer] = "baby"				
			elseif ( source == mask18) then
		if maske[localPlayer] == "Monstruo" then outputChatBox("" .. maske[localPlayer] .. " ya está seleccionado/a", 0, 255, 255) return end
			triggerServerEvent( "setmask", localPlayer, "monster") 
			maske[localPlayer] = "Monstruo"
			mask[localPlayer] = "monster"				
			elseif ( source == mask19) then
		if maske[localPlayer] == "Monstruo 2" then outputChatBox("" .. maske[localPlayer] .. " ya está seleccionado/a", 0, 255, 255) return end
			triggerServerEvent( "setmask", localPlayer, "tilki") 
			maske[localPlayer] = "Monstruo 2"
			mask[localPlayer] = "tilki"			
			elseif ( source == mask20) then
		if maske[localPlayer] == "Admin" then return end
			triggerServerEvent( "setmask", localPlayer, "admin") 
			maske[localPlayer] = "Admin"
			mask[localPlayer] = "admin"	
			elseif ( source == yelek1) then


		if yelek[localPlayer] == "Chaleco 1" then outputChatBox("" .. yelek[localPlayer] .. " ya está seleccionado/a", 0, 255, 255) return end
			triggerServerEvent( "setyelek", localPlayer, "yelek1") 
			yelek[localPlayer] = "Chaleco 1"				
			elseif ( source == yelek2) then
		if yelek[localPlayer] == "Chaleco 2" then outputChatBox("" .. yelek[localPlayer] .. " ya está seleccionado/a", 0, 255, 255) return end
			triggerServerEvent( "setyelek", localPlayer, "yelek2") 
			yelek[localPlayer] = "Chaleco 2"				
			elseif ( source == yelek3) then
		if yelek[localPlayer] == "Chaleco 3" then outputChatBox("" .. yelek[localPlayer] .. " ya está seleccionado/a", 0, 255, 255) return end
			triggerServerEvent( "setyelek", localPlayer, "yelek3") 
			yelek[localPlayer] = "Chaleco 3"	

   end
	end
) 


end

function updateMask()
	if mask[localPlayer] == nil then return end
	triggerServerEvent( "setsize", localPlayer) 
end


function aktivePanel( playerSource )
	if playerSource then 

		maskePanel()

		if not isCursorShowing () then               
			showCursor(true)
		end

	end
end
addCommandHandler("mascaras", aktivePanel)

function importqqqures2()
	mask_devil_txt = engineLoadTXD ( "object/mask_devil.txd" ) 
		engineImportTXD ( mask_devil_txt, 1512 )
	mask_devil_dff = engineLoadDFF ( "object/mask_devil.dff", 0 )
	engineReplaceModel ( mask_devil_dff, 1512 )
	engineSetModelLODDistance(1512, 2000)
	
	mask_guyfawkes_txt = engineLoadTXD ( "object/mask_guyfawkes.txd" ) 
	engineImportTXD ( mask_guyfawkes_txt, 1455 )
	mask_guyfawkes_dff = engineLoadDFF ( "object/mask_guyfawkes.dff", 0 )
	engineReplaceModel ( mask_guyfawkes_dff, 1455 )
	engineSetModelLODDistance(1455, 2000)
	
	mask_darthvader_txt = engineLoadTXD ( "object/mask_darthvader.txd" ) 
	engineImportTXD ( mask_darthvader_txt, 1484 )
	mask_darthvader_dff = engineLoadDFF ( "object/mask_darthvader.dff", 0 )
	engineReplaceModel ( mask_darthvader_dff, 1484 )
	engineSetModelLODDistance(1484, 2000)
	
	mask_terrorist_txt = engineLoadTXD ( "object/bordobereli.txd" ) 
	engineImportTXD ( mask_terrorist_txt, 1485 )
	mask_terrorist_dff = engineLoadDFF ( "object/bordobereli.dff", 0 )
	engineReplaceModel ( mask_terrorist_dff, 1485 )
	engineSetModelLODDistance(1485, 2000)
	
	mask_gas_txt = engineLoadTXD ( "object/mask_gas.txd" ) 
	engineImportTXD ( mask_gas_txt, 1487 )
	mask_gas_dff = engineLoadDFF ( "object/mask_gas.dff", 0 )
	engineReplaceModel ( mask_gas_dff, 1487 )
	engineSetModelLODDistance(1487, 2000)
	
	hat_cowboy_txt = engineLoadTXD ( "object/hat_cowboy.txd" ) 
	engineImportTXD ( hat_cowboy_txt, 1543 )
	hat_cowboy_dff = engineLoadDFF ( "object/hat_cowboy.dff", 0 )
	engineReplaceModel ( hat_cowboy_dff, 1543 )
	engineSetModelLODDistance(1543, 2000)
	
	celikyelek_txt = engineLoadTXD ( "object/celikyelek.txd" ) 
	engineImportTXD ( celikyelek_txt, 1922 )
	celikyelek_dff = engineLoadDFF ( "object/celikyelek.dff", 0 )
	engineReplaceModel ( celikyelek_dff, 1922 )
	engineSetModelLODDistance(1922, 2000)
	
	celikyelek2_txt = engineLoadTXD ( "object/celikyelek2.txd" ) 
	engineImportTXD ( celikyelek2_txt, 1923 )
	celikyelek2_dff = engineLoadDFF ( "object/celikyelek2.dff", 0 )
	engineReplaceModel ( celikyelek2_dff, 1923 )
	engineSetModelLODDistance(1923, 2000)
	
	celikyelek3_txt = engineLoadTXD ( "object/celikyelek3.txd" ) 
	engineImportTXD ( celikyelek3_txt, 1924 )
	celikyelek3_dff = engineLoadDFF ( "object/celikyelek3.dff", 0 )
	engineReplaceModel ( celikyelek3_dff, 1924 )
	engineSetModelLODDistance(1924, 2000)
	
	mask_zombie_txt = engineLoadTXD ( "object/mask_zombie.txd" ) 
	engineImportTXD ( mask_zombie_txt, 1544 )
	mask_zombie_dff = engineLoadDFF ( "object/mask_zombie.dff", 0 )
	engineReplaceModel ( mask_zombie_dff, 1544 )
	engineSetModelLODDistance(1544, 2000)
	
	mask_vampire_txt = engineLoadTXD ( "object/mask_vampire.txd" ) 
	engineImportTXD ( mask_vampire_txt, 1666 )
	mask_vampire_dff = engineLoadDFF ( "object/mask_vampire.dff", 0 )
	engineReplaceModel ( mask_vampire_dff, 1666 )
	engineSetModelLODDistance(1666, 2000)
	
	mask_skull_txt = engineLoadTXD ( "object/mask_skull.txd" ) 
	engineImportTXD ( mask_skull_txt, 1667 )
	mask_skull_dff = engineLoadDFF ( "object/mask_skull.dff", 0 )
	engineReplaceModel ( mask_skull_dff, 1667 )
	engineSetModelLODDistance(1667, 2000)
	
	mask_raccoon_txt = engineLoadTXD ( "object/mask_raccoon.txd" ) 
	engineImportTXD ( mask_raccoon_txt, 1668 )
	mask_raccoon_dff = engineLoadDFF ( "object/mask_raccoon.dff", 0 )
	engineReplaceModel ( mask_raccoon_dff, 1668 )
	engineSetModelLODDistance(1668, 2000)	
	
	mask_owl_txt = engineLoadTXD ( "object/mask_owl.txd" ) 
	engineImportTXD ( mask_owl_txt, 1950 )
	mask_owl_dff = engineLoadDFF ( "object/mask_owl.dff", 0 )
	engineReplaceModel ( mask_owl_dff, 1950 )
	engineSetModelLODDistance(1950, 2000)
	
	mask_cat_txt = engineLoadTXD ( "object/mask_cat.txd" ) 
	engineImportTXD ( mask_cat_txt, 1951 )
	mask_cat_dff = engineLoadDFF ( "object/mask_cat.dff", 0 )
	engineReplaceModel ( mask_cat_dff, 1951 )
	engineSetModelLODDistance(1951, 2000)		
	
	mask_bag_txt = engineLoadTXD ( "object/mask_bag.txd" ) 
	engineImportTXD ( mask_bag_txt, 1551 )
	mask_bag_dff = engineLoadDFF ( "object/mask_bag.dff", 0 )
	engineReplaceModel ( mask_bag_dff, 1551 )
	engineSetModelLODDistance(1551, 2000)	
	
	mask_dog_txt = engineLoadTXD ( "object/mask_dog.txd" ) 
	engineImportTXD ( mask_dog_txt, 1546 )
	mask_dog_dff = engineLoadDFF ( "object/mask_dog.dff", 0 )
	engineReplaceModel ( mask_dog_dff, 1546 )
	engineSetModelLODDistance(1546, 2000)	
	
	mask_baby_txt = engineLoadTXD ( "object/mask_baby.txd" ) 
	engineImportTXD ( mask_baby_txt, 1669 )
	mask_baby_dff = engineLoadDFF ( "object/mask_baby.dff", 0 )
	engineReplaceModel ( mask_baby_dff, 1669 )
	engineSetModelLODDistance(1669, 2000)	
	
	mask_monster_txt = engineLoadTXD ( "object/mask_monster.txd" ) 
	engineImportTXD ( mask_monster_txt, 1853 )
	mask_monster_dff = engineLoadDFF ( "object/mask_monster.dff", 0 )
	engineReplaceModel ( mask_monster_dff, 1853 )
	engineSetModelLODDistance(1853, 2000)	
	
	hat_airborne_txt = engineLoadTXD ( "object/mask_alien.txd" ) 
	engineImportTXD ( hat_airborne_txt, 1854 )
	hat_airborne_dff = engineLoadDFF ( "object/mask_alien.dff", 0 ) 
	engineReplaceModel ( hat_airborne_dff, 1854 )
	engineSetModelLODDistance(1854, 2000)
	
	admin_txt = engineLoadTXD ( "object/admin.txd" ) 
	engineImportTXD ( admin_txt, 1855 )
	admin_dff = engineLoadDFF ( "object/admin.dff", 0 ) 
	engineReplaceModel ( admin_dff, 1855 )
	engineSetModelLODDistance(1855, 2000)
	
	kevlar_txt = engineLoadTXD ( "askeri/askeri.txd" ) 
	engineImportTXD ( kevlar_txt, 1856 )
	kevlar_dff = engineLoadDFF ( "askeri/askeri.dff", 0 ) 
	engineReplaceModel ( kevlar_dff, 1856 )
	engineSetModelLODDistance(1856, 2000)
end

setTimer ( importqqqures2, 1000, 1)

addEventHandler("onClientResourceStop", getResourceRootElement(getThisResource()),
	function()
		engineRestoreModel(1512)
		destroyElement(mask_devil_txt)
		destroyElement(mask_devil_dff)
		
		engineRestoreModel(1856)
		destroyElement(kevlar_txt)
		destroyElement(kevlar_dff)
		
		engineRestoreModel(1855)
		destroyElement(admin_txt)
		destroyElement(admin_dff)
		
		engineRestoreModel(1854)
		destroyElement(hat_airborne_txt)
		destroyElement(hat_airborne_dff)
		
		engineRestoreModel(1853)
		destroyElement(mask_monster_txt)
		destroyElement(mask_monster_dff)
		
		engineRestoreModel(1669)
		destroyElement(mask_baby_txt)
		destroyElement(mask_baby_dff)
		
		engineRestoreModel(1546)
		destroyElement(mask_dog_txt)
		destroyElement(mask_dog_dff)	
		
		engineRestoreModel(1551)
		destroyElement(mask_bag_txt)
		destroyElement(mask_bag_dff)	
		
		engineRestoreModel(1924)
		destroyElement(celikyelek3_txt)
		destroyElement(celikyelek3_dff)	
		
		engineRestoreModel(1923)
		destroyElement(celikyelek2_txt)
		destroyElement(celikyelek2_dff)	
		
		engineRestoreModel(1922)
		destroyElement(celikyelek_txt)
		destroyElement(celikyelek_dff)		
		
		engineRestoreModel(1951)
		destroyElement(mask_cat_txt)
		destroyElement(mask_cat_dff)	
		
		engineRestoreModel(1950)
		destroyElement(mask_owl_txt)
		destroyElement(mask_owl_dff)	
		
		engineRestoreModel(1668)
		destroyElement(mask_raccoon_txt)
		destroyElement(mask_raccoon_dff)		
		
		engineRestoreModel(1666)
		destroyElement(mask_vampire_txt)
		destroyElement(mask_vampire_dff)		
		
		engineRestoreModel(1667)
		destroyElement(mask_skull_txt)
		destroyElement(mask_skull_dff)		
		
		engineRestoreModel(1455)
		destroyElement(mask_guyfawkes_txt)
		destroyElement(mask_guyfawkes_dff)
		
		engineRestoreModel(1484)
		destroyElement(mask_darthvader_txt)
		destroyElement(mask_darthvader_dff)		
		
		engineRestoreModel(1485)
		destroyElement(mask_terrorist_txt)
		destroyElement(mask_terrorist_dff)
		
		engineRestoreModel(1487)
		destroyElement(mask_gas_txt)
		destroyElement(mask_gas_dff)		
		
		engineRestoreModel(1543)
		destroyElement(hat_cowboy_txt)
		destroyElement(hat_cowboy_dff)		
		
		engineRestoreModel(1544)
		destroyElement(mask_zombie_txt)
		destroyElement(mask_zombie_dff)
	end
)




