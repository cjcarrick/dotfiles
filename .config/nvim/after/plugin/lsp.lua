local fidget = require 'fidget'
local null_ls = require 'null-ls'
local lspconfig = require 'lspconfig'
local schemastore = require 'schemastore'

local language_servers = lspconfig.util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
local capabilities = vim.lsp.protocol.make_client_capabilities()
for _, ls in ipairs(language_servers) do
  lspconfig[ls].setup {
    capabilities = capabilities,
    -- you can add other fields for setting up lsp server in this table
  }
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local configs = require 'lspconfig.configs'

local _border = 'rounded'
require('lspconfig.ui.windows').default_options = {
  border = _border,
}

-- -- fix `gq` https://github.com/jose-elias-alvarez/null-ls.nvim/issues/1131#issuecomment-1268760653
-- vim.api.nvim_create_autocmd('LspAttach', {
--     callback = function(args) vim.bo[args.buf].formatexpr = nil end,
-- })

-- vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = _border, max_width = 80 })
vim.lsp.handlers['textDocument/signatureHelp'] =
    vim.lsp.with(vim.lsp.handlers.signature_help, { border = _border, max_width = 80 })
vim.diagnostic.config { float = { border = _border, max_width = 80 } }

if not configs.ls_emmet then
  configs.ls_emmet = {
    default_config = {
      cmd = { 'ls_emmet', '--stdio' },
      filetypes = {
        'html',
        -- 'css',
        -- 'scss',
        'javascriptreact',
        'typescriptreact',
        'haml',
        'xml',
        'xsl',
        'pug',
        'slim',
        -- 'sass',
        -- 'stylus',
        -- 'less',
        -- 'sss',
        'hbs',
        'handlebars',
      },
      root_dir = function(fname) return vim.loop.cwd() end,
      settings = {},
    },
  }
end
lspconfig.ls_emmet.setup {
  capabilities = capabilities,
}

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.formatting.prettierd.with {
      filetypes = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'vue',
        'css',
        'scss',
        'less',
        'html',
        'json',
        'jsonc',
        'yaml',
        'markdown',
        'svg',
        'xml',
        'markdown.mdx',
        'graphql',
        'handlebars',
        'astro',
      },
    },

    null_ls.builtins.diagnostics.puglint,

    null_ls.builtins.formatting.latexindent.with {
      filetypes = { 'tex', 'latex' },
      args = {
        -- -m this allows latexindent to modify line breaks. This must be turned
        -- on in order for wrapping to work
        '-m',

        -- -g prevents log files from being generated
        '-g',
        '/dev/null',

        -- specify config inline with -y so you don't need a whole ass config file
        '-y',
        "modifyLineBreaks:textWrapOptions:columns:80,defaultIndent:'  '",

        '-',
      },
    },

    null_ls.builtins.formatting.black.with {
      filetypes = { 'ipynb', 'python' },
    },
    -- ruff is insanely fast, but doesn't do all the cool lsp things that
    -- pyright does
    -- null_ls.builtins.diagnostics.ruff,
  },
}
vim.keymap.set('n', '<leader>f', function(payload)
  vim.lsp.buf.format {
    filter = function(client) return client.name ~= 'volar' end,
  }
end)

-- LSP Mappings

vim.keymap.set('n', 'K', function()
  vim.lsp.buf.hover()
  vim.notify 'please work'
end)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'rn', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action)

-- Turn off inline diagnostics, and Show all diagnostics on current line in floating window
vim.diagnostic.config { virtual_text = false }
vim.keymap.set('n', 'cd', function() vim.diagnostic.open_float { max_width = 80 } end)

vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)

-- languages

-- Python

lspconfig.pyright.setup {}

-- Latex
lspconfig.texlab.setup {
  filetypes = {
    'tex',
    -- 'plaintext',
    'bib',
  },
}

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

-- Svelte

lspconfig.svelte.setup {}

-- Vue

lspconfig.volar.setup {}

-- Sql, mysql, postgres

lspconfig.sqlls.setup {}

-- C, CPP, ObjC

lspconfig.clangd.setup {}

-- prisma

lspconfig.prismals.setup {}

-- JSON

lspconfig.jsonls.setup {
  filetypes = { 'json', 'jsonc' },
  capabilities = capabilities,
  settings = {
    json = {
      schemas = schemastore.json.schemas(),
      validate = { enable = true },
    },
  },
}

-- Lua

lspconfig.lua_ls.setup {
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

fidget.setup {
  window = {
    relative = 'win', -- where to anchor, either "win" or "editor"
    blend = 100,      -- &winblend for the window
    zindex = nil,     -- the zindex value for the window
  },
  fmt = { max_width = 80 },
  timer = { spinner_rate = 60 },
  text = {
    spinner = 'dots',        -- animation shown when tasks are ongoing
    done = '✔',            -- character shown when all tasks are complete
    commenced = 'Started',   -- message shown when task starts
    completed = 'Completed', -- message shown when task completes
  },
}
