---@diagnostic disable: unused-local
-- on_attach {{{
local on_attach = function(client, bufnr)
   local hoverOpts = {
      border = "rounded",
      title = "hover",
      title_pos = "center"
   }
   local bufopts = { noremap=true, silent=true, buffer=bufnr }
   local ok, wk = pcall(require, 'which-key')
   if ok then
      wk.add({
         mode = "n",
         {"<leader>oc", vim.lsp.buf.code_action,                     desc = "Open code actions" },
         {"<leader>rn", vim.lsp.buf.rename,                          desc = "Rename" },
         {"<leader>D",  vim.lsp.buf.type_definition,                 desc = "Go to type definition"},
         {"<leader>F",  vim.lsp.buf.formatting,                      desc = "Format code"},
         {"<leader>wa", vim.lsp.buf.add_workspace_folder,            desc = "Add folder to workspace"},
         {"<leader>wr", vim.lsp.buf.remove_workspace_folder,         desc = "Remove folder from workspace"},
         {"<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
         end, desc = "List workspace folder"},
         {"<leader>K",  function ()
            vim.lsp.buf.hover(hoverOpts)
         end, desc = "Hover docs" },
         {"<leader>gd", vim.lsp.buf.definition,                      desc = "Go to definition"},
         {"<leader>gD", vim.lsp.buf.declaration,                     desc = "Go to declaration"},
         {"<leader>gi", vim.lsp.buf.implementation,                  desc = "Go to implementation"},
         {"<leader>gr", vim.lsp.buf.references,                      desc = "Go to references"},
         {"[d", function()
            vim.diagnostic.jump({ count = -1, float = true })
         end, desc = "Go to previous diagnostics" },
         {"]d", function()
            vim.diagnostic.jump({ count = 1, float = true })
         end, desc = "Go to next diagnostics" },
         {"<leader>tl", function ()
            local new_config = not vim.diagnostic.config().virtual_lines
            vim.diagnostic.config({ virtual_lines = new_config })
         end, desc = "Toggle diagnostic virtual_lines" }
      })
   end
end
-- }}}

local client = vim.lsp.start_client({
   name = "progress_ls",
   cmd = { "/home/dilip/Gits/progress_ls/progress_ls" },
   on_attach = on_attach
})

if not client then
   vim.notify("hey u didnt do the client thing good ")
   return
end

vim.api.nvim_create_autocmd("FileType", {
   pattern =  "progress" ,
   callback = function ()
      vim.lsp.buf_attach_client(0, client)
   end
})
