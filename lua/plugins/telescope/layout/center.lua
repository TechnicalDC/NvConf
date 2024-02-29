local M = {}
M.border = {
	prompt = {"─", "│", " ", "│", '╭', '╮', "│", "│"},
	results = {"─", "│", "─", "│", "├", "┤", "╯", "╰"},
	preview = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
}
M.layout_config = {
	preview_cutoff = 20,
	height = 0.5,
	anchor = "S",
	prompt_position = "top",
	width = 0.5,
}

return M
