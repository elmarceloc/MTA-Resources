addEventHandler('onResourceStart', getResourceRootElement(getThisResource()),function(res)
    for i, acc in pairs(getAccounts()) do
        
        accName = getAccountName(acc)

        if isObjectInACLGroup ("user."..accName, aclGetGroup("Vip")) then
            setAccountData ( acc, "tank", '1' )
            setAccountData ( acc, "hydra", '1' )
            setAccountData ( acc, "weapons", '1' )
            setAccountData ( acc, "rocket", '1' )
            
            outputDebugString('vip de '.. accName .. ' RECARGADO CON EXITO')
        end
    end 
    
end)