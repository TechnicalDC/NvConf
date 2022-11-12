local lspconfig = require('lspconfig')
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")


vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	-- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	keymap('n', 'gD', vim.lsp.buf.declaration, bufopts)
	keymap('n', 'gd', vim.lsp.buf.definition, bufopts)
	-- keymap('n', 'K', vim.lsp.buf.hover, bufopts)
	-- keymap('n', 'gi', vim.lsp.buf.implementation, bufopts)
	-- keymap('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	-- keymap('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	-- keymap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	-- keymap('n', '<space>wl', function()
	-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- end, bufopts)
	-- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	keymap("n", "gr", "<cmd>Lspsaga rename<CR>", bufopts)
	keymap('n', '<space>rn', vim.lsp.buf.rename, bufopts)
	keymap('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", bufopts)
	-- keymap('n', 'gr', vim.lsp.buf.references, bufopts)
	-- keymap('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

lspconfig.pyright.setup{
	on_attach = on_attach
}

lspconfig.tsserver.setup{
	on_attach = on_attach
}
lspconfig.sumneko_lua.setup({
	on_attach = on_attach,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
	virtual_text = {
		prefix = '●', -- Could be '●', '▎', 'x'
	}
})
