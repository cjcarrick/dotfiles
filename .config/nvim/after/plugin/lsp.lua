local lspconfig = require 'lspconfig'
-- local snippy = require 'snippy'
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local _border = 'rounded'

-- -- exit snippets on exit insert mode
-- vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
--   callback = function() snippy.complete_done() end,
-- })

require('lspconfig.ui.windows').default_options = {
  border = _border,
}

vim.g.lsp_preview_max_width = 80

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = _border })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = _border })
vim.diagnostic.config { float = { border = _border } }

-- Make css, json, and other nonstandard language servers work
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.emmet_ls.setup {
  capabilities = capabilities,
  filetypes = {
    'html',
    'typescriptreact',
    'javascriptreact',
    -- 'css', 'sass', 'scss', 'less'
  },
  init_options = {
    html = {
      options = {
        ['output.selfClosingStyle'] = 'xhtml',
      },
    },
  },
}

-- local configs = require 'lspconfig.configs'
-- if not configs.ls_emmet then
--   configs.ls_emmet = {
--     default_config = {
--       cmd = { 'ls_emmet', '--stdio' },
--       filetypes = {
--         'html',
--         -- 'css',
--         -- 'scss',
--         'javascriptreact',
--         'typescriptreact',
--         'haml',
--         'xml',
--         'xsl',
--         'pug',
--         'slim',
--         -- 'sass',
--         -- 'stylus',
--         -- 'less',
--         -- 'sss',
--         'hbs',
--         'handlebars',
--       },
--       root_dir = function(fname) return vim.loop.cwd() end,
--       settings = {},
--     },
--   }
-- end
-- lspconfig.ls_emmet.setup { capabilities = capabilities }

local null_ls = require 'null-ls'
null_ls.setup {
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.formatting.prettierd,
  },
}
vim.keymap.set('n', '<leader>f', function(payload)
  vim.lsp.buf.format {
    filter = function(client) return client.name ~= 'volar' end,
  }
end)

-- LSP Mappings

vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition)
vim.keymap.set('n', '<leader>n', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action)

-- Turn off inline diagnostics, and Show all diagnostics on current line in floating window
vim.diagnostic.config { virtual_text = false }
vim.keymap.set('n', 'cd', function() vim.diagnostic.open_float { max_width = 80 } end)

vim.keymap.set('n', 'cn', vim.diagnostic.goto_next)
vim.keymap.set('n', 'cp', vim.diagnostic.goto_prev)

-- languages

-- C

require('lspconfig').clangd.setup {}

-- ESLint (make sure this loads first)

-- lspconfig.eslint.setup {
--   format = false,
-- }

-- CSS

lspconfig.cssls.setup {
  capabilities = capabilities,
}

-- Typescript, Javascript

lspconfig.tsserver.setup {}

-- Astro

lspconfig.astro.setup {}

-- HTML

lspconfig.html.setup { capabilities = capabilities }

-- Rust

lspconfig.rust_analyzer.setup {}

-- Vue

lspconfig.volar.setup {}

-- JSON

lspconfig.jsonls.setup {
  filetypes = { 'json', 'jsonc' },
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
}

-- Lua

lspconfig.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      -- disabled because it took forever for the lsp to load
      --
      -- workspace = {
      --   -- Make the server aware of Neovim runtime files
      --   library = vim.api.nvim_get_runtime_file('', true),
      -- },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

require('fidget').setup {
  window = {
    relative = 'win', -- where to anchor, either "win" or "editor"
    blend = 100, -- &winblend for the window
    zindex = nil, -- the zindex value for the window
  },
  fmt = { max_width = 80 },
  timer = { spinner_rate = 60 },
  text = {
    spinner = 'dots', -- animation shown when tasks are ongoing
    done = '✔', -- character shown when all tasks are complete
    commenced = 'Started', -- message shown when task starts
    completed = 'Completed', -- message shown when task completes
  },
}
