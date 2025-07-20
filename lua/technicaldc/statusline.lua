local modes = {
    ['n'] = {'NORMAL', 'N'},
    ['no'] = {'N·OPERATOR', 'N·P'},
    ['v'] = {'VISUAL', 'V'},
    ['V'] = {'V·LINE', 'V·L'},
    [''] = {'V·BLOCK', 'V·B'},
    [''] = {'V·BLOCK', 'V·B'},
    ['s'] = {'SELECT', 'S'},
    ['S'] = {'S·LINE', 'S·L'},
    [''] = {'S·BLOCK', 'S·B'},
    ['i'] = {'INSERT', 'I'},
    ['ic'] = {'INSERT', 'I'},
    ['R'] = {'REPLACE', 'R'},
    ['Rv'] = {'V·REPLACE', 'V·R'},
    ['c'] = {'COMMAND', 'C'},
    ['cv'] = {'VIM·EX', 'V·E'},
    ['ce'] = {'EX', 'E'},
    ['r'] = {'PROMPT', 'P'},
    ['rm'] = {'MORE', 'M'},
    ['r?'] = {'CONFIRM', 'C'},
    ['!'] = {'SHELL', 'S'},
    ['t'] = {'TERMINAL', 'T'}
}

local get_current_mode = function()
	local current_mode = vim.api.nvim_get_mode().mode
	if vim.o.columns <= 80 then
		return "%#StatusLineMode#" .. string.format(' %s ', modes[current_mode][2]) .. "%#StatusLine#"
	else
		return "%#StatusLineMode#" .. string.format(' %s ', modes[current_mode][1]) .. "%#StatusLine#"
	end
end

 function _G.setup_statusline()
	 return table.concat {
		 get_current_mode(), -- get current mode
		 -- git_branch(), -- branch name
		 " %h ",
		 " %<", -- spacing
		 "%=", -- right align
		 "%#StatusLineMode# %-3.(%l/%L ", -- current / total lines
	 }
 end

 vim.opt.statusline = "%!v:lua.setup_statusline()"
