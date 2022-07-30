
-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

require('orgmode').setup({
	org_agenda_files = {'~/Documents/agenda/**/*'},
	org_default_notes_file = '~/Documents/Org Documents/index.org',
	org_todo_keywords = {'TODO', 'WAITING', '|', 'DONE', 'DELEGATED'},
	org_hide_leading_stars = true,
	org_hide_emphasis_markers = true,
	org_ellipsis = "",
	org_indent_mode = indent,
})
