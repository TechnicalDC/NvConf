return {
   "folke/snacks.nvim",
   priority = 1000,
   lazy = false,
   keys = {
      { "<leader>ff", function() Snacks.picker.files() end,      desc = "Find files" },
      { "<leader>fh", function() Snacks.picker.help() end,       desc = "Find help files" },
      { "<leader>fH", function() Snacks.picker.highlights() end, desc = "Find highlights" },
      { "<leader>fr", function() Snacks.picker.recent() end,     desc = "Find recent files" },
      { "<leader>fb", function() Snacks.picker.buffers() end,    desc = "Find buffers" },
      { "<leader>fw", function() Snacks.picker.grep_word() end,  desc = "Find word under the cursor" },
      { "<leader>fW", function() Snacks.picker.grep() end,       desc = "Find word" },
      { "<leader>fs", function() Snacks.picker.spelling() end,   desc = "Fix spelling" },
   },
   opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = {
         enabled = true,
         preset = {
            pick = "telescope.nvim",
            keys = {
               { icon = " ", key = "f", desc = "Find File", action = "<leader>ff" },
               { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
               { icon = " ", key = "g", desc = "Find Text", action = "<leader>fW" },
               { icon = " ", key = "r", desc = "Recent Files", action = "<leader>fr" },
               { icon = " ", key = "b", desc = "Browse Files", action = "<leader>fo" },
               { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
               { icon = " ", key = "q", desc = "Quit", action = ":qa" },
            }
         },
         sections = {
            {
               section = "terminal",
               cmd = "chafa ~/.config/nvim/assets/rose-pine.jpg --format symbols --symbols vhalf --size 60x17 --stretch; sleep .1",
               height = 10,
               padding = 1,
            },
            { section = "keys", gap = 1, padding = 1 },
            { section = "startup" },
         },
      },
      input = { enabled = true },
      notifier = {
         enabled = true,
         style = "fancy",
      },
      picker = { enabled = true },
      quickfile = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
   },
}
