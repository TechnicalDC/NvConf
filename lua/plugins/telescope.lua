---@diagnostic disable: unused-local
return {
	'nvim-telescope/telescope.nvim',
	lazy = false,
	dependencies = {
		'nvim-lua/plenary.nvim',
		"nvim-telescope/telescope-file-browser.nvim"
	},
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
		{ "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Find old files" },
		{ "<leader>fb", "<cmd>Telescope file_browser<cr>", desc = "Browse files" },
		{ "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
		{ "<leaderlg", "<cmd>Telescope live_grep<cr>", desc = "Find file by word" },
	},
	config = function ()
		local center = require("plugins.telescope.layout.center")
		local border_char = { '─', '│', '─', '│', '┌', '┐', '┘', '└'}
		local full_border_char = {
			preview = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
			prompt = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
			results = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
		}

		local toggle_preview = require("telescope.actions.layout").toggle_preview

		require('telescope').setup{
			defaults = {
				-- layout_strategy = 'horizontal',
				-- layout_strategy = 'vertical',
				layout_strategy = "center",
				-- layout_strategy = "flex",
				layout_config = center.layout_config,
				sorting_strategy = "ascending",
				prompt_prefix = "   ",
				entry_prefix = "   ",
				multi_icon = "  ",
				selection_caret = "  ",
				border = true,
				borderchars = center.border,
				results_title = "",
				prompt_title = " Prompt ",

				-- Preview
				preview = {
					color_devicons = true,
					mime_hook = function(filepath, bufnr, opts)
						local is_image = function(lFilepath)
							local image_extensions = {'png','jpg'}   -- Supported image formats
							local split_path = vim.split(lFilepath:lower(), '.', {plain=true})
							local extension = split_path[#split_path]
							return vim.tbl_contains(image_extensions, extension)
						end
						if is_image(filepath) then
							local term = vim.api.nvim_open_term(bufnr, {})
							local function send_output(_, data, _ )
								for _, d in ipairs(data) do
									vim.api.nvim_chan_send(term, d..'\r\n')
								end
							end
							vim.fn.jobstart(
							{
								'wezterm','imgcat', filepath  -- Terminal image viewer command
							},
							{on_stdout=send_output, stdout_buffered=true, pty=true})
						else
							require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid, "Binary cannot be previewed")
						end
					end
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
				file_browser = {
					hijack_netrw = true,
					path = "%:p:h",
					default_selection_index = 2,
				},
			},
		}

		require("telescope").load_extension("noice")
		require("telescope").load_extension("file_browser")
	end
}
