return {
	'nvim-lualine/lualine.nvim',
	config = function ()
		local mode_map = {
			['NORMAL'] = 'N',
			['O-PENDING'] = 'N?',
			['INSERT'] = 'I',
			['VISUAL'] = 'V',
			['V-BLOCK'] = 'VB',
			['V-LINE'] = 'VL',
			['V-REPLACE'] = 'VR',
			['REPLACE'] = 'R',
			['COMMAND'] = '!',
			['SHELL'] = 'SH',
			['TERMINAL'] = 'T',
			['EX'] = 'X',
			['S-BLOCK'] = 'SB',
			['S-LINE'] = 'SL',
			['SELECT'] = 'S',
			['CONFIRM'] = 'Y?',
			['MORE'] = 'M',
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

		require('lualine').setup {
			options = {
				icons_enabled = true,
				theme = 'onedark',
				-- theme = 'tokyonight',
				component_separators = { left = '', right = ''},
				-- section_separators = { left = '', right = ''},
				-- component_separators = { left = '', right = ''},
				-- section_separators = { left = '', right = ''},
				-- component_separators = { left = '╲', right = '╱'},
				section_separators = { left = ' ', right = ' '},
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
			lualine_a = {{'mode', fmt = function(s) return '  ' ..  s end} },
			lualine_b = {'branch', 'diff', 'diagnostics'},
			lualine_c = {},
			lualine_x = {
				{
					require("noice").api.status.mode.get,
					cond = require("noice").api.status.mode.has,
					color = {link = "lualine_b_diff_added_insert"},
				},
				'searchcount',
				'selectioncount',
				-- tabs,
				'progress'
			},
			lualine_y = {'filetype'},
			lualine_z = {'location'}
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {'filename'},
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
		extensions = {'toggleterm', 'lazy','nvim-tree'}
	}
end
}
