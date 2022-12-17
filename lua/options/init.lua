local set = vim.opt

set.swapfile       = false
set.splitbelow     = true
set.splitright     = true
set.showmode       = false
set.number         = true
set.relativenumber = true
set.wildmenu       = true
set.wildmode       = "longest:full,list:full"
set.wildignore     = "*.o,*.obj,*.bak,*.exe,*.hi,*.dyn_hi,*.dyn_o,*.zip,*.pdf,*.gif,*.png,*.jpg,*.mp4,*mp3"
set.encoding       = "UTF-8"
set.foldenable     = true
set.foldmethod     = "marker"
set.foldmarker     = "{{{,}}}"
set.cursorline     = true
set.showmatch      = true      
set.linebreak      = true
set.wrap           = false
set.ignorecase     = true
set.smartcase      = true
set.clipboard      = "unnamedplus"
set.fillchars	   = "fold: ,eob: "
set.listchars	   = "eol:,tab:  "
set.list           = true
set.mouse          = "a"
set.tabstop        = 3
set.shiftwidth     = 3
set.softtabstop    = 3
set.spelllang      = "en_us"
set.signcolumn     = "yes"
set.conceallevel   = 2
set.concealcursor  = 'nc'
set.termguicolors  = true
set.foldtext	   = "v:lua.custom_fold_text()"
set.scrolloff	   = 10

-- GUI Configuration
set.guifont			= "FantasqueSansMono Nerd Font Mono:style=Regular:pixelsize=13"

function _G.custom_fold_text()
	local line = vim.fn.getline(vim.v.foldstart)
	line = string.gsub(line, "{+", "")
	local line_count = vim.v.foldend - vim.v.foldstart + 1
	return " " .. line .. ": " .. line_count .. " lines"
end
