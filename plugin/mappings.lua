local ls = require("luasnip")
local map = vim.keymap.set

-- SMART SPLITS {{{{
map("n", '<A-h>', require('smart-splits').resize_left,  { desc = "Adjust size to left" })
map("n", '<A-j>', require('smart-splits').resize_down,  { desc = "Adjust size to left" })
map("n", '<A-k>', require('smart-splits').resize_up,    { desc = "Adjust size to left" })
map("n", '<A-l>', require('smart-splits').resize_right, { desc = "Adjust size to left" })
-- moving between splits
map("n",  '<C-h>', require('smart-splits').move_cursor_left,  { desc = "Switch to left split" })
map("n",  '<C-j>', require('smart-splits').move_cursor_down,  { desc = "Switch to below split" })
map("n",  '<C-k>', require('smart-splits').move_cursor_up,    { desc = "Switch to above split" })
map("n",  '<C-l>', require('smart-splits').move_cursor_right, { desc = "Switch to right split" })
-- }}}}

map("x",  "<leader>p", [["_dP]], { desc = "Paste Ultra Pro Max" } )

map({ "n", "v" }, "<leader>n",     ":norm ",                            { desc = "Run normal commands" } )
map("n", "<leader>Y",     "maggVGy`a",                                  { desc = "Copy entire content" } )
map("n", "<leader>tS",     ":setlocal spell!<CR>",                       { desc = "Toggle spell checker" } )
map("n", "Y",             "y$",                                         { desc = "Copy text till end of line" } )
map("n", "<BS>",          "^",                                          { desc = "Move to first non-blank character" } )
map("n", "<leader><Esc>", ":lua vim.o.hlsearch = false<CR>",            { desc = "Disable incremental search highlighting" } )
map("n", "x",             [["_x]],                                      { desc = "Delete character" } )
map("n", "<leader>rr",    [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], { desc = "Replace word under the cursor globally" } )
map("n", "<leader>xx",    "<cmd>!chmod +x %<CR>",                       { desc = "Make file executable" } )
map("n", "<A-=>",         "<C-w>=",                                     { desc = "Reset the split size" } )
map("n", "<A-m>",         "<C-w>|",                                     { desc = "Maximize the split width" } )
map("n", "<leader>dt",    "<cmd>diffthis<CR>",                          { desc = "Toggle diff for current buffer" } )
map("n", "<leader>th",    "<C-w>t<C-w>K",                               { desc = "Toggle vertical splits to horizontal" } )
map("n", "<leader>tv",    "<C-w>t<C-w>H",                               { desc = "Toggle horizontal splits to vertical" } )


-- Quickfix
map("n",  "<leader>qo", "<cmd>copen<cr>",  { desc = "Open quickfix list" } )
map("n",  "<leader>qc", "<cmd>cclose<cr>", { desc = "Close quickfix list" } )
map("n",  "<leader>qf", "<cmd>cfirst<cr>", { desc = "Go to first item in quickfix list" } )
map("n",  "<leader>ql", "<cmd>clast<cr>",  { desc = "Go to last item in quickfix list" } )
map("n",  "<leader>qn", "<cmd>cnext<cr>", { desc = "Go to next item in quickfix list" } )
map("n",  "<leader>ql", "<cmd>cprev<cr>",  { desc = "Go to prev item in quickfix list" } )

map("i",   "<C-c>", "<Esc>", { desc = "Escape the matrix" } )
map({ "i", "s" },   "<C-j>", function() ls.jump(1) end,           { desc = "Jump to next node" } )
map({ "i", "s" },   "<C-k>", function() ls.jump(-1) end,          { desc = "Jump to previous node" } )
map({ "i", "s" },   "<C-n>", function() ls.change_choice(1)  end, { desc = "Select next choice" } )
map({ "i", "s" },   "<C-p>", function() ls.change_choice(-1) end, { desc = "Select previous choice" } )

map("v",  "<",         "<gv",  { desc = "Indent inwards" } )
map("v",  ">",         ">gv",  { desc = "Indent outwards" } )
map("v",  "<leader>d", "\"_d", { desc = "Delete ultra pro max" } )
