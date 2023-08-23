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
local patch_fmt = fmt(
	[[
	/* Last modified on: {} Last modified by: Dilip Chauhan ECO: {} */
	]],
	{
		f(function(_,snip) return {os.date('%d-%m-%Y')} end, {}),
		i(2,"<++>"),
	}
)
local patch_snippet = s("patch", patch_fmt)
table.insert(snippets, patch_snippet)
-- }}}

-- PATCH MARKER SNIPPET {{{
local patch_mark_fmt = fmt(
	[[
	/* ALT{} */
	]],
	{
		f(function(_,snip) return {os.date('%d%m%Y')} end, {}),
	}
)
local patch_mark_snippet = s("ALT", patch_mark_fmt)
table.insert(autosnippets, patch_mark_snippet)
-- }}}

-- MARKER {{{
local marker_fmt = fmt(
	[[
	/* START - {} */
	{}
	/* END - {} */
	]],
	{
		d(1, function()
			return sn(1,t("ALT" .. string(os.date('%d%m%Y'))))
		end),
		d(2, function(_, snip)
			return sn(1, t(snip.env.TM_SELECTED_TEXT or {}))
		end),
		rep(1)
	}
)
local marker_snippet = s("mark", marker_fmt)
-- table.insert(snippets, marker_snippet)
--}}}

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
	define {} {} {} no-undo.
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

-- MESSAGE SNIPPET {{{
local msg_fmt = fmt(
	[[
	{{ us/bbi/pxmsg.i {}={} &errorlevel={} }}
	]],
	{
		c(1, {
			i(1, "&msgnum"),
			i(1, "&msgtext"),
			}
		),
		i(2, "<++>"),
		i(3, "<++>"),
	}
)
local msg_snippet = s("msg", msg_fmt)
table.insert(snippets, msg_snippet)
-- }}}

-- FIND SNIPPET {{{
local find_fmt = fmt(
	[[
		find {} {} {}
			where {} {}no-error.
		if available {} then do:
		end. /* if available {} then do: */
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
		rep(2),
		rep(2),
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
		end. /* for {} {} {} */
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
		rep(1),
		rep(2),
		rep(3),
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
			(input {}):

			define variable lv_output as {}.

			{}

			return lv_output.
		end function. /* function {} returns {} */
	]],
	{
		d(1, function(_, snip)
			return sn(1, i(1,snip.env.TM_SELECTED_TEXT[1] or {"<++>"}))
		end),
		c(2,get_options(data_types)),
		i(3, ""),
		rep(2),
		i(4, "/* Add Logic */"),
		rep(1),
		rep(2),
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
