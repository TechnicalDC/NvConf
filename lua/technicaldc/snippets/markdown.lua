-- REQUIRED {{{
local ls = require("luasnip")
local s = ls.s --> snippet
local i = ls.i --> insert node
local t = ls.t --> text node

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {}
-- }}}

-- LINK SNIPPET {{{
local link_fmt = fmta(
	[[
	[<alt_text>](<url>)
	]],
	{
		alt_text = i(1, "link"),
		url = d(2, function(_,snip)
			return sn(1, i(1, snip.captures[1]))
		end)
	}
)
local link_snippet = s("link", link_fmt)
table.insert(snippets, link_snippet)
-- }}}

-- IMAGE SNIPPET {{{
local image_fmt = fmta(
	[[
	![<alt_text>](<url>)
	]],
	{
		alt_text = i(1, "image"),
		url = d(2, function(_,snip)
			return sn(1, i(1, snip.captures[1]))
		end)
	}
)
local image_snippet = s("![", image_fmt)
table.insert(snippets, image_snippet)
-- }}}

-- META SNIPPET {{{
local meta_fmt = fmta(
	[[
	---
	title: <title>
	author: <author>
	date: <new_date>
	---
	]],
	{
		title = i(1, "<++>"),
		author = i(2, "Dilip Chauhan"),
		new_date = f(function(_,snip) return {os.date('%d-%m-%Y')} end, {})
	}
)
local meta_snippet = s("meta", meta_fmt)
table.insert(snippets, meta_snippet)
-- }}}

-- DATE {{{
local date_fmt = fmta(
   [[- <today> - ]],
   {
		today = f(function(_,snip) return {os.date('%d/%m/%Y')} end, {})
   }
)
local date_snippet = s("\\todo", date_fmt)
table.insert(autosnippets, date_snippet)
-- }}}

return snippets, autosnippets
