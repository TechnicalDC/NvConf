return {
	'mfussenegger/nvim-jdtls',
	dependencies = {
		"mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio"
	},
	ft = "java",
	config = function ()
		-- Eclipse Java development tools (JDT) Language Server downloaded from:
		-- https://www.eclipse.org/downloads/download.php?file=/jdtls/milestones/1.21.0/jdt-language-server-1.21.0-202303161431.tar.gz
		local jdtls = require('jdtls')
		-- Change or delete this if you don't depend on nvim-cmp for completions.
		-- local cmp_nvim_lsp = require('cmp_nvim_lsp')

		-- Change jdtls_path to wherever you have your Eclipse Java development tools (JDT) Language Server downloaded to.
		local jdtls_path = vim.fn.stdpath('data') .. '/mason/packages/jdtls/'
		local launcher_jar = vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar')
		local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

		-- for completions
		-- local client_capabilities = vim.lsp.protocol.make_client_capabilities()
		local capabilities = require('blink.cmp').get_lsp_capabilities()

		local function get_config_dir()
			-- Unlike some other programming languages (e.g. JavaScript)
			-- lua considers 0 truthy!
			if vim.fn.has('linux') == 1 then
				return 'config_linux'
			elseif vim.fn.has('mac') == 1 then
				return 'config_mac'
			else
				return 'config_win'
			end
		end

		local on_attach = function(client, bufnr)

			require('jdtls').setup_dap({ hotcodereplace = 'auto' })

			-- https://github.com/mfussenegger/dotfiles/blob/833d634251ebf3bf7e9899ed06ac710735d392da/vim/.config/nvim/ftplugin/java.lua#L88-L94
			local opts = { silent = true, buffer = bufnr }
			vim.keymap.set('n', "<leader>lo", jdtls.organize_imports, { desc = 'Organize imports', buffer = bufnr })
			-- Should 'd' be reserved for debug?
			vim.keymap.set('n', "<leader>df", jdtls.test_class, opts)
			vim.keymap.set('n', "<leader>dn", jdtls.test_nearest_method, opts)
			vim.keymap.set('n', '<leader>rv', jdtls.extract_variable_all, { desc = 'Extract variable', buffer = bufnr })
			vim.keymap.set('v', '<leader>rm', [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]], { desc = 'Extract method', buffer = bufnr })
			vim.keymap.set('n', '<leader>rc', jdtls.extract_constant, { desc = 'Extract constant', buffer = bufnr })

			local ok, wk = pcall(require, 'which-key')
			if ok then
				wk.add({
					mode = "n",
					{"<leader>oc", vim.lsp.buf.code_action,                     desc = "Open code actions" },
					{"<leader>rn", vim.lsp.buf.rename,                          desc = "Rename" },
					{"<leader>D",  vim.lsp.buf.type_definition,                 desc = "Go to type definition"},
					{"<leader>F",  vim.lsp.buf.formatting,                      desc = "Format code"},
					{"<leader>wa", vim.lsp.buf.add_workspace_folder,            desc = "Add folder to workspace"},
					{"<leader>wr", vim.lsp.buf.remove_workspace_folder,         desc = "Remove folder from workspace"},
					{"<leader>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, desc = "List workspace folder"},
					{"<leader>K",  function ()
						vim.lsp.buf.hover(hoverOpts)
					end, desc = "Hover docs" },
					{"<leader>gd", vim.lsp.buf.definition,                      desc = "Go to definition"},
					{"<leader>gD", vim.lsp.buf.declaration,                     desc = "Go to declaration"},
					{"<leader>gi", vim.lsp.buf.implementation,                  desc = "Go to implementation"},
					{"<leader>gr", vim.lsp.buf.references,                      desc = "Go to references"},
					{"[d", function()
						vim.diagnostic.jump({ count = -1, float = true })
					end, desc = "Go to previous diagnostics" },
					{"]d", function()
						vim.diagnostic.jump({ count = 1, float = true })
					end, desc = "Go to next diagnostics" },
					{"<leader>tl", function ()
						local new_config = not vim.diagnostic.config().virtual_lines
						vim.diagnostic.config({ virtual_lines = new_config })
					end, desc = "Toggle diagnostic virtual_lines" }
				})
			end
		end

		-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
		local lsp_config = {
			capabilities = capabilities,
			cmd = {
				-- This sample path was tested on Cygwin, a "unix-like" Windows environment.
				-- Please contribute to this Wiki if this doesn't work for another Windows
				-- environment like [Git for Windows](https://gitforwindows.org/) or PowerShell.
				-- JDTLS currently needs Java 17 to work, but you can replace this line with "java"
				-- if Java 17 is on your PATH.
				-- "C:/Program Files/Java/jdk-20/bin/java",
				"java",
				"-Declipse.application=org.eclipse.jdt.ls.core.id1",
				"-Dosgi.bundles.defaultStartLevel=4",
				"-Declipse.product=org.eclipse.jdt.ls.core.product",
				"-Dlog.protocol=true",
				"-Dlog.level=ALL",
				"-Xmx1G",
				"--add-modules=ALL-SYSTEM",
				"--add-opens", "java.base/java.util=ALL-UNNAMED",
				"--add-opens", "java.base/java.lang=ALL-UNNAMED",
				"-jar", launcher_jar,
				"-configuration", vim.fs.normalize(jdtls_path .. '/' .. get_config_dir()),
				"-data", vim.fn.expand('~/.cache/jdtls-workspace/') .. workspace_dir
			},
			settings = {
				['java.format.settings.url'] = vim.fn.expand("~/formatter.xml")
			},
			root_dir = vim.fs.dirname(vim.fs.find({ 'pom.xml', '.git' }, { upward = true })[1]),
			init_options = {
				-- https://github.com/eclipse/eclipse.jdt.ls/wiki/Language-Server-Settings-&-Capabilities#extended-client-capabilities
				extendedClientCapabilities = jdtls.extendedClientCapabilities,
				bundles = {
					vim.fn.glob("/home/dilip/Gits/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.53.2.jar", 1)
				},
			},
			on_attach = on_attach
		}

		jdtls.start_or_attach(lsp_config)
	end
}
