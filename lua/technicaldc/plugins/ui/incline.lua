local helpers = require 'incline.helpers'
-- local colors = require("mini.hues").make_palette()
local devicons = require 'nvim-web-devicons'

require('incline').setup {
	window = {
		padding = 0,
		margin = { horizontal = 0 },
	},
	render = function(props)
		local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
		if filename == '' then
			filename = '[No Name]'
		end
		local ft_icon, _ = devicons.get_icon_color(filename)
		local modified = vim.bo[props.buf].modified
		local modified_icon = ""
		local search_icon = ""

		if ft_icon == nil then
			ft_icon = ""
		end

		local function get_diagnostic_label()
			local icons = { Error = "", Warn = "", Hint = "󰌵", Info = ""
			}
			local label = {}

			for severity, icon in pairs(icons) do
				local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
				if n > 0 then
					table.insert(label, { icon .. n .. ' ', group = 'DiagnosticSign' .. severity })
				end
			end
			return label
		end


		return {
			-- {get_diagnostic_label()},
			ft_icon and {
				' ',
				modified and modified_icon or ft_icon,
				' ',
				-- guibg = modified and colors.red or colors.green,
				-- guifg = colors.bg
			} or '',
			{
				' ',
				filename,
				' ',
				gui = modified and 'bold,italic' or 'bold',
				-- guibg = modified and colors.yellow or colors.bg_mid,
				-- guifg = modified and colors.bg or colors.fg
			},
		}
	end,
}
