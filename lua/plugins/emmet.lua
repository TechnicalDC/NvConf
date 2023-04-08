return {
	"mattn/emmet-vim",
	config = function ()
		vim.g.user_emmet_leader_key=','
		vim.cmd([[
		let g:user_emmet_settings = {
			\  'handlebars' : {
				\    'extends' : 'html',
				\  }
				\}
		let g:user_emmet_settings = {
			\  'variables': {'lang': 'ja'},
			\  'html': {
				\    'default_attributes': {
					\      'option': {'value': v:null},
					\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
					\    },
				\    'snippets': {
					\      'html:5': "<!DOCTYPE html>\n"
					\              ."<html lang=\"${lang}\">\n"
					\              ."<head>\n"
					\              ."\t<meta charset=\"${charset}\">\n"
					\              ."\t<title></title>\n"
					\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
					\              ."</head>\n"
					\              ."<body>\n\t${child}|\n</body>\n"
					\              ."</html>",
					\    },
					\  },
					\}
		]])
	end
}
