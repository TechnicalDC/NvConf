return {
	'kyazdani42/nvim-tree.lua',
	config = function ()
		require("nvim-tree").setup({
			sort_by = "case_sensitive",
			open_on_tab = false,
			respect_buf_cwd = true,
			view = {
				adaptive_size = false,
				width = 30,
				side = "left",
				hide_root_folder = true,
				number = false,
				relativenumber = false,
				signcolumn = "yes",
				mappings = {
					list = {
						{ key = "u", action = "dir_up" },
					},
				},
				float = {
					enable = false,
					quit_on_focus_loss = true,
					open_win_config = {
						relative = "editor",
						border = "rounded",
						width = 30,
						height = 30,
						row = 1,
						col = 1,
					},
				}
			},
			actions = {
				use_system_clipboard = true,
				open_file = {
					quit_on_open = true,
					resize_window = true,
				}
			},
			renderer = {
				group_empty = true,
				root_folder_modifier = ":~",
				highlight_git = false,
				full_name = false,
				indent_markers = {
					enable = true,
					icons = {
						corner = "└ ",
						edge = "│ ",
						item = "│ ",
						none = "  ",
					}
				}
			},
			diagnostics = {
				enable = true,
				show_on_dirs = false,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",

				}
			},
			filters = {
				dotfiles = true,
			},
		})
	end
}
