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

local rep = require("luasnip.extras").rep
local fmta = require("luasnip.extras.fmt").fmta

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
	"stream",
	"input parameter",
	"output parameter",
	"temp-table"
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
	local x = {}

	for key, value in pairs(arg) do
		table.insert(x, i(1, arg[key]))
	end
	return x
end

-- Finds the passed argument in the current buffer
local find = function(arg)
	local found = false
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
local patch_fmt = fmta(
	[[
	/* Last modified on: <new_date> Last modified by: Dilip Chauhan ECO: <marker> */
	]],
	{
		new_date = f(function(_,snip) return {os.date('%d-%m-%y')} end, {}),
		marker = i(1, "<++>")
	}
)
local patch_snippet = s("patch", patch_fmt)
table.insert(autosnippets, patch_snippet)
-- }}}

-- PATCH MARKER SNIPPET {{{
local patch_mark_fmt = fmta(
	[[
	/* ALT<marker> */
	]],
	{
		marker = f(function(_,snip) return {os.date('%d%m%Y')} end, {}),
	}
)
local patch_mark_snippet = s("ALT", patch_mark_fmt)
table.insert(autosnippets, patch_mark_snippet)
-- }}}

-- DEFINITION SNIPPET {{{
local def_fmt = fmta(
	[[
	define <var_type> <var_name> <data_type> no-undo.
	]],
	{
		var_type = c(1, get_options(def_types)),
		var_name = d(2, function(_, snip)
			return sn(1, i(1,snip.env.TM_SELECTED_TEXT[1] or {"<++>"}))
		end),
		data_type = c(3, {
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

-- MESSAGE SNIPPET {{{
local msg_fmt = fmta(
	[[
	{{ us/bbi/pxmsg.i <mesg_type>=<mesg> &errorlevel=<error_level> }}
	]],
	{
		mesg_type = c(1, {
			i(1, "&msgnum"),
			i(1, "&msgtext"),
			}
		),
		mesg = i(2, "<++>"),
		error_level = i(3, "<++>"),
	}
)
local msg_snippet = s("pxmsg", msg_fmt)
table.insert(snippets, msg_snippet)
-- }}}

-- FIND SNIPPET {{{
local find_fmt = fmta(
	[[
		find <no> <table_name> <lock>
			where <table_field> <condition> no-error.
		if available <table_name1> then do:
		end. /* if available <table_name2> then do: */
	]],
	{
		no = c(1, {
			i(1, "first"),
			i(1, "last"),
			i(1, "next"),
			i(1, "prev")
		}),
		table_name = d(2, function(_, snip)
			return sn(1, i(1,snip.env.TM_SELECTED_TEXT[1] or {"<++>"}))
		end),
		lock = c(3, get_options(lock_type)),
		table_field = i(4, "<++>"),
		condition = d(5, function()
			if find("mfdeclre.i") or find("mfdtitle.i") then
				return sn(1, i(1,"= global_domain "))
			else
				return sn(1, i(1,""))
			end
		end),
		table_name1 = rep(2),
		table_name2 = rep(2),
	}
)
local find_snippet = s(
	{trig = "find", regTrig = false, hidden = false},
	find_fmt
)
table.insert(snippets, find_snippet)
-- }}}

-- FOR SNIPPET {{{
local for_fmt = fmta(
	[[
		for <no> <table_name> <lock>
			where <table_field> <condition>:
			<code>
		end. /* for <no1> <table_name1> <lock1> */
	]],
	{
		no = c(1, {
			i(1, "each"),
			i(1, "first"),
			i(1, "last"),
			i(1, "next"),
			i(1, "prev")
		}),
		table_name = d(2, function(_, snip)
			return sn(1, i(1,snip.env.TM_SELECTED_TEXT[1] or {"<++>"}))
		end),
		lock = c(3, get_options(lock_type)),
		table_field = i(4, "<++>"),
		condition = d(5, function()
			if find("mfdeclre.i") or find("mfdtitle.i") then
				return sn(1, i(1,"= global_domain"))
			else
				return sn(1, i(1,""))
			end
		end),
		code = i(6, "/* Add Logic */"),
		no1 = rep(1),
		table_name1 = rep(2),
		lock1 = rep(3),
	}
)
local for_snippet = s(
	{trig = "for", regTrig = false, hidden = false},
	for_fmt
)
table.insert(snippets, for_snippet)
-- }}}

-- FUNCTION SNIPPET {{{
local function_fmt = fmta(
	[[
		function <func_name> returns <return_type>
			(input <args>):

			define variable <var_name> as <data_type>.

			<code>

			return <var_name1>.
		end function. /* function <func_name1> returns <return_type1> */
	]],
	{
		func_name = d(1, function(_, snip)
			return sn(1, i(1,snip.env.TM_SELECTED_TEXT[1] or {"<++>"}))
		end),
		return_type = c(2,get_options(data_types)),
		args = i(3, ""),
		var_name = i(4, "<++>"),
		data_type = rep(2),
		code = i(5, "/* Add Logic */"),
		var_name1 = rep(4),
		func_name1 = rep(1),
		return_type1 = rep(2),
	}
)
local function_snippet = s(
	{trig = "function", regTrig = false, hidden = false},
	-- "function",
	function_fmt
)
table.insert(snippets, function_snippet)
-- }}}

return snippets, autosnippets
