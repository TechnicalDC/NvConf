return {
   "folke/snacks.nvim",
   priority = 1000,
   lazy = false,
   keys = {
      { "<leader>ff", function ()
         require("snacks").picker.files()
      end, desc = "Find files"    },
      { "<leader>fh", function ()
         require("snacks").picker.help()
      end, desc = "Find help files" },
      { "<leader>fs", function ()
         require("snacks").picker.lsp_symbols()
      end,  desc = "Find symbols"  },
      { "<leader>fS",function ()
         require("snacks").picker.lsp_workspace_symbols()
      end, desc = "Find workspace symbols" },
      { "<leader>fo", function ()
         require("snacks").picker.recent()
      end, desc = "Find recent files" },
      { "<leader>fb", function ()
         require("snacks").picker.buffers()
      end, desc = "Find buffers"  },

      {
         "<leader>lg", function ()
            require("snacks").lazygit.open()
         end,
         desc = "LazyGit"
      }
   },
   ---@type snacks.Config
   opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile      = { enabled = true },
      dashboard    = { enabled = true },
      explorer     = { enabled = true },
      indent       = { enabled = true },
      input        = { enabled = true },
      lazygit      = {
         enabled = true,
         win = { style = "float" }
      },
      picker       = {
         enabled = true,
         prompt = "   ",
         default = {
            layout = {
               box = "horizontal",
               width = 0.8,
               min_width = 120,
               height = 0.8,
               {
                  box = "vertical",
                  border = "single",
                  title = "{title} {live} {flags}",
                  { win = "input", height = 1, border = "bottom" },
                  { win = "list", border = "none" },
               },
               { win = "preview", title = "{preview}", border = "single", width = 0.5 },
            },
         }
      },
      notifier     = { enabled = true },
      quickfile    = { enabled = true },
      scope        = { enabled = true },
      scroll       = { enabled = true },
      statuscolumn = { enabled = true },
      words        = { enabled = true },
   },
}
