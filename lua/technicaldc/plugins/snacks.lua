return {
   "folke/snacks.nvim",
   priority = 1000,
   lazy = false,
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
               { icon = " ", key = "r", desc = "Recent Files", action = "<leader>fo" },
               { icon = " ", key = "s", desc = "Restore Session", section = "session" },
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
            { title = "Bookmarks", padding = 1 },
            { section = "keys", gap = 1, padding = 1 },
            { section = "startup" },
         },
      },
      input = { enabled = true },
      notifier = {
         enabled = true,
         style = "fancy",
      },
      quickfile = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
   },
}
