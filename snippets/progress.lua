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
local date = function() return {os.date('%d-%m-%Y')} end

local selection = f(function(_, snip)
			return snip.env.TM_SELECTED_TEXT[1] or {}
		end, {})
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
			return sn(1, t(snip.env.TM_SELECTED_TEXT[1] or {}))
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
		c(1, {
			i(1, "variable"), 
			i(1, "input parameter"),
			i(1, "output parameter"),
			i(1, "query"),
			i(1, "frame"),
		}),
		i(2, "<++>"),
		-- c(2, {
		-- 	i(1, "<++>"),
		-- 	d(1, function(_, snip)
		-- 		return sn(1, t(snip.env.TM_SELECTED_TEXT[1] or {}))
		-- 	end)
		-- }),
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
			where {} no-error.
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
				return sn(1, i(1, snip.captures[1]))
		end),
		c(3, {
			i(1, "no-lock"),
			i(1, "exclusive-lock"),
		}),
		i(4, "<++>"),
		rep(2)
	}
)
local find_snippet = s(
	{trig = "find(%w+%_?%w+)", regTrig = true, hidden = true},
	-- "find",
	find_fmt
)
table.insert(autosnippets, find_snippet)
-- }}}

-- FOR SNIPPET {{{
local for_fmt = fmt(
	[[
		for {} {} {}
			where {} :
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
				return sn(1, i(1, snip.captures[1]))
		end),
		c(3, {
			i(1, "no-lock"),
			i(1, "exclusive-lock"),
		}),
		i(4, "<++>"),
		i(5, "<++>"),
	}
)
local for_snippet = s(
	{trig = "for(%w+%_?%w+)", regTrig = true, hidden = true},
	-- "for",
	for_fmt
)
table.insert(autosnippets, for_snippet)
-- }}}

-- FUNCTION SNIPPET {{{
local function_fmt = fmt(
	[[
		function {} ({}):
			{}
		end function.
	]],
	{
		d(1, function(_, snip)
				return sn(1, i(1, snip.captures[1]))
		end),
		i(2, ""),
		i(3, "<++>"),
	}
)
local function_snippet = s(
	{trig = "fun(%w+%_?%w+)", regTrig = true, hidden = true},
	-- "function",
	function_fmt
)
table.insert(autosnippets, function_snippet)
-- }}}

return snippets, autosnippets
