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
      local autocmd = vim.api.nvim_create_autocmd

      local my_prefix = function(fs_entry)
         if fs_entry.fs_type == 'directory' then
            -- NOTE: it is usually a good idea to use icon followed by space
            return ' ', 'MiniFilesDirectory'
         end
         return miniFiles.default_prefix(fs_entry)
      end

      local show_dotfiles = true

      local filter_show = function(fs_entry) return true end

      local filter_hide = function(fs_entry)
         return not vim.startswith(fs_entry.name, '.')
      end

      local toggle_dotfiles = function()
         show_dotfiles = not show_dotfiles
         local new_filter = show_dotfiles and filter_show or filter_hide
         miniFiles.refresh({ content = { filter = new_filter } })
      end

      local set_mark = function(id, path, desc)
         miniFiles.set_bookmark(id, path, { desc = desc })
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

      -- Toggle dotfiles
      vim.api.nvim_create_autocmd('User', {
         pattern = 'MiniFilesBufferCreate',
         callback = function(args)
            local buf_id = args.data.buf_id
            -- Tweak left-hand side of mapping to your liking
            vim.keymap.set('n', 'g.', toggle_dotfiles, { buffer = buf_id })
         end,
      })

      -- Setting bookmarks
      vim.api.nvim_create_autocmd('User', {
         pattern = 'MiniFilesExplorerOpen',
         callback = function()
            set_mark('c', vim.fn.stdpath('config'), 'Config') -- path
            set_mark('w', vim.fn.getcwd, 'Working directory') -- callable
            set_mark('~', '~', 'Home directory')
         end,
      })

      autocmd('User', {
         pattern = 'MiniFilesWindowOpen',
         callback = function(args)
            local win_id = args.data.win_id

            -- Customize window-local settings
            local config = vim.api.nvim_win_get_config(win_id)
            config.border, config.title_pos = 'single', 'left'
            vim.api.nvim_win_set_config(win_id, config)
         end,
      })
      autocmd('User', {
         pattern = 'MiniFilesWindowUpdate',
         callback = function(args)
            local config = vim.api.nvim_win_get_config(args.data.win_id)

            -- Ensure fixed height
            config.height = 15

            -- Ensure title padding
            if config.title[#config.title][1] ~= ' ' then
               table.insert(config.title, { ' ', 'NormalFloat' })
            end
            if config.title[1][1] ~= ' ' then
               table.insert(config.title, 1, { ' ', 'NormalFloat' })
            end

            vim.api.nvim_win_set_config(args.data.win_id, config)
         end,
      })
   end
}
