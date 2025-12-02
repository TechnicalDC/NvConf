local headers = require("technicaldc.header_ascii")

return {
   "folke/snacks.nvim",
   dependencies = { { "praczet/little-taskwarrior.nvim", opts = {} } },
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
      { "<leader>od", function ()
         Snacks.win({
            file = "/home/dilip/Handy/data_dictionary.d",
            width = 0.8,
            height = 0.8,
            border = "rounded",
            wo = {
               spell = false,
               wrap = false,
               signcolumn = "yes",
               statuscolumn = " ",
               conceallevel = 3,
            },
         })
      end, desc = "Open data dictionary"}
   },
   config = function ()
      local ltw = require("little-taskwarrior")
      ltw.setup({})
      local opts = {
         bigfile = { enabled = true },
         dashboard = {
            enabled = true,
            preset = {
               pick = "telescope.nvim",
               header = headers.nvchad,
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
                  { section = "header", padding = 1 },
                  { pane = 2, title = "Shortcuts", padding = 1 },
                  { pane = 2, section = "keys", padding = 1, indent = 2 },
                  {
                     title = "Little TaskWarrior",
                     pane = 2,
                     padding = 1
                  },
                  {
                     text = ltw.get_snacks_dashboard_tasks(56, "dir", "special"),
                     pane = 2,
                     indent = 2,
                  },
               }
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
      }

      require("snacks").setup(opts)
   end
}
