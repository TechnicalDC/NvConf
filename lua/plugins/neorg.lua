return {
   {
      "nvim-neorg/neorg",
      dependencies = {
         "nvim-lua/plenary.nvim",
      },
      event = "VimEnter",
      version = "v7.0.0", -- This is the important part!
      lazy = false,
      config = function()
         local snacks = require("snacks")
         local default_workspace = "~/Neorg/"

         local ok, wk = pcall(require, 'which-key')
         wk.add({
            {
               mode = "n",
               { "<leader>on", function ()
                  local opts = {
                     cwd = default_workspace
                  }
                  require("snacks").picker.files(opts)
               end,  desc = "Open neorg notes"},
               { "<leader>oh", function ()
                  local opts = {
                     cwd = "~/Handy/"
                  }
                  require("snacks").picker.files(opts)
               end,  desc = "Open neorg notes"},
               { "<leader>oH", function ()
                  snacks.win({
                     file = vim.api.nvim_get_runtime_file("doc/neorg.norg", false)[1],
                     title = " neorg.norg ",
                     border = "rounded",
                     width = 0.6,
                     height = 0.8,
                     wo = {
                        spell = false,
                        wrap = false,
                        signcolumn = "no",
                        statuscolumn = " ",
                        conceallevel = 3,
                     },
                  })
               end, desc = "Open neorg help"}
            }
         })

         require("neorg").setup {
            load = {
               ["core.defaults"] = {},
               ["core.concealer"] = {
                  config = {
                     folds = true,
                     icon_preset = "varied",
                     icons = {
                        todo = {
                           undone = { icon = " " },
                           pending = { icon = " " },
                           urgent = { icon = "!" },
                           uncertain = { icon = "!" },
                           on_hold = { icon = "-" },
                           cancelled = { icon = "x" },
                        }
                     },
                  }
               },
               ["core.summary"] = {},
               ["core.export"] = {},
               ["core.looking-glass"] = {},
               ["core.tempus"] = {},
               ["core.ui.calendar"] = {},
               ["core.dirman"] = {
                  config = {
                     workspaces = {
                        default  = default_workspace,
                     },
                     default_workspace = "default",
                  },
               },
               ["core.keybinds"] = {
                  config = {
                     default_keybinds = true,
                     neorg_leader = ";",
                     -- hook = function(keybinds)
                        -- Unmaps any Neorg key from the `norg` mode
                        -- keybinds.unmap("norg", "n", "gtd")

                        -- Binds the `gtd` key in `norg` mode to execute `:echo 'Hello'`
                        -- keybinds.map("norg", "n", "<leader>td", "<cmd>echo 'Hello!'<CR>")

                        -- Remap unbinds the current key then rebinds it to have a different action
                        -- associated with it.
                        -- The following is the equivalent of the `unmap` and `map` calls you saw above:
                        -- keybinds.remap("norg", "n", "gtd", "<cmd>echo 'Hello!'<CR>")

                        -- Sometimes you may simply want to rebind the Neorg action something is bound to
                        -- versus remapping the entire keybind. This remap is essentially the same as if you
                        -- did `keybinds.remap("norg", "n", "<C-Space>, "<cmd>Neorg keybind norg core.qol.todo_items.todo.task_done<CR>")
                        -- keybinds.remap_event("norg", "n", "<LocalLeader>td", "core.qol.todo_items.todo.task_done")
                        -- keybinds.remap_event("norg", "n", "<LocalLeader>tu", "core.qol.todo_items.todo.task_undone")
                        -- keybinds.remap_event("norg", "n", "<LocalLeader>tc", "core.qol.todo_items.todo.task_cancelled")

                        -- Want to move one keybind into the other? `remap_key` moves the data of the
                        -- first keybind to the second keybind, then unbinds the first keybind.
                        -- keybinds.remap_key("norg", "n", "<C-Space>", "<Leader>t")
                        -- end,
                     }
                  },
               }
            }
         end,
      }
   }
