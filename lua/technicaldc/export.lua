local util = require("technicaldc.util")
local palette = require("mini.hues").make_palette()
local extras = {}
local extras_fun = {}

-- print(vim.inspect(palette))

extras.alacritty = "mini.toml"
extras.css = "index.css"
extras.fish = "mini.fish"
extras.fzf = "mini-fzf.fish"
extras.hypr = "mini.conf"
extras.qutebrowser = "colors.py"
extras.rofi = "mini.rasi"
extras.tmux = "tmux-status.conf"
extras.vimiv = "mini"
extras.waybar = "mini.css"
extras.wezterm = "wezterm-colors.lua"
extras.zathura = "mini-zathura"

function extras_fun.alacritty()
	return util.replace_vars([[
# Colors (mini)

# Default colors
[colors.primary]
background = '${bg}'
foreground = '${fg}'

# Normal colors
[colors.normal]
black   = '${bg_mid2}'
red     = '${red}'
green   = '${green}'
yellow  = '${yellow}'
blue    = '${blue}'
magenta = '${purple}'
cyan    = '${cyan}'
white   = '${fg_edge}'

# Bright colors
[colors.bright]
black   = '${bg_mid2}'
red     = '${red}'
green   = '${green}'
yellow  = '${yellow}'
blue    = '${blue}'
magenta = '${purple}'
cyan    = '${cyan}'
white   = '${fg_edge}'
	]], palette)
end

function extras_fun.qutebrowser()
	return util.replace_vars([[
mini = {
	"accent"    : "${accent}",
	"accent_bg" : "${accent_bg}",
	"azure"     : "${azure}",
	"azure_bg"  : "${azure_bg}",
	"bg"        : "${bg}",
	"bg_edge"   : "${bg_edge}",
	"bg_edge2"  : "${bg_edge2}",
	"bg_mid"    : "${bg_mid}",
	"bg_mid2"   : "${bg_mid2}",
	"blue"      : "${blue}",
	"blue_bg"   : "${blue_bg}",
	"cyan"      : "${cyan}",
	"cyan_bg"   : "${cyan_bg}",
	"fg"        : "${fg}",
	"fg_edge"   : "${fg_edge}",
	"fg_edge2"  : "${fg_edge2}",
	"fg_mid"    : "${fg_mid}",
	"fg_mid2"   : "${fg_mid2}",
	"green"     : "${green}",
	"green_bg"  : "${green_bg}",
	"orange"    : "${orange}",
	"orange_bg" : "${orange_bg}",
	"purple"    : "${purple}",
	"purple_bg" : "${purple_bg}",
	"red"       : "${red}",
	"red_bg"    : "${red_bg}",
	"yellow"    : "${yellow}",
	"yellow_bg" : "${yellow_bg}"
}
	]],palette)
end

function extras_fun.vimiv()
	return util.replace_vars([[
[STYLE]
base00 = ${bg}
base01 = #e0e0e0
base02 = #d6d6d6
base03 = #8e908c
base04 = #969896
base05 = #4d4d4c
base06 = #282a2e
base07 = #1d1f21
base08 = ${red}
base09 = ${orange}
base0a = ${yellow}
base0b = ${green}
base0c = ${cyan}
base0d = ${blue}
base0e = ${purple}
base0f = ${azure}
font = 14pt Iosevka Nerd Font
image.bg = ${bg}
image.scrollbar.width = 8px
image.scrollbar.bg = ${bg}
image.scrollbar.fg = ${bg_mid}
image.scrollbar.padding = 2px
library.font = 14pt Iosevka Nerd Font
library.fg = ${fg}
library.padding = 2px
library.directory.fg = ${blue}
library.even.bg = ${bg}
library.odd.bg = ${bg}
library.selected.bg = ${bg_mid2}
library.selected.fg = ${fg}
library.search.highlighted.fg = #e0e0e0
library.search.highlighted.bg = ${bg_mid2}
library.scrollbar.width = 8px
library.scrollbar.bg = ${bg}
library.scrollbar.fg = ${bg_mid}
library.scrollbar.padding = 2px
library.border = 0px solid
statusbar.font = 14pt Iosevka Nerd Font
statusbar.bg = ${bg_mid}
statusbar.fg = ${fg}
statusbar.error = ${red}
statusbar.warning = ${orange}
statusbar.info = ${green}
statusbar.message_border = 2px solid
statusbar.padding = 4
thumbnail.font = 14pt Iosevka Nerd Font
thumbnail.fg = ${fg}
thumbnail.bg = ${bg}
thumbnail.padding = 20
thumbnail.selected.bg = ${bg_mid2}
thumbnail.search.highlighted.bg = #969896
thumbnail.default.bg = ${bg_mid}
thumbnail.error.bg = ${red}
thumbnail.frame.fg = #282a2e
completion.height = 16em
completion.fg = ${fg}
completion.even.bg = ${bg_edge}
completion.odd.bg = ${bg_edge}
completion.selected.fg = ${fg}
completion.selected.bg = ${bg_mid2}
keyhint.padding = 2px
keyhint.border_radius = 10px
keyhint.suffix_color = #3e999f
manipulate.fg = #282a2e
manipulate.focused.fg = #3e999f
manipulate.bg = #ffffff
manipulate.slider.left = #81a2be
manipulate.slider.handle = #969896
manipulate.slider.right = #d6d6d6
manipulate.image.border = 2px solid
manipulate.image.border.color = #3e999f
mark.color = #8959a8
keybindings.bindings.color = #3e999f
keybindings.highlight.color = #8959a8
metadata.padding = 2px
metadata.border_radius = 10px
image.straighten.color = #eab700
prompt.font = 14pt Iosevka Nerd Font
prompt.fg = #282a2e
prompt.bg = #d6d6d6
prompt.padding = 2px
prompt.border_radius = 10px
prompt.border = 2px solid
prompt.border.color = #3e999f
crop.shading = #88000000
crop.border = 2px solid
crop.border.color = #88AAAAAA
crop.grip.color = #88FFFFFF
crop.grip.border = 2px solid
crop.grip.border.color = #88AAAAAA
library.selected.bg.unfocus = #8881a2be
thumbnail.selected.bg.unfocus = #8881a2be
metadata.bg = #AAd6d6d6

; vim:ft=dosini
	]],palette)
end

function extras_fun.waybar()
	return util.replace_vars([[
@define-color accent     ${accent};
@define-color accent_bg  ${accent_bg};
@define-color azure      ${azure};
@define-color azure_bg   ${azure_bg};
@define-color bg         ${bg};
@define-color bg_edge    ${bg_edge};
@define-color bg_edge2   ${bg_edge2};
@define-color bg_mid     ${bg_mid};
@define-color bg_mid2    ${bg_mid2};
@define-color blue       ${blue};
@define-color blue_bg    ${blue_bg};
@define-color cyan       ${cyan};
@define-color cyan_bg    ${cyan_bg};
@define-color fg         ${fg};
@define-color fg_edge    ${fg_edge};
@define-color fg_edge2   ${fg_edge2};
@define-color fg_mid     ${fg_mid};
@define-color fg_mid2    ${fg_mid2};
@define-color green      ${green};
@define-color green_bg   ${green_bg};
@define-color orange     ${orange};
@define-color orange_bg  ${orange_bg};
@define-color purple     ${purple};
@define-color purple_bg  ${purple_bg};
@define-color red        ${red};
@define-color red_bg     ${red_bg};
@define-color yellow     ${yellow};
@define-color yellow_bg  ${yellow_bg};
	]],palette)
end

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

function  extras_fun.fzf()
	return util.replace_vars([[
set --export FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS "
--color=fg:${fg},fg+:${bg_edge},bg:-1,bg+:${fg_edge} \
--color=hl:${green},hl+:${bg_edge} \
--color=prompt:${fg} \
--color=input-border:${bg_edge},input-bg:${bg_edge},query:${fg} \
--color=list-border:${bg_edge2},list-bg:${bg_edge2}"

set --export _ZO_FZF_OPTS $_ZO_FZF_OPTS "
--color=fg:${fg},fg+:${bg_edge},bg:-1,bg+:${fg_edge} \
--color=hl:${green},hl+:${bg_edge} \
--color=prompt:${fg} \
--color=input-border:${bg_edge},input-bg:${bg_edge},query:${fg} \
--color=list-border:${bg_edge2},list-bg:${bg_edge2}"
	]],palette)
end

function extras_fun.rofi()
	return util.replace_vars([[
* {
   foreground    : ${fg};
   background    : ${bg};
   selected      : ${bg_mid};
	promptbg		  : ${bg_mid2};
}
	]],palette)
end

function extras_fun.hypr()
	return util.replace_vars([[
$fg           = rgb(${fg})
$bg           = rgb(${bg})
$bg_mid       = rgb(${bg_mid})
$bg_mid2      = rgb(${bg_mid2})
$fg_mid       = rgb(${fg_mid})
$fg_mid2      = rgb(${fg_mid2})
$red          = rgb(${red})
$green        = rgb(${green})
$orange       = rgb(${orange})
$blue         = rgb(${blue})
$purple       = rgb(${purple})
$cyan         = rgb(${cyan})
$fgAlpha      = ${fg}
$bgAlpha      = ${bg}
$bg_midAlpha  = ${bg_mid}
$bg_mid2Alpha = ${bg_mid2}
$fg_midAlpha  = ${fg_mid}
$fg_mid2Alpha = ${fg_mid2}
$redAlpha     = ${red}
$greenAlpha   = ${green}
$orangeAlpha  = ${orange}
$blueAlpha    = ${blue}
$purpleAlpha  = ${purple}
$cyanAlpha    = ${cyan}
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

function extras_fun.css()
	return util.replace_vars([[
:root {
	--accent    : ${accent};
	--accent-bg : ${accent_bg};
	--azure     : ${azure};
	--azure-bg  : ${azure_bg};
	--bg        : ${bg};
	--bg-edge   : ${bg_edge};
	--bg-edge2  : ${bg_edge2};
	--bg-mid    : ${bg_mid};
	--bg-mid2   : ${bg_mid2};
	--blue      : ${blue};
	--blue-bg   : ${blue_bg};
	--cyan      : ${cyan};
	--cyan-bg   : ${cyan_bg};
	--fg        : ${fg};
	--fg-edge   : ${fg_edge};
	--fg-edge2  : ${fg_edge2};
	--fg-mid    : ${fg_mid};
	--fg-mid2   : ${fg_mid2};
	--green     : ${green};
	--green-bg  : ${green_bg};
	--orange    : ${orange};
	--orange-bg : ${orange_bg};
	--purple    : ${purple};
	--purple-bg : ${purple_bg};
	--red       : ${red};
	--red-bg    : ${red_bg};
	--yellow    : ${yellow};
	--yellow-bg : ${yellow_bg};
}]] ,palette)
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
}]] ,palette)
end

function extras_fun.zathura()
	return util.replace_vars([[
set default-fg              "${fg}"
set default-bg              "${bg}"
set completion-bg           "${bg_edge}"
set completion-fg           "${fg}"
set completion-highlight-bg "${bg_mid2}"
set completion-highlight-fg "${fg}"
set completion-group-fg     "${fg_mid}"
set completion-group-bg     "${bg_mid}"
set statusbar-fg            "${fg}"
set statusbar-bg            "${bg_mid}"
set notification-bg         "${bg_mid2}"
set notification-fg         "${fg}"
set notification-error-bg   "${red}"
set notification-error-fg   "${bg}"
set notification-warning-bg "${orange}"
set notification-warning-fg "${bg}"
set inputbar-fg             "${bg}"
set inputbar-bg             "${green}"
set recolor-lightcolor      "${bg}"
set recolor-darkcolor       "${fg}"
set index-fg                "${fg}"
set index-bg                "${bg}"
set index-active-fg         "${fg}"
set index-active-bg         "${bg}"
set render-loading-bg       "${bg}"
set render-loading-fg       "${fg}"
set highlight-color         "${bg_mid2}"
set highlight-fg            "${bg}"
set highlight-active-color  "${fg_mid}"
	]],palette)
end

local function generate()
	local path = vim.fn.stdpath("config")
	local result
	local file

	for key, val in pairs(extras) do
		result = extras_fun[key]()

		if key == "hypr" then
			result = string.gsub(result, "#", "")
		end

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

vim.api.nvim_create_user_command("MiniExport", generate, {})

-- return M
