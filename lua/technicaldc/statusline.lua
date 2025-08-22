local config = require("technicaldc.config")
local modes = {
    ['n']  = {'NORMAL',     'N'},
    ['no'] = {'N·OPERATOR', 'N·P'},
    ['v']  = {'VISUAL',     'V', },
    ['V']  = {'V·LINE',     'V·L'},
    ['']   = {'V·BLOCK',    'V·B'},
    [''] = {'V·BLOCK',    'V·B'},
    ['s']  = {'SELECT',     'S', },
    ['S']  = {'S·LINE',     'S·L'},
    [''] = {'S·BLOCK',    'S·B'},
    ['i']  = {'INSERT',     'I', },
    ['ic'] = {'INSERT',     'I', },
    ['R']  = {'REPLACE',    'R', },
    ['Rv'] = {'V·REPLACE',  'V·R'},
    ['c']  = {'COMMAND',    'C', },
    ['cv'] = {'VIM·EX',     'V·E'},
    ['ce'] = {'EX',         'E', },
    ['r']  = {'PROMPT',     'P', },
    ['rm'] = {'MORE',       'M', },
    ['r?'] = {'CONFIRM',    'C', },
    ['!']  = {'SHELL',      'S', },
    ['t']  = {'TERMINAL',   'T', }
}

local excludes = function()
	if vim.tbl_contains(config.statusline.exclude_filetype, vim.bo.filetype) then
		return true
	end
	return false
end

local get_current_mode = function()
	local current_mode = vim.api.nvim_get_mode().mode
   local mode = string.format('%s', modes[current_mode][1])
	-- if vim.o.columns <= 80 then
	-- 	mode = string.format(' %s ', modes[current_mode][2])
	-- else
	-- 	mode = string.format(' %s ', modes[current_mode][1])
	-- end
   return "[" .. mode .. "] "
end

local get_filename = function ()
   if excludes() then
      return ""
   end

   local filename = ""
   local cwd = vim.fn.getcwd()
   local home = os.getenv("HOME")
   local head = vim.fn.expand("%:.:h")
   cwd = home and cwd:gsub(home, "~") or cwd

   if head == "" then
      return " [Unnamed]"
   end

   local tail = vim.fn.expand("%:t")

   if vim.bo.filetype == "help" then
      return "[" .. tail .. "]"
   end

	if config.statusline.show_cwd then
      filename = filename .. cwd
	end

   filename = "[" .. filename .. (head == "." and "" or head .. "/") .. tail .. "]"

   return filename
end

local is_modified = function ()
   if vim.bo.filetype == "help" then
      return ""
   end
   if excludes() then
      return ""
   end
   return " %m"
end

local get_location = function ()
   if excludes() then
      return ""
   end
   return " [%-3.(%l/%L]"
end

function _G.setup_statusline()
   return table.concat {
      get_current_mode(),
      get_filename(),
      is_modified(),
      " %<",
      "%=",
      "%{get(b:,'gitsigns_status','')} ",
      "%{get(b:,'gitsigns_head','')} ",
      "%y",
      get_location(),
   }
end

vim.opt.statusline = "%!v:lua.setup_statusline()"
