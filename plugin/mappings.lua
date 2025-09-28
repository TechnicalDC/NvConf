local ls = require("luasnip")

local nmap = function (lhs, rhs, desc)
   vim.keymap.set("n", lhs, rhs, { desc = desc })
end

local imap = function (lhs, rhs, desc)
   vim.keymap.set("i", lhs, rhs, { desc = desc })
end

local smap = function (lhs, rhs, desc)
   vim.keymap.set("s", lhs, rhs, { desc = desc })
end

local vmap = function (lhs, rhs, desc)
   vim.keymap.set("v", lhs, rhs, { desc = desc })
end

local xmap = function (lhs, rhs, desc)
   vim.keymap.set("x", lhs, rhs, { desc = desc })
end

-- SMART SPLITS {{{{
nmap('<A-h>', require('smart-splits').resize_left,  "Adjust size to left")
nmap('<A-j>', require('smart-splits').resize_down,  "Adjust size to left")
nmap('<A-k>', require('smart-splits').resize_up,    "Adjust size to left")
nmap('<A-l>', require('smart-splits').resize_right, "Adjust size to left")
-- moving between splits
nmap( '<C-h>', require('smart-splits').move_cursor_left,  "Switch to left split")
nmap( '<C-j>', require('smart-splits').move_cursor_down,  "Switch to below split")
nmap( '<C-k>', require('smart-splits').move_cursor_up,    "Switch to above split")
nmap( '<C-l>', require('smart-splits').move_cursor_right, "Switch to right split")
-- }}}}

xmap( "<leader>p", [["_dP]], "Paste Ultra Pro Max" )

nmap( "<leader>Y",  "maggVGy`a",                                  "Copy entire content" )
nmap( "<leader>s",  ":setlocal spell!<CR>",                       "Toggle spell checker" )
nmap( "Y",          "y$",                                         "Copy text till end of line" )
nmap( "<BS>",       "^",                                          "Move to first non-blank character" )
nmap( "<leader><Esc>",      ":lua vim.o.hlsearch = false<CR>",            "Disable incremental search highlighting" )
nmap( "x",          [["_x]],                                      "Delete character" )
nmap( "<leader>rr", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], "Replace word under the cursor globally" )
nmap( "<leader>xx", "<cmd>!chmod +x %<CR>",                       "Make file executable" )
nmap( "<A-=>",      "<C-w>=",            "Reset the split size" )
nmap( "<A-m>",      "<C-w>|",            "Maximize the split width" )
nmap( "<leader>dt", "<cmd>diffthis<CR>", "Toggle diff for current buffer" )
nmap( "<leader>th", "<C-w>t<C-w>K",      "Toggle vertical splits to horizontal" )
nmap( "<leader>tv", "<C-w>t<C-w>H",      "Toggle horizontal splits to vertical" )

-- Quickfix
nmap( "<leader>qo", "<cmd>copen<cr>",  "Open quickfix list" )
nmap( "<leader>qc", "<cmd>cclose<cr>", "Close quickfix list" )
nmap( "<leader>qf", "<cmd>cfirst<cr>", "Go to first item in quickfix list" )
nmap( "<leader>ql", "<cmd>clast<cr>",  "Go to last item in quickfix list" )

imap( "<C-c>", "<Esc>",                             "Escape the matrix" )
imap( "<C-j>", function() ls.jump(1) end,           "Jump to next node" )
imap( "<C-k>", function() ls.jump(-1) end,          "Jump to previous node" )
imap( "<C-n>", function() ls.change_choice(1)  end, "Select next choice" )
imap( "<C-p>", function() ls.change_choice(-1) end, "Select previous choice" )
smap( "<C-j>", function() ls.jump(1) end,           "Jump to next node" )
smap( "<C-k>", function() ls.jump(-1) end,          "Jump to previous node" )
smap( "<C-n>", function() ls.change_choice(1)  end, "Select next choice" )
smap( "<C-p>", function() ls.change_choice(-1) end, "Select previous choice" )

vmap( "<",         "<gv",  "Indent inwards" )
vmap( ">",         ">gv",  "Indent outwards" )
vmap( "<leader>d", "\"_d", "Delete ultra pro max" )
