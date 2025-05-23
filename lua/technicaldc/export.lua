local util = require("technicaldc.util")
local palette = require("mini.hues").make_palette()
local M = {}

function M.wezterm()
	local wal = [[
	return {
		accent    = "${accent}",
		accent_bg = "${accent_bg}",
		azure     = "${azure}",
		azure_bg  = "${azure_bg}",
		bg        = "${bg}",
		bg_edge   = "${bg_edge}",
		bg_edge2  = "${bg_edge2}",
		bg_mid    = "${bg_mid}",
		bg_mid2   = "${bg_mid2}",
		blue      = "${blue}",
		blue_bg   = "${blue_bg}",
		cyan      = "${cyan}",
		cyan_bg   = "${cyan_bg}",
		fg        = "${fg}",
		fg_edge   = "${fg_edge}",
		fg_edge2  = "${fg_edge2}",
		fg_mid    = "${fg_mid}",
		fg_mid2   = "${fg_mid2}",
		green     = "${green}",
		green_bg  = "${green_bg}",
		orange    = "${orange}",
		orange_bg = "${orange_bg}",
		purple    = "${purple}",
		purple_bg = "${purple_bg}",
		red       = "${red}",
		red_bg    = "${red_bg}",
		yellow    = "${yellow}",
		yellow_bg = "${yellow_bg}"
	}]]
	return util.replace_vars(wal,palette)
end

function M.generate(output_path)
	local result = M.wezterm()

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
