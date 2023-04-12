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

-- BOILER PLATE SNIPPET {{{
local boiler = fmt(
	[[
	package main

	import (
		"fmt"
	)

	func main() {{
		fmt.Println("{}")
	}}
	]],
	{
		i(1, "<++>"),
	}
)
local boiler_snippet = s("!main", boiler)
table.insert(autosnippets, boiler_snippet)
-- }}}

return snippets, autosnippets

