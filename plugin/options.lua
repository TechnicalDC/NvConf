---@diagnostic disable: undefined-global
local set = vim.opt
local config = require("technicaldc.config")

-- CONFIGURATION {{{
set.guicursor      = ""
set.title          = false
set.titlestring    = "nvim - %F"
set.swapfile       = false
set.splitbelow     = true
set.splitright     = true
set.showmode       = false
set.showtabline    = 0
set.laststatus     = config.laststatus
set.number         = config.number
set.relativenumber = config.relativenumber
set.wildmenu       = true
set.wildmode       = "longest:full,list:full"
set.wildignore     = "*.o,*.obj,*.bak,*.exe,*.hi,*.dyn_hi,*.dyn_o,*.zip,*.pdf,*.gif,*.png,*.jpg,*.mp4,*mp3"
set.encoding       = "UTF-8"
set.foldenable     = false
set.foldcolumn     = "0"
set.foldmethod     = "marker"
set.foldmarker     = "{{{,}}}"
set.foldexpr       = "v:lua.vim.treesitter.foldexpr()"
set.foldtext       = "v:lua.custom_fold_text()"
set.cursorline     = true
set.showmatch      = true
set.linebreak      = true
set.wrap           = false
set.ignorecase     = true
set.smartcase      = true
set.clipboard      = "unnamedplus"
set.winborder      = "double"
set.fillchars:append({
   fold      = "─",
   foldopen  = "",
   foldclose = "",
   diff      = "-",
   eob       = " ",
	horiz     = '═',
	horizup   = '╩',
	horizdown = '╦',
	vert      = '║',
	vertleft  = '╣',
	vertright = '╠',
	verthoriz = '╬',
})

set.listchars = "eol:󰌑"
   .. ",tab:··"
   .. ",lead:·"
   .. ",leadmultispace:·"
   .. ",extends:>"
   .. ",precedes:<"

set.list          = true
set.diffopt       = "filler,vertical,iwhiteall,iblank"
set.mouse         = "a"
set.expandtab     = true
set.tabstop       = config.indent
set.shiftwidth    = config.indent
set.softtabstop   = config.indent
set.breakindent   = true
set.autoindent		= true
set.spelllang     = "en_us"
set.signcolumn    = "auto:1"
set.conceallevel  = 2
set.concealcursor = 'nc'
set.termguicolors = true
-- set.quickfixtextfunc = "v:lua.qftf"
set.scrolloff	   = 10
set.undofile		= true
set.shada			= "!,'300,<50,s10,h"
set.helpheight   = 15
set.statuscolumn = "%s%=%{v:relnum ? v:relnum : v:lnum} "
-- }}}

vim.filetype.add({
   pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
   extension = {
      rasi = "css",
      tex = "tex",
      md = "markdown",
      i = "progress",
      p = "progress",
      cls = "progress",
   }
})

-- SHELL {{{
if vim.fn.has("win32") == 1 then
   set.shell = vim.fn.executable "powershell" == 1 and "powershell" or "pwsh"
   set.shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
   set.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
   set.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
   set.shellquote = ""
   set.shellxquote = ""
else
   set.shell = "fish"
end
-- }}}

-- CUSTOM FOLD TEXT {{{
function _G.custom_fold_text()
   local line = vim.fn.getline(vim.v.foldstart)
   line = string.gsub(line, "{+", "")
   local line_count = vim.v.foldend - vim.v.foldstart + 1
   local fill_char = "─"
   local start_char = "────┤ "
   local end_char = " lines ├─────"
   local fill_count = vim.o.columns - string.len(start_char) - string.len(line) - string.len(line_count) - string.len(end_char) - 5
   return start_char .. line .. "├─" .. string.rep(fill_char,fill_count) .. "─┤ " .. line_count .. end_char
end
-- }}}
