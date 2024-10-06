---@diagnostic disable: undefined-global
local set = vim.opt
local fn = vim.fn

set.guicursor		 = ""
set.title			 = false
set.titlestring    = "nvim - %F"
set.swapfile       = false
set.splitbelow     = true
set.splitright     = true
set.showmode       = false
set.showtabline    = 1
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
set.fillchars:append({
   fold = " ",
   foldopen = "",
   foldclose = "",
   diff = "-",
   horiz = " ",
   horizup = " ",
   horizdown = " ",
   vert = " ",
   vertleft = " ",
   vertright = " ",
   verthoriz = " ",
   eob = " ",
})
set.listchars	   = "tab:  "
set.list          = true
set.mouse         = "a"
set.expandtab     = true
set.tabstop       = 3
set.shiftwidth    = 3
set.softtabstop   = 3
set.breakindent   = true
set.spelllang     = "en_us"
set.signcolumn    = "yes"
set.conceallevel  = 2
set.concealcursor = 'nc'
set.termguicolors = true
set.foldtext	   = "v:lua.custom_fold_text()"
set.quickfixtextfunc = "v:lua.qftf"
set.foldcolumn		= "0"
set.scrolloff	   = 10
set.undofile		= true
set.shada			= "!,'300,<50,s10,h"

-- GUI Configuration
-- set.guifont			= "FantasqueSansMono Nerd Font Mono:style=Regular:pixelsize=10"
set.guifont			= "Iosevka NF:h12"

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


function _G.custom_fold_text()
   local line = vim.fn.getline(vim.v.foldstart)
   line = string.gsub(line, "{+", "")
   local line_count = vim.v.foldend - vim.v.foldstart + 1
   -- local fill_char = vim.o.columns - string.len(line) - string.len(line_count)
   -- return line .. ": " .. line_count .. " lines"
   return " " .. line .. ": " .. line_count .. " lines"
end

function _G.qftf(info)
   local items
   local ret = {}
   -- The name of item in list is based on the directory of quickfix window.
   -- Change the directory for quickfix window make the name of item shorter.
   -- It's a good opportunity to change current directory in quickfixtextfunc :)
   --
   -- local alterBufnr = fn.bufname('#') -- alternative buffer is the buffer before enter qf window
   -- local root = getRootByAlterBufnr(alterBufnr)
   -- vim.cmd(('noa lcd %s'):format(fn.fnameescape(root)))
   --
   if info.quickfix == 1 then
      items = fn.getqflist({id = info.id, items = 0}).items
   else
      items = fn.getloclist(info.winid, {id = info.id, items = 0}).items
   end
   local limit = 31
   local fnameFmt1, fnameFmt2 = '%-' .. limit .. 's', '…%.' .. (limit - 1) .. 's'
   local validFmt = '%s │%5d:%-3d│%s %s'
   for i = info.start_idx, info.end_idx do
      local e = items[i]
      local fname = ''
      local str
      if e.valid == 1 then
         if e.bufnr > 0 then
            fname = fn.bufname(e.bufnr)
            if fname == '' then
               fname = '[No Name]'
            else
               fname = fname:gsub('^' .. vim.env.HOME, '~')
            end
            -- char in fname may occur more than 1 width, ignore this issue in order to keep performance
            if #fname <= limit then
               fname = fnameFmt1:format(fname)
            else
               fname = fnameFmt2:format(fname:sub(1 - limit))
            end
         end
         local lnum = e.lnum > 99999 and -1 or e.lnum
         local col = e.col > 999 and -1 or e.col
         local qtype = e.type == '' and '' or ' ' .. e.type:sub(1, 1):upper()
         str = validFmt:format(fname, lnum, col, qtype, e.text)
      else
         str = e.text
      end
      table.insert(ret, str)
   end
   return ret
end

function SetIndent ()
   vim.ui.input({ prompt = 'New Indent', default = tostring(vim.opt.tabstop._value)}, function(input)
      set.tabstop       = tonumber(input)
      set.shiftwidth    = tonumber(input)
      set.softtabstop   = tonumber(input)
   end)
end
