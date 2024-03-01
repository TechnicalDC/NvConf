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
	map('n', 'go', "<cmd>Lspsaga outline<cr>", bufopts)
	map('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	map('n', 'K', vim.lsp.buf.hover, bufopts)
	map('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
	map('n', 'gr', vim.lsp.buf.references, bufopts)
	map('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
	map('n', '[d', vim.diagnostic.goto_prev, bufopts)
	map('n', ']d', vim.diagnostic.goto_next, bufopts)
	map('n', '<space>f', vim.lsp.buf.formatting, bufopts)
	map('n', 'gi', vim.lsp.buf.implementation, bufopts)
	map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	map('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
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
	nvim_lsp[lsp].setup {
		on_attach = on_attach,
	}
end

nvim_lsp.openedge_ls.setup {
	on_attach = on_attach,
	oe_jar_path = oe_jar_path,
	-- oe_jar_path = '/home/dilip/.local/share/nvim/mason/packages/openedge-language-server/abl-lsp.jar',
	dlc = '12.2:C:\\Progress\\OpenEdge\\bin', -- Version number and OpenEdge root directory (colon separator)
	debug = true, -- Set to true for debug logging
	trace = false -- Set to true for trace logging (REALLY verbose)
}

-- local border_chars = { '┌', '─', '┐', '│', '┘', '─', '└', '│'}
local rounded_border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│'}
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
	virtual_text = {
		prefix = '',
		-- prefix = '󱓻 ',
	},
	-- virtual_text = false,
	float = {
		border = rounded_border,
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

