local config = require("technicaldc.config")
local icons = require("mini.icons")
local modes = {
    ['n']  = {'NORMAL',     'N',   'StatuslineModeNormal'},
    ['v']  = {'VISUAL',     'V',   'StatuslineModeVisual'},
    ['V']  = {'V·LINE',     'V·L', 'StatuslineModeVisual'},
    ['']   = {'V·BLOCK',    'V·B', 'StatuslineModeVisual'},
    [''] = {'V·BLOCK',    'V·B', 'StatuslineModeVisual'},
    ['s']  = {'SELECT',     'S',   'StatuslineModeVisual'},
    ['S']  = {'S·LINE',     'S·L', 'StatuslineModeVisual'},
    [''] = {'S·BLOCK',    'S·B', 'StatuslineModeVisual'},
    ['i']  = {'INSERT',     'I',   'StatuslineModeInsert'},
    ['ic'] = {'INSERT',     'I',   'StatuslineModeInsert'},
    ['R']  = {'REPLACE',    'R',   'StatuslineModeInsert'},
    ['Rv'] = {'V·REPLACE',  'V·R', 'StatuslineModeInsert'},
    ['c']  = {'COMMAND',    'C',   'StatuslineModeCommand'},
    ['!']  = {'SHELL',      'S',   'StatuslineModeCommand'},
    ['t']  = {'TERMINAL',   'T',   'StatuslineModeCommand'}
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
   local hl = string.format('%s', modes[current_mode][3])
   return "%#" .. hl .. "# " .. mode .. " %#StatusLine#"
end

local get_end_block = function()
	local current_mode = vim.api.nvim_get_mode().mode
   local mode = string.format('%s', modes[current_mode][1])
   local hl = string.format('%s', modes[current_mode][3])
   return "%#" .. hl .. "#▐%#StatusLine#"
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
      return " [No Name]"
   end

   local tail = vim.fn.expand("%:t")

   if vim.bo.filetype == "help" then
      return " " .. tail
   end

	if config.statusline.show_cwd then
      filename = filename .. cwd
	end

   filename = " " .. filename .. (head == "." and "" or head .. "/") .. tail

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
   return " %-3.(%l/%L "
end

local get_filetype = function ()
   return icons.get("filetype",vim.bo.filetype) .. " " .. vim.bo.filetype .. " "
end

function _G.setup_statusline()
   return table.concat {
      get_current_mode(),
      get_filename(),
      is_modified(),
      " %<",
      "%=",
      get_filetype(),
      get_location(),
      get_end_block(),
   }
end

vim.opt.statusline = "%!v:lua.setup_statusline()"
