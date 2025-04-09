if vim.g.neovide then
   vim.o.guifont = "JetBrainsMono NF:h14"
   vim.opt.linespace = 0
   vim.g.neovide_scale_factor = 1.0
   vim.g.neovide_padding_top = 0
   vim.g.neovide_padding_bottom = 0
   vim.g.neovide_padding_right = 0
   vim.g.neovide_padding_left = 0
   -- g:neovide_opacity should be 0 if you want to unify transparency of content and title bar.
   vim.g.neovide_opacity = 1.0
   vim.g.transparency = 0.0
   -- Helper function for transparency formatting
   local alpha = function()
      return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
   end
   vim.g.neovide_background_color = "#0f1117" .. alpha()
end
