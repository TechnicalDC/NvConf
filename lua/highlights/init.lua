local hi = vim.api.nvim_set_hl

hi(0, 'TSComment', {})
hi(0, 'TSComment', {link = "Comment"})
hi(0, 'VertSplit', {link = "Comment"})
hi(0, 'CmpItemAbbr', {guibg = None})

-- BufferLine Highlightings {{{
hi(0, 'BufferLineFill', {link = "CursorLine"})
hi(0, 'BufferLineBufferSelected', {link = "lualine_a_normal"})
hi(0, 'BufferLineBackground', {link = "lualine_c_normal"})
hi(0, 'BufferLineCloseButton', {link = "lualine_c_normal"})
hi(0, 'BufferLineModified', {link = "lualine_c_normal"})
hi(0, 'BufferLineIndicatorSelected', {link = "lualine_a_normal"})
hi(0, 'BufferLineSeparatorSelected', {link = "lualine_a_normal"})
hi(0, 'BufferLineCloseButtonSelected', {link = "lualine_a_normal"})
hi(0, 'BufferLineModifiedSelected', {link = "lualine_a_normal"})

hi(0, 'BufferLineTabClose', {link = "ErrorMsg"})
hi(0, 'BufferLineTabSelected', {link = "lualine_a_normal"})
hi(0, 'BufferLineTabSeparatorSelected', {link = "lualine_a_normal"})
-- }}}
