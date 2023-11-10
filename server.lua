ESX.RegisterServerCallback('hxz_getInfo', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    MySQL.Async.fetchAll('SELECT firstname, lastname, sex FROM users WHERE identifier = ?', {identifier},
	function(result)
        local data = os.date("%d/%m/%y")
        cb(result[1].firstname, result[1].lastname, result[1].sex, data)
	end)
end)