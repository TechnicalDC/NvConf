local helpers = require 'incline.helpers'

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
      local search_icon = ""

      if ft_icon == nil then
         ft_icon = ""
      end

      local function get_diagnostic_label()
         local icons = { Error = "", Warn = "", Hint = "󰌵", Info = ""
         }
         local label = {}
         -- local diagnostics = vim.diagnostic.get(0)
         -- local count = { 0, 0, 0, 0 }
         -- for _, diagnostic in ipairs(diagnostics) do
         -- 	if vim.startswith(vim.diagnostic.get_namespace(diagnostic.namespace).name, 'vim.lsp') then
         -- 		count[diagnostic.severity] = count[diagnostic.severity] + 1
         -- 	end
         -- end
         -- local error_count = count[vim.diagnostic.severity.ERROR]
         -- local warning_count = count[vim.diagnostic.severity.WARN]
         -- local info_count = count[vim.diagnostic.severity.INFO]
         -- local hint_count = count[vim.diagnostic.severity.HINT]

         for severity, icon in pairs(icons) do
            local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
            if n > 0 then
               table.insert(label, { icon .. n .. ' ', group = 'DiagnosticSign' .. severity })
            end
         end
         return label
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
