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

local snippets = {}

local date = function() return {os.date('%d-%m-%Y')} end

local selection = f(function(_, snip)
			return snip.env.TM_SELECTED_TEXT[1] or {}
		end, {})

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

table.insert(snippets, patch_snippet)
table.insert(snippets, cmmt_snippet)
table.insert(snippets, def_snippet)

return snippets
