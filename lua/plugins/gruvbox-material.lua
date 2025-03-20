return {
   'TechnicalDC/gruvbox-material.nvim',
   name = 'gruvbox-material',
   lazy = false,
   priority = 1000,
   config = function ()
      local colors = require("gruvbox-material.colors").get(vim.o.background, "medium")

      require('gruvbox-material').setup({
         italics = true,             -- enable italics in general
         contrast = "medium",        -- set contrast, can be any of "hard", "medium", "soft"
         comments = {
            italics = true,           -- enable italic comments
         },
         background = {
            transparent = true,      -- set the background to transparent
         },
         float = {
            force_background = true, -- force background on floats even when background.transparent is set
            background_color = colors.bg0,
            -- by the color scheme
         },
         signs = {
            highlight = true,         -- whether to highlight signs
         },
         customize = function (hl, opts)
            if hl == "FloatBorder" then
               print(vim.inspect(opts))
               opts.link = nil
               opts.fg = colors.aqua
            end

            return opts
         end,            -- customize the theme in any way you desire, see below what this
         -- configuration accepts
      })
   end
}
