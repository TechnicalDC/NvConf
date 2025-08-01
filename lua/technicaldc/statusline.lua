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

function _G.setup_statusline()
	 return table.concat {
		 get_current_mode(), -- get current mode
       " %F",
       " %m",
		 " %<", -- spacing
		 "%=", -- right align
       -- git_branch(), -- branch name
		 " %h ",
       "%#StatusLineMode# %-3.(%l/%L ", -- current / total lines
    }
end

vim.opt.statusline = "%!v:lua.setup_statusline()"
