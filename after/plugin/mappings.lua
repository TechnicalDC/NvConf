---@diagnostic disable: undefined-global
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
-- local extra_opts = { noremap = true, silent = true, expr = true }

local ls = require("luasnip")
local ok, wk = pcall(require, 'which-key')
if not ok then
   return nil
end

wk.add({
   {
      mode = "n",
      { "<leader>Y", "maggVGy`a",                       desc = "Copy entire content"},
      { "<leader>s", ":setlocal spell!<CR>",            desc = "Toggle spell checker"},
      { "Y",         "y$",                              desc = "Copy text till end of line"},
      { "<BS>",      "^",                               desc = "Move to first non-blank character"},
      { "gb",        ":bnext<cr>",                      desc = "Jump to next buffer"},
      { "gB",        ":bprevious<cr>",                  desc = "Jump to previous buffer"},
      {"<Esc>",      ":lua vim.o.hlsearch = false<CR>", desc = "Disable incremental search highlighting"},

      -- Quickfix
      { "<leader>co", "<cmd>copen<cr>",  desc = "Open quickfix list"},
      { "<leader>cc", "<cmd>cclose<cr>", desc = "Close quickfix list"},
      { "<leader>cf", "<cmd>cfirst<cr>", desc = "Go to first item in quickfix list"},
      { "<leader>cl", "<cmd>clast<cr>",  desc = "Go to last item in quickfix list"},
      { "<leader>cn", "<cmd>cnext<cr>",  desc = "Go to next item in quickfix list"},
      { "<leader>cp", "<cmd>cprev<cr>",  desc = "Go to previous item in quickfix list"},

      { "<A-=>",      "<C-w>=",            desc = "Equal the split size" },
      { "<A-m>",      "<C-w>|",            desc = "Maximize the split width" },
      { "<leader>dt", "<cmd>diffthis<CR>", desc = "Toggle diff for current buffer" },
      { "<leader>th", "<C-w>t<C-w>K",      desc = "Turn vertical splits to horizontal" },
      { "<leader>tv", "<C-w>t<C-w>H",      desc = "Turn horizontal splits to vertical" },
   },
   {
      mode = "v",
      { "<", "<gv", desc = "Indent inwards"},
      { ">", ">gv", desc = "Indent outwards"},
      {"<leader>d", "\"_d", desc = "Delete Ultra Pro Max"},
   },
   {
      mode = "i",
      { "<C-c>", "<Esc>", desc = "Escape the matrix" },
      { "<C-j>", function() ls.jump(1) end, desc = "Jump to next node" },
      { "<C-k>", function() ls.jump(-1) end, desc = "Jump to previous node"},
      { "<C-n>", function() ls.change_choice(1)  end, desc = "Select next choice" },
      { "<C-p>", function() ls.change_choice(-1) end, desc = "Select previous choice" },
   },
   {
      mode = "s",
      { "<C-j>", function() ls.jump(1) end, desc = "Jump to next node" },
      { "<C-k>", function() ls.jump(-1) end, desc = "Jump to previous node"},
      { "<C-n>", function() ls.change_choice(1)  end, desc = "Select next choice" },
      { "<C-p>", function() ls.change_choice(-1) end, desc = "Select previous choice" },
   },
   {
      mode = "x",
      {"<leader>p", [["_dP]], desc = "Paste Ultra Pro Max"}
   }
})

-- SMART SPLITS {{{{
map('n', '<A-h>', require('smart-splits').resize_left)
map('n', '<A-j>', require('smart-splits').resize_down)
map('n', '<A-k>', require('smart-splits').resize_up)
map('n', '<A-l>', require('smart-splits').resize_right)
-- moving between splits
map('n', '<C-h>', require('smart-splits').move_cursor_left)
map('n', '<C-j>', require('smart-splits').move_cursor_down)
map('n', '<C-k>', require('smart-splits').move_cursor_up)
map('n', '<C-l>', require('smart-splits').move_cursor_right)
-- swapping buffers between windows
-- map('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
-- map('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
-- map('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
-- map('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
-- }}}}

-- Moving text
map("i", "<A-S-j>", "<Esc>:m .+1<CR>==i", opts)
map("i", "<A-S-k>", "<Esc>:m .-2<CR>==i", opts)

