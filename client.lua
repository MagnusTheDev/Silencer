Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1) 
        local player = GetPlayerPed(-1)
        local coord = GetEntityCoords(player)
        if GetDistanceBetweenCoords(YOURCOORDS, coord.x, coord.y, coord.z) < 2.0 then
             DrawText3Ds(YOURCOORDS, "~r~[E]~s~ Get a silencer on your deagle")
            if(IsControlJustReleased(1, 51))then   
                if GetSelectedPedWeapon(player) == GetHashKey("weapon_pistol50") then
                    GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_pistol50"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))
                end
            end
        end
    end
end)

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
  end
