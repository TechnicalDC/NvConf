local nvim_lsp = require('lspconfig')
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

---@diagnostic disable-next-line: unused-local
local on_attach = function(client, bufnr)
   local bufopts = { noremap=true, silent=true, buffer=bufnr }
   local ok, wk = pcall(require, 'which-key')
   if ok then
      wk.register({
         ["<leader>"] = {
            e = { vim.diagnostic.open_float, "Open float" },
            c = { a = { vim.lsp.buf.code_action, "Code Actions" } },
            r = { n = { vim.lsp.buf.rename, "Rename" } },
            D = { vim.lsp.buf.type_definition,"Go to type definition"},
            F = {vim.lsp.buf.formatting, "Format code"},
            t = { b = { "<cmd>TroubleToggle<cr>", "Toggle trouble" }},
            w = {
               a = { vim.lsp.buf.add_workspace_folder, "Add folder to workspace"},
               r = { vim.lsp.buf.remove_workspace_folder, "Remove folder from workspace"},
               l = { function()
                  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
               end, "List workspace folder"},
            },
         },
         K = {vim.lsp.buf.hover, "Hover docs"},
         g = {
            d = {vim.lsp.buf.definition, "Go to definition"},
            D = {vim.lsp.buf.declaration, "Go to declaration"},
            -- o = { "<cmd>Lspsaga outline<cr>", "Toggle outline"},
            i = {vim.lsp.buf.implementation, "Go to implementation"},
            r = {vim.lsp.buf.references, "Go to references"},
         },
         ["["] = { d = { vim.diagnostic.goto_prev, "Go to previous diagnostics" } },
         ["]"] = { d = { vim.diagnostic.goto_next, "Go to next diagnostics" } },
      })
   end
   map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
end

local servers = {
   'pyright',
   -- 'openedge_ls',
   -- 'tsserver',
   'jsonls',
   -- 'gopls',
   -- 'texlab'
}
local oe_jar_path = 'C:\\Users\\Dilip Chauhan\\AppData\\Local\\nvim-data\\mason\\packages\\openedge-language-server\\abl-lsp.jar'
for _, lsp in ipairs(servers) do
   nvim_lsp[lsp].setup {
      on_attach = on_attach,
   }
end

nvim_lsp.openedge_ls.setup {
   on_attach = on_attach,
   oe_jar_path = oe_jar_path,
   -- oe_jar_path = '/home/dilip/.local/share/nvim/mason/packages/openedge-language-server/abl-lsp.jar',
   dlc = '12.2:C:\\Progress\\OpenEdge\\bin', -- Version number and OpenEdge root directory (colon separator)
   debug = true, -- Set to true for debug logging
   trace = false -- Set to true for trace logging (REALLY verbose)
}

nvim_lsp.tsserver.setup({
   on_attach = on_attach,
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

nvim_lsp.lua_ls.setup({
   on_attach = on_attach,
   settings = {
      Lua = {
         runtime = { version = "LuaJIT" },
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


local rounded_border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│'}
local signs = {
   Error = " ",
   Warn = " ",
   Hint = "󰌵 ",
   Info = " "
}

for type, icon in pairs(signs) do
   local hl = "DiagnosticSign" .. type
   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
   virtual_text = {
      prefix = '',
   },
   -- virtual_text = false,
   float = {
      border = rounded_border,
      max_width = 50,
      max_height = 10,
      wrap = true,
      focusable = true,
      focus = false
   }
})

local lspconfig = require 'lspconfig'
lspconfig.util.on_setup = lspconfig.util.add_hook_before(lspconfig.util.on_setup, function(config)
   if config.name == "openedge_ls" then
      config.cmd = {"java","-jar", oe_jar_path}
   end
end)

