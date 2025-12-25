return {
	'mfussenegger/nvim-jdtls',
   enabled = false,
	dependencies = {
		"mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio"
	},
	ft = "java",
	config = function ()
		local map = vim.keymap.set

		local jdtls = require('jdtls')

		-- Change jdtls_path to wherever you have your Eclipse Java development tools (JDT) Language Server downloaded to.
		local jdtls_path = vim.fn.stdpath('data') .. '/mason/packages/jdtls/'
		local lombox_path = jdtls_path .. "lombok.jar"
		local launcher_jar = vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar')
		local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

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
			require("technicaldc.lsp_keymaps")
			require('jdtls').setup_dap({ hotcodereplace = 'auto' })

			vim.keymap.set('n', "<leader>lo", jdtls.organize_imports, { desc = 'Organize imports', buffer = bufnr })
			-- Should 'd' be reserved for debug?
			map('n', "<leader>df", jdtls.test_class, { silent = true, buffer = bufnr, desc = "Test class" })
			map('n', "<leader>dn", jdtls.test_nearest_method, { silent = true, buffer = bufnr, desc = "Test nearest method" })
			map('n', '<leader>rv', jdtls.extract_variable_all, { desc = 'Extract variable', buffer = bufnr })
			map('v', '<leader>rm', [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]], { desc = 'Extract method', buffer = bufnr })
			map('n', '<leader>rc', jdtls.extract_constant, { desc = 'Extract constant', buffer = bufnr })
		end

		-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
		local lsp_config = {
			capabilities = capabilities,
			cmd = {
				"java",
				"-Declipse.application=org.eclipse.jdt.ls.core.id1",
				"-Dosgi.bundles.defaultStartLevel=4",
				"-Declipse.product=org.eclipse.jdt.ls.core.product",
				"-Dlog.protocol=true",
				"-Dlog.level=ALL",
				"-javaagent:" .. lombox_path,
				"-Xmx1G",
				"--add-modules=ALL-SYSTEM",
				"--add-opens", "java.base/java.util=ALL-UNNAMED",
				"--add-opens", "java.base/java.lang=ALL-UNNAMED",
				"-jar", launcher_jar,
				"-configuration", vim.fs.normalize(jdtls_path .. '/' .. get_config_dir()),
				"-data", vim.fn.expand('~/.cache/jdtls-workspace/') .. workspace_dir
			},
			settings = {
				-- ['java.format.settings.url'] = vim.fn.expand("~/formatter.xml")
				java = {
					eclipse = {
						downloadSources = true,
					},
					configuration = {
						updateBuildConfiguration = "interactive",
					},
					maven = {
						downloadSources = true,
						updateSnapshots = true,
					},
				},
			},
			root_dir = vim.fs.dirname(vim.fs.find({ 'pom.xml', '.git', '.classpath', '.project' }, { upward = true })[1]),
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
