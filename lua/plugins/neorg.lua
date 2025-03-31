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
               { "<leader>on", function ()
                  local opts = {
                     cwd = default_workspace
                  }
                  require("snacks").picker.files(opts)
               end,  desc = "Open neorg notes"},
            },
            {
               mode = "n",
               { "<leader>oh", function ()
                  local opts = {
                     cwd = "~/Handy/"
                  }
                  require("snacks").picker.files(opts)
               end,  desc = "Open neorg notes"},
            }
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
                  -- config = { engine = { module_name = "external.lsp-completion" } },
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
               -- ["external.interim-ls"] = {
               --    config = {
               --       -- default config shown
               --       completion_provider = {
               --          -- Enable or disable the completion provider
               --          enable = true,
               --
               --          -- Show file contents as documentation when you complete a file name
               --          documentation = true,
               --
               --          -- Try to complete categories provided by Neorg Query. Requires `benlubas/neorg-query`
               --          categories = false,
               --
               --          -- suggest heading completions from the given file for `{@x|}` where `|` is your cursor
               --          -- and `x` is an alphanumeric character. `{@name}` expands to `[name]{:$/people:# name}`
               --          people = {
               --             enable = false,
               --
               --             -- path to the file you're like to use with the `{@x` syntax, relative to the
               --             -- workspace root, without the `.norg` at the end.
               --             -- ie. `folder/people` results in searching `$/folder/people.norg` for headings.
               --             -- Note that this will change with your workspace, so it fails silently if the file
               --             -- doesn't exist
               --             path = "people",
               --          }
               --       }
               --    }
               -- },
            },
         }
         -- vim.api.nvim_create_autocmd("LspAttach", {
         --    callback = function(args)
         --       local bufnr = args.buf
         --       local client = vim.lsp.get_client_by_id(args.data.client_id)
         --       if not client then return end
         --
         --       if client.server_capabilities.completionProvider then
         --          vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
         --       end
         --       -- ... your other lsp mappings
         --    end
         -- })
      end,
   }
}
