---@diagnostic disable: undefined-global
return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		'neovim/nvim-lspconfig',
		"glepnir/lspsaga.nvim",
		"nvim-treesitter/nvim-treesitter",
		'kyazdani42/nvim-web-devicons'
	},
	config = function ()
		-- MASON {{{
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "pyright", "tsserver" }
		})
		-- }}}

		-- LSPSAGA {{{
		require("lspsaga").setup({
			ui = {
				-- This option only works in Neovim 0.9
				title = true,
				-- Border type can be single, double, rounded, solid, shadow.
				border = "single",
				winblend = 0,
				expand = "",
				collapse = "",
				code_action = "💡",
				incoming = " ",
				outgoing = " ",
				hover = ' ',
				kind = {},
			},
			definition = {
				edit = "<C-c>o",
				vsplit = "<C-c>v",
				split = "<C-c>i",
				tabe = "<C-c>t",
				quit = "q",
			},
			preview = {
				lines_above = 0,
				lines_below = 10,
			},
			scroll_preview = {
				scroll_down = "<C-f>",
				scroll_up = "<C-b>",
			},
			request_timeout = 2000,
			finder = {
				max_height = 0.5,
				min_width = 30,
				force_max_height = false,
				keys = {
					jump_to = 'p',
					expand_or_jump = 'o',
					vsplit = 's',
					split = 'i',
					tabe = 't',
					tabnew = 'r',
					quit = { 'q', '<ESC>' },
					close_in_preview = '<ESC>',
				},
			},
			code_action = {
				num_shortcut = true,
				show_server_name = false,
				extend_gitsigns = true,
				keys = {
					-- string | table type
					quit = "q",
					exec = "<CR>",
				},
			},
			lightbulb = {
				enable = true,
				enable_in_insert = true,
				sign = true,
				sign_priority = 40,
				virtual_text = true,
			},
			hover = {
				max_width = 0.6,
				open_link = 'gx',
				open_browser = '!chrome',
			},
			diagnostic = {
				on_insert = false,
				on_insert_follow = false,
				insert_winblend = 0,
				show_code_action = true,
				show_source = true,
				jump_num_shortcut = true,
				max_width = 0.7,
				max_height = 0.6,
				max_show_width = 0.9,
				max_show_height = 0.6,
				text_hl_follow = true,
				border_follow = true,
				extend_relatedInformation = false,
				keys = {
					exec_action = 'o',
					quit = 'q',
					expand_or_jump = '<CR>',
					quit_in_show = { 'q', '<ESC>' },
				},
			},
			rename = {
				quit = "<C-c>",
				exec = "<CR>",
				mark = "x",
				confirm = "<CR>",
				in_select = true,
			},
			outline = {
				win_position = "right",
				win_with = "",
				win_width = 30,
				preview_width= 0.4,
				show_detail = true,
				auto_preview = true,
				auto_refresh = true,
				auto_close = true,
				auto_resize = false,
				custom_sort = nil,
				keys = {
					expand_or_jump = 'o',
					quit = "q",
				},
			},
			symbol_in_winbar = {
				enable = true,
				separator = "  ",
				ignore_patterns={},
				hide_keyword = true,
				show_file = true,
				folder_level = 2,
				respect_root = false,
				color_mode = true,
			},
		})
		-- }}}

		-- LSPCONFIG {{{
		local nvim_lsp = require('lspconfig')
		local map = vim.keymap.set
		local opts = { noremap = true, silent = true }

		map('n', '<space>e', vim.diagnostic.open_float, opts)

		---@diagnostic disable-next-line: unused-local
		local on_attach = function(client, bufnr)
			local bufopts = { noremap=true, silent=true, buffer=bufnr }

			-- Native lsp client keybindings
			map('n', 'gD', vim.lsp.buf.declaration, bufopts)
			map('n', 'gd', vim.lsp.buf.definition, bufopts)
			map('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
			map('n', 'K', vim.lsp.buf.hover, bufopts)
			map('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
			map('n', 'gr', vim.lsp.buf.references, bufopts)
			map('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
			map('n', '[d', vim.diagnostic.goto_prev, bufopts)
			map('n', ']d', vim.diagnostic.goto_next, bufopts)
			-- map('n', '<space>f', vim.lsp.buf.formatting, bufopts)
			-- map('n', 'gi', vim.lsp.buf.implementation, bufopts)
			-- map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
			-- map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
			-- map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
			-- map('n', '<space>wl', function()
				-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				-- end, bufopts)
		end

		local servers = {
			'pyright',
			-- 'openedge_ls',
			'tsserver',
			'lua_ls',
			'jsonls',
			-- 'gopls',
			-- 'texlab'
		}
		local oe_jar_path = 'C:\\Users\\Dilip Chauhan\\AppData\\Local\\nvim-data\\mason\\packages\\openedge-language-server\\abl-lsp.jar'
		for _, lsp in ipairs(servers) do
			if nvim_lsp[lsp] == "openedge_ls" then
				nvim_lsp[lsp].setup {
					on_attach = on_attach,
					cmd = {},
					root_dir = root_pattern('openedge-project.json'),
					oe_jar_path = oe_jar_path,
					-- oe_jar_path = '/home/dilip/.local/share/nvim/mason/packages/openedge-language-server/abl-lsp.jar',
					dlc = '12.2:C\\Progress\\OpenEdge\\bin', -- Version number and OpenEdge root directory (colon separator)
					debug = true, -- Set to true for debug logging
					trace = false -- Set to true for trace logging (REALLY verbose)
				}
			else
				nvim_lsp[lsp].setup {
					on_attach = on_attach,
				}
			end
		end

		local border_chars = { '┌', '─', '┐', '│', '┘', '─', '└', '│'}
		local signs = {
			Error = " ",
			Warn = " ",
			Hint = "󰌵 ",
			Info = " "
		}

		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		vim.diagnostic.config({
			-- virtual_text = {
			-- 	prefix = '󱓻 ',
			-- }
			virtual_text = false,
			float = {
				border = border_chars,
				max_width = 50,
				max_height = 10,
				wrap = true,
				focusable = true,
				focus = false
			}
		})

		local lspconfig = require 'lspconfig'
		lspconfig.util.on_setup = lspconfig.util.add_hook_before(lspconfig.util.on_setup, function(config)
			if some_condition and config.name == "openedge_ls" then
				config.cmd = {"java","-jar", oe_jar_path}
			end
		end)
		-- }}}

	end
}
