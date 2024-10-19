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
	minimum_width = 30,
	maximum_width = 30,
	stages = "slide",
	timeout = 2000
})
