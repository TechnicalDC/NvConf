return {
	'romgrk/barbar.nvim',
	enabled = true,
	dependencies = {
		'kyazdani42/nvim-web-devicons'
	},
	config = function ()
		require'barbar'.setup {
			animation = true,
			auto_hide = false,

			-- Enable/disable current/total tabpages indicator (top right corner)
			tabpages = true,

			clickable = true,

			-- Excludes buffers from the tabline
			exclude_ft = {'javascript'},
			exclude_name = {'package.json'},

			-- A buffer to this direction will be focused (if it exists) when closing the current buffer.
			-- Valid options are 'left' (the default) and 'right'
			focus_on_close = 'left',

			-- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
			hide = {extensions = false, inactive = true},

			-- Disable highlighting alternate buffers
			highlight_alternate = true,

			-- Disable highlighting file icons in inactive buffers
			highlight_inactive_file_icons = false,

			-- Enable highlighting visible buffers
			highlight_visible = true,

			icons = {
				-- Configure the base icons on the bufferline.
				buffer_index = false,
				buffer_number = false,
				button = ' ',
				-- Enables / disables diagnostic symbols
				diagnostics = {
					[vim.diagnostic.severity.ERROR] = {enabled = true, icon = ' '},
					[vim.diagnostic.severity.WARN] = {enabled = true, icon = ' '},
					[vim.diagnostic.severity.INFO] = {enabled = false, icon = ' '},
					[vim.diagnostic.severity.HINT] = {enabled = true, icon = '󰌵 '},
				},
				filetype = {
					-- Sets the icon's highlight group.
					-- If false, will use nvim-web-devicons colors
					custom_colors = false,

					-- Requires `nvim-web-devicons` if `true`
					enabled = true,
				},
				-- separator = {left = '', right = ' '},
				-- separator = {left = '▎', right = ''},
				separator = {left = '', right = ''},

				-- Configure the icons on the bufferline when modified or pinned.
				-- Supports all the base icon options.
				modified = {button = '● '},
				pinned = {button = '車'},

				-- Configure the icons on the bufferline based on the visibility of a buffer.
				-- Supports all the base icon options, plus `modified` and `pinned`.
				alternate = {filetype = {enabled = false}},
				current = {buffer_index = false},
				inactive = {
					button = '  ',
					separator = {
						left = '',
						right = ''
					}
				},
				visible = {modified = {buffer_number = false}},
			},

			-- If true, new buffers will be inserted at the start/end of the list.
			-- Default is to insert after current buffer.
			insert_at_end = true,
			insert_at_start = false,

			maximum_padding = 5,
			minimum_padding = 3,
			maximum_length = 30,
			minimum_length = 0,

			-- If set, the letters for each buffer in buffer-pick mode will be
			-- assigned based on their name. Otherwise or in case all letters are
			-- already assigned, the behavior is to assign letters in order of
			-- usability (see order below)
			semantic_letters = true,

			sidebar_filetypes = {
				-- Use the default values: {event = 'BufWinLeave', text = nil}
				NvimTree = true,
				-- Or, specify the text used for the offset:
				undotree = {text = 'undotree'},
				-- Or, specify the event which the sidebar executes when leaving:
				['neo-tree'] = {event = 'BufWipeout'},
				-- Or, specify both
				Outline = {event = 'BufWinLeave', text = 'symbols-outline'},
			},

			-- New buffer letters are assigned in this order. This order is
			-- optimal for the qwerty keyboard layout but might need adjustement
			-- for other layouts.
			letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

			-- Sets the name of unnamed buffers. By default format is "[Buffer X]"
			-- where X is the buffer number. But only a static string is accepted here.
			no_name_title = nil,
		}
	end
}
