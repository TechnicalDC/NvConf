return {
	'nvim-lualine/lualine.nvim',
	config = function ()
		local default_icon = '  '
		local mode_map = {
			['NORMAL'] = '  ',
			['O-PENDING'] = '  ',
			['INSERT'] = '  ',
			['VISUAL'] = '  ',
			['V-BLOCK'] = '  ',
			['V-LINE'] = '  ',
			['V-REPLACE'] = '  ',
			['REPLACE'] = '  ',
			['COMMAND'] = '  ',
			['SHELL'] = '  ',
			['TERMINAL'] = '  ',
			['EX'] = '  ',
			['S-BLOCK'] = '  ',
			['S-LINE'] = '  ',
			['SELECT'] = '  ',
			['CONFIRM'] = '  ',
			['MORE'] = '  ',
		}

		local mode = {
			'mode',
			fmt = function(s)
				local icon = default_icon
				return icon .. s
			end
		}

		local tabs = {
			'tabs',
			mode = 0,
			tabs_color = {
				-- Same values as the general color option can be used here.
				active = 'lualine_a_normal',     -- Color for active tab.
				inactive = 'lualine_b_normal', -- Color for inactive tab.
			},
		}

		local diagnostics = {
			'diagnostics',
			symbols = {error = ' ', warn = ' ', info = ' ', hint = '󰌵 '},
			colored = true,           -- Displays diagnostics status in color if set to true.
			update_in_insert = false, -- Update diagnostics in insert mode.
			always_visible = false,   -- Show diagnostics even if there are none.
		}

		local filetype = {
			'filetype',
			colored = true,   -- Displays filetype icon in color if set to true
			icon_only = false, -- Display only an icon for filetype
			icon = { align = 'left' }, -- Display filetype icon on the right hand side
			-- icon =    {'X', align='right'}
			-- Icon string ^ in table is ignored in filetype component
		}

		local diff = {
			'diff',
			colored = true, -- Displays a colored diff status if set to true
			symbols = {added = ' ', modified = ' ', removed = ' '}, -- Changes the symbols used by the diff.
			source = nil, -- A function that works as a data source for diff.
		}

	local filename = {
		'filename',
		file_status = true,      -- Displays file status (readonly status, modified status)
		newfile_status = false,  -- Display new file status (new file means no write after created)
		path = 0,                -- 0: Just the filename
		-- 1: Relative path
		-- 2: Absolute path
		-- 3: Absolute path, with tilde as the home directory
		-- 4: Filename and parent dir, with tilde as the home directory

		shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
		-- for other components. (terrible name, any suggestions?)
		symbols = {
			modified = '󰏫 ',      -- Text to show when the file is modified.
			readonly = ' ',      -- Text to show when the file is non-modifiable or readonly.
			unnamed = ' [Untitled]', -- Text to show for unnamed buffers.
			newfile = ' [New]',     -- Text to show for newly created file before first write
		}
	}

	local help = { sections = { lualine_a = { {'filetype', colored = false}} }, filetypes = {'help'} }
	local alpha = {
		sections = {
			lualine_a = {
				mode
			},
			lualine_b = {
				'branch'
			},
			lualine_z = { 'hostname' }
		},
		filetypes = {'alpha'}
	}

	require('lualine').setup {
		options = {
			icons_enabled = true,
			theme = 'onedark',
			-- theme = 'tokyonight',
			component_separators = { left = '•', right = '•'},
			section_separators = { left = ' ', right = ' '},
			disabled_filetypes = {},
			always_divide_middle = true,
			globalstatus = true,
			refresh = {                  -- sets how often lualine should refresh it's contents (in ms)
			statusline = 1000,         -- The refresh option sets minimum time that lualine tries
			tabline = 1000,            -- to maintain between refresh. It's not guarantied if situation
			winbar = 1000              -- arises that lualine needs to refresh itself before this time
		}
	},
	sections = {
		lualine_a = { mode },
		lualine_b = {'branch', diff, diagnostics},
		lualine_c = { filename },
		lualine_x = {
			{
				require("noice").api.status.mode.get,
				cond = require("noice").api.status.mode.has,
				color = {link = "lualine_b_diff_added_insert"},
			},
			'searchcount',
			'selectioncount',
			'progress'
		},
		lualine_y = { filetype },
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {filename},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {
		-- lualine_a = {
			-- 	{
				-- 		'buffers',
				-- 		symbols = {
					-- 			modified = ' ●',      -- Text to show when the buffer is modified
					-- 			alternate_file = '', -- Text to show to identify the alternate file
					-- 			directory =  '',     -- Text to show when the buffer is a directory
					-- 		},
					-- 	}
					-- },
					-- lualine_b = {'branch'},
					-- lualine_c = {},
					-- lualine_x = {},
					-- lualine_y = {},
					-- lualine_z = {tabs}
				},
				winbar = {},
				extensions = {'toggleterm', 'lazy','nvim-tree', help, alpha}
			}
		end
	}
