---@diagnostic disable: undefined-global
return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		'TechnicalDC/nvim-lspconfig',
		"nvim-treesitter/nvim-treesitter",
		"nvimdev/lspsaga.nvim",
		'kyazdani42/nvim-web-devicons',
		"nvimtools/none-ls.nvim"
	},
	config = function ()
		-- MASON {{{
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "pyright", "tsserver", "jdtls"}
		})
		-- }}}

		require("plugins.lsp.none-ls")
		require("plugins.lsp.lsp-config")
		require("plugins.lsp.lspsaga")
	end
}
