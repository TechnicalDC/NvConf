local map = vim.keymap.set

map("n", "<leader>rn", vim.lsp.buf.rename,                  { desc = "Rename" } )
map("n", "<leader>oc", vim.lsp.buf.code_action,             { desc = "Open code actions" } )
map("n", "<leader>gd", vim.lsp.buf.definition,              { desc = "Go to definition" } )
map("n", "<leader>gD", vim.lsp.buf.declaration,             { desc = "Go to declaration" } )
map("n", "<leader>gi", vim.lsp.buf.implementation,          { desc = "Go to implementation" } )
map("n", "<leader>gr", vim.lsp.buf.references,              { desc = "Go to references" } )
map("n", "<leader>gt", vim.lsp.buf.type_definition,         { desc = "Go to type definition" } )
map("n", "<leader>F",  vim.lsp.buf.format,                  { desc = "Format code" } )
map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder,    { desc = "Add folder to workspace" } )
map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove folder from workspace" } )

map("n", "<leader>fr", function()
	require("telescope.builtin").lsp_references()
end, { desc = "Go to references" } )

map( "n", "<leader>wl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "List workspace folder" })

map( "n", "<leader>K", function ()
	vim.lsp.buf.hover()
end, { desc = "Hover docs" })

map( "n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Go to previous diagnostics" })

map( "n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Go to next diagnostics" })

