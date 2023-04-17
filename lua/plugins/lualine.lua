return {
	'nvim-lualine/lualine.nvim',
	config = function ()
		require('lualine').setup {
			options = {
				icons_enabled = true,
				theme = 'ayu',
				component_separators = { left = '', right = ''},
				section_separators = { left = '', right = ''},
				-- component_separators = { left = '', right = ''},
				-- section_separators = { left = '', right = ''},
				-- component_separators = { left = '╲', right = '╱'},
				-- section_separators = { left = '', right = ' '},
				disabled_filetypes = {},
				always_divide_middle = true,
				globalstatus = true,
			},
			sections = {
				lualine_a = {'mode'},
				lualine_b = {'branch', 'diff', 'diagnostics'},
				lualine_c = {},
				lualine_x = {
					{
						require("noice").api.status.mode.get,
						cond = require("noice").api.status.mode.has,
						color = {link = "lualine_b_diff_added_insert"},
					},
					'searchcount',
					'filetype'
				},
				lualine_y = {'progress'},
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
			tabline = {},
			extensions = {'nvim-tree'}
		}
	end
}
