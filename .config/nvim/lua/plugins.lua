local disabled_built_ins = {
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
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
  -- use { 'lukas-reineke/indent-blankline.nvim' }  -- made vim slow with large files

  -- Functionality

  -- use { 'JoosepAlviste/nvim-ts-context-commentstring' }
  -- use { 'tpope/vim-commentary' }
  use { 'numToStr/Comment.nvim' }

  use { 'mogelbrod/vim-jsonpath', cmd = { 'JsonPath' } }

  use { 'alvan/vim-closetag' }
  use { 'christoomey/vim-tmux-navigator' }
  use { 'dkarter/bullets.vim', ft = 'markdown' }
  use { 'ggandor/leap.nvim', event = 'BufEnter *' }
  use { 'jiangmiao/auto-pairs', event = 'BufEnter *' }
  use { 'tpope/vim-abolish', event = 'BufEnter *' }
  use { 'tpope/vim-surround', event = 'BufEnter *' }
  use { 'uga-rosa/ccc.nvim', event = { 'BufEnter *' } }
  use { 'windwp/nvim-ts-autotag', event = 'BufEnter *' }

  -- Misc.
  use { 'lewis6991/impatient.nvim' }
  use { 'wbthomason/packer.nvim' }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    requires = {
      { 'j-hui/fidget.nvim' },
      { 'jose-elias-alvarez/null-ls.nvim' },
    },
  }

  -- Completion
  use { 'L3MON4D3/LuaSnip', tag = 'v1.*' }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { 'b0o/schemastore.nvim' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip', requires = { 'L3MON4D3/LuaSnip', tag = 'v1.*' } },
    },
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  -- Git
  -- use { 'tpope/vim-fugitive' }
  use { 'mhinz/vim-signify', event = 'Bufenter *' }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    cmd = { 'Telescope' },
    tag = '0.1.0',
    requires = { 'nvim-lua/plenary.nvim' },
  }

  -- Fern
  use {
    'lambdalisue/fern.vim',
    cmd = { 'Fern' },
    requires = {
      { 'lambdalisue/fern-renderer-nerdfont.vim', after = 'fern.vim' },
      { 'lambdalisue/nerdfont.vim', after = 'fern.vim' },
      { 'lambdalisue/glyph-palette.vim', after = 'fern.vim' },
    },
  }

  -- -- debugger
  -- use {
  --   'mfussenegger/nvim-dap',
  --   cmd = { 'DapContinue' },
  --   requires = { 'rcarriga/nvim-dap-ui', },
  -- }
end)
