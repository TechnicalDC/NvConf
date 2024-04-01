return {
   {
      "vhyrro/luarocks.nvim",
      priority = 1000, -- We'd like this plugin to load first out of the rest
      config = true, -- This automatically runs `require("luarocks-nvim").setup()`
   },
   {
      "nvim-neorg/neorg",
      dependencies = {
         "nvim-lua/plenary.nvim",
      },
      event = "VimEnter",
      lazy = false,
      config = function()
         require("neorg").setup {
            load = {
               ["core.defaults"] = {}, -- Loads default behaviour
               ["core.concealer"] = {}, -- Adds pretty icons to your documents
               ["core.summary"] = {},
               ["core.looking-glass"] = {},
               -- ["core.ui.calendar"] = {},
               -- ["core.completion"] = {
                  -- 	engine = "nvim-cmp",
                  -- 	name	 = "(neorg)"
                  -- },
                  ["core.dirman"] = { -- Manages Neorg workspaces
                  config = {
                     workspaces = {
                        work  = "~\\Desktop\\WORK\\Neorg",
                        personal = "~\\Desktop\\PERSONAL\\Neorg"
                     },
                     default_workspace = "personal",
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
