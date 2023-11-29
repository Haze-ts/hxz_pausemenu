local ESX = GetResourceState('es_extended'):find('start') and exports['es_extended']:getSharedObject() or nil
local QBCore = GetResourceState('qb-core'):find('start') and exports['qb-core']:GetCoreObject() or nil
local NDCore = GetResourceState('ND_Core'):find('start') and exports["ND_Core"]:GetCoreObject() or nil

if ESX then
    ESX.RegisterServerCallback('hxz_getInfo', function(source, cb)
        local xPlayer = ESX.GetPlayerFromId(source)
        local data = os.date("%d/%m/%y")
        print(xPlayer.variables.firstName, xPlayer.variables.lastName, data)

        cb(xPlayer.variables.firstName, xPlayer.variables.lastName, data)
    end)
elseif QBCore then
    QBCore.Functions.CreateCallback('hxz_getInfo', function(source, cb)
        local xPlayer = QBCore.Functions.GetPlayer(source)
        local data = os.date("%d/%m/%y")
        cb(xPlayer.PlayerData.charinfo.firstname, xPlayer.PlayerData.charinfo.lastname, data)
    end)
elseif NDCore then
    local characters = NDCore.Functions.GetPlayerCharacters(source)
    for id, data in pairs(characters) do
        print(data.firstName, data.lastName)
    end
end