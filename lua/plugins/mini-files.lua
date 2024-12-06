return {
   'echasnovski/mini.files',
   version = '*',
   keys = {
      {
         "<leader>b",
         function()
            require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
         end,
         desc = "Open mini.files (Directory of Current File)",
      },
      {
         "<leader>B",
         function()
            require("mini.files").open(vim.uv.cwd(), true)
         end,
         desc = "Open mini.files (cwd)",
      },
   },
   config = function ()
      local miniFiles = require('mini.files')
      local my_prefix = function(fs_entry)
         if fs_entry.fs_type == 'directory' then
            -- NOTE: it is usually a good idea to use icon followed by space
            return ' ', 'MiniFilesDirectory'
         end
         return miniFiles.default_prefix(fs_entry)
      end
      miniFiles.setup({
         -- Module mappings created only inside explorer.
         -- Use `''` (empty string) to not create one.
         mappings = {
            close       = 'q',
            go_in       = 'l',
            go_in_plus  = '<CR>',
            go_out      = 'h',
            go_out_plus = 'H',
            mark_goto   = "'",
            mark_set    = 'm',
            reset       = '<BS>',
            reveal_cwd  = '@',
            show_help   = 'g?',
            synchronize = 's',
            trim_left   = '<',
            trim_right  = '>',
         },
         content = { prefix = my_prefix },
         windows = {
            -- Maximum number of windows to show side by side
            max_number = 3,
            -- Whether to show preview of file/directory under cursor
            preview = true,
            -- Width of focused window
            width_focus = 40,
            -- Width of non-focused window
            width_nofocus = 20,
            -- Width of preview window
            width_preview = 40,
         },
      })
   end
}
