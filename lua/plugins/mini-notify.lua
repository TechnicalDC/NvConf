return {
   'echasnovski/mini.notify',
   version = '*',
   config = function ()
      local notify = require('mini.notify')
      local autocmd = vim.api.nvim_create_autocmd
      local opts = {
         ERROR = { duration = 5000, hl_group = 'DiagnosticError'  },
         WARN  = { duration = 1000, hl_group = 'DiagnosticWarn'   },
         INFO  = { duration = 1000, hl_group = 'DiagnosticInfo'   },
         DEBUG = { duration = 0,    hl_group = 'DiagnosticHint'   },
         TRACE = { duration = 0,    hl_group = 'DiagnosticOk'     },
         OFF   = { duration = 0,    hl_group = 'MiniNotifyNormal' },
      }

      vim.notify = notify.make_notify(opts)

      notify.setup({
         -- Content management
         content = {
            -- Function which formats the notification message
            -- By default prepends message with notification time
            format = nil,

            -- Function which orders notification array from most to least important
            -- By default orders first by level and then by update timestamp
            sort = nil,
         },

         -- Notifications about LSP progress
         lsp_progress = {
            enable = true,
            duration_last = 1000,
         },

         window = {
            -- Floating window config
            config = {
               border = "rounded"
            },
            -- Maximum window width as share (between 0 and 1) of available columns
            max_width_share = 0.382,
            winblend = 0,
         },
      })
   end
}
