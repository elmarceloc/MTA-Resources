function pedNfale ( ) 
    local AllPeds = getElementsByType ( "ped" ) 
    for _, ped in ipairs ( AllPeds ) do 
        setPedVoice ( ped, "PED_TYPE_DISABLED" ) 
    end 
end 
addEventHandler ( "onClientResourceStart", resourceRoot, pedNfale ) 