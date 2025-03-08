local dashboard
local chafa_dashboard = {
   {
      section = "terminal",
      cmd = "chafa ~/.config/nvim/res/chafa.jpeg --format symbols --symbols vhalf --size 60x15 --stretch; sleep .1",
      height = 15,
      padding = 1,
   },
   {
      pane = 2,
      { section = "keys", gap = 1, padding = 1 },
      { section = "startup" },
   },
}
local default_dashboard = {
   { section = "header" },
   { section = "keys", gap = 1 },
   { section = "startup" },
}
if vim.fn.executable("chafa") then
   dashboard = chafa_dashboard
else
   dashboard = default_dashboard
end

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
      { "<leader>fc", function ()
         require("snacks").picker.cliphist()
      end, desc = "Find cliphist"  },
      { "<leader>fz", function ()
         require("snacks").picker.zoxide()
      end, desc = "Find zoxide"  },

      { "<leader>oe", function ()
         require("snacks").explorer.open()
      end, desc = "Open file explorer"  },
      { "<leader>ou", function ()
         require("snacks").picker.undo()
      end, desc = "Open undo tree"  },
      { "<leader>lg", function ()
            require("snacks").lazygit.open()
      end, desc = "LazyGit" },
      { "<leader>.",  function() require("snacks").scratch() end, desc = "Toggle Scratch Buffer" },
      { "<leader>S",  function() require("snacks").scratch.select() end, desc = "Select Scratch Buffer" },
   },
   ---@type snacks.Config
   opts = {
      bigfile      = { enabled = true },
      bufdelete    = { enabled = true },
      dashboard    = {
         enabled = true,
         sections = dashboard,
      },
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
         configure = true,
         win = { style = "float" },
         theme = {
            [241]                      = { fg = "Special" },
            activeBorderColor          = { fg = "FloatTitle", bold = true },
            inactiveBorderColor        = { fg = "FloatBorder" },
            cherryPickedCommitBgColor  = { fg = "Character" },
            cherryPickedCommitFgColor  = { fg = "Function" },
            defaultFgColor             = { fg = "Normal" },
            optionsTextColor           = { fg = "Special" },
            searchingActiveBorderColor = { fg = "MatchParen", bold = true },
            selectedLineBgColor        = { bg = "PmenuThumb" }, -- set to `default` to have no background colour
            unstagedChangesColor       = { fg = "DiagnosticError" },
         },
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
         },
         -- TODO: Adding preset
         sources = {
            icons = { layout = { preset = "select" } },
            cliphist = { layout = { preset = "select" } },
            colorschemes = { layout = { preset = "select" } },
            command_history = { layout = { preset = "select" } },
            command = { layout = { preset = "select" } },
            keymaps = { layout = { preset = "select" } },
            notifications = { layout = { preset = "select" } },
            pick = { layout = { preset = "select" } },
            picker_actions = { layout = { preset = "select" } },
            picker_format = { layout = { preset = "select" } },
            pickers = { layout = { preset = "select" } },
            registers = { layout = { preset = "select" } },
            search_history = { layout = { preset = "select" } },
            spelling = { layout = { preset = "select" } },
            undo = { layout = { preset = "sidebar" } },
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
