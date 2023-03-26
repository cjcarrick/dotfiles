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
  use { 'shortcuts/no-neck-pain.nvim' }
  -- use { 'lukas-reineke/indent-blankline.nvim' }  -- made vim slow with large files

  -- Functionality
  -- use { 'tpope/vim-commentary' }
  use { 'numToStr/Comment.nvim' }
  use { 'echasnovski/mini.align', branch = 'stable' }
  use { 'ThePrimeagen/harpoon', requires = { 'nvim-lua/plenary.nvim' } }

  use { 'mogelbrod/vim-jsonpath', cmd = { 'JsonPath' } }

  use { 'christoomey/vim-tmux-navigator' }
  use { 'dkarter/bullets.vim', ft = 'markdown' }
  use { 'ggandor/leap.nvim', event = 'BufEnter *' }
  use { 'tpope/vim-abolish', event = 'BufEnter *' }
  use { 'jiangmiao/auto-pairs' }
  use { 'alvan/vim-closetag' }
  use { 'tpope/vim-surround', event = 'BufEnter *' }
  use { 'uga-rosa/ccc.nvim', event = { 'BufEnter *' } }
  use { 'tpope/vim-fugitive' }

  -- Misc.
  use { 'lewis6991/impatient.nvim' }
  use { 'wbthomason/packer.nvim' }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    requires = {
      { 'j-hui/fidget.nvim' },
      { 'jose-elias-alvarez/null-ls.nvim' },
      { 'b0o/schemastore.nvim' },
    },
  }

  -- Jupyter notebooks
  use { 'GCBallesteros/jupytext.vim' }
  use { 'hkupty/iron.nvim' }
  use { 'kana/vim-textobj-user' }
  use { 'kana/vim-textobj-line' }
  use { 'GCBallesteros/vim-textobj-hydrogen' }

  -- Completion
  use { 'L3MON4D3/LuaSnip', tag = 'v1.*' }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
    },
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    -- disable = true,
    requires = {
      'nvim-treesitter/playground',
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
  }

  -- Git
  -- use { 'tpope/vim-fugitive' }
  use { 'mhinz/vim-signify' }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    cmd = { 'Telescope' },
    tag = '0.1.0',
    requires = { 'nvim-lua/plenary.nvim' },
  }

  -- nvim-tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
  }

  -- -- debugger
  -- use {
  --   'mfussenegger/nvim-dap',
  --   cmd = { 'DapContinue' },
  --   requires = { 'rcarriga/nvim-dap-ui', },
  -- }
end)
