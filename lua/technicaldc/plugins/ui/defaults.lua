local M = {}

M.get_popup_width = function ()
	if vim.o.columns >= 80 then
		return 0.4
	else
		return vim.o.columns * 0.8
	end
end

return M
