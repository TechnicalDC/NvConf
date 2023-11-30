---@diagnostic disable: unused-local
return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		-- 'nvim-telescope/telescope-ui-select.nvim',
		-- "nvim-telescope/telescope-file-browser.nvim"
	},
	config = function ()
		local border_char = { '─', '│', '─', '│', '┌', '┐', '┘', '└'}
		local full_border_char = {
			preview = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
			prompt = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
			results = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
		}
		local dropdown_border = {
			prompt = {"─", "│", " ", "│", '╭', '╮', "│", "│"},
			results = {"─", "│", "─", "│", "├", "┤", "╯", "╰"},
			preview = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
		}

		local toggle_preview = require("telescope.actions.layout").toggle_preview
		-- local builtin = require("telescope.builtin")
		-- local is_inside_work_tree = {}
		--
		-- local project_files = function()
		-- 	local opts = {} -- define here if you want to define something
		--
		-- 	local cwd = vim.fn.getcwd()
		-- 	if is_inside_work_tree[cwd] == nil then
		-- 		vim.fn.system("git rev-parse --is-inside-work-tree")
		-- 		is_inside_work_tree[cwd] = vim.v.shell_error == 0
		-- 	end
		--
		-- 	if is_inside_work_tree[cwd] then
		-- 		builtin.git_files(opts)
		-- 	else
		-- 		builtin.find_files(opts)
		-- 	end
		-- end

		require('telescope').setup{
			defaults = {
				-- layout_strategy = 'horizontal',
				-- layout_strategy = 'vertical',
				layout_strategy = "flex",
				layout_config = {
					preview_cutoff = 1,
					height = 0.9,
					prompt_position = "top",
					width = 0.8,
				},
				sorting_strategy = "ascending",
				prompt_prefix = "   ",
				entry_prefix = "   ",
				multi_icon = "   ",
				selection_caret = "  ",
				border = true,
				borderchars = full_border_char,
				results_title = "",
				prompt_title = " Prompt ",

				-- Preview
				preview = {
					color_devicons = true,
				},
				mappings = {
					i = {
						-- map actions.which_key to <C-h> (default: <C-/>)
						-- actions.which_key shows the mappings for your picker,
						-- e.g. git_{create, delete, ...}_branch for the git_branches picker
						["<C-/>"] = "which_key",
						["<C-p>"] = toggle_preview
					}
				}
			},
			extensions = {
				-- ["ui-select"] = {
				-- 	previewer = false,
				-- 	layout_config = {    
				-- 		width = 0.4,
				-- 		height = 0.4,
				-- 	}
				-- },
				-- file_browser = {
				-- 	hijack_netrw = true,
				-- 	path = "%:p:h",
				-- 	default_selection_index = 2,
				-- },
			},
		}

		-- require("telescope").load_extension("ui-select")
		require("telescope").load_extension("noice")
		-- require("telescope").load_extension("file_browser")
	end
}
