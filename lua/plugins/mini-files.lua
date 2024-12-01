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
      require('mini.files').setup({
         windows = {
            -- Maximum number of windows to show side by side
            max_number = math.huge,
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
