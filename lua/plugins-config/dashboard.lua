local db = require('dashboard')
db.hide_statusline = false
db.hide_tabline = false

db.custom_center = {
	{icon = '  ',
	desc = 'Recently opened files                   ',
	action =  'DashboardFindHistory',
	shortcut = 'SPC f h'},
	{icon = '  ',
	desc = 'Find  File                              ',
	action = 'Telescope find_files find_command=rg,--hidden,--files',
	shortcut = 'SPC f f'},
	{icon = '  ',
	desc ='File Browser                            ',
	action =  'Telescope file_browser',
	shortcut = 'SPC f b'},
	{icon = '  ',
	desc = 'Find  word                              ',
	action = 'Telescope live_grep',
	shortcut = 'SPC f w'},
}
