---@diagnostic disable: undefined-doc-name
return {
   "folke/noice.nvim",
   dependencies = {
      "MunifTanjim/nui.nvim",
      -- 'nvim-lualine/lualine.nvim',
   },
   enabled = true,
   config = function ()
      require("technicaldc.plugins.ui.noice-ui")
      -- require("technicaldc.plugins.ui.lualine")
   end
}
