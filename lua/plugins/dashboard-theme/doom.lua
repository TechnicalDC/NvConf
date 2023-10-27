local header_collection = require('plugins.dashboard-theme.headers')
return {
	theme = 'doom',
	config = {
		header = header_collection.dash,
		center = {
			{
				icon = ' ',
				icon_hl = 'Title',
				desc = 'Find File           ',
				desc_hl = 'String',
				key = 'b',
				keymap = 'SPC f f',
				key_hl = 'Number',
				key_format = ' %s', -- remove default surrounding `[]`
				action = 'lua print(2)'
			},
			{
				icon = ' ',
				desc = 'Find Dotfiles',
				key = 'f',
				keymap = 'SPC f d',
				key_format = ' %s', -- remove default surrounding `[]`
				action = 'lua print(3)'
			},
		},
		footer = {}  --your footer
	}
}
