return {
    "nvzone/floaterm",
	 -- enabled = false,
    dependencies = "nvzone/volt",
	 cmd = "FloatermToggle",
	 config = function ()
		require("floatterm").setup({
			 border = false,
			 size = { h = 80, w = 80 },

			 -- to use, make this func(buf)
			 mappings = { sidebar = nil, term = nil},

			 terminals = {
				 { name = "Terminal" },
				 -- { name = "Terminal", cmd = "neofetch" },
			 },
		 })
	 end
 }
