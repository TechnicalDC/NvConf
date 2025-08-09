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
   "handle",
	"date",
	"logical",
   "void"
}
local access_type = {
   "public",
   "private",
   "protected"
}
local input_types = {
   "input",
   "output",
   "input-output",
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
		table_field = i(3, "<++>"),
		condition = d(4, function()
			if find("mfdeclre.i") or find("mfdtitle.i") then
				return sn(1, i(1,"= global_domain "))
			else
				return sn(1, i(1,"= <++>"))
			end
		end),
		lock = c(5, get_options(lock_type)),
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

-- METHOD SNIPPET {{{
-- local method_fmt =
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
		args = i(3, "<++>"),
		var_name = i(4, "<++>"),
		data_type = rep(2),
		code = i(5, "/* Add Logic */"),
		var_name1 = rep(4),
		func_name1 = rep(1),
		return_type1 = rep(2),
	}
)
local function_snippet = s(
	{trig = "func", regTrig = false, hidden = false},
	-- "function",
	function_fmt
)
table.insert(snippets, function_snippet)
-- }}}

-- QUERY SNIPPET {{{
local query_fmt = fmta(
   [[
   create query <query_name>.
   <query_buffers>:set-buffers(<buffers>).
   <query_prepare>:query-prepare("<query_logic>").
   <query_open>:query-open().

   do while <query_next>:get-next():
   end. /*do while <query_next1>:get-next():*/
   <query_close>:query-close().
   ]],
   {
		query_name = d(1, function(_, snip)
			return sn(1, i(1,snip.env.TM_SELECTED_TEXT[1] or {"<++>"}))
		end),
      query_buffers =  rep(1),
      buffers = i(3,"<++>"),
      query_prepare =  rep(1),
      query_logic = i(5,"<++>"),
      query_open =  rep(1),
      query_next =  rep(1),
      query_next1 =  rep(1),
      query_close =  rep(1),
   }
)
local query_snippet = s(
	{trig = "build-query", regTrig = false, hidden = false},
	query_fmt
)
table.insert(snippets, query_snippet)

-- local test_fmt = fmta(
--    [[
--    Captured Text: <test>
--    ]],
--    {
--       test = d(1, function(_, snip)
-- 			return sn(1, i(1, snip.captures[1]))
-- 		end),
--    }
-- )
-- local test_snippet = s(
-- 	{trig = "test(.)", regTrig = true, hidden = false},
--    test_fmt
-- )
-- table.insert(autosnippets, test_snippet)
-- }}}

return snippets, autosnippets
