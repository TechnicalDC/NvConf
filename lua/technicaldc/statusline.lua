local modes = {
    ['n']  = {'NORMAL',     'N',   'StatusLineModeNormal'},
    ['no'] = {'N·OPERATOR', 'N·P', 'StatuslineMode'},
    ['v']  = {'VISUAL',     'V',   'StatusLineModeVisual'},
    ['V']  = {'V·LINE',     'V·L', 'StatusLineModeVisual'},
    ['']   = {'V·BLOCK',    'V·B', 'StatuslineModeVisual'},
    [''] = {'V·BLOCK',    'V·B', 'StatuslineModeVisual'},
    ['s']  = {'SELECT',     'S',   'StatuslineModeVisual'},
    ['S']  = {'S·LINE',     'S·L', 'StatuslineModeVisual'},
    [''] = {'S·BLOCK',    'S·B', 'StatuslineModeVisual'},
    ['i']  = {'INSERT',     'I',   'StatusLineModeInsert'},
    ['ic'] = {'INSERT',     'I',   'StatuslineModeInsert'},
    ['R']  = {'REPLACE',    'R',   'StatusLineModeReplace'},
    ['Rv'] = {'V·REPLACE',  'V·R', 'StatuslineModeReplace'},
    ['c']  = {'COMMAND',    'C',   'StatusLineModeCommand'},
    ['cv'] = {'VIM·EX',     'V·E', 'StatuslineModeCommand'},
    ['ce'] = {'EX',         'E',   'StatuslineModeCommand'},
    ['r']  = {'PROMPT',     'P',   'StatusLineModeConfirm'},
    ['rm'] = {'MORE',       'M',   'StatuslineModeConfirm'},
    ['r?'] = {'CONFIRM',    'C',   'StatuslineModeConfirm'},
    ['!']  = {'SHELL',      'S',   'StatusLineModeTerminal'},
    ['t']  = {'TERMINAL',   'T',   'StatuslineModeTerminal'}
}

local get_current_mode = function()
	local current_mode = vim.api.nvim_get_mode().mode
   local mode = ""
	if vim.o.columns <= 80 then
		mode = string.format(' %s ', modes[current_mode][2])
	else
		mode = string.format(' %s ', modes[current_mode][1])
	end
   return "%#" .. modes[current_mode][3] .. "#" .. mode .. "%#StatusLine#"
end

local get_filename = function ()
   local sep = "%#StatusLineFilenameSep#/%#StatusLineFileName#"

   local cwd = vim.fn.getcwd()
   local home = os.getenv("HOME")

   cwd = home and cwd:gsub(home, "~") or cwd
   cwd = table.concat(vim.fn.split(cwd, "/"), sep)

   local head = vim.fn.expand("%:.:h")
   head = table.concat(vim.fn.split(head, "/"), sep)
   if head == "" then
      return ""
   end

   local tail = vim.fn.expand("%:t")

   local filename = " %#StatusLineFilename#"

	if vim.o.columns > 80 then
      filename = filename .. (cwd and cwd .. sep or "")
	end

   filename = filename .. (head == "." and "" or head .. sep) .. ("%#StatusLine#" .. tail .. "%#StatusLine#")

   return filename
end

function _G.setup_statusline()
   return table.concat {
      get_current_mode(), -- get current mode
      get_filename(),
      " %m",
      " %<", -- spacing
      "%=", -- right align
      " %{get(b:,'gitsigns_status','')}",
      " %h",
      " %q ",
      "%#StatusLineMode# %-3.(%l/%L ", -- current / total lines
   }
end

vim.opt.statusline = "%!v:lua.setup_statusline()"
