---@diagnostic disable: undefined-global
return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		'neovim/nvim-lspconfig',
		"nvim-treesitter/nvim-treesitter",
		'kyazdani42/nvim-web-devicons'
	},
	config = function ()
		-- MASON CONFIG {{{
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "pyright", "tsserver" }
		})
		--- }}}

		-- LSPCONFIG {{{
			local nvim_lsp = require('lspconfig')
			local map = vim.keymap.set
			local opts = { noremap = true, silent = true }

			map('n', '<space>e', vim.diagnostic.open_float, opts)
			-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

			-- Use an on_attach function to only map the following keys
			-- after the language server attaches to the current buffer
			---@diagnostic disable-next-line: unused-local
			local on_attach = function(client, bufnr)
				-- Enable completion triggered by <c-x><c-o>
				-- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

				-- Mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
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

				-- Use a loop to conveniently call 'setup' on multiple servers and
				-- map buffer local keybindings when the language server attaches
				local servers = {
					'pyright',
					'openedge_ls',
					'tsserver',
					'lua_ls',
					'jsonls',
					'gopls',
					'texlab'
				}
				for _, lsp in ipairs(servers) do
					if nvim_lsp[lsp] == "openedge_ls then" then
						nvim_lsp[lsp].setup {
							on_attach = on_attach,
							root_dir = root_pattern('openedge-project.json'),
							oe_jar_path = '/home/dilip/.local/share/nvim/mason/packages/openedge-language-server/abl-lsp.jar',
							dlc = '12.2:/path/to/dlc-12.2', -- Version number and OpenEdge root directory (colon separator)
							debug = false, -- Set to true for debug logging
							trace = false -- Set to true for trace logging (REALLY verbose)
						}
					else
						nvim_lsp[lsp].setup {
							on_attach = on_attach,
						}
					end
				end

				local signs = {
					Error = " ",
					Warn = " ",
					Hint = " ",
					Info = " "
				}

				for type, icon in pairs(signs) do
					local hl = "DiagnosticSign" .. type
					vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
				end

				vim.diagnostic.config({
					virtual_text = {
						prefix = '󱓻 ',
					}
				})
				-- }}}
			end
		}
