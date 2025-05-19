return {
   'TechnicalDC/gruvbox-material.nvim',
   name = 'gruvbox-material',
   lazy = false,
   priority = 1000,
   config = function ()
      local colors = require("gruvbox-material.colors").get(vim.o.background, "hard")

      require('gruvbox-material').setup({
         italics = true,
         contrast = "hard",
         comments = {
            italics = true,
         },
         background = {
            transparent = false,
         },
         float = {
            force_background = true,
            background_color = colors.bg0,
         },
         signs = {
            highlight = false,
         },
         customize = nil,
      })
   end
}
