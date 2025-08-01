vim.keymap.set("n", "<leader>xc", function ()
   vim.cmd("!rm *.aux *.log *.out -f")
   vim.cmd("!xelatex %")
end, { desc = "Compile latex document", buffer = true })
