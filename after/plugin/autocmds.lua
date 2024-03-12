local autocmd = vim.api.nvim_create_autocmd

-- Vertically center documents when in insert mode
autocmd({"InsertEnter"},{pattern = {"*"}, command = "norm zz" })

autocmd({"BufEnter","BufNewfile"},{pattern = {"*.tex"}, command = "set filetype=tex"})
autocmd({"BufEnter","BufNewfile"},{pattern = {"*.md"}, command = "set filetype=markdown"})
autocmd({"BufEnter","BufNewfile"},{pattern = {"*.i","*.cls"}, command = "set filetype=progress"})
autocmd({"BufEnter","BufNewfile"},{pattern = {"*.i","*.cls","*.p"}, command = "set commentstring=\\ /*\\ %s\\ */"})
