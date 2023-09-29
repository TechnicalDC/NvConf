return {
	'kyazdani42/nvim-tree.lua',
	keys = {
		{ "<leader>tt", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" },
	},
	config = function ()
		local map = vim.keymap.set
		local M = {}

		local api = require("nvim-tree.api")

		function M.on_attach(bufnr)
			local function opts(desc)
				return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end
			-- put some default mappings here
			map('n', '<C-]>', api.tree.change_root_to_node,          opts('CD'))
			map('n', '<C-e>', api.node.open.replace_tree_buffer,     opts('Open: In Place'))
			map('n', '<C-k>', api.node.show_info_popup,              opts('Info'))
			map('n', '<C-r>', api.fs.rename_sub,                     opts('Rename: Omit Filename'))
			map('n', '<C-t>', api.node.open.tab,                     opts('Open: New Tab'))
			map('n', '<C-v>', api.node.open.vertical,                opts('Open: Vertical Split'))
			map('n', '<C-x>', api.node.open.horizontal,              opts('Open: Horizontal Split'))
			map('n', '<BS>',  api.node.navigate.parent_close,        opts('Close Directory'))
			map('n', '<CR>',  api.node.open.edit,                    opts('Open'))
			map('n', '<Tab>', api.node.open.preview,                 opts('Open Preview'))
			map('n', '>',     api.node.navigate.sibling.next,        opts('Next Sibling'))
			map('n', '<',     api.node.navigate.sibling.prev,        opts('Previous Sibling'))
			map('n', '.',     api.node.run.cmd,                      opts('Run Command'))
			map('n', '-',     api.tree.change_root_to_parent,        opts('Up'))
			map('n', 'a',     api.fs.create,                         opts('Create'))
			map('n', 'bmv',   api.marks.bulk.move,                   opts('Move Bookmarked'))
			map('n', 'B',     api.tree.toggle_no_buffer_filter,      opts('Toggle No Buffer'))
			map('n', 'c',     api.fs.copy.node,                      opts('Copy'))
			map('n', 'C',     api.tree.toggle_git_clean_filter,      opts('Toggle Git Clean'))
			map('n', '[c',    api.node.navigate.git.prev,            opts('Prev Git'))
			map('n', ']c',    api.node.navigate.git.next,            opts('Next Git'))
			map('n', 'd',     api.fs.remove,                         opts('Delete'))
			map('n', 'D',     api.fs.trash,                          opts('Trash'))
			map('n', 'E',     api.tree.expand_all,                   opts('Expand All'))
			map('n', 'e',     api.fs.rename_basename,                opts('Rename: Basename'))
			map('n', ']e',    api.node.navigate.diagnostics.next,    opts('Next Diagnostic'))
			map('n', '[e',    api.node.navigate.diagnostics.prev,    opts('Prev Diagnostic'))
			map('n', 'F',     api.live_filter.clear,                 opts('Clean Filter'))
			map('n', 'f',     api.live_filter.start,                 opts('Filter'))
			map('n', 'g?',    api.tree.toggle_help,                  opts('Help'))
			map('n', 'gy',    api.fs.copy.absolute_path,             opts('Copy Absolute Path'))
			map('n', 'H',     api.tree.toggle_hidden_filter,         opts('Toggle Dotfiles'))
			map('n', 'I',     api.tree.toggle_gitignore_filter,      opts('Toggle Git Ignore'))
			map('n', 'J',     api.node.navigate.sibling.last,        opts('Last Sibling'))
			map('n', 'K',     api.node.navigate.sibling.first,       opts('First Sibling'))
			map('n', 'm',     api.marks.toggle,                      opts('Toggle Bookmark'))
			map('n', 'o',     api.node.open.edit,                    opts('Open'))
			map('n', 'O',     api.node.open.no_window_picker,        opts('Open: No Window Picker'))
			map('n', 'p',     api.fs.paste,                          opts('Paste'))
			map('n', 'P',     api.node.navigate.parent,              opts('Parent Directory'))
			map('n', 'q',     api.tree.close,                        opts('Close'))
			map('n', 'r',     api.fs.rename,                         opts('Rename'))
			map('n', 'R',     api.tree.reload,                       opts('Refresh'))
			map('n', 's',     api.node.run.system,                   opts('Run System'))
			map('n', 'S',     api.tree.search_node,                  opts('Search'))
			map('n', 'U',     api.tree.toggle_custom_filter,         opts('Toggle Hidden'))
			map('n', 'W',     api.tree.collapse_all,                 opts('Collapse'))
			map('n', 'x',     api.fs.cut,                            opts('Cut'))
			map('n', 'y',     api.fs.copy.filename,                  opts('Copy Name'))
			map('n', 'Y',     api.fs.copy.relative_path,             opts('Copy Relative Path'))
			map('n', '<2-LeftMouse>',  api.node.open.edit,           opts('Open'))
			map('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
		end

		require("nvim-tree").setup({
			sort_by = "case_sensitive",
			open_on_tab = false,
			respect_buf_cwd = true,
			on_attach = M.on_attach,
			view = {
				adaptive_size = false,
				width = 30,
				side = "left",
				number = false,
				relativenumber = false,
				signcolumn = "yes",
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
				root_folder_label = true,
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
