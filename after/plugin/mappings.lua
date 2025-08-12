---@diagnostic disable: undefined-global
local map = vim.keymap.set

local ls = require("luasnip")
local ok, wk = pcall(require, 'which-key')
if not ok then
   return nil
end

wk.add({
   {
      mode = "n",
      { "<leader>Y",  "maggVGy`a",                                  desc = "Copy entire content"},
      { "<leader>s",  ":setlocal spell!<CR>",                       desc = "Toggle spell checker"},
      { "Y",          "y$",                                         desc = "Copy text till end of line"},
      { "<BS>",       "^",                                          desc = "Move to first non-blank character"},
      { "<Esc>",      ":lua vim.o.hlsearch = false<CR>",            desc = "Disable incremental search highlighting"},
      { "x",          [["_x]],                                      desc = "Delete character"},
      { "<leader>rr", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], desc = "Replace word under the cursor globally" },
      { "<leader>rw", [[:%s/\s\+$//e<CR>]],                         desc = "Remove whitespaces" },
      { "<leader>xx", "<cmd>!chmod +x %<CR>",                       desc = "Make file executable" },

      -- Quickfix
      { "<leader>qo", "<cmd>copen<cr>",  desc = "Open quickfix list"},
      { "<leader>qc", "<cmd>cclose<cr>", desc = "Close quickfix list"},
      { "<leader>qf", "<cmd>cfirst<cr>", desc = "Go to first item in quickfix list"},
      { "<leader>ql", "<cmd>clast<cr>",  desc = "Go to last item in quickfix list"},

      { "<A-=>",      "<C-w>=",            desc = "Reset the split size" },
      { "<A-m>",      "<C-w>|",            desc = "Maximize the split width" },
      { "<leader>dt", "<cmd>diffthis<CR>", desc = "Toggle diff for current buffer" },
      { "<leader>th", "<C-w>t<C-w>K",      desc = "Toggle vertical splits to horizontal" },
      { "<leader>tv", "<C-w>t<C-w>H",      desc = "Toggle horizontal splits to vertical" },
   },
   {
      mode = "v",
      { "<",        "<gv",  desc = "Indent inwards"},
      { ">",        ">gv",  desc = "Indent outwards"},
      {"<leader>d", "\"_d", desc = "Delete ultra pro max"},
   },
   {
      mode = "i",
      { "<C-c>", "<Esc>",                             desc = "Escape the matrix" },
      { "<C-j>", function() ls.jump(1) end,           desc = "Jump to next node" },
      { "<C-k>", function() ls.jump(-1) end,          desc = "Jump to previous node"},
      { "<C-n>", function() ls.change_choice(1)  end, desc = "Select next choice" },
      { "<C-p>", function() ls.change_choice(-1) end, desc = "Select previous choice" },
   },
   {
      mode = "s",
      { "<C-j>", function() ls.jump(1) end,           desc = "Jump to next node" },
      { "<C-k>", function() ls.jump(-1) end,          desc = "Jump to previous node"},
      { "<C-n>", function() ls.change_choice(1)  end, desc = "Select next choice" },
      { "<C-p>", function() ls.change_choice(-1) end, desc = "Select previous choice" },
   },
   {
      mode = "x",
      {"<leader>p", [["_dP]], desc = "Paste Ultra Pro Max"}
   }
})

-- SMART SPLITS {{{{
map('n', '<A-h>', require('smart-splits').resize_left,  { desc = "Adjust size to left" })
map('n', '<A-j>', require('smart-splits').resize_down,  { desc = "Adjust size to left" })
map('n', '<A-k>', require('smart-splits').resize_up,    { desc = "Adjust size to left" })
map('n', '<A-l>', require('smart-splits').resize_right, { desc = "Adjust size to left" })
-- moving between splits
map('n', '<C-h>', require('smart-splits').move_cursor_left,  { desc = "Switch to left split" })
map('n', '<C-j>', require('smart-splits').move_cursor_down,  { desc = "Switch to below split" })
map('n', '<C-k>', require('smart-splits').move_cursor_up,    { desc = "Switch to above split" })
map('n', '<C-l>', require('smart-splits').move_cursor_right, { desc = "Switch to right split" })
-- }}}}
