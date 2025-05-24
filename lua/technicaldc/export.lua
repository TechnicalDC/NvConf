local util = require("technicaldc.util")
local palette = require("mini.hues").make_palette()
local M = {}
local extras = {}
local extras_fun = {}

-- print(vim.inspect(palette))

extras.fish = "mini.fish"
extras.wezterm = "wezterm-colors.lua"
extras.rofi = "mini.rasi"
extras.tmux = "tmux-status.conf"

function extras_fun.fish()
	return util.replace_vars([[
# Colors
set -l foreground "${fg}"
set -l selection  "${bg_mid}"
set -l comment    "${fg_mid2}"
set -l red        "${red}"
set -l orange     "${orange}"
set -l yellow     "${yellow}"
set -l green      "${green}"
set -l blue       "${blue}"
set -l purple     "${purple}"
set -l cyan       "${cyan}"

# Syntax highlighting
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $purple
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_option $yellow
set -g fish_color_error $red
set -g fish_color_param $blue
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $foreground
set -g fish_color_escape $purple
set -g fish_color_autosuggestion $comment
set -g fish_color_cwd $cyan
set -g fish_color_user $purple
set -g fish_color_host $orange
set -g fish_color_valid_path $green
set -g fish_color_prefix $blue
set -g fish_color_history_current_command $yellow
set -g fish_color_history_duration $comment
set -g fish_color_error_background --background=$red

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
set -g fish_pager_color_selected_background --background=$selection
	]],palette)
end

function extras_fun.rofi()
	return util.replace_vars([[
* {
   foreground    : ${fg};
   background    : ${bg};
   selected      : ${bg_mid};
}
	]],palette)
end

function extras_fun.tmux()
	return util.replace_vars([[
# panes
set -g pane-border-style 'fg=${bg_mid}'
set -g pane-active-border-style 'fg=${fg_edge}'
set-option -g status-style 'fg=${fg},bg=${bg_mid}'
set-option -g status-left "#[fg=${fg},bg=${bg_mid2}] #S #[default]"
set-option -g status-right "#(whoami)::#H "
set-window-option -g window-status-separator ""
set-window-option -g window-status-style fg=${fg}
set-window-option -g window-status-style bg=${bg_mid}
set-window-option -g window-status-current-style "fg=${fg},bg=${bg_mid2}"
setw -g window-status-current-format ' #I.#W '
setw -g window-status-format ' #I.#W '
# messages
set -g message-style 'fg=${bg_mid} bg=${orange}'
	]],palette)
end

function extras_fun.wezterm()
	return util.replace_vars([[
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
	,palette)
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
