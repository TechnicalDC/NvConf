-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

require('orgmode').setup({
	org_agenda_files = {'D:/Dilip/My Org Documents/agenda/**/*'},
	org_default_notes_file = 'D:/Dilip/My Org Documents/index.org',
	org_todo_keywords = {'TODO', 'WAITING', 'WIP', 'DONE'},
	org_todo_keyword_faces = {
		WAITING = ':foreground blue :weight bold',
		DELEGATED = ':background #FFFFFF :slant italic :underline on',
		TODO = ':foreground red', -- overrides builtin color for `TODO` keyword
	},
	org_hide_leading_stars = true,
	org_hide_emphasis_markers = true,
	org_ellipsis = "...",
	org_edit_src_content_indentation = 0,
	mappings = {
		global = {
			org_agenda = {'gA', '<Leader>oa'},
			org_capture = {'gC', '<Leader>oc'}
		}
	}
})
