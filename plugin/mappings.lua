local nmap = function (lhs, rhs, desc)
   vim.keymap.set("n", lhs, rhs, { desc = desc })
end

local imap = function (lhs, rhs, desc)
   vim.keymap.set("i", lhs, rhs, { desc = desc })
end

local vmap = function (lhs, rhs, desc)
   vim.keymap.set("v", lhs, rhs, { desc = desc })
end

-- Quickfix
nmap( "<leader>qo", "<cmd>copen<cr>",  "Open quickfix list" )
nmap( "<leader>qc", "<cmd>cclose<cr>", "Close quickfix list" )
nmap( "<leader>qf", "<cmd>cfirst<cr>", "Go to first item in quickfix list" )
nmap( "<leader>ql", "<cmd>clast<cr>",  "Go to last item in quickfix list" )
