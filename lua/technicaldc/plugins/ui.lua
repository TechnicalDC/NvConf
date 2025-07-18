---@diagnostic disable: undefined-doc-name
return {
   "folke/noice.nvim",
   dependencies = {
      "MunifTanjim/nui.nvim",
   },
   enabled = true,
   config = function ()
      require("technicaldc.plugins.ui.noice-ui")
   end
}
