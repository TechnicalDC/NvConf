vim.notify = require("notify")

require("notify").setup({
	background_colour = "Normal",
	fps = 30,
	icons = {
		DEBUG = " ",
		ERROR = " ",
		INFO = " ",
		TRACE = "✎",
		WARN = " "
	},
	level = 2,
	minimum_width = 40,
	max_width = 40,
	stages = "slide",
   render = "wrapped-default",
	timeout = 2000
})
