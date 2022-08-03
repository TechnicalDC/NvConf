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

-- LINK SNIPPET {{{
local link_fmt = fmt(
	[[
	[{}]({})
	]],
	{
		i(1, "link"),
		d(2, function(_,snip)
			return sn(1, i(1, snip.captures[1]))
		end)
	}
)
local link_snippet = s("link", link_fmt)
table.insert(snippets, link_snippet)
-- }}}

-- IMAGE SNIPPET {{{
local image_fmt = fmt(
	[[
	![{}]({})
	]],
	{
		i(1, "image"),
		d(2, function(_,snip)
			return sn(1, i(1, snip.captures[1]))
		end)
	}
)
local image_snippet = s("link", link_fmt)
table.insert(snippets, image_snippet)
-- }}}

return snippets, autosnippets
