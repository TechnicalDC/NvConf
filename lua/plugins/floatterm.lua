return {
    "nvzone/floaterm",
	 enabled = false,
    dependencies = "nvzone/volt",
	 opts =  {
		 border = false,
		 size = { h = 60, w = 70 },

		 -- to use, make this func(buf)
		 mappings = { sidebar = nil, term = nil},

		 terminals = {
			 { name = "Terminal" },
			 -- { name = "Terminal", cmd = "neofetch" },
		 },
	 },
	 cmd = "FloatermToggle",
 }
