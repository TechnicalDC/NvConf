local default_workspace = ""
if vim.fn.has("win32") == 1 then
   default_workspace = "work"
else
   default_workspace = "personal"
end

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
         require("neorg").setup {
            load = {
               ["core.defaults"] = {}, -- Loads default behaviour
               ["core.concealer"] = {
                  config = {
                     folds = true,
                     icon_present = "diamond",
                  }
               }, -- Adds pretty icons to your documents
               ["core.summary"] = {},
               ["core.export"] = {},
               ["core.looking-glass"] = {},
               -- ["core.tempus"] = {},
               -- ["core.ui.calendar"] = {},
               ["core.integrations.nvim-cmp"] = {},
               ["core.completion"] = {
                  config = {
                     engine = "nvim-cmp",
                     name	 = "(neorg)"
                  }
               },
               ["core.dirman"] = { -- Manages Neorg workspaces
                  config = {
                     workspaces = {
                        work  = "/mnt/d/WORK/Neorg",
                        personal = "~/Neorg"
                     },
                     default_workspace = "work",
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
