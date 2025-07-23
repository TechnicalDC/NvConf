local colors = require("mini.hues").make_palette()
local devicons = require 'nvim-web-devicons'

require('incline').setup {
   window = {
      padding = 0,
      margin = { horizontal = 0 },
   },
   render = function(props)
      local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
      if filename == '' then
         filename = '[No Name]'
      end
      local ft_icon, _ = devicons.get_icon_color(filename)
      local modified = vim.bo[props.buf].modified
      local readonly = vim.bo[props.buf].readonly
      local modified_icon = " "
      local readonly_icon = " "

      if ft_icon == nil then
         ft_icon = ""
      end

      return {
         -- {get_diagnostic_label()},
         ft_icon and {
            ' ',
            ft_icon .. ' ',
            ' ',
            guibg = colors.bg_mid2,
            guifg = colors.fg
         } or '',
         {
            ' ',
            filename,
            ' ',
            gui = modified and 'italic' or '',
            guibg = colors.bg_mid,
            guifg = colors.fg
         },
         modified and {
            ' ',
            modified_icon or ' ',
            ' ',
            guibg = colors.yellow,
            guifg = colors.bg
         } or '',
         readonly and {
            ' ',
            readonly_icon or ' ',
            ' ',
            guibg = colors.red,
            guifg = colors.bg
         } or '',
      }
   end,
}
