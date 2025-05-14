local helpers = require 'incline.helpers'
local colors = require("gruvbox-material.colors").get(vim.o.background, "medium")
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
      local ft_icon, ft_color = devicons.get_icon_color(filename)
      local modified = vim.bo[props.buf].modified
      local modified_icon = ""

      if ft_icon == nil then
         ft_icon = ""
      end

      return {
         ft_icon and {
            ' ',
            modified and modified_icon or ft_icon,
            ' ',
            guibg = modified and colors.red or colors.green,
            guifg = colors.bg0
         } or '',
         {
            ' ',
            filename,
            ' ',
            gui = modified and 'bold,italic' or 'bold',
            guibg = modified and colors.yellow or colors.bg1,
            guifg = modified and colors.bg0 or colors.fg0
         },
      }
   end,
}
