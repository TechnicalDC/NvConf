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
      { "<leader>fr", function ()
         require("snacks").picker.recent()
      end, desc = "Find recent files" },
      { "<leader>fb", function ()
         require("snacks").picker.buffers()
      end, desc = "Find buffers"  },
      { "<leader>fi", function ()
         require("snacks").picker.icons()
      end, desc = "Find icons"  },

      { "<leader>e", function ()
         require("snacks").explorer.open()
      end, desc = "Open file explorer"  },
      {
         "<leader>lg", function ()
            require("snacks").lazygit.open()
         end,
         desc = "LazyGit"
      },
      { "<leader>.",  function() require("snacks").scratch() end, desc = "Toggle Scratch Buffer" },
      { "<leader>S",  function() require("snacks").scratch.select() end, desc = "Select Scratch Buffer" },
   },
   ---@type snacks.Config
   opts = {
      bigfile      = { enabled = true },
      bufdelete    = { enabled = true },
      dashboard    = { enabled = true },
      explorer     = { enabled = true },
      indent       = { enabled = true },
      input        = {
         enabled = true,
         win = {
            style = {
               border = "rounded"
            }
         }
      },
      lazygit      = {
         enabled = true,
         win = { style = "float" }
      },
      picker       = {
         enabled = true,
         prompt = "   ",
         layout = {
            preset = "default",
            cycle = true
         },
         layouts = {
            default = {
               layout = {
                  box = "horizontal",
                  width = 0.8,
                  min_width = 120,
                  height = 0.8,
                  {
                     box = "vertical",
                     border = "rounded",
                     title = "{title} {live} {flags}",
                     { win = "input", height = 1, border = "bottom" },
                     { win = "list", border = "none" },
                  },
                  { win = "preview", title = "{preview}", border = "rounded", width = 0.5 },
               },
            },
            dropdown = {
               layout = {
                  backdrop = false,
                  row = 1,
                  width = 0.4,
                  min_width = 80,
                  height = 0.8,
                  border = "none",
                  box = "vertical",
                  { win = "preview", title = "{preview}", height = 0.4, border = "rounded" },
                  {
                     box = "vertical",
                     border = "rounded",
                     title = "{title} {live} {flags}",
                     title_pos = "center",
                     { win = "input", height = 1, border = "bottom" },
                     { win = "list", border = "none" },
                  },
               },
            }
         }
      },
      notifier     = {
         enabled = true,
         style =  {
            border = "rounded",
            zindex = 100,
            ft = "markdown",
            wo = {
               winblend = 5,
               wrap = false,
               conceallevel = 2,
               colorcolumn = "",
            },
            bo = { filetype = "snacks_notif" },
         }
      },
      quickfile    = { enabled = true },
      scope        = { enabled = true },
      scratch      = {
         enabled = true,
         win = {
            style = {
               width = 100,
               height = 20,
               bo = { buftype = "", buflisted = false, bufhidden = "hide", swapfile = false },
               minimal = false,
               noautocmd = false,
               -- position = "right",
               zindex = 20,
               wo = { winhighlight = "NormalFloat:Normal" },
               border = "rounded",
               title_pos = "center",
               footer_pos = "center",
            }
         }
      },
      scroll       = { enabled = true },
      statuscolumn = { enabled = true },
      -- terminal     = { enabled = true },
      -- toggle       = { enabled = true },
      words        = { enabled = true },
   },
}
