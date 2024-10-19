---@diagnostic disable: undefined-doc-name
return {
   "folke/noice.nvim",
   dependencies = {
      'stevearc/dressing.nvim',
      "MunifTanjim/nui.nvim",
      'rcarriga/nvim-notify',
      "SmiteshP/nvim-navic",
      "utilyre/barbecue.nvim",
   },
   enabled = true,
   config = function ()
      require("plugins.ui.dressing")
      require("plugins.ui.noice-ui")
      require("plugins.ui.notify")
      require("plugins.ui.barbecue")
   end
}
