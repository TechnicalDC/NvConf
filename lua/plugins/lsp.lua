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
      require("plugins.lsp.mason")
      require("plugins.lsp.config")
   end
}
