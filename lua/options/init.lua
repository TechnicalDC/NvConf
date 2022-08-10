vim.o.swapfile       = false
vim.o.splitbelow     = true
vim.o.splitright     = true
vim.o.showmode       = false
vim.o.number         = true
vim.o.relativenumber = true
vim.o.wildmenu       = true
vim.o.wildmode       = "longest:full,list:full"
vim.o.wildignore     = "*.o,*.obj,*.bak,*.exe,*.hi,*.dyn_hi,*.dyn_o,*.zip,*.pdf,*.gif,*.png,*.jpg,*.mp4,*mp3"
vim.o.encoding       = "UTF-8"
vim.o.foldenable     = true
vim.o.foldmethod     = "marker"
vim.o.foldmarker     = "{{{,}}}"
vim.o.cursorline     = false
vim.o.showmatch      = true      
vim.o.linebreak      = true
vim.o.wrap           = false
vim.o.ignorecase     = true
vim.o.smartcase      = true
vim.o.clipboard      = "unnamedplus"
vim.o.fillchars		 = "fold: ,eob: "
vim.o.mouse          = "a"
vim.o.tabstop        = 4
vim.o.shiftwidth     = 4
vim.o.softtabstop    = 4
vim.o.spelllang      = "en_us"
vim.o.signcolumn     = "yes"
vim.o.conceallevel   = 2
vim.o.concealcursor  = 'nc'
vim.o.termguicolors  = true
vim.o.foldtext		 = "v:lua.custom_fold_text()"

function _G.custom_fold_text()
    local line = vim.fn.getline(vim.v.foldstart)
	line = string.gsub(line, "{+", "")
    local line_count = vim.v.foldend - vim.v.foldstart + 1
    return " " .. line .. ": " .. line_count .. " lines"
end
