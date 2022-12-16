require('neorg').setup {
    load = {
        ["core.defaults"] = {},
		["core.export"] = {},
		["core.norg.concealer"] = {},
		["core.norg.dirman"] = {
            		config = {
                	workspaces = {
                    		work = "~/Documents/work",
							neorg = "~/Neorg",
                    		home = "~/Documents/home",
                }
            }
        }
    }
}