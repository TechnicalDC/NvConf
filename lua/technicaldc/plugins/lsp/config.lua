local capabilities = require('blink.cmp').get_lsp_capabilities()

---@diagnostic disable-next-line: unused-local
local on_attach = function(client, bufnr)
	require("technicaldc.lsp_keymaps")
end

vim.lsp.config("*", {
	on_attach = on_attach,
	capabilities = capabilities
})

vim.lsp.config("jdtls",{
	cmd = { "jdtls", "-configuration", "~/.cache/jdtls/config", "-data", "~/.cache/jdtls/workspace" },
	filetypes = { "java" },
	root_markers = { ".git", "build.gradle", "build.gradle.kts", "build.xml", "pom.xml", "settings.gradle", "settings.gradle.kts" }
})

vim.lsp.config("jsonls",{
	cmd = { "vscode-json-language-server", "--stdio" },
	filetypes = { "json", "jsonc" },
	init_options = {
		provideFormatter = true
	},
	root_markers = { ".git" }
})

vim.lsp.config("bashls",{
	cmd = { "bash-language-server", "start" },
	filetypes = { "bash", "sh" },
	settings = {
		bashIde = {
			globPattern = "*@(.sh|.inc|.bash|.command)"
		}
	}
})

vim.lsp.config("gopls",{
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
})

vim.lsp.config('lua_ls', {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if
				path ~= vim.fn.stdpath('config')
				and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
				then
					return
				end
			end

			client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
				runtime = {
					-- Tell the language server which version of Lua you're using (most
					-- likely LuaJIT in the case of Neovim)
					version = 'LuaJIT',
					-- Tell the language server how to find Lua modules same way as Neovim
					-- (see `:h lua-module-load`)
					path = {
						'lua/?.lua',
						'lua/?/init.lua',
					},
				},
				-- Make the server aware of Neovim runtime files
				workspace = {
					checkThirdParty = false,
					library = {
						vim.env.VIMRUNTIME
						-- Depending on the usage, you might want to add additional paths
						-- here.
						-- '${3rd}/luv/library'
						-- '${3rd}/busted/library'
					}
					-- Or pull in all of 'runtimepath'.
					-- NOTE: this is a lot slower and will cause issues when working on
					-- your own configuration.
					-- See https://github.com/neovim/nvim-lspconfig/issues/3189
					-- library = {
               --   vim.api.nvim_get_runtime_file('', true),
               -- }
					}
				})
			end,
			settings = {
				Lua = {}
			}
		})

		vim.lsp.config('rust_analyzer', {
			cmd = { "rust-analyzer" },
			filetypes = { "rust" },
		})

		vim.lsp.config("ts_ls", {
			cmd = { "typescript-language-server", "--stdio" },
			filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
			root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" }
		})

		vim.lsp.config("texlab",{
			cmd = { "texlab" },
			filetypes = { "tex", "plaintex", "bib" },
			settings ={
				texlab = {
					auxDirectory = ".",
					bibtexFormatter = "texlab",
					build = {
						args = {},
						executable = "xelatex",
						forwardSearchAfter = false,
						onSave = false
					},
					chktex = {
						onEdit = false,
						onOpenAndSave = false
					},
					diagnosticsDelay = 300,
					formatterLineLength = 80,
					forwardSearch = {
						args = {}
					},
					latexFormatter = "latexindent",
					latexindent = {
						modifyLineBreaks = false
					}
				}
			}
		})

		local signs = {
			Error = "",
			Warn = "",
			Hint = "󰌵",
			Info = ""
		}

		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			-- NOTE: This is deprecated. Use `vim.diagnostics.config()` instead
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		vim.diagnostic.config({
			underline = true,
			severity_sort = true,
			virtual_text = {
				prefix = function (diagnostic)
					if diagnostic.severity == vim.diagnostic.severity.ERROR then
						return " "
					elseif diagnostic.severity == vim.diagnostic.severity.WARN then
						return " "
					elseif diagnostic.severity == vim.diagnostic.severity.HINT then
						return "󰌵 "
					elseif diagnostic.severity == vim.diagnostic.severity.INFO then
						return " "
					end
					return ""
				end,
				format = function(diagnostic)
					if diagnostic.severity == vim.diagnostic.severity.ERROR then
						return string.format("ERROR: %s", diagnostic.message)
					end
					return diagnostic.message
				end
			},
			float = {
				scope = "cursor",
				severity_sort = true,
				border = "rounded",
				max_width = 70,
				max_height = 10,
				wrap = true,
				focusable = false,
				focus = false
			}
		})
