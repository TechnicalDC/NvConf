---@diagnostic disable: unused-local
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

local hello_fmt = fmt(
	[[
	Hello {}!
	]],
	{
		i(i, "Dilip"),
	}
)

local hello_snippet = s("hello", hello_fmt)
table.insert(snippets, hello_snippet)

local use_fmt = fmt(
	[[
		use "{}"
	]],
	{
		d(1, function(_,snip)
			return sn(1, i(1, snip.captures[1]))
		end)
	}
)
local use_snippet = s(
    {trig = "https://github%.com/(%w+%)[%.git]?", regTrig = true, hidden = false},
	use_fmt
)
table.insert(autosnippets, use_snippet)

-- return snippets, autosnippets
