# Colors
set -g foreground "#c0c8cc"
set -g selection  "#363a3b"
set -g comment    "#858c90"
set -g red        "#e0bdbb"
set -g orange     "#d9c2ac"
set -g yellow     "#c7caac"
set -g green      "#b2cfbc"
set -g blue       "#c6c2df"
set -g purple     "#d8bdd0"
set -g cyan       "#a9cfd2"

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
	