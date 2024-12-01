return {
   'echasnovski/mini.indentscope',
   version = '*',
   config = function ()
      require('mini.indentscope').setup({
         -- Options which control scope computation
         options = {
            -- Type of scope's border: which line(s) with smaller indent to
            -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
            border = 'both',

            -- Whether to use cursor column when computing reference indent.
            -- Useful to see incremental scopes with horizontal cursor movements.
            indent_at_cursor = true,

            -- Whether to first check input line to be a border of adjacent scope.
            -- Use it if you want to place cursor on function header to get scope of
            -- its body.
            try_as_border = false,
         },

         -- Which character to use for drawing scope indicator
         symbol = '╎'
      })
   end
}
