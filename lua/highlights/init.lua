local hi = vim.api.nvim_set_hl

hi(0, 'TSComment', {})
hi(0, 'TSComment', {link = "Comment"})
hi(0, 'VertSplit', {link = "Comment"})
hi(0, 'NvimTreeWinSeparator', {link = "NvimTreeEndOfBuffer"})
hi(0, 'CmpItemAbbr', {guibg = None})
hi(0, 'BufferTabpages', {link = "lualine_a_visual"})
