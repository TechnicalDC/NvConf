local util = require("technicaldc.util")
local palette = require("mini.hues").make_palette()
local M = {}

function M.pywal()
	local wal = [[{
		"wallpaper": "",
		"special": {
			"background": "${bg}",
			"foreground": "${fg}",
			"cursor": "${fg}"
		},
		"colors": {
			"color0": "${bg}",
			"color1":  "${red}",
			"color2":  "${green}",
			"color3":  "${orange}",
			"color4":  "${blue}",
			"color5":  "${purple}",
			"color6":  "${cyan}",
			"color7":  "${fg}",
			"color8":  "${bg_edge2}",
			"color9":  "${bg_edge}",
			"color10":  "${bg_mid}",
			"color11":  "${bg_mid2}",
			"color12":  "${fg_mid2}",
			"color13":  "${fg_mid}",
			"color14":  "${fg_edge}",
			"color15": "${fg_edge2}"
		}
	}
	]]
	return util.replace_vars(wal,palette)
end

function M.generate(output_path)
	local result = M.pywal()

	local file = io.open(output_path, "w")
	if file then
		file:write(result)
		file:close()
		vim.notify("File created at: " .. output_path,2)
	else
		vim.notify("Failed to write file.",4)
	end
end

return M
