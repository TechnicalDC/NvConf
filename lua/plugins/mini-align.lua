return {
	'echasnovski/mini.align',
	version = '*',
   event = { "BufReadPre", "BufNewFile" },
	config  = function ()
		require('mini.align').setup()
	end
}
