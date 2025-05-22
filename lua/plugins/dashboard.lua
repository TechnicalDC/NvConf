return {
	'echasnovski/mini.starter',
	version = '*',
	config = function ()
		local starter = require('mini.starter')
		local autocmd = vim.api.nvim_create_autocmd
		local map     = vim.keymap.set
		local opts    = { buffer = true }
		local headers = require("technicaldc.header_ascii")

		local content_type_width = function(content, section_type)
			local coords = starter.content_coords(content, section_type)
			local width = math.max(unpack(vim.tbl_map(function(c)
				local line = content[c.line][c.unit].string
				return vim.fn.strdisplaywidth(line)
			end, coords)))
			return width
		end

		require('mini.starter').setup( {
			autoopen = true,

			evaluate_single = true,
			items = {
				{
					name = 'browse files',
					action = 'lua require("mini.files").open(vim.uv.cwd(), true)',
					section = 'telescope'
				},
				{
					name = 'open notes',
					action = 'lua require("telescope.builtin").find_files({cwd = "~/Notes/", prompt_title = "Open Notes"})',
					section = 'telescope'
				},
				{
					name = 'find files',
					action = 'lua require("telescope.builtin").find_files()',
					section = 'telescope'
				},
				{
					name = 'recent files',
					action = 'lua require("telescope.builtin").oldfiles()',
					section = 'telescope'
				},
				{
					name = 'edit new buffer',
					action = 'enew',
					section = 'builtin'
				},
				{
					name = 'quit neovim',
					action = 'qall',
					section = 'builtin'
				},
			},

			header = headers.mini,
			footer = headers.mini_footer,

			content_hooks = {
				-- starter.gen_hook.adding_bullet(),
				function(content)
					-- Coords
					local header_width = content_type_width(content, "header")
					local section_width = content_type_width(content, "section")
					local item_width = content_type_width(content, "item")
	 				local footer_width = content_type_width(content, "footer")
					local max_width = math.max(header_width, section_width, item_width, footer_width)

					for _, line in ipairs(content) do
						if not (#line == 0 or (#line == 1 and line[1].string == "")) then
							local line_str = ""
							local line_types = {}
							for _, unit in ipairs(line) do
								line_str = line_str .. unit.string
								table.insert(line_types, unit.type)
							end
							local line_width = 0
							for _, type in ipairs(line_types) do
								if type == "item" or type == "section" then
									line_width = math.max(item_width, section_width)
								elseif type == "header" then
									line_width = header_width
								elseif type == "footer" then
									line_width = footer_width
								end
							end
							local left_pad = string.rep(" ", (max_width - line_width) * 0.5)

							table.insert(line, 1, { string = left_pad, type = "empty" })
						end
					end
					return content
				end,
				starter.gen_hook.aligning('center', 'center'),
			},

			-- Characters to update query. Each character will have special buffer
			-- mapping overriding your global ones. Be careful to not add `:` as it
			-- allows you to go into command mode.
			query_updaters = [[abcdefghilmoqrstuvwxyz0123456789_-,.ABCDEFGHIJKLMOQRSTUVWXYZ]],

			-- Whether to disable showing non-error feedback
			silent = false,
		})

		autocmd("User",{
			pattern = "MiniStarterOpened",
			callback = function(args)
				vim.opt_local.statuscolumn = ""
				map("n", "j", "<Cmd>lua MiniStarter.update_current_item('next')<CR>", opts)
				map("n", "k", "<Cmd>lua MiniStarter.update_current_item('prev')<CR>", opts)
			end})
		end
	}
