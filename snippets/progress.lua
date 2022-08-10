-- REQUIRED {{{
local ls = require("luasnip")
local s = ls.s --> snippet
local i = ls.i --> insert node
local t = ls.t --> text node

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {}
-- }}}

-- OTHER STUFFS {{{
local lock_type = {
	"no-lock",
	"exclusive-lock"
}
local def_types = {
	"variable",
	"frame",
	"query",
	"buffer",
	"input parameter",
	"output parameter"
}
local data_types = {
	"character",
	"decimal",
	"integer",
	"date",
	"logical"
}
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

-- PATCH SNIPPET {{{
local patch_fmt = fmt(
	[[
	/* Last modified on: {} Last modified by: Dilip Chauhan ECO: ALT{} */
	]],
	{
		f(function(_,snip) return {os.date('%d-%m-%Y')} end, {}),
		f(function(_,snip) return {os.date('%d%m%Y')} end, {})
	}
)
local patch_snippet = s("patch", patch_fmt)
table.insert(snippets, patch_snippet)
-- }}}

-- COMMENT SNIPPET {{{
local cmmt_fmt = fmt(
	[[
	/*
	{}
	*/
	]],
	{
		d(1, function(_, snip)
			return sn(1, t(snip.env.TM_SELECTED_TEXT or {}))
		end)
	}
)
local cmmt_snippet = s("comment", cmmt_fmt)
table.insert(snippets, cmmt_snippet)
-- }}}

-- DEFINITION SNIPPET {{{
local def_fmt = fmt(
	[[
	define {} {} {}.
	]],
	{
		c(1, get_options(def_types)),
		d(2, function(_, snip)
			return sn(1, i(1,snip.env.TM_SELECTED_TEXT[1] or {"<++>"}))
		end),
		c(3, {
			i(1, "as character"), 
			i(1, "as integer"),
			i(1, "as decimal"),
			i(1, "as date"),
			i(1, "as logical"),
			i(1, "like"),
			i(1, "for"),
		}),
	}
)
local def_snippet = s("define", def_fmt)
table.insert(snippets, def_snippet)
-- }}}

-- FIND SNIPPET {{{
local find_fmt = fmt(
	[[
		find {} {} {}
			where {} {}no-error.
		if available {} then do:
		end.
	]],
	{
		c(1, {
			i(1, "first"),
			i(1, "last"),
			i(1, "next"),
			i(1, "prev")
		}),
		d(2, function(_, snip)
			return sn(1, i(1,snip.env.TM_SELECTED_TEXT[1] or {"<++>"}))
		end),
		c(3, get_options(lock_type)),
		i(4, "<++>"),
		d(5, function()
			if find("mfdeclre.i") or find("mfdtitle.i") then
				return sn(1, i(1,"= global_domain "))
			else 
				return sn(1, i(1,""))
			end
		end),
		rep(2)
	}
)
local find_snippet = s(
	{trig = "find", regTrig = false, hidden = false},
	find_fmt
)
table.insert(snippets, find_snippet)
-- }}}

-- FOR SNIPPET {{{
local for_fmt = fmt(
	[[
		for {} {} {}
			where {} {}:
			{}
		end.
	]],
	{
		c(1, {
			i(1, "first"),
			i(1, "last"),
			i(1, "next"),
			i(1, "prev")
		}),
		d(2, function(_, snip)
			return sn(1, i(1,snip.env.TM_SELECTED_TEXT[1] or {"<++>"}))
		end),
		c(3, get_options(lock_type)),
		i(4, "<++>"),
		d(5, function()
			if find("mfdeclre.i") or find("mfdtitle.i") then
				return sn(1, i(1,"= global_domain"))
			else 
				return sn(1, i(1,""))
			end
		end),
		i(6, "/* Add Logic */"),
	}
)
local for_snippet = s(
	{trig = "for", regTrig = false, hidden = false},
	for_fmt
)
table.insert(snippets, for_snippet)
-- }}}

-- FUNCTION SNIPPET {{{
local function_fmt = fmt(
	[[
		function {} returns {}
			({}):

			define variable lv_output as {}.

			{}

			return lv_output.
		end function.
	]],
	{
		d(1, function(_, snip)
			return sn(1, i(1,snip.env.TM_SELECTED_TEXT[1] or {"<++>"}))
		end),
		c(2,get_options(data_types)),
		i(3, ""),
		rep(2),
		i(4, "/* Add Logic */"),
	}
)
local function_snippet = s(
	{trig = "function", regTrig = false, hidden = false},
	-- "function",
	function_fmt
)
table.insert(snippets, function_snippet)
-- }}}

return snippets
