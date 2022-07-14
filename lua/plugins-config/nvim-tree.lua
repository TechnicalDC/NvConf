require("nvim-tree").setup({
	sort_by = "case_sensitive",
	open_on_tab = false,
	respect_buf_cwd = true,
	view = {
		adaptive_size = true,
		width = 30,
		side = "left",
		hide_root_folder = false,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
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
				corner = "| ",
				edge = "| ",
				item = "| ",
				none = "  ",
			}
		}
	},
	diagnostics = {
		enable = false,
		show_on_dirs = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		}
	},
	filters = {
		dotfiles = true,
	},
})

