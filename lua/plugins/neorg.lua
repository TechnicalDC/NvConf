return {
   {
      "nvim-neorg/neorg",
      dependencies = {
         "benlubas/neorg-interim-ls",
         "nvim-lua/plenary.nvim",
      },
      event = "VimEnter",
      version = "v7.0.0", -- This is the important part!
      lazy = false,
      config = function()
         local default_workspace = "~/Neorg/"

         local ok, wk = pcall(require, 'which-key')
         wk.add({
            {
               mode = "n",
               { "<leader>n", function ()
                  local opts = {
                     cwd = default_workspace
                  }
                  require("snacks").picker.files(opts)
               end,  desc = "Open neorg notes"},
            },
            -- {
            --    mode = "n",
            --    { "<leader>h", function ()
            --       local opts = {
            --          cwd = "~/Handy/"
            --       }
            --       require("snacks").picker.files(opts)
            --    end,  desc = "Open neorg notes"},
            -- }
         })

         require("neorg").setup {
            load = {
               ["core.defaults"] = {}, -- Loads default behaviour
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
               }, -- Adds pretty icons to your documents
               ["core.summary"] = {},
               ["core.export"] = {},
               ["core.looking-glass"] = {},
               ["core.tempus"] = {},
               ["core.ui.calendar"] = {},
               -- ["core.integrations.nvim-cmp"] = {},
               -- ["core.completion"] = {
               --    config = {
               --       engine = "nvim-cmp",
               --       name	 = "(neorg)"
               --    }
               -- },
               ["core.dirman"] = { -- Manages Neorg workspaces
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
            },
         }
      end,
   }
}
