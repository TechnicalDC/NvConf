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

local patch_fmt = fmt(
	[[
	/* Last modified on:{}!
	]],
	{
		i(i, "Dilip"),
	}
)

local patch_snippet = s("patch", patch_fmt)

table.insert(snippets, patch_snippet)

return snippets
