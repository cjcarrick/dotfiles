local disabled_built_ins = {
  -- 'netrw',
  -- 'netrwPlugin',
  -- 'netrwSettings',
  -- 'netrwFileHandlers',
  'gzip',
  'zip',
  'zipPlugin',
  'tar',
  'tarPlugin',
  'getscript',
  'getscriptPlugin',
  'vimball',
  'vimballPlugin',
  '2html_plugin',
  'logipat',
  'rrhelper',
  'spellfile_plugin',
  'matchit',
}
for _, plugin in pairs(disabled_built_ins) do
  vim.g['loaded_' .. plugin] = 1
end

return require('packer').startup(function(use)
  -- Interface
  use { 'RRethy/vim-illuminate' }

  -- TODO: make fails. Missing <luaxlib.h>. Probably comes from liblua. How do
  -- you intall liblua on macos?
  -- use { 'JosefLitos/reform.nvim', disable = true, run = 'make' }

  -- Functionality
  use { 'echasnovski/mini.align', branch = 'stable' }
  use { 'mattn/emmet-vim' }
  use { 'numToStr/Comment.nvim' }

  use { 'christoomey/vim-tmux-navigator' }
  use { 'ggandor/leap.nvim' }
  use { 'jiangmiao/auto-pairs' }
  use { 'tpope/vim-surround' }
  use { 'uga-rosa/ccc.nvim' }
  -- use { 'alvan/vim-closetag' }

  -- Misc.
  use { 'lewis6991/impatient.nvim' }
  use { 'wbthomason/packer.nvim' }

  -- LSP
  use { 'b0o/schemastore.nvim' }
  use { 'j-hui/fidget.nvim', branch = 'legacy' }
  use { 'neovim/nvim-lspconfig' }
  -- use { 'ray-x/lsp_signature.nvim' }

  -- Completion
  use { 'L3MON4D3/LuaSnip', tag = 'v1.*' }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
    },
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    disable = false,
    requires = { 'JoosepAlviste/nvim-ts-context-commentstring' },
  }

  -- Git
  use { 'mhinz/vim-signify' }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
  }

  -- nvim-tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
  }
  -- use { 'tpope/vim-vinegar' }

  -- debugger
  use {
    'mfussenegger/nvim-dap',
    requires = {
      'LiadOz/nvim-dap-repl-highlights',
      'mxsdev/nvim-dap-vscode-js',
      {
        'microsoft/vscode-js-debug',
        opt = true,
        run = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out',
      },
    },
  }
end)
