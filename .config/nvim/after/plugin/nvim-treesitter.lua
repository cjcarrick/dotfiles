if not pcall(require, 'nvim-treesitter') then return end

require('nvim-treesitter.configs').setup {
  ensure_installed = {},
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    disable = { --[[ 'html', 'markdown', 'css', 'setup', ]] 'help', 'telescope' },
  },

  indent = { enable = false },

  hlargs = { enable = false },

  query_linter = {
    -- lint_events = { 'BufWrite', 'CursorHold' },
    use_virtual_text = false,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      -- scope_incremental = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<S-CR>',
    },
  },

  context_commentstring = { enable = true },

  playground = { enable = false },
}
