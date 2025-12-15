return {
   'b0o/incline.nvim',
   event = { "BufReadPre", "BufNewFile" },
   config = function()
      local colors = require("rose-pine.palette")
      local icons = require("mini.icons")

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
            local ft_icon, _, _ = icons.get("file", filename)
            local modified = vim.bo[props.buf].modified
            local readonly = vim.bo[props.buf].readonly
            local modified_icon = ""
            local readonly_icon = ""
            local search_icon = ""

            if ft_icon == nil then
               ft_icon = ""
            end

            return {
               '▌',
               ft_icon and {
                  ' ',
                  modified and modified_icon or ft_icon,
               } or '',
               {
                  ' ',
                  filename,
                  ' ',
                  gui = modified and 'italic,bold' or '',
               },
               "▐"
            }
         end,
      }
   end,
}
