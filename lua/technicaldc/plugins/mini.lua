return {
   "echasnovski/mini.nvim",
   version = '*',
   config = function ()
      -- NOTE:
      -- IMPORTS {{{
      local starter = require('mini.starter')
      local miniFiles = require('mini.files')
      local hipatterns = require('mini.hipatterns')
      local pick = require("mini.pick")
      local diff = require("mini.diff")
      local extras = require("mini.extra")
      local autocmd = vim.api.nvim_create_autocmd
      local map     = vim.keymap.set
      local headers = require("technicaldc.header_ascii")
      local show_dotfiles = true
      local filter_show = function(fs_entry) return true end
      -- }}}

      -- OPTS {{{
      local opts    = { buffer = true }
      local notify_opts = {
         ERROR = { duration = 5000, hl_group = 'DiagnosticError'  },
         WARN  = { duration = 5000, hl_group = 'DiagnosticWarn'   },
         INFO  = { duration = 5000, hl_group = 'DiagnosticInfo'   },
         DEBUG = { duration = 0,    hl_group = 'DiagnosticHint'   },
         TRACE = { duration = 0,    hl_group = 'DiagnosticOk'     },
         OFF   = { duration = 0,    hl_group = 'MiniNotifyNormal' },
      }
      -- }}}

      -- FUNCTIONS {{{
      local content_type_width = function(content, section_type)
         local coords = starter.content_coords(content, section_type)
         local width = math.max(unpack(vim.tbl_map(function(c)
            local line = content[c.line][c.unit].string
            return vim.fn.strdisplaywidth(line)
         end, coords)))
         return width
      end

      local win_config = function()
         local has_statusline = vim.o.laststatus > 0
         local pad = vim.o.cmdheight + (has_statusline and 1 or 0)
         return {
            -- title_pos = "center",
            anchor = 'SE',
            col = vim.o.columns,
            row = vim.o.lines - pad
         }
      end

      -- Centered on screen
      local pick_win_config = function()
         local height = math.floor(0.618 * vim.o.lines)
         local width = math.floor(0.618 * vim.o.columns)
         return {
            anchor = 'NW', height = height, width = width,
            row = math.floor(0.5 * (vim.o.lines - height)),
            col = math.floor(0.5 * (vim.o.columns - width)),
         }
      end

      local my_prefix = function(fs_entry)
         if fs_entry.fs_type == 'directory' then
            return ' ', 'MiniFilesDirectory'
         end
         return miniFiles.default_prefix(fs_entry)
      end

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
      -- }}}

      diff.setup({
         view = {
            style = "sign",
            signs = {
               add    = '┃',
               change = '┃',
               delete = '┃',
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
      require('mini.cursorword').setup()
      require('mini.clue').setup()
      require('mini.git').setup()
      require('mini.pick').setup({
         options = {
            content_from_bottom = true
         },
         window = {
            config = {
               width =  vim.o.columns <= 80 and vim.o.columns or math.floor(0.618 * vim.o.columns)
            },
            prompt_caret = "▓ ]",
            prompt_prefix = '[ ',
         }
      })
      require('mini.notify').setup({
         window = {
            winblend = 0,
            max_width_share = 0.333,
            config = win_config
         }
      })
      vim.notify = require('mini.notify').make_notify(notify_opts)

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

      require('mini.starter').setup( {
         autoopen = true,
         evaluate_single = true,
         items = {
            {
               name = 'browse files',
               action = 'lua require("mini.files").open(vim.uv.cwd(), true)',
               section = 'telescope'
            },
            {
               name = 'find files',
               action = 'Pick files',
               section = 'telescope'
            },
            {
               name = 'recent files',
               action = 'Pick oldfiles',
               section = 'telescope'
            },
            {
               name = 'new file',
               action = 'enew',
               section = 'builtin'
            },
            {
               name = 'update plugins',
               action = 'Lazy update',
               section = 'builtin'
            },
            {
               name = 'quit neovim',
               action = 'qall',
               section = 'builtin'
            },
         },

         header = headers.mini,
         footer = headers.mini_footer,
         content_hooks = {
            -- starter.gen_hook.adding_bullet(),
            function(content)
               -- Coords
               local header_width = content_type_width(content, "header")
               local section_width = content_type_width(content, "section")
               local item_width = content_type_width(content, "item")
               local footer_width = content_type_width(content, "footer")
               local max_width = math.max(header_width, section_width, item_width, footer_width)

               for _, line in ipairs(content) do
                  if not (#line == 0 or (#line == 1 and line[1].string == "")) then
                     local line_str = ""
                     local line_types = {}
                     for _, unit in ipairs(line) do
                        line_str = line_str .. unit.string
                        table.insert(line_types, unit.type)
                     end
                     local line_width = 0
                     for _, type in ipairs(line_types) do
                        if type == "item" or type == "section" then
                           line_width = math.max(item_width, section_width)
                        elseif type == "header" then
                           line_width = header_width
                        elseif type == "footer" then
                           line_width = footer_width
                        end
                     end
                     local left_pad = string.rep(" ", (max_width - line_width) * 0.5)

                     table.insert(line, 1, { string = left_pad, type = "empty" })
                  end
               end
               return content
            end,
            starter.gen_hook.aligning('center', 'center'),
         },
         -- Characters to update query. Each character will have special buffer
         -- mapping overriding your global ones. Be careful to not add `:` as it
         -- allows you to go into command mode.
         query_updaters = [[abcdefghilmoqrstuvwxyz0123456789_-,.ABCDEFGHIJKLMOQRSTUVWXYZ]],
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
         content = { prefix = my_prefix },
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
      vim.ui.select = pick.ui_select

      autocmd("User",{
         pattern = "MiniStarterOpened",
         callback = function(args)
            vim.b.miniindentscope_disable = true
            vim.opt_local.statuscolumn = ""
            map("n", "j", "<Cmd>lua MiniStarter.update_current_item('next')<CR>", opts)
            map("n", "k", "<Cmd>lua MiniStarter.update_current_item('prev')<CR>", opts)
         end
      })

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

      vim.keymap.set("n", "<leader>ff", "<CMD>Pick files<CR>", { desc = "Find files" } )
      vim.keymap.set("n", "<leader>fh", "<CMD>Pick help<CR>", { desc = "Find help files" } )
      vim.keymap.set("n", "<leader>fH", "<CMD>Pick hl_groups<CR>", { desc = "Find highlights" } )
      vim.keymap.set("n", "<leader>fk", "<CMD>Pick keymaps<CR>", { desc = "Find keymaps " } )
      vim.keymap.set("n", "<leader>fb", "<CMD>Pick buffers<CR>", { desc = "Find buffers" } )
      vim.keymap.set("n", "<leader>fe", "<CMD>Pick explorer<CR>", { desc = "Open explorer" } )
      vim.keymap.set("n", "<leader>fr", "<CMD>Pick oldfiles<CR>", { desc = "Find oldfiles" } )
      vim.keymap.set("n", "<leader>fg", "<CMD>Pick grep<CR>", { desc = "Grep word" } )

      vim.keymap.set( "n", "<leader>of", function()
         require("mini.files").open(vim.uv.cwd(), true)
      end,{ desc = "Open mini.files (cwd)" })

      vim.keymap.set("n", "<leader>oF", function()
         require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
      end, {desc = "Open mini.files (Directory of Current File)" })
   end
}
