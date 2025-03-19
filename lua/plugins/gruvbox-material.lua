return {
   'TechnicalDC/gruvbox-material.nvim',
   name = 'gruvbox-material',
   lazy = false,
   priority = 1000,
   config = function ()
      -- values shown are defaults and will be used if not provided
      require('gruvbox-material').setup({
         italics = true,             -- enable italics in general
         contrast = "medium",        -- set contrast, can be any of "hard", "medium", "soft"
         comments = {
            italics = true,           -- enable italic comments
         },
         background = {
            transparent = false,      -- set the background to transparent
         },
         float = {
            force_background = true, -- force background on floats even when background.transparent is set
            background_color = nil,   -- set color for float backgrounds. If nil, uses the default color set
            -- by the color scheme
         },
         signs = {
            highlight = true,         -- whether to highlight signs
         },
         customize = nil,            -- customize the theme in any way you desire, see below what this
         -- configuration accepts
      })
   end
}
