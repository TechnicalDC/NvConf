---@diagnostic disable: undefined-doc-name
return {
   "folke/noice.nvim",
   dependencies = {
      'echasnovski/mini.notify',
      'stevearc/dressing.nvim',
      "MunifTanjim/nui.nvim",
      "SmiteshP/nvim-navic",
      "utilyre/barbecue.nvim",
   },
   enabled = true,
   config = function ()
      require("plugins.ui.noice-ui")
      require("plugins.ui.dressing")
      require("plugins.ui.barbecue")
   end
}
