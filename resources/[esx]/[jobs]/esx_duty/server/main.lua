ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('duty:onoff')
AddEventHandler('duty:onoff', function(job)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.job.name
    local grade = xPlayer.job.grade
    
    if job == 'police' then
        xPlayer.setJob('off' ..job, grade)
        TriggerClientEvent('esx:showNotification', _source, _U('offduty'))
        TriggerEvent("esx_eden_garage:EnableSocietyGarage", "police", false)
        --exports.ft_libs:DisableArea("esx_eden_garage_area_police_mecanodeletepoint")
        --exports.ft_libs:DisableArea("esx_eden_garage_area_police_mecanospawnpoint")
    elseif job == 'ambulance' then
        xPlayer.setJob('off' ..job, grade)
        TriggerClientEvent('esx:showNotification', _source, _U('offduty'))
    elseif job == 'offpolice' then -- police on duty
        xPlayer.setJob('police', grade)
        TriggerClientEvent('esx:showNotification', _source, _U('onduty'))
        TriggerEvent("esx_eden_garage:EnableSocietyGarage", "police", true)
        --exports.ft_libs:EnableArea("esx_eden_garage_area_police_mecanodeletepoint")
        --exports.ft_libs:EnableArea("esx_eden_garage_area_police_mecanospawnpoint")
    elseif job == 'offambulance' then -- ambulance on duty
        xPlayer.setJob('ambulance', grade)
        TriggerClientEvent('esx:showNotification', _source, _U('onduty'))
    end

end)

---------------------------------
--- Copyright by ikNox#6088 ---
---------------------------------