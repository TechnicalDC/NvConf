return {
	'nvimdev/dashboard-nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	enabled = true,
	config = function()

		local header_collection = {}
		local limit = 10

		header_collection.default = {
			"                                                    ",
			" ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			" ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			" ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			" ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			" ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			" ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			"                                                    ",
		}

		header_collection.dash = {
			" ",
			"▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄",
			"█	           ▄ ▄                    █",
			"█	       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄      █",
			"█	       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █      █",
			"█	    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █      █",
			"█	  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄   █",
			"█	  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄ █",
			"█	▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █ █",
			"█	█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █ █",
			"█	    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█     █",
			"█▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█",
			" "
		}

		header_collection.neovim_mini1 = {
			"",
			"",
			" _______             ____   ____.__         ",
			" \\      \\   ____  ___\\   \\ /   /|__| _____  ",
			" /   |   \\_/ __ \\/  _ \\   Y   / |  |/     \\ ",
			"/    |    \\  ___(  <_> )     /  |  |  Y Y  \\",
			"\\____|__  /\\___  >____/ \\___/   |__|__|_|  /",
			"        \\/     \\/                        \\/ ",
			"",

		}
		header_collection.neovim_mini2 = {
			"                          __           ",
			" .-----.-----.-----.--.--|__|--------. ",
			" |     |  -__|  _  |  |  |  |        | ",
			" |__|__|_____|_____|\\___/|__|__|__|__| ",
			""
		}
		require('dashboard').setup {
			theme = 'hyper',
			change_to_vcs_root = true,
			hide = {
				statusline = true,    -- hide statusline default is true
				tabline = true,      -- hide the tabline
				winbar  = true,      -- hide winbar
			},
			config = {
				header = header_collection.dash,
				week_header = {
					enable = true,
				},
				packages = { enable = false }, -- show how many plugins neovim loaded
				project = {
					enable = true,
					limit = 8,
					icon = ' ',
					group = '@function',
					label = 'Projects',
					action = 'Telescope find_files cwd='
				},
				mru = {
					limit = limit,
					icon = ' ',
					label = 'Recent (Last ' .. tostring(limit) .. ' files)',
				},
				shortcut = {
					{
						icon = ' ',
						desc = 'New file',
						group = 'DiagnosticOk',
						action = 'ene',
						key = 'e'
					},
					{
						icon = ' ',
						desc = 'Open notes',
						group = 'DiagnosticWarn',
						action = 'Neorg index',
						key = 'n'
					},
					{
						icon = ' ',
						desc = 'Files',
						group = 'DiagnosticInfo',
						action = 'Telescope find_files',
						key = 'f',
					},
					{
						icon = ' ',
						desc = 'Words',
						group = 'DiagnosticWarn',
						action = 'Telescope live_grep',
						key = 'g',
					},
					{
						icon = ' ',
						desc = 'Todo',
						group = 'DiagnosticOk',
						action = 'TodoTelescope',
						key = 't',
					},
					{ desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
					{ icon = ' ', desc = 'Quit', group = 'DiagnosticError', action = 'qa', key = 'q' },
				},
			},
		}
	end,
}
