---@diagnostic disable: undefined-global
return {
   "williamboman/mason.nvim",
   dependencies = {
      "williamboman/mason-lspconfig.nvim",
      'TechnicalDC/nvim-lspconfig',
      "nvim-treesitter/nvim-treesitter",
      'kyazdani42/nvim-web-devicons',
   },
   event = { "BufReadPre", "BufNewFile" },
   config = function ()
      require("technicaldc.plugins.lsp.mason")
      require("technicaldc.plugins.lsp.config")
   end
}
