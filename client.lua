local vehicles = {
    'ftanker',
    'enforcer'
}
local extraNumber = 1


Citizen.CreateThread(function()
    while true do 
        Wait(100)

        local player = PlayerPedId()

        if IsPedInAnyVehicle(player, false) then 
            local curVehicle = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(player, false)))

            for index,data in pairs(vehicles) do 
                if data == curVehicle then 

                    local veh = GetVehiclePedIsIn(player, false)
                    local vehVel = GetEntityVelocity(veh)
                    SetVehicleAutoRepairDisabled(veh, true)

                    if vehVel.x < -1 then 
                        SetVehicleExtra(veh, extraNumber, true)
                    else 
                        SetVehicleExtra(veh, extraNumber, false)
                    end
                end
            end 
        end
    end
end)

