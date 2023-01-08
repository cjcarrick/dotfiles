-- require('hlargs').setup()

require('nvim-treesitter.configs').setup {
  ensure_installed = {},
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    disable = { 'setup', 'help' },
  },

  autotag = {
    enable = true,
  },

  -- hlargs = {
  --   enable = true,
  -- },

  query_linter = {
    lint_events = { 'BufWrite', 'CursorHold' },
    use_virtual_text = true,
  },

  context_commentstring = {
    enable = true,
  },

  illuminate = {
    enable = true,
    disable = { 'fern' },
  },

  playground = {
    enable = true,
  },
}

vim.opt.foldlevel = 20
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
