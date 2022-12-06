local hi = vim.api.nvim_set_hl

hi(0, 'TSComment', {})
hi(0, 'TSComment', {link = "Comment"})
hi(0, 'VertSplit', {link = "Comment"})
hi(0, 'CmpItemAbbr', {guibg = None})

-- BufferLine Highlighting
hi(0, 'BufferLineFill', {link = "CursorLine"})
hi(0, 'BufferLineBufferSelected', {link = "lualine_a_normal"})
hi(0, 'BufferLineCloseButtonSelected', {link = "lualine_a_normal"})
hi(0, 'BufferLineModifiedSelected', {link = "lualine_a_normal"})

