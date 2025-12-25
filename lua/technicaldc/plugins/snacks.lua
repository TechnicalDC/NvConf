local headers = require("technicaldc.header_ascii")

return {
   "folke/snacks.nvim",
   dependencies = { { "praczet/little-taskwarrior.nvim", opts = {} } },
   priority = 1000,
   lazy = false,
   keys = {
      { "<leader>ol", function() Snacks.lazygit.open() end,                                   desc = "Open lazygit" },
      { "<leader>oe", function() Snacks.explorer() end,                                       desc = "Open file explorer" },
      { "<leader>ff", function() Snacks.picker.files() end,                                   desc = "Find files" },
      { "<leader>fh", function() Snacks.picker.help({ layout = "ivy_no_preview" }) end,       desc = "Find help files" },
      { "<leader>fH", function() Snacks.picker.highlights({ layout = "ivy_no_preview" }) end, desc = "Find highlights" },
      { "<leader>fr", function() Snacks.picker.recent() end,                                  desc = "Find recent files" },
      { "<leader>fb", function() Snacks.picker.buffers({ layout = "ivy_no_preview" }) end,    desc = "Find buffers" },
      { "<leader>fw", function() Snacks.picker.grep_word() end,                               desc = "Find word under the cursor" },
      { "<leader>fW", function() Snacks.picker.grep() end,                                    desc = "Find word" },
      { "<leader>fm", function() Snacks.picker.marks() end,                                   desc = "Find Marks" },
      { "<leader>fs", function() Snacks.picker.spelling({ layout = "ivy_no_preview" }) end,   desc = "Fix spelling" },
      { "<leader>od", function ()
         Snacks.win({
            file = "/home/dilip/Handy/data_dictionary.d",
            width = 0.8,
            height = 0.8,
            border = "rounded",
            title = " data dictionary ",
            title_pos = "left",
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
                  { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                  { icon = " ", key = "f", desc = "Find File", action = "<leader>ff" },
                  { icon = " ", key = "b", desc = "Browse Files", action = "<leader>of" },
                  { icon = " ", key = "o", desc = "Open Notes", action = "<cmd>lua require('neowiki').open_wiki('notes')<cr>" },
                  { icon = " ", key = "s", desc = "Restore Session", action = ":lua MiniSessions.select()" },
                  { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                  { icon = " ", key = "q", desc = "Quit", action = ":qa" },
               }
            },
            sections = {
               {
                  { section = "header", padding = 1 },
                  {
                     title = "Little TaskWarrior",
                     enabled = vim.fn.executable("task") == 1,
                     icon = " ",
                     pane = 1,
                  },
                  {
                     text = ltw.get_snacks_dashboard_tasks(56, "dir", "error"),
                     enabled = vim.fn.executable("task") == 1,
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
                  { pane = 2, section = "startup", },
               }
            },
         },
         explorer = { enabled = true },
         input = { enabled = true },
         lazygit = {
            theme = {
               inactiveBorderColor = { fg = "SnacksPickerPreviewBorder" }
            }
         },
         notifier = {
            enabled = true,
            render = "minimal"
         },
         picker = {
            enabled = true,
            matcher = {
               frecency = true,
            },
            icons = {
               ui = {
                  selected   = "󰱒 ",
                  unselected = "󰄱 ",
               }
            },
            layout = {
               cycle = true,
               preset = function()
                  return vim.o.columns >= 120 and "ivy_preview" or "ivy_no_preview"
               end,
            },
            sources = {
               files = { exclude = { "*.png", "*.jpg", "*.jpeg" } },
               select = {
                  layout = {
                     preset = "ivy_no_preview",
                  },
               },
               explorer = {
                  layout = { preset = "explorer", preview = false },
                  config = function(opts)
                     return require("snacks.picker.source.explorer").setup(opts)
                  end,
                  win = {
                     list = {
                        keys = {
                           ["<BS>"] = "explorer_up",
                           ["l"] = "confirm",
                           ["h"] = "explorer_close", -- close directory
                           ["a"] = "explorer_add",
                           ["d"] = "explorer_del",
                           ["r"] = "explorer_rename",
                           ["c"] = "explorer_copy",
                           ["m"] = "explorer_move",
                           ["o"] = "explorer_open", -- open with system application
                           ["P"] = "toggle_preview",
                           ["y"] = { "explorer_yank", mode = { "n", "x" } },
                           ["p"] = "explorer_paste",
                           ["u"] = "explorer_update",
                           ["<c-c>"] = "tcd",
                           ["<leader>/"] = "picker_grep",
                           ["<c-t>"] = "terminal",
                           ["."] = "explorer_focus",
                           ["I"] = "toggle_ignored",
                           ["H"] = "toggle_hidden",
                           ["Z"] = "explorer_close_all",
                           ["]g"] = "explorer_git_next",
                           ["[g"] = "explorer_git_prev",
                           ["]d"] = "explorer_diagnostic_next",
                           ["[d"] = "explorer_diagnostic_prev",
                           ["]w"] = "explorer_warn_next",
                           ["[w"] = "explorer_warn_prev",
                           ["]e"] = "explorer_error_next",
                           ["[e"] = "explorer_error_prev",
                        },
                     },
                  },
               }
            },
            layouts = {
               ivy_preview = {
                  reverse = true,
                  layout = {
                     box = "vertical",
                     backdrop = false,
                     row = -1,
                     width = 0,
                     height = 0.5,
                     border = "top",
                     title = " {title} {live} {flags}",
                     title_pos = "left",
                     {
                        box = "horizontal",
                        { win = "list", border = "none" },
                        { win = "preview", title = "{preview}", width = 0.5, border = "rounded" },
                     },
                     { win = "input", height = 1, border = "none" },
                  },
               },
               ivy_no_preview = {
                  reverse = true,
                  hidden = { "preview" },
                  layout = {
                     box = "vertical",
                     backdrop = false,
                     row = -1,
                     width = 0,
                     height = 0.4,
                     border = "top",
                     title = " {title} {live} {flags}",
                     title_pos = "left",
                     {
                        box = "horizontal",
                        { win = "list", border = "none" },
                        { win = "preview", title = "{preview}", width = 0.5, border = "left" },
                     },
                     { win = "input", height = 1, border = "none" },
                  },
               },
               explorer = {
                  preview = "main",
                  layout = {
                     backdrop = false,
                     width = 40,
                     min_width = 40,
                     height = 0,
                     position = "left",
                     border = "none",
                     box = "vertical",
                     {
                        win = "input",
                        height = 1,
                        border = "none",
                        title = "{title} {live} {flags}",
                        title_pos = "center",
                     },
                     { win = "list", border = "none" },
                     { win = "preview", title = "{preview}", height = 0.4, border = "top" },
                  },
               }
            }
         },
         quickfile = { enabled = true },
         scroll = { enabled = true },
         statuscolumn = { enabled = true },
         styles = {
            lazygit = {
               backdrop = false,
               title = " Lazygit ",
               title_pos = "left",
               border = true
            }
         },
         words = { enabled = true },
      }

      require("snacks").setup(opts)
   end
}
