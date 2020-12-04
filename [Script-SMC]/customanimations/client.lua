ifps = 10

local customIfp = nil 

function setPedCustomAnimation (ped,animation,tiempo,repetir,mover,interrumpible)
    if (type(animation) ~= "string" or type(tiempo) ~= "number" or type(repetir) ~= "boolean" or type(mover) ~= "boolean" or type(interrumpible) ~= "boolean") then return false end
    if isElement(ped) then
    
        for i = 1,ifps do
            setPedAnimation(ped, tostring(i), animation, tiempo, true, false, false) 
            if tiempo > 1 then
                setTimer(setPedAnimation,tiempo,1,ped,false)
                setTimer(setPedAnimation,tiempo+100,1,ped,false)
            end
        end

    end
end
addEvent("setPedCustomAnimation",true)
addEventHandler("setPedCustomAnimation",getRootElement(),setPedCustomAnimation)

addEventHandler("onClientResourceStart", resourceRoot,
    function ( startedRes )

        customIfp = engineLoadIFP ("1.ifp", "1")
        customIfp2 = engineLoadIFP ("2.ifp", "2")
        customIfp3 = engineLoadIFP ("3.ifp", "3")
        customIfp4 = engineLoadIFP ("4.ifp", "4")
        customIfp5 = engineLoadIFP ("5.ifp", "5")
        customIfp6 = engineLoadIFP ("6.ifp", "6")
        customIfp7 = engineLoadIFP ("7.ifp", "7")
        customIfp8 = engineLoadIFP ("8.ifp", "8")
        customIfp9 = engineLoadIFP ("9.ifp", "9")
        customIfp10 = engineLoadIFP ("10.ifp", "10")
    end
)