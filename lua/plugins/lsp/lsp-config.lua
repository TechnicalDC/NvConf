local nvim_lsp = require('lspconfig')
local capabilities = require('blink.cmp').get_lsp_capabilities()
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local oe_jar_path = vim.fn.stdpath("data") .. "/mason/packages/openedge-language-server/abl-lsp.jar"

---@diagnostic disable-next-line: unused-local
local on_attach = function(client, bufnr)
   local bufopts = { noremap=true, silent=true, buffer=bufnr }
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
         {"<leader>K",  vim.lsp.buf.hover,                           desc = "Hover docs" },
         {"<leader>gd", vim.lsp.buf.definition,                      desc = "Go to definition"},
         {"<leader>gD", vim.lsp.buf.declaration,                     desc = "Go to declaration"},
         {"<leader>gi", vim.lsp.buf.implementation,                  desc = "Go to implementation"},
         {"<leader>gr", vim.lsp.buf.references,                      desc = "Go to references"},
         {"[d", function()
            vim.diagnostic.jump({ count = -1, float = true })
         end, desc = "Go to previous diagnostics" },
         {"]d", function()
            vim.diagnostic.jump({ count = 1,  float = true })
         end, desc = "Go to next diagnostics" },
      })
   end
end

nvim_lsp.jsonls.setup {
   on_attach = on_attach,
   capabilities = capabilities,
}
nvim_lsp.gopls.setup {
   on_attach = on_attach,
   capabilities = capabilities,
}
nvim_lsp.rust_analyzer.setup {
   on_attach = on_attach,
   capabilities = capabilities,
}

nvim_lsp.tsserver.setup({
   on_attach = on_attach,
   capabilities = capabilities,
   disable_formatting = true,
   settings = {
      javascript = {
         inlayHints = {
            includeInlayEnumMemberValueHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayVariableTypeHints = true,
         },
      },
      typescript = {
         inlayHints = {
            includeInlayEnumMemberValueHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayVariableTypeHints = true,
         },
      },
   },
})

nvim_lsp.texlab.setup({
   capabilities = capabilities,
   settings ={
      texlab = {
         auxDirectory = ".",
         bibtexFormatter = "texlab",
         build = {
            args = {},
            executable = "xelatex",
            forwardSearchAfter = false,
            onSave = false
         },
         chktex = {
            onEdit = false,
            onOpenAndSave = false
         },
         diagnosticsDelay = 300,
         formatterLineLength = 80,
         forwardSearch = {
            args = {}
         },
         latexFormatter = "latexindent",
         latexindent = {
            modifyLineBreaks = false
         }
      }
   }
})

nvim_lsp.lua_ls.setup({
   on_attach = on_attach,
   capabilities = capabilities,
   settings = {
      Lua = {
         runtime = { version = "LuaJIT" },
         diagnostics = {
            globals = { "vim" }
         },
         workspace = {
            checkThirdParty = false,
            library = {
               vim.env.VIMRUNTIME
            },
         },
         completion = {
            enable = true,
            -- When the input looks like a file name, automatically require the file.
            autoRequire = true,
            callSnippet = "Replace",
            keywordSnippet = "Replace",
            -- When a snippet is being suggested, this setting will set the amount of lines
            -- around the snippet to preview to help you better understand its usage.
            displayContext = 10,
         },
      }
   }
})
nvim_lsp.openedge_ls.setup {
  oe_jar_path = vim.fn.stdpath("data") .. "/mason/packages/openedge-language-server/abl-lsp.jar",
  debug = false, -- Set to true for debug logging
  trace = false, -- Set to true for trace logging (REALLY verbose)
  init_options = {
    abl = {
      configuration = {
        runtimes = {
          { name = '12.8', path = '/mnt/c/Progress/OpenEdge/bin/' }
        },
        maxThreads = 1
      },
      completion = {
        upperCase = false
      },
      buildMode = 1 -- Build all
    }
  }
}

nvim_lsp.util.on_setup = nvim_lsp.util.add_hook_before(nvim_lsp.util.on_setup, function(config)
   if config.name == "openedge_ls" then
      config.cmd = {"java","-jar", oe_jar_path}
      print(config.cmd)
   end
end)

local signs = {
   Error = "",
   Warn = "",
   Hint = "󰌵",
   Info = ""
}

for type, icon in pairs(signs) do
   local hl = "DiagnosticSign" .. type
   -- NOTE: This is deprecated. Use `vim.diagnostics.config()` instead
   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
   underline = true,
   severity_sort = true,
   -- virtual_text = {
   --    prefix = '',
   --    format = function(diagnostic)
   --       if diagnostic.severity == vim.diagnostic.severity.ERROR then
   --          return string.format("ERROR: %s", diagnostic.message)
   --       end
   --       return diagnostic.message
   --    end
   --    -- current_line = true,
   -- },
   virtual_lines = {
      current_line = true,
   },
   virtual_text = false,
   float = false,
   -- float = {
   --    scope = "cursor",
   --    severity_sort = true,
   --    -- header = "diagnostics",
   --    border = "rounded",
   --    max_width = 70,
   --    max_height = 10,
   --    wrap = true,
   --    focusable = false,
   --    focus = false
   -- }
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
   vim.lsp.handlers.hover, {
      -- Use a sharp border with `FloatBorder` highlights
      border = "rounded",
      -- add the title in hover float window
      title = "hover"
   }
)

