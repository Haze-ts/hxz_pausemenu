fx_version 'adamant'
game 'gta5'

author 'Haze-ts'
version '1.0'

client_scripts{
    'client.lua'
}

server_scripts{
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

ui_page 'web/index.html'

files{
	'web/*.*',
    'web/img/*.*'
}