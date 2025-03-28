---@diagnostic disable: undefined-global
return {
   "williamboman/mason.nvim",
   dependencies = {
      "williamboman/mason-lspconfig.nvim",
      'TechnicalDC/nvim-lspconfig',
      "nvim-treesitter/nvim-treesitter",
      'kyazdani42/nvim-web-devicons',
   },
   config = function ()
      -- MASON {{{
      require("mason").setup({
         ui = {
            border = "rounded"
         }
      })
      require("mason-lspconfig").setup({
         ensure_installed = {
            "lua_ls",
            -- "pyright",
            "ts_ls",
            -- "jdtls",
         }
      })
      -- }}}

      -- require("plugins.lsp.none-ls")
      require("plugins.lsp.lsp-config")
   end
}
