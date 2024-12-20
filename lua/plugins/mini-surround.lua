return {
   "echasnovski/mini.surround",
   version = "*", -- Use for stability; omit to use `main` branch for the latest features
   -- event = "VeryLazy",
   config = function()
      require('mini.surround').setup({
         -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
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
   end
}
