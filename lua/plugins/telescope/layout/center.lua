local M = {}
M.border = {
	prompt = {"─", "│", " ", "│", '╭', '╮', "│", "│"},
	results = {"─", "│", "─", "│", "├", "┤", "╯", "╰"},
	preview = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
}
M.layout_config = {
   preview_cutoff = 10,
   height = 0.6,
   anchor = "S",
   anchor_padding = 0,
   mirror = false,
   prompt_position = "top",
   width = { padding = 0 }, -- padding to 0 to cover full width
}

return M
