return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope-ui-select.nvim',
		"nvim-telescope/telescope-file-browser.nvim"
	},
	config = function ()
		require('telescope').setup{
			defaults = {
				-- layout_strategy = 'center',
				-- layout_strategy = 'vertical',
				-- layout_strategy = 'horizontal',
				layout_strategy = 'flex',
				layout_config = {
					height = 0.7,
					prompt_position = "top",
					width = 0.8,
				},
				sorting_strategy = "ascending",
				prompt_prefix = "  ",
				entry_prefix = "   ",
				multi_icon = " ●  ",
				selection_caret = "  ",
				border = true,
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				results_title = " Results ",
				prompt_title = " Prompt ",

				-- Preview
				preview = {
					color_devicons = true,
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown()
				},
				file_browser = {
					hijack_netrw = true,
					path = "%:p:h",
					default_selection_index = 2,
				},
			},
		}

		require("telescope").load_extension("ui-select")
		require("telescope").load_extension "file_browser"
	end
}