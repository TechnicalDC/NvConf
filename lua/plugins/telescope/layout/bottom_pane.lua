local M = {}
M.border = {
	prompt = {"─", " ", " ", " ", '─', '─', " ", " "},
	results = {" ", " ", " ", " ", " ", " ", " ", " "},
	preview = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
}
M.layout_config = {
	preview_cutoff = 20,
	height = 0.7,
	anchor = "N",
	mirror = false,
	prompt_position = "top",
	width = 0.999,
}

return M
