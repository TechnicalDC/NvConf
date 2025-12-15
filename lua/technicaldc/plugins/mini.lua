return {
   "echasnovski/mini.nvim",
   version = '*',
   -- event = { "BufReadPre", "BufNewFile" },
   lazy = false,
   keys = {
      -- MiniFiles
      { "<leader>of", function() require("mini.files").open(vim.uv.cwd(), true) end, desc = "Open mini.files (cwd)" },
      { "<leader>oF", function() require("mini.files").open(vim.api.nvim_buf_get_name(0), true) end, desc = "Open mini.files (Directory of Current File)" },
      -- MiniSessions
      { "<leader>ss", "<cmd>mksession!<cr>", desc = "Create session (local)" },
      { "<leader>so", "<cmd>lua MiniSessions.select()<cr>", desc = "Open session" },
      { "<leader>sw", "<cmd>lua MiniSessions.write()<cr>", desc = "Write session" },
      { "<leader>sS", function ()
         local session_dir = vim.fn.stdpath("data") .. "/session/"
         vim.ui.input({ prompt = 'Session name' }, function(session_name)
            if vim.fn.filereadable(session_dir .. session_name) == 0 then
               vim.cmd("mksession! " .. session_dir .. session_name)
            end
         end)
      end, desc = "Create session (global)" },

      -- { "<leader>rw", "<cmd> lua MiniTrailspace.trim()<cr>" desc = "Remove whitespaces" },
   },
   config = function ()
      -- NOTE:
      -- IMPORTS {{{
      local miniFiles     = require('mini.files')
      local hipatterns    = require('mini.hipatterns')
      local diff          = require("mini.diff")
      local extras        = require("mini.extra")
      -- local trailspace    = require('mini.trailspace')
      local autocmd       = vim.api.nvim_create_autocmd
      local show_dotfiles = true
      -- }}}

      -- FUNCTIONS {{{
      local filter_hide = function(fs_entry)
         return not vim.startswith(fs_entry.name, '.')
      end

      local toggle_dotfiles = function()
         show_dotfiles = not show_dotfiles
         local new_filter = show_dotfiles and true or filter_hide
         miniFiles.refresh({ content = { filter = new_filter } })
      end
      -- }}}

      diff.setup({
         view = {
            style = "sign",
            signs = {
               add    = '▌',
               change = '▌',
               delete = '▌',
            }
         }
      })
      hipatterns.setup({
         highlighters = {
            fixme = { pattern = ' FIXME:', group = 'MiniHipatternsFixme' },
            hack  = { pattern = ' HACK:',  group = 'MiniHipatternsHack'  },
            todo  = { pattern = ' TODO:',  group = 'MiniHipatternsTodo'  },
            note  = { pattern = ' NOTE:',  group = 'MiniHipatternsNote'  },
            debug = { pattern = ' DEBUG:',  group = 'MiniHipatternsHack'  },
            hex_color = hipatterns.gen_highlighter.hex_color(),
         }
      })
      require('mini.align').setup()
      require('mini.ai').setup()
      require('mini.git').setup()
      require('mini.icons').setup({
         filetype = {
            progress = { glyph = "" }
         },
      })
      require('mini.sessions').setup()
      -- trailspace.setup({
         -- Highlight only in normal buffers (ones with empty 'buftype'). This is
         -- useful to not show trailing whitespace where it usually doesn't matter.
         -- only_in_normal_buffers = true,
      -- })
      require('mini.bracketed').setup({
         -- First-level elements are tables describing behavior of a target:
         --
         -- - <suffix> - single character suffix. Used after `[` / `]` in mappings.
         --   For example, with `b` creates `[B`, `[b`, `]b`, `]B` mappings.
         --   Supply empty string `''` to not create mappings.
         --
         -- - <options> - table overriding target options.
         --
         -- See `:h MiniBracketed.config` for more info.

         buffer     = { suffix = 'b', options = {} },
         comment    = { suffix = 'c', options = {} },
         conflict   = { suffix = 'x', options = {} },
         diagnostic = { suffix = 'd', options = {} },
         file       = { suffix = 'f', options = {} },
         indent     = { suffix = 'i', options = {} },
         jump       = { suffix = 'j', options = {} },
         location   = { suffix = 'l', options = {} },
         oldfile    = { suffix = 'o', options = {} },
         quickfix   = { suffix = 'q', options = {} },
         treesitter = { suffix = 't', options = {} },
         undo       = { suffix = 'u', options = {} },
         window     = { suffix = 'w', options = {} },
         yank       = { suffix = 'y', options = {} },
      })

      require('mini.move').setup({
         -- Module mappings. Use `''` (empty string) to disable one.
         mappings = {
            -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
            left = '',
            right = '',
            down = 'J',
            up = 'K',
            -- Move current line in Normal mode
            line_left = '',
            line_right = '',
            line_down = '<M-S-j>',
            line_up = '<M-S-k>',
         },
         -- Options which control moving behavior
         options = {
            -- Automatically reindent selection during linewise vertical move
            reindent_linewise = true,
         },
      })

      require('mini.operators').setup({
         -- Each entry configures one operator.
         -- `prefix` defines keys mapped during `setup()`: in Normal mode
         -- to operate on textobject and line, in Visual - on selection.

         -- Evaluate text and replace with output
         evaluate = {
            prefix = 'g=',

            -- Function which does the evaluation
            func = nil,
         },

         -- Exchange text regions
         exchange = {
            prefix = 'gx',

            -- Whether to reindent new text to match previous indent
            reindent_linewise = true,
         },

         -- Multiply (duplicate) text
         multiply = {
            prefix = 'gm',

            -- Function which can modify text before multiplying
            func = nil,
         },

         -- Replace text with register
         replace = {
            prefix = 'gr',

            -- Whether to reindent new text to match previous indent
            reindent_linewise = true,
         },

         -- Sort text
         sort = {
            prefix = 'gs',

            -- Function which does the sort
            func = nil,
         }
      })

      require('mini.pairs').setup({
         -- In which modes mappings from this `config` should be created
         modes = { insert = true, command = false, terminal = false },

         -- Global mappings. Each right hand side should be a pair information, a
         -- table with at least these fields (see more in |MiniPairs.map|):
         -- - <action> - one of 'open', 'close', 'closeopen'.
         -- - <pair> - two character string for pair to be used.
         -- By default pair is not inserted after `\`, quotes are not recognized by
         -- `<CR>`, `'` does not insert pair after a letter.
         -- Only parts of tables can be tweaked (others will use these defaults).
         mappings = {
            ['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\].' },
            ['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\].' },
            ['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\].' },

            [')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
            [']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
            ['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },

            ['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '[^\\].', register = { cr = true } },
            ["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '[^%a\\].', register = { cr = false } },
            ['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '[^\\].', register = { cr = false } },
         },
      })

      require('mini.splitjoin').setup({
         -- Module mappings. Use `''` (empty string) to disable one.
         -- Created for both Normal and Visual modes.
         mappings = {
            toggle = '<leader>ts',
            split = '',
            join = '',
         },

         -- Detection options: where split/join should be done
         detect = {
            -- Array of Lua patterns to detect region with arguments.
            -- Default: { '%b()', '%b[]', '%b{}' }
            brackets = nil,

            -- String Lua pattern defining argument separator
            separator = ',',

            -- Array of Lua patterns for sub-regions to exclude separators from.
            -- Enables correct detection in presence of nested brackets and quotes.
            -- Default: { '%b()', '%b[]', '%b{}', '%b""', "%b''" }
            exclude_regions = nil,
         },

         -- Split options
         split = {
            hooks_pre = {},
            hooks_post = {},
         },

         -- Join options
         join = {
            hooks_pre = {},
            hooks_post = {},
         },
      })

      require('mini.surround').setup({
         highlight_duration = 500,
         -- Module mappings. Use `''` (empty string) to disable one.
         mappings = {
            add = 'sa', -- Add surrounding in Normal and Visual modes
            delete = 'sd', -- Delete surrounding
            find = 'sf', -- Find surrounding (to the right)
            find_left = 'sF', -- Find surrounding (to the left)
            highlight = 'sh', -- Highlight surrounding
            replace = 'sr', -- Replace surrounding
            update_n_lines = 'sn', -- Update `n_lines`
            suffix_last = 'l', -- Suffix to search with "prev" method
            suffix_next = 'n', -- Suffix to search with "next" method
         },
         -- Whether to disable showing non-error feedback
         silent = false,
      })

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
         windows = {
            -- Maximum number of windows to show side by side
            max_number = 3,
            -- Whether to show preview of file/directory under cursor
            preview = true,
            -- Width of focused window
            width_focus = 30,
            -- Width of non-focused window
            width_nofocus = 30,
            -- Width of preview window
            width_preview = 50,
         },
      })

      extras.setup()

      autocmd('User', {
         pattern = 'MiniFilesBufferCreate',
         callback = function(args)
            local buf_id = args.data.buf_id
            -- Tweak left-hand side of mapping to your liking
            vim.keymap.set('n', 'g.', toggle_dotfiles, { buffer = buf_id })
         end
      })

      autocmd('User', {
         pattern = 'MiniFilesWindowUpdate',
         callback = function(args)
            local config = vim.api.nvim_win_get_config(args.data.win_id)

            vim.wo[args.data.win_id].number = true
            vim.wo[args.data.win_id].relativenumber = true
            vim.wo[args.data.win_id].statuscolumn = "%s%=%{v:relnum ? v:relnum : v:lnum} "

            vim.api.nvim_win_set_config(args.data.win_id, config)
         end,
      })

      -- autocmd('FileType', {
      --    pattern = "snacks_dashboard",
      --    callback = function(args)
      --       vim.b[args.buf].minitrailspace_disable = true
      --    end
      -- })
   end
}
