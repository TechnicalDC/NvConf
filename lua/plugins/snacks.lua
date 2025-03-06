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
      },
      { "<leader>.",  function() require("snacks").scratch() end, desc = "Toggle Scratch Buffer" },
      { "<leader>S",  function() require("snacks").scratch.select() end, desc = "Select Scratch Buffer" },
   },
   ---@type snacks.Config
   opts = {
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
         layout = {
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
      notifier     = {
         enabled = true,
         style =  {
            notfication = {
               border = "single",
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
               border = "single",
               title_pos = "center",
               footer_pos = "center",
            }         }
         },
         scroll       = { enabled = true },
         statuscolumn = { enabled = true },
         words        = { enabled = true },
      },
   }
