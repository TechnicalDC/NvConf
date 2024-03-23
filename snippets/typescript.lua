---@diagnostic disable: unused-local
-- REQUIRED {{{
local ls = require("luasnip")
local s = ls.s --> snippet
local i = ls.i --> insert node
local t = ls.t --> text node

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node
local snippet_from_nodes = ls.sn

local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {}
-- }}}

-- OTHER STUFFS {{{
-- Returns table containing insert node with provided options
local get_options = function(arg)
	local t = {}

	for key, value in pairs(arg) do
		table.insert(t, i(1, arg[key]))
	end
	return t
end

-- Finds the passed argument in the current buffer
local find = function(arg)
	local count = vim.api.nvim_buf_line_count(0)
	for line = 1, count, 1 do
		if string.find(vim.api.nvim_buf_get_lines(0,0,-1,false)[line], arg) then
			found = true
			break
		else
			found = false
		end
	end
	return found
end
-- }}}

local import_var = function(args, _)
   local text = args[1][1] or ""
   local split = vim.split(text, ".", { plain = true })

   local options = {}
   for len = 0, #split - 1 do
      table.insert(options, t(table.concat(vim.list_slice(split, #split - len, #split), "_")))
   end

   return snippet_from_nodes(nil, {
      c(1, options),
   })
end
local import = fmta(
   [[
   import <import_name> = <import_module>
   ]],
   {
      import_name = d(2, import_var, { 1 }),
      import_module = i(1,"<++>"),
   })
local import_snippet = s("imp", import)
table.insert(autosnippets, import_snippet)

return snippets,autosnippets
