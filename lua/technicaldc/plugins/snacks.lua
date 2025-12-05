local headers = require("technicaldc.header_ascii")

return {
   "folke/snacks.nvim",
   dependencies = { { "praczet/little-taskwarrior.nvim", opts = {} } },
   priority = 1000,
   lazy = false,
   keys = {
      { "<leader>ol", function() Snacks.lazygit.open() end,      desc = "Open lazygit" },
      { "<leader>ff", function() Snacks.picker.files() end,      desc = "Find files" },
      { "<leader>fh", function() Snacks.picker.help() end,       desc = "Find help files" },
      { "<leader>fH", function() Snacks.picker.highlights({ layout = "select" }) end, desc = "Find highlights" },
      { "<leader>fr", function() Snacks.picker.recent() end,     desc = "Find recent files" },
      { "<leader>fb", function() Snacks.picker.buffers() end,    desc = "Find buffers" },
      { "<leader>fw", function() Snacks.picker.grep_word() end,  desc = "Find word under the cursor" },
      { "<leader>fW", function() Snacks.picker.grep() end,       desc = "Find word" },
      { "<leader>fm", function() Snacks.picker.marks() end,      desc = "Find Marks" },
      { "<leader>fs", function() Snacks.picker.spelling({ layout = "select" }) end,   desc = "Fix spelling" },
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
                  { icon = " ", key = "b", desc = "Browse Files", action = "<leader>fo" },
                  { icon = " ", key = "q", desc = "Quit", action = ":qa" },
               }
            },
            sections = {
               {
                  { section = "header", padding = 1 },
                  {
                     title = "Little TaskWarrior",
                     icon = " ",
                     pane = 1,
                  },
                  {
                     text = ltw.get_snacks_dashboard_tasks(56, "dir", "error"),
                     pane = 1,
                     indent = 2,
                  },
                  { pane = 2, title = "Shortcuts", icon = " " },
                  { pane = 2, section = "keys", padding = 1, indent = 2 },
                  {
                     pane = 2,
                     icon = " ",
                     title = "Recent Files",
                     section = "recent_files",
                     indent = 2,
                     padding = 1,
                     limit = 5
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
