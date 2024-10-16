---@diagnostic disable: undefined-doc-name
return {
   "folke/noice.nvim",
   dependencies = {
      'stevearc/dressing.nvim',
      'fgheng/winbar.nvim',
      "MunifTanjim/nui.nvim",
      'rcarriga/nvim-notify'
   },
   enabled = true,
   config = function ()
      require("plugins.ui.dressing")
      require("plugins.ui.winbar")
      require("plugins.ui.noice-ui")
      require("plugins.ui.notify")
   end
}
