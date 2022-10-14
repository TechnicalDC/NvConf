require('telescope').setup{
	defaults = {
		layout_strategy = 'horizontal',
		layout_config = { 
			height = 0.95,
			prompt_position = "top",
			preview_width = 0.5,
			width = 0.8,
		},
		sorting_strategy = "ascending",
		prompt_prefix = "  ",
		entry_prefix = "   ",
		multi_icon = " ● ",
		selection_caret = " → ",
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
		file_browser = {
			hijack_netrw = true,
			path = "%:p:h",
			default_selection_index = 2,
			-- mappings = {
			-- 	["i"] = {
			-- 		-- your custom insert mode mappings
			-- 	},
			-- 	["n"] = {
			-- 		-- your custom normal mode mappings
			-- 	},
			-- },
		},
	},
}

require("telescope").load_extension "file_browser"
