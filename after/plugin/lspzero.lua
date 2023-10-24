local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {
    'tsserver', 'rust_analyzer', 'eslint', 'clangd', 'cssls', 'gopls', 'jsonls', 'lua_ls',
    'volar', 'yamlls', 'tailwindcss', 'csharp_ls', 'pyright', 'powershell_es',
  },
  handlers = {
    lsp_zero.default_setup,
  },
})

require 'lspconfig'.lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        }
      })

      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end
}

require 'lspconfig'.rust_analyzer.setup {
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false,
      }
    }
  }
}

require 'lspconfig'.powershell_es.setup {}
require 'lspconfig'.gopls.setup {}
require 'lspconfig'.pyright.setup {}
require 'lspconfig'.tsserver.setup {}
require 'lspconfig'.clangd.setup {}
require 'lspconfig'.cssls.setup {}
require 'lspconfig'.jsonls.setup {}
require 'lspconfig'.yamlls.setup {}
require 'lspconfig'.tailwindcss.setup {}
require 'lspconfig'.volar.setup {}
require 'lspconfig'.csharp_ls.setup {}
