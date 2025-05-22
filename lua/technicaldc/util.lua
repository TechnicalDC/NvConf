local util = {}

function util.replace_vars(str, tbl)
	return (str:gsub("($%b{})", function(w)
		return tbl[w:sub(3, -2)] or w
	end))
end

return util
