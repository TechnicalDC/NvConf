local M = {}
M.border = {
   preview = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
   prompt = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
   results = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
}
M.layout_config = {
   preview_cutoff = 10,
   height = 0.6,
   anchor = "S",
   anchor_padding = 0,
   mirror = false,
   prompt_position = "top",
   width = 0.999,    -- to make width 100%
}

return M
