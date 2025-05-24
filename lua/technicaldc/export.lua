local util = require("technicaldc.util")
local palette = require("mini.hues").make_palette()
local M = {}
local extras = {}
local extras_fun = {}

extras.fish = "mini.fish"
extras.wezterm = "wezterm-colors.lua"

function extras_fun.fish()
	return "test"
end

function extras_fun.wezterm()
	local wal = [[return {
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

function M.generate()
	local path = vim.fn.stdpath("config")
	local result
	local file

	for key, val in pairs(extras) do
		result = extras_fun[key]()

		file = io.open(path .. "/extras/" .. val, "w")
		if file then
			file:write(result)
			file:close()
			vim.notify("File created at: " .. path .. "/extras/" .. val,2)
		else
			vim.notify("Failed to write file.",4)
		end
	end
end

return M
