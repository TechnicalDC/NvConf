# Colors
set -l foreground "#c0c8cc"
set -l selection  "#2a4047"
set -l comment    "#868e91"
set -l red        "#e1b8d4"
set -l orange     "#ebb8b5"
set -l yellow     "#e1c09d"
set -l green      "#c6cb9f"
set -l blue       "#a8cbec"
set -l purple     "#c7c0eb"
set -l cyan       "#a7d3b8"

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
	