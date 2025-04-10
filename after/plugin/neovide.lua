if vim.g.neovide then
   vim.o.guifont = "JetBrainsMono NF:h13"
   vim.opt.linespace = 0
   vim.g.neovide_scale_factor = 1.0
   vim.g.neovide_padding_top = 20
   vim.g.neovide_padding_bottom = 20
   vim.g.neovide_padding_right = 20
   vim.g.neovide_padding_left = 20
   -- g:neovide_opacity should be 0 if you want to unify transparency of content and title bar.
   vim.g.neovide_opacity = 1.0
   vim.g.neovide_normal_opacity = 1.0
   vim.g.transparency = 0.0
   vim.g.neovide_floating_shadow = false
end
