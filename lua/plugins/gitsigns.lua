return {
   'lewis6991/gitsigns.nvim',
   enabled = true,
   event = { "BufReadPre", "BufNewFile" },
   config = function ()
      require('gitsigns').setup {
         signs = {
            add          = { text = ''},
            change       = { text = ''},
            delete       = { text = ''},
            topdelete    = { text = ''},
            changedelete = { text = ''},
            untracked    = { text = '┆' },
         },
         signs_staged = {
            add          = { text = ''},
            change       = { text = ''},
            delete       = { text = ''},
            topdelete    = { text = ''},
            changedelete = { text = ''},
         },
         signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
         numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
         linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
         word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
         watch_gitdir = {
            interval = 1000,
            follow_files = true
         },
         attach_to_untracked = true,
         current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
         current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 1000,
            ignore_whitespace = false,
         },
         current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
         sign_priority = 6,
         update_debounce = 100,
         status_formatter = nil, -- Use default
         max_file_length = 40000,
         preview_config = {
            -- Options passed to nvim_open_win
            border = 'rounded',
            style = 'minimal',
            relative = 'cursor',
            row = 0,
            col = 1
         },
      }
   end
}
