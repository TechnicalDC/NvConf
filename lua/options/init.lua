local set = vim.opt

set.guicursor		 = ""
set.swapfile       = false
set.splitbelow     = true
set.splitright     = true
set.showmode       = false
set.laststatus 	 = 3
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
set.fillchars	   = "fold: ,eob: ,foldclose:,foldopen:,diff:-"
set.listchars	   = "tab:  "
-- set.listchars	   = "eol:,tab:  "
set.list          = true
set.mouse         = "a"
set.tabstop       = 3
set.shiftwidth    = 3
set.softtabstop   = 3
set.spelllang     = "en_us"
set.signcolumn    = "yes"
set.conceallevel  = 2
set.concealcursor = 'nc'
set.termguicolors = true
set.foldtext	   = "v:lua.custom_fold_text()"
set.foldcolumn		= "3"
set.scrolloff	   = 10
set.undofile		= false

-- GUI Configuration
-- set.guifont			= "FantasqueSansMono Nerd Font Mono:style=Regular:pixelsize=10"
set.guifont			= "Iosevka Nerd Font:h10"

if vim.fn.has("win32") == 1 then
	set.shell = vim.fn.executable "powershell" == 1 and "powershell" or "pwsh"
	set.shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
	set.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
	set.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
	set.shellquote = ""
	set.shellxquote = ""
else
	set.shell = "zsh"
end


function _G.custom_fold_text()
	local line = vim.fn.getline(vim.v.foldstart)
	line = string.gsub(line, "{+", "")
	local line_count = vim.v.foldend - vim.v.foldstart + 1
	-- local fill_char = vim.o.columns - string.len(line) - string.len(line_count)
	return line .. ": " .. line_count .. " lines"
	-- return " " .. line .. ": " .. line_count .. " lines"
end
