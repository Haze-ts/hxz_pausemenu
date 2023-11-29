local ESX = GetResourceState('es_extended'):find('start') and exports['es_extended']:getSharedObject() or nil
local QBCore = GetResourceState('qb-core'):find('start') and exports['qb-core']:GetCoreObject() or nil
local NDCore = exports["ND_Core"]:GetCoreObject()


local PauseOpen = false
function DisableControl()
    while PauseOpen do
	    Wait(1)
        DisableControlAction(1, 200, true)
	end
end

RegisterKeyMapping('openpausemenu', 'Apri Pause Menu', 'KEYBOARD', 'ESCAPE')
RegisterCommand('openpausemenu', function()
    PauseOpen = true
    local invOpen = LocalPlayer.state.invOpen
    if not IsPauseMenuActive() and not invOpen then
        if ESX then
            ESX.TriggerServerCallback('hxz_getInfo', function(name, surname, date)
                TriggerScreenblurFadeIn(0)
                SetNuiFocus(true, true)
                SendNUIMessage({
                    action = "open",
                    name = name,
                    surname = surname,
                    date = date,
                    id = GetPlayerServerId(PlayerId())
                })
            end)
        elseif QBCore then
            QBCore.Functions.TriggerCallback('hxz_getInfo', function(name, surname, date)
                TriggerScreenblurFadeIn(0)
                SetNuiFocus(true, true)
                SendNUIMessage({
                    action = "open",
                    name = name,
                    surname = surname,
                    date = date,
                    id = GetPlayerServerId(PlayerId())
                })
            end)
        elseif NDCore then
            NDCore.callback('hxz_getInfo', function(name, surname, date)
                TriggerScreenblurFadeIn(0)
                SetNuiFocus(true, true)
                SendNUIMessage({
                    action = "open",
                    name = name,
                    surname = surname,
                    date = date,
                    id = GetPlayerServerId(PlayerId())
                })
            end)
        end
    end
    DisableControl()
end)


RegisterNUICallback('Close', function()
    PauseOpen = false
    Close()
end)

function Close()
    TriggerScreenblurFadeOut(0)
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = "close"
    })
end


RegisterNUICallback('PauseMenu', function(data)
  if data == 'impostazioni' then
    Close()
    ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_LANDING_MENU'),0,-1)
  elseif data == 'cambiapg' then
    Close()
    TriggerServerEvent('esx_multicharacter:relog')
  elseif data == 'mappa' then
    Close()
    Wait(100)
    ActivateFrontendMenu(-1171018317, 0, -1)
    while not IsFrontendReadyForControl() do
        Wait(10)
    end
    Wait(20)
    SetControlNormal(2, 201, 1.0)
  end
end)