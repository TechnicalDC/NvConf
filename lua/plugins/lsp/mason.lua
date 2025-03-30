require("mason").setup({
   ui = {
      border = "rounded"
   }
})
require("mason-lspconfig").setup({
   ensure_installed = {
      "lua_ls",
      -- "pyright",
      "ts_ls",
      -- "jdtls",
   }
})

