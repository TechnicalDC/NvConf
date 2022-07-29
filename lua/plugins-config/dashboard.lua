local db = require('dashboard')
db.hide_statusline = false
db.hide_tabline = false
db.custom_header = {
	"",
	"                                             o8o                     ",
	"                                             `\"'                     ",
	"ooo. .oo.    .ooooo.   .ooooo.  oooo    ooo oooo  ooo. .oo.  .oo.    ",
	"`888P\"Y88b  d88' `88b d88' `88b  `88.  .8'  `888  `888P\"Y88bP\"Y88b			",
	" 888   888  888ooo888 888   888   `88..8'    888   888   888   888   ",
	" 888   888  888    .o 888   888    `888'     888   888   888   888   ",
	"o888o o888o `Y8bod8P' `Y8bod8P'     `8'     o888o o888o o888o o888o  ",
	"                                                                     ",
	"                                                                     ",
}

db.custom_center = {
	{
		icon = '📁  ',
		desc = 'Recently opened files                   ',
		shortcut = 'SPC f h'
	},
	{
		icon = '📄  ',
		desc = 'Find  File                              ',
		shortcut = 'SPC f f'
	},
	{
		icon = '📄  ',
		desc = 'Open new file                           ',
		shortcut = 'SPC c n'
	},
	{
		icon = '🎨  ',
		desc = 'Change colorsheme                       ',
		shortcut = 'SPC c c'
	},
}



