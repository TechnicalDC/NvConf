local dashboard
local chafa_dashboard = {
   {
      section = "terminal",
      cmd = "chafa ~/.config/nvim/res/coffee.jpg --format symbols --symbols vhalf --size 60x15 --stretch; sleep .1",
      height = vim.o.columns >= 120 and 15 or 10,
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

dashboard = vim.fn.executable("chafa") == 1 and chafa_dashboard or default_dashboard

local icons = {
   files = {
      enabled = true, -- show file icons
      dir = "󰉋 ",
      dir_open = "󰝰 ",
      file = "󰈔 "
   },
   keymaps = {
      nowait = "󰓅 "
   },
   tree = {
      vertical = "│ ",
      middle   = "├╴",
      last     = "╰╴",
      -- last     = "└╴",
   },
   undo = {
      saved   = " ",
   },
   ui = {
      live        = "󰐰 ",
      hidden      = " ",
      ignored     = "i",
      follow      = "f",
      selected    = " 󰱒 ",
      unselected  = " 󰄱 ",
   },
   git = {
      enabled   = true, -- show git icons
      commit    = "󰜘 ", -- used by git log
      staged    = "●", -- staged changes. always overrides the type icons
      added     = "",
      deleted   = "",
      ignored   = " ",
      modified  = "",
      renamed   = "",
      unmerged  = " ",
      untracked = "?",
   },
   diagnostics = {
      Error = " ",
      Warn  = " ",
      Hint  = " ",
      Info  = " ",
   },
   lsp = {
      unavailable = "",
      enabled = " ",
      disabled = " ",
      attached = "󰖩 "
   },
   kinds = {
      Array         = " ",
      Boolean       = "󰨙 ",
      Class         = " ",
      Color         = " ",
      Control       = " ",
      Collapsed     = " ",
      Constant      = "󰏿 ",
      Constructor   = " ",
      Copilot       = " ",
      Enum          = " ",
      EnumMember    = " ",
      Event         = " ",
      Field         = " ",
      File          = " ",
      Folder        = " ",
      Function      = "󰊕 ",
      Interface     = " ",
      Key           = " ",
      Keyword       = " ",
      Method        = "󰊕 ",
      Module        = " ",
      Namespace     = "󰦮 ",
      Null          = " ",
      Number        = "󰎠 ",
      Object        = " ",
      Operator      = " ",
      Package       = " ",
      Property      = " ",
      Reference     = " ",
      Snippet       = "󱄽 ",
      String        = " ",
      Struct        = "󰆼 ",
      Text          = " ",
      TypeParameter = " ",
      Unit          = " ",
      Unknown        = " ",
      Value         = " ",
      Variable      = "󰀫 ",
   },
}

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
      { "<leader>fk", function ()
         require("snacks").picker.keymaps()
      end, desc = "Find keymaps" },
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
         local opts = { on_show = function() vim.cmd.stopinsert() end }
         require("snacks").picker.buffers(opts)
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
         local opts = { on_show = function() vim.cmd.stopinsert() end }
         require("snacks").picker.undo(opts)
      end, desc = "Open undo tree"  },
      { "<leader>ol", function ()
            require("snacks").lazygit.open()
      end, desc = "LazyGit" },
      { "<leader>bd", function() require("snacks").bufdelete.delete() end, desc = "Delete current buffer" },
      { "<leader>tt", function() require("snacks").terminal.toggle() end, desc = "Toggle terminal" },
      { "<leader>.",  function() require("snacks").scratch() end, desc = "Toggle Scratch Buffer" },
      { "<leader>S", function()
         local opts = { on_show = function() vim.cmd.stopinsert() end }
         require("snacks").scratch.select(opts)
      end, desc = "Select Scratch Buffer" },
   },
   ---@type snacks.Config
   opts = {
      bigfile      = { enabled = true },
      bufdelete    = { enabled = true },
      dashboard    = {
         enabled = true,
         sections = dashboard,
      },
      explorer     = {
         enabled = true,
         replace_netrw = true,
      },
      image        = {
         enabled = true,
         inline = false,
         float = true,
      },
      indent       = {
         enabled = true,
         indent = {
            char = "",
            -- char = "│",
         },
         scope = {
            enabled = false,
            char = "",
            -- char = "│",
         },
         filter = function(buf)
            return vim.bo[buf].filetype == "lua"
                or vim.bo[buf].filetype == "progress"
                or vim.bo[buf].filetype == "rust"
                or vim.bo[buf].filetype == "go"
         end,
      },
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
         win = {
            style = "float",
         },
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
         icons = icons,
         layout = {
            preset = function()
               return vim.o.columns >= 120 and "default" or "dropdown"
            end,
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
            },
            sidebar = {
               preview = "main",
               layout = {
                  backdrop = false,
                  width = 40,
                  min_width = 40,
                  height = 0,
                  position = "left",
                  border = "rounded",
                  box = "vertical",
                  {
                     win = "input",
                     height = 1,
                     border = "bottom",
                     title = "{title} {live} {flags}",
                     title_pos = "center",
                  },
                  { win = "list", border = "none" },
                  { win = "preview", title = "{preview}", height = 0.4, border = "top" },
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
         top_down = false,
         style = "compact"
         -- style = function(buf, notif, ctx)
         --    local title = vim.trim(notif.icon .. " " .. (notif.title or ""))
         --    if title ~= "" then
         --       ctx.opts.title = { { " " .. title .. " ", ctx.hl.title } }
         --       ctx.opts.title_pos = "center"
         --    end
         --    vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(notif.msg, "\n"))
         -- end,
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
      terminal     = {
         enabled = true,
         win = {
            style = "terminal",
            border = "rounded"
         }
      },
      win          = {
         enabled = true,
         show = true,
         fixbuf = true,
         title_pos = "center",
         relative = "editor",
         position = "float",
         wo = {
            winhighlight = "Normal:SnacksNormal,NormalNC:SnacksNormalNC,WinBar:SnacksWinBar,WinBarNC:SnacksWinBarNC",
         },
         bo = {},
         keys = {
            q = "close",
         },
      },
      words        = { enabled = true },
   },
}
