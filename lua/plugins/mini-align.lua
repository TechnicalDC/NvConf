return {
	'echasnovski/mini.align',
	version = '*',
   event = { "BufRead", "BufNewFile" },
	config  = function ()
		require('mini.align').setup()
	end
}
