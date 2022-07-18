
-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

require('orgmode').setup({
	org_agenda_files = {'~/Documents/agenda/**/*'},
	org_default_notes_file = '~/Documents/Org Documents/index.org',
})
