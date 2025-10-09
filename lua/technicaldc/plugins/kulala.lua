return {
   "mistweaverco/kulala.nvim",
   keys = {
      { "<leader>Rs", desc = "Send request" },
      { "<leader>Ra", desc = "Send all requests" },
      { "<leader>Rb", desc = "Open scratchpad" },
   },
   ft = {"http", "rest"},
   opts = {
      global_keymaps = true,
      global_keymaps_prefix = "<leader>R",
      kulala_keymaps_prefix = "",
      ui = {
         display_mode = "float",
         win_opts = {
            width = 80,
            height = 20,
            border = "double",
            title = " kulala ",
            title_pos = "center",
            -- split = "vertical",
            -- bo = { number = true, wrap = true }, -- buffer options
            wo = { foldmethod = "indent" }, -- window options
         },
         icons = {
            inlay = {
               loading = "⏳",
               done = "✔",
               error = "✘",
            },
            lualine = "🐼",
            textHighlight = "WarningMsg", -- highlight group for request elapsed time
            loadingHighlight = "Normal",
            doneHighlight = "String",
            errorHighlight = "ErrorMsg",
         },
      }
   },
}
